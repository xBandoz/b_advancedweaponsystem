return {
    debug = true,                -- prints weapon name and spread.
    defaultSpread = 0.5,         -- used when a weapon isn’t defined in weaponSpreadValues
    fpMultiplier = 0.5,          -- under 1.0 is decreasing spread
    fpmAffectsComponents = true, -- if false, fpMultiplier wont affect componentSpreadReduces
    vehicle = {
        allowShooting = true,    -- if false, players cannot shoot from vehicles at all
        driverCanShoot = false,  -- if false, vehicle driver cant shoot
        speedUnit = "kmh",       -- "kmh" or "mph"
        maxVehicleSpeed = 10,    -- max speed to allow shooting in cars
        inVehicleMultiplier = 2.0,
        helicopter = {
            allowShooting = true,    -- helicopter specific
            maxHelicopterSpeed = 50, -- max speed to allow shooting in helicopters
            noSpread = true,         -- if false, bullets spread when shooting in helicopter and inHeliMultiplier applys to weaponSpreadValues.
            inHeliMultiplier = 1.0,
        }
    },

    weaponSpreadValues = { -- GTA V DEFAULT = 0.50
        --customit
        ["WEAPON_UZI"] = 6.0,
        ["WEAPON_MAC10"] = 6.0,
        ["WEAPON_MP5"] = 0.5,
        ["WEAPON_GLOCK17"] = 1.0,
        ["WEAPON_FNX45"] = 1.4,
        ["WEAPON_M1911"] = 1.4,
        ["WEAPON_M9"] = 1.5,
        ["WEAPON_M70"] = 5.0,
        ["WEAPON_SCARH"] = 0.1,
        ["WEAPON_HUNTINGRIFLE"] = 2.5,

        -- Handguns
        ["WEAPON_PISTOL"] = 1.5,
        ["WEAPON_PISTOL_MK2"] = 1.4,
        ["WEAPON_COMBATPISTOL"] = 1.4,
        ["WEAPON_APPISTOL"] = 4.0,
        ["WEAPON_STUNGUN"] = 1.0,
        ["WEAPON_PISTOL50"] = 1.4,
        ["WEAPON_SNPISTOL"] = 1.4,
        ["WEAPON_HEAVYPISTOL"] = 1.8,
        ["WEAPON_VINTAGEPISTOL"] = 1.4,
        ["WEAPON_FLAREGUN"] = 1.0,
        ["WEAPON_MARKSMANPISTOL"] = 1.0,
        ["WEAPON_REVOLVER"] = 1.0,
        ["WEAPON_REVOLVER_MK2"] = 1.0,
        ["WEAPON_DOUBLEACTION"] = 1.0,
        ["WEAPON_SNPISTOL_MK2"] = 1.4,
        ["WEAPON_RAYPISTOL"] = 1.0,
        ["WEAPON_CERAMICPISTOL"] = 1.0,
        ["WEAPON_NAVYREVOLVER"] = 1.0,
        ["WEAPON_GADGETPISTOL"] = 1.0,
        ["WEAPON_TECPISTOL"] = 6.5,

        -- Submachine Guns
        ["WEAPON_SMG"] = 4.5,
        ["WEAPON_SMG_MK2"] = 4.0,
        ["WEAPON_ASSAULTSMG"] = 4.0,
        ["WEAPON_COMBATPDW"] = 4.5,
        ["WEAPON_MACHINEPISTOL"] = 5.5,
        ["WEAPON_MINISMG"] = 6.5,
        ["WEAPON_RAYCARBINE"] = 4.5,

        -- Shotguns
        ["WEAPON_PUMPSHOTGUN"] = 6.6,
        ["WEAPON_SAWNOFFSHOTGUN"] = 6.6,
        ["WEAPON_ASSAULTSHOTGUN"] = 6.6,
        ["WEAPON_BULLPUPSHOTGUN"] = 6.6,
        ["WEAPON_MUSKET"] = 6.6,
        ["WEAPON_HEAVYSHOTGUN"] = 6.6,
        ["WEAPON_DBSHOTGUN"] = 6.6,
        ["WEAPON_AUTOSHOTGUN"] = 6.6,
        ["WEAPON_PUMPSHOTGUN_MK2"] = 6.6,
        ["WEAPON_COMBATSHOTGUN"] = 6.6,

        -- Assault Rifles
        ["WEAPON_ASSAULTRIFLE"] = 4.0,
        ["WEAPON_ASSAULTRIFLE_MK2"] = 3.0,
        ["WEAPON_CARBINERIFLE"] = 4.0,
        ["WEAPON_CARBINERIFLE_MK2"] = 3.0,
        ["WEAPON_ADVANCEDRIFLE"] = 2.5,
        ["WEAPON_SPECIALCARBINE"] = 3.0,
        ["WEAPON_BULLPUPRIFLE"] = 4.0,
        ["WEAPON_COMPACTRIFLE"] = 6.0,
        ["WEAPON_SPECIALCARBINE_MK2"] = 2.0,
        ["WEAPON_BULLPUPRIFLE_MK2"] = 2.2,
        ["WEAPON_MILITARYRIFLE"] = 4.0,
        ["WEAPON_TACTICALRIFLE"] = 2.0,
        ["WEAPON_HEAVYRIFLE"] = 0.5,
        ["WEAPON_BATTLERIFLE"] = 5.5,

        -- Light Machine Guns
        ["WEAPON_MG"] = 0.1,
        ["WEAPON_COMBATMG"] = 0.1,
        ["WEAPON_GUSENBERG"] = 2.1,
        ["WEAPON_COMBATMG_MK2"] = 0.1,

        -- Sniper Rifles
        ["WEAPON_SNIPERRIFLE"] = 0.5,
        ["WEAPON_HEAVYSNIPER"] = 0.7,
        ["WEAPON_MARKSMANRIFLE"] = 0.3,
        ["WEAPON_REMOTESNIPER"] = 1.2,
        ["WEAPON_HEAVYSNIPER_MK2"] = 0.6,
        ["WEAPON_MARKSMANRIFLE_MK2"] = 0.3,

        -- Heavy Weapons
        ["WEAPON_RPG"] = 0.0,
        ["WEAPON_GRENADELAUNCHER"] = 1.0,
        ["WEAPON_GRENADELAUNCHER_SMOKE"] = 1.0,
        ["WEAPON_MINIGUN"] = 0.1,
        ["WEAPON_FIREWORK"] = 0.3,
        ["WEAPON_RAILGUN"] = 2.4,
        ["WEAPON_HOMINGLAUNCHER"] = 0.0,
        ["WEAPON_COMPACTLAUNCHER"] = 0.5,
        ["WEAPON_RAYMINIGUN"] = 0.3,
    },

    componentSpreadReduces = {
        -- Scopes
        ["at_scope_macro"] = -1.0,
        ["at_scope_holo"] = -2.0,
        ["at_scope_small"] = -0.5,
        ["at_scope_medium"] = -1.0,
        ["at_scope_large"] = -2.0,
        ["at_scope_advanced"] = -3.0,
        ["at_scope_nv"] = -4.0,
        ["at_scope_thermal"] = 3.0,

        -- Grips
        ["at_grip"] = -2.0,

        -- Barrels (improve accuracy)
        ["at_barrel"] = -5.0,

        -- Flashlight
        ["at_flashlight"] = -0.05,

        -- Suppressors
        ["at_suppressor_light"] = 0.3,
        ["at_suppressor_heavy"] = 0.6,

        -- Muzzles
        ["at_compensator"] = -1.0,
        ["at_muzzle_flat"] = -1.0,
        ["at_muzzle_tactical"] = -1.2,
        ["at_muzzle_fat"] = -1.0,
        ["at_muzzle_precision"] = -1.0,
        ["at_muzzle_heavy"] = -1.0,
        ["at_muzzle_slanted"] = -1.0,
        ["at_muzzle_split"] = -1.0,
        ["at_muzzle_squared"] = -1.0,
        ["at_muzzle_bell"] = -1.0,

        -- Clips (no spread effect, capacity-based)
        ["at_clip_extended_pistol"] = 1.0,
        ["at_clip_extended_smg"] = 1.0,
        ["at_clip_extended_shotgun"] = 1.0,
        ["at_clip_extended_rifle"] = 1.0,
        ["at_clip_extended_mg"] = 2.0,
        ["at_clip_extended_sniper"] = 5.0,

        ["at_clip_drum_smg"] = 3.0,
        ["at_clip_drum_shotgun"] = 3.0,
        ["at_clip_drum_rifle"] = 3.0,

    },

    WeaponAttachments = {
        scopes = {
            "at_scope_macro",
            "at_scope_small",
            "at_scope_medium",
            "at_scope_large",
            "at_scope_advanced",
            "at_scope_nv",
            "at_scope_thermal",
        },
        suppressors = {
            "at_suppressor_light",
            "at_suppressor_heavy",
        },
        grips = {
            "at_grip",
        },
        flashlights = {
            "at_flashlight",
        },
        muzzles = {
            "at_muzzle_flat",
            "at_muzzle_tactical",
            "at_muzzle_fat",
            "at_muzzle_precision",
            "at_muzzle_heavy",
            "at_muzzle_slanted",
            "at_muzzle_split",
            "at_muzzle_squared",
            "at_muzzle_bell",
        },
        barrels = {
            "at_barrel",
        },
        clips = {
            "at_clip_extended_pistol",
            "at_clip_extended_smg",
            "at_clip_extended_shotgun",
            "at_clip_extended_rifle",
            "at_clip_extended_mg",
            "at_clip_extended_sniper",
            "at_clip_drum_smg",
            "at_clip_drum_shotgun",
            "at_clip_drum_rifle",
        },
    },
}
