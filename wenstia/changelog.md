# Changelog

## 1.4.0 - [ 13.09.2020 ]
Kastia was shut down so this will be the last commit to the repository. 

## 1.3.0 - [ 29.07.2020 ]
### Changed
- [ALT+3] hotkey now performs the same macro as [ALT+2] but using the Z key instead.

### Removed
- Removed 'buffs()' from macros

## 1.2.1 - [ 12.06.2020 ]
### Changed
- buffs() disabled from macros. Obtained a buff crystal which allows for 1-hour-long duration for buffs so no need to cast it so frequently.
- Changed attack key from Z to X. Spirit Claw key binding moved from Z to X.

## 1.2.0 -  [ 03.06.2020 ]
### Added
- Created new folder for .ahk script.
- Completed the code for Auto Chaos Dojo.
- 
### Changed 
- Renamed repository from 'wenstia' to 'full-maple-alchemist'
- Added separate folders to separate macro files.

### Removed
- Auto Hell Dojo macro.

## 1.1.1 -  [ 03.06.2020 ]
### Added
- New Macros:
  - Flat Plat Left/Right
  - Stationary Attack
- Skeleton code for new macro: Auto Chaos Dojo.

### Changed
- In-code comments now say "MACRO" for macros and "FUNCTION" for functions.
- buff()
  - Buff delay is now specified by a variable rather than a hard value.
- Added TODO for Auto-Gathering, Hell Dojo, and Chaos Dojo.

## 1.1.0 -  [ 02.06.2020 ]
### Added
- New macros:
  - Hell Dojo
  - Auto-Gathering
- Visual indicator of scripts running via the "inventory" key.
- More breakpoints for more responsive macro toggling.

### Changed
- Macro hotkeys from {CTRL + } to {ALT +}.
- Renamed "flat map travel" macro to "swim" to fit with Kastia terminology.

## 1.0.0 - [ 30.05.2020 ]
### Added
- Initial commit to GitHub.
- Macros work by toggling via {CTRL + } keys.
- Macros include:
  - toggle
  - "flat map travel"
- Functions include:
  - buffs()
  - flash_jump_attack()
