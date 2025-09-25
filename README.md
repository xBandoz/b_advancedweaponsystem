# b_advancedweaponsystem

# 🎯 FiveM Weapon Accuracy & Aiming Mode

[![FiveM](https://img.shields.io/badge/FiveM-Resource-orange?style=for-the-badge&logo=fivem)](https://fivem.net)
[![ox_lib](https://img.shields.io/badge/dependency-ox__lib-blue?style=for-the-badge)](https://overextended.dev/ox_lib)
[![ox_inventory](https://img.shields.io/badge/dependency-ox__inventory-green?style=for-the-badge)](https://overextended.dev/ox_inventory)

A comprehensive FiveM script that dynamically adjusts weapon spread based on aiming mode, vehicle type, and weapon attachments. Includes a toggle between third-person and first-person aiming.

---

## ✨ Features

- 🔫 **Dynamic Weapon Spread**
  - GTA V default spread with customizable multipliers.
  - Vehicle and helicopter spread adjustments.
  - Component-based spread reduction or increase.
- 👁️ **Aiming Mode Toggle**
  - `/aim` command toggles between **Third-Person** and **First-Person** aiming.
  - Automatically forces first-person when aiming if enabled.
- 🚗 **Vehicle and Seat Handling**
  - Prevents drivers from firing weapons; passengers can shoot.
  - Updates spread dynamically when entering/exiting vehicles or changing seats.
- 🛠️ **Developer-Friendly**
  - Debug mode prints weapon name and current spread (`config.debug = true`).
  - Highly configurable through `config.lua`.

---

## ⚙️ Configuration (`config.lua`)

Example structure:

```lua
return {
    debug = false,              -- prints weapon name and spread.
    defaultSpread = 0.5,        -- used when a weapon isn’t defined in weaponSpreadValues
    vehicle = {
        allowShooting = true,   -- if false, players cannot shoot from vehicles at all
        driverCanShoot = false, -- if false, vehicle driver cant shoot
        speedUnit = "kmh",      -- "kmh" or "mph"
        maxVehicleSpeed = 10,   -- max speed to allow shooting in cars
        inVehicleMultiplier = 2.0,
        helicopter = {
            allowShooting = true,    -- helicopter specific
            maxHelicopterSpeed = 50, -- max speed to allow shooting in helicopters
            noSpread = true,         -- if false, bullets spread when shooting in helicopter and inHeliMultiplier applys to weaponSpreadValues.
            inHeliMultiplier = 1.0,
        }
    },

    weaponSpreadValues = {
        -- Handguns
        [453432689] = 1.5,   -- weapon_pistol
        [-1075685676] = 1.4, -- weapon_pistol_mk2
        [1593441988] = 1.4,  -- weapon_combatpistol
        -- SMGs
        [734278471] = 6.0,   -- weapon_uzi
        [199456042] = 6.0,   -- weapon_mac10
        [-634552258] = 0.5,  -- weapon_mp5
        -- Rifles, Shotguns, Snipers, etc.
    },

    componentSpreadReduces = {
        ["at_scope_macro"] = -1.0,
        ["at_scope_holo"] = -2.0,
        ["at_grip"] = -2.0,
        ["at_barrel"] = -5.0,
        ["at_flashlight"] = -0.05,
        ["at_suppressor_light"] = 0.3,
        -- Add more attachments as needed
    },

    WeaponAttachments = {
        scopes = { "at_scope_macro", "at_scope_small", "at_scope_medium" },
        suppressors = { "at_suppressor_light", "at_suppressor_heavy" },
        grips = { "at_grip" },
        flashlights = { "at_flashlight" },
        barrels = { "at_barrel" },
        clips = { "at_clip_extended_pistol", "at_clip_extended_smg" },
    },
}
```
