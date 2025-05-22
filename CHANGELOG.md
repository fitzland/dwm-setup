# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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