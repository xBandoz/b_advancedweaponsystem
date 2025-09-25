local config = require "shared.config"
if not EnsureResourceName("b_advancedweaponsystem") then return end

local isFirstPerson = GetResourceKvpInt("ViewMode") == 1
local currentWeapon = exports.ox_inventory:getCurrentWeapon()
local firstPersonThreadRunning = false

local function enableFirstPersonAiming()
    if firstPersonThreadRunning then return end
    firstPersonThreadRunning = true

    CreateThread(function()
        while currentWeapon and isFirstPerson do
            Wait(30) -- ~33 updates per second, enough for PvP
            local pedId = cache.playerId

            if IsPlayerFreeAiming(pedId) then
                if GetFollowPedCamViewMode() ~= 4 or not check then
                    SetFollowPedCamViewMode(4)
                    check = true
                end
                HideHudComponentThisFrame(14)
            else
                if check then
                    SetFollowPedCamViewMode(1)
                    check = false
                end
            end
        end

        firstPersonThreadRunning = false
    end)
end

local function calculateSpread(weaponData, vehicle)
    if not weaponData?.name then return config.defaultSpread end

    local spread = config.weaponSpreadValues[string.upper(weaponData.name)] or config.defaultSpread
    if isFirstPerson and config.fpMultiplier then
        spread = spread * config.fpMultiplier
    end
    if vehicle then
        spread = spread * (config.vehicle.inVehicleMultiplier or 1.0)
        if IsThisModelAHeli(GetEntityModel(vehicle)) then
            spread = config.vehicle.helicopter.noSpread and config.defaultSpread or
                spread * (config.vehicle.helicopter.inHeliMultiplier or 1.0)
        end
    end

    local components = (weaponData.metadata?.components) or {}
    for i = 1, #components do
        local compReduction = config.componentSpreadReduces[components[i]] or 0

        if isFirstPerson and config.fpmAffectsComponents and config.fpMultiplier then
            compReduction = compReduction * config.fpMultiplier
        end

        spread = spread + compReduction
    end

    local total = math.max(0.0, spread)
    if config.debug then lib.print.info(("%s Spread: %.2f"):format(weaponData.name, total)) end

    return total
end

local function setWeaponAccuracy(weapon, vehicle)
    if not weapon?.hash and IsPedArmed(cache.ped, 6) then return end

    SetWeaponAccuracySpread(weapon.hash, calculateSpread(weapon, vehicle))
end

local function getVehicleSpeed(vehicle)
    local speedMps = GetEntitySpeed(vehicle)
    local unit = config.vehicle.speedUnit or "kmh"
    return unit == "kmh" and speedMps * 3.6 or unit == "mph" and speedMps * 2.23694 or speedMps
end

local function canShootInVehicle(vehicle, seat)
    if not vehicle then return true end

    local speed = getVehicleSpeed(vehicle)
    local model = GetEntityModel(vehicle)
    local isHeli = IsThisModelAHeli(model)
    if isHeli then
        return (config.vehicle.helicopter.allowShooting or false) and
            speed <= (config.vehicle.helicopter.maxHelicopterSpeed or 72)
    end
    local driverCanShoot = config.vehicle.driverCanShoot or false

    local canShoot = (config.vehicle.allowShooting or false) and speed <= (config.vehicle.maxVehicleSpeed or 36) and
        (driverCanShoot or seat > -1)

    return canShoot
end

AddEventHandler('ox_inventory:currentWeapon', function(weaponData)
    currentWeapon = weaponData

    if not weaponData?.hash then
        return
    end
    if isFirstPerson and currentWeapon then
        enableFirstPersonAiming()
    end

    setWeaponAccuracy(weaponData, cache.vehicle)
end)

lib.onCache('seat', function(seat)
    LocalPlayer.state.canUseWeapons = canShootInVehicle(cache.vehicle, seat)

    if not currentWeapon then return end
    setWeaponAccuracy(currentWeapon, cache.vehicle)
end)

TriggerEvent('chat:addSuggestion', '/aim', 'Toggle aiming mode')
RegisterCommand("aim", function()
    isFirstPerson = not isFirstPerson
    SetResourceKvpInt("ViewMode", isFirstPerson and 1 or 0)


    if isFirstPerson and currentWeapon then
        enableFirstPersonAiming()
    end

    lib.notify({
        title = 'Aiming Mode',
        description = isFirstPerson and 'First Person enabled' or 'Third Person enabled',
        type = 'success',
        position = 'bottom'
    })

    setWeaponAccuracy(currentWeapon, cache.vehicle)
end, false)
