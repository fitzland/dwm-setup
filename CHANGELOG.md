# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2025-08-25]

### Changed
- Updated README.md documentation
- Cleaned up repository by removing config.h (using config.def.h instead)
- Improved .gitignore files to protect special files without extensions
- Removed compiled object files and executables from repository

### Fixed
- File protection for special files in .gitignore (PR #3 by [@JeffofBread](https://github.com/JeffofBread))

## [2025-08-20]

### Changed
- Updated install.sh to remove bashrc option
- Refactored installer for better functionality

## [2025-07-02]

### Changed
- Removed wallpaper from repository but added to script functionality
- Updated install.sh

### Removed
- install.sh.orig file (cleanup)

## [2025-06-15]

### Added
- install_minimal.sh script for minimal installation option

### Changed
- Major refactoring to make setup more suckless-compliant
- Updated README.md documentation
- Multiple improvements to install_minimal.sh

## [2025-05-31]

### Changed
- Multiple updates and improvements to install.sh

## [2025-05-23]

### Changed
- Updated install.sh
- Made dunstrc configuration more streamlined

## [2025-05-22]

### Added
- Native scratchpad terminal (spterm3) mapped to Mod+Shift+Return
  - Replaces tdrop dependency for floating terminal functionality
  - Third scratchpad with different floating behavior (isfloating=0)
- Fullscreen toggle functionality (Mod+Shift+f)
  - Switches between last layout and monocle mode
  - Automatically hides/shows status bar

### Changed
- Updated scratchpad rules to include isfloating parameter
- Removed tdrop command from sxhkd configuration
- Updated install.sh (removed 25 lines for cleanup/optimization)

### Removed
- Dependency on tdrop for floating terminal

## [2025-05-21]

### Changed
- Updated README.md documentation

### Removed
- Deprecated st-alpha patch (st-alpha-20220206-0.8.5.diff)

## [2025-05-20]

### Added
- New installer script with improved functionality
- Initial dwm configuration with multiple patches:
  - alwayscenter
  - attachbottom
  - cool-autostart
  - fixborders
  - focusadjacenttag
  - focusedontop
  - focusonnetactive
  - movestack
  - pertag
  - preserveonrestart
  - restartsig
  - scratchpads
  - status2d-systray
  - togglefloatingcenter
  - vanitygaps
  - windowfollow
- st (simple terminal) with patches:
  - alpha transparency
  - anysize
  - bold-is-not-bright
  - clipboard
  - delkey
  - font2
  - scrollback
  - scrollback-mouse
- slstatus configuration
- dunst notification daemon configuration
- picom compositor configuration
- rofi launcher configuration
- sxhkd hotkey daemon configuration
- Collection of wallpapers
- Helper scripts:
  - autostart.sh
  - changevolume
  - discord.sh
  - dwm-layout-menu.sh
  - firefox-latest.sh
  - help
  - librewolf-install.sh
  - neovim.sh
  - power
  - redshift-off/on

### Changed
- Updated install.sh with improved installation process
- Enhanced README documentation

### Removed
- Deprecated st-alpha patch (st-alpha-20220206-0.8.5.diff)