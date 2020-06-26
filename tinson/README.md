# Changelog

## 1.1.0 - [ 26.06.2020 ]

### Added
- New Macros
  - F4 script
    - Macro used in Monster Park Extreme, which features time-limited instanced maps.
  - F3 script
    - Macro experimenting with ControlSend, a functino whose purpose is to send commands to a window that is NOT active. Not yet working as intended, WIP.
  - F1 script
    - Macro used to immediately exit AHK. Higher priority than break commands. 
- New purpose tags
  - "Timed Movement"
- New map
  - Monster Park Extreme Forbidden Time
  
 ### Changed
 - Updated some scripts
   - F5 script
     - Added two extra attacks after each finishing_sweep() call to better handle stronger monsters.
   - Numpad5 script
     - Shifted ordering of Dark Genesis and Sweeping Staff to better adapt to lowered cooldown timings.  
 - swimming_loop_left() and swimming_loop_right() functions number of attacks increased to better handle stronger monsters
 - In some scripts, changed values of various delay buffers to better handle server-related lag issues. Affected scripts:
   - F12 script
   - Numpad5 
   
 ### Removed
 - Purpose tag breakdown section from README moved to its own file
 
 ---

## 1.0.1 - [ 07.06.2020 ]
### Added 
- New purpose tags 
  - "No Movement" 
- New maps
  - Lachelein Ballroom (entire region)
  - Lachelein Ballroom 3
  - Lachelein Clocktower (entire region)

### Changed
- Some scripts have been given new tags and new maps:
  - F12 script
     - Added "No Movement" tag
     - Added Nest of a Dead Dragon
     - Added Lachelein Ballroom
     - Added Lachelein Clocktower
  - 'Minus' sign script
    - Added "No Movement" tag
  - Numpad5 script
    - Added "Climbing" tag
  - F6 script
    - Added Lachelein Ballroom 3
  - F5 script
    - Added "No Movement" tag
  
### Removed
- Some comments in the .ahk file itself were removed 
  - Specifically, the "GENERAL STATEMENT: ..." that was found in the comments preceding each script
  
---

## 1.0.0 - [ 30.05.2020 ]
### Added
- Initial commit to GitHub.
  - 'tinstia_magic.ahk' 
    - Includes magic for the following purposes/maps:
      - "Fast Farm"/Any map
      - "Stasis Farm", "Swimming"/Inside the Stone Colossus 2
      - "Stasis Farm"/Nest of a Dead Dragon
      - "Stasis Farm"/Warped Path of Time 2
      - "Stasis Farm", "Climbing"/Slurpy Forest Depths
      - "Stasis Farm"/Forgotten Path of Time 1
      
  - 'beginners_guide.ahk'
   - An introduction to using AHK for KastiaMS written for friends and guild mates
