# fivem-velleb-trashcans

A trash can / stash system for FiveM using `ox_lib`, `ox_target`, and `ox_inventory`.

**Version:** v1.0.0
**Author:** Bradley — https://velleb.com

**Contents**
- `client.lua` — client-side logic (spawn props, add target entries)
- `server.lua` — server-side logic (register stashes, clearing loop)
- `config.lua` — shared configuration (locations, model, timing, inventory limits)
- `fxmanifest.lua` — resource manifest and metadata
- `locales/` — translation files

## Requirements
- A running FiveM server (CitizenFX)
- `ox_lib` (used for model requests and localization)
- `ox_target` (used to add target interactions to spawned trash cans)
- `ox_inventory` (used to register/open stashes)

## Installation
1. Copy this folder into your server `resources` directory.
2. Add the resource to your `server.cfg`:

```
ensure fivem-velleb-trashcans
```

3. Ensure required dependencies are started before this resource. Add (if not already present):

```
ensure ox_lib
ensure ox_target
ensure ox_inventory
```

4. Configure locations and settings by editing [config.lua](config.lua).

## Configuration
- Open [config.lua](config.lua) to change `ClearInterval`, `TrashModel`, `MaxSlots`, `MaxWeight`, and the `Locations` array.
- Each location must include an `id`, `label`, and `coords` (a `vec4`). Example locations are already provided.

The resource registers each trash can as an `ox_inventory` stash and spawns a physical prop with an `ox_target` interaction.

## Usage
- Start your server and visit one of the configured trash can coordinates.
- Aim and interact with the trash can (via `ox_target`) — this opens the stash inventory for that location.
- Stashes are registered on server start via `exports.ox_inventory:RegisterStash(...)` using each location's `id`.

## Troubleshooting
- If trash cans or targets do not appear, confirm the resource started in the server console and that dependencies (`ox_lib`, `ox_target`, `ox_inventory`) are running.
- Check [config.lua](config.lua) for `Locations` and ensure coordinates are valid and within the world bounds.
- Verify `ox_inventory` and `ox_target` exports are available on your server — the script uses `exports.ox_target` and `exports.ox_inventory` directly.
- Look at the server and client logs for runtime errors if props fail to spawn or interactions error out.

## Credits
- Built by Velleb — https://velleb.com

## Support
For issues or questions, open an issue in this repository.

---
Updated: 22 May 2026
