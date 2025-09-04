# 🧱 dwm-setup

![Made for Debian](https://img.shields.io/badge/Made%20for-Debian-A81D33?style=for-the-badge&logo=debian&logoColor=white)

A minimal suckless DWM setup for Debian-based systems.  
Following the suckless philosophy with carefully selected patches — simple, efficient, and hackable.

> Part of the [JustAGuy Linux](https://codeberg.org/justaguylinux) window manager collection.

## 📜 Suckless Philosophy

This setup adheres to the [suckless philosophy](https://suckless.org/philosophy/):
- **Simplicity** - Minimal code, maximum functionality
- **Clarity** - Configuration through clean C header files
- **Hackability** - Easy to understand, modify, and extend

Configuration follows the suckless way: edit `config.def.h`, remove `config.h`, then recompile — no bloated config systems.

---

## 🚀 Installation

### Quick Install
```bash
git clone https://codeberg.org/justaguylinux/dwm-setup.git
cd dwm-setup
chmod +x install.sh
./install.sh
```

### Installation Options

The installer follows the suckless principle of simplicity:

```bash
./install.sh [OPTIONS]

Options:
  --only-config      Only copy config files (perfect for non-Debian distros)
  --export-packages  Export package lists for different distros and exit
  --help            Show usage information
```

### Distribution-Agnostic Installation

<details>
<summary><strong>⚠️ UNSUPPORTED: Instructions for other distributions (click to expand)</strong></summary>

**IMPORTANT:** These instructions are provided as-is for advanced users. Non-Debian distributions are **NOT officially supported**. Package names and availability may vary. Use at your own risk.

**Quick Package Export:**
```bash
# Export package lists for all supported distros
./install.sh --export-packages
```

This will display properly formatted package lists for:
- Debian/Ubuntu (apt)
- Arch Linux (pacman) 
- Fedora (dnf)

**Manual Installation Process:**
1. Run `./install.sh --export-packages` to see package equivalents
2. Install the packages using your distro's package manager
3. Run `./install.sh --only-config` to copy configuration files
4. Compile and install suckless tools manually:
   ```bash
   cd ~/.config/suckless/dwm && sudo make clean install
   cd ~/.config/suckless/slstatus && sudo make clean install
   cd ~/.config/suckless/st && sudo make clean install
   ```

**Note:** Some packages may have different names or may not be available in all distributions. You may need to find equivalents or install from source.

</details>

### Advanced Usage Examples

```bash
# Export package lists for manual installation
./install.sh --export-packages

# Update only configuration files (no packages)
./install.sh --only-config

# Standard installation with optional tools prompt
./install.sh
```

**Note:** The script can be run from any location - it automatically detects its directory.

### What Gets Installed

The installer follows the suckless approach - only what's necessary:

1. **System Update** - Updates package lists and upgrades existing packages
2. **Core Packages** - Essential X11, build tools, and suckless dependencies
3. **UI Components** - Window manager utilities (rofi, dunst, etc.)
4. **System Tools** - File manager, audio controls, power management
5. **Suckless Builds** - Compiles and installs dwm, slstatus, and st
6. **External Tools** - Via butterscripts:
   - FT-Labs picom (compositor)
   - WezTerm (terminal emulator)
   - Nerd Fonts collection
   - Orchis theme & Colloid icons
   - LightDM display manager
   - Bashrc enhancements
7. **Optional Tools** - Additional browsers, editors, and utilities (prompted)

---

## 📦 What It Installs

### Suckless Tools & Core Components
| Component           | Purpose                          |
|---------------------|----------------------------------|
| `dwm`               | Tiling window manager (patched)  |
| `sxhkd`             | Keybinding daemon                |
| `slstatus`          | Status bar for DWM               |
| `st`                | Patched for scratchpad with transparency, scrollback, and clipboard support |
| `xorg` & tools      | Display server and utilities     |
| `build-essential`   | Compilation tools                |

### UI & System Tools
| Component           | Purpose                          |
|---------------------|----------------------------------|
| `rofi`              | App launcher + keybind viewer    |
| `dunst`             | Lightweight notifications        |
| `feh`               | Wallpaper setter                 |
| `lxappearance`      | GTK theme manager                |
| `network-manager`   | Network management applet        |
| `thunar`            | File Manager (+plugins)          |
| `pavucontrol`       | Audio control GUI                |
| `xfce4-power-manager`| Power management                |
| `flameshot`         | Screenshot tool                  |
| `qimgv`             | Lightweight image viewer         |
| `firefox-esr`       | Default web browser              |
| `nala`              | Better apt frontend              |

### External Tools (via butterscripts)
| Component           | Purpose                          |
|---------------------|----------------------------------|
| `picom` `(FT-Labs)` | Compositor with transparency     |
| `wezterm`           | Main terminal emulator           |
| Nerd Fonts          | Icon-enabled fonts               |
| Orchis & Colloid    | GTK theme and icons              |
| LightDM             | Display manager                  |

### Optional Tools (prompted during install)
Additional browsers, editors, and utilities available through the optional tools script.


---

## 🎨 Appearance & Theming

- GTK Theme: [Orchis](https://github.com/vinceliuice/Orchis-theme)
- Icon Theme: [Colloid](https://github.com/vinceliuice/Colloid-icon-theme)

> 💡 _Special thanks to [vinceliuice](https://github.com/vinceliuice) for the excellent GTK and icon themes._

---

## 🔑 Keybindings Overview

Keybindings are split between two systems:

- `~/.config/suckless/dwm/config.def.h` for **DWM-specific keybindings** (window management, layout control, tag switching)
- `~/.config/suckless/sxhkd/sxhkdrc` for **application launchers and system commands** (programs, scripts, media keys)

This separation keeps DWM's core window management bindings in the source while allowing hot-reloadable keybinds for launching applications via sxhkd.

Launch the keybind cheatsheet anytime with:

```bash
~/.config/suckless/scripts/help
```

| Shortcut             | Action                          |
|----------------------|---------------------------------|
| `Super + Enter`      | Launch terminal (WezTerm)       |
| `Super + Space`      | Launch rofi                     |
| `Super + H`          | Open keybind help via Rofi      |
| `Super + Q`          | Close focused window            |
| `Super + Shift + R`  | Restart DWM                     |
| `Super + Shift + L`  | Cycle through layouts           |
| `Super + 1–=`        | Switch to tag                   |
| `Super + Shift + 1–=`| Move window to tag              |

---

## 🧱 Layouts

Cycle layouts using:

```text
Super + Shift + L
```

<details>
<summary>Click to expand layout descriptions</summary>

These are the layouts included in this build, in the exact order from `config.def.h`:

- **`dwindle`** (`[\]`) — Fibonacci-style dwindle layout (default)
- **`tile`** (`[]=`) — Classic master-stack
- **`columnlayout`** (`[C]`) — Vertical column view
- **`centeredmaster`** (`|M|`) — Centered master, tiled sides
- **Floating** (`><>`) — Free window placement
- **`bstack`** (`TTT`) — Master on top, stack below
- **`nrowgrid`** (`###`) — Grid with fixed rows
- **`deck`** (`H[]`) — Master with tabbed stack
- **`gaplessgrid`** (`:::`) — Even, gapless grid
- **`spiral`** (`[@]`) — Spiral Fibonacci layout
- **`monocle`** (`[M]`) — Fullscreen stacked windows
- **`grid`** (`HHH`) — Even grid
- **`bstackhoriz`** (`===`) — Horizontal bstack
- **`centeredfloatingmaster`** (`>M>`) — Centered floating master
- **`horizgrid`** (`---`) — Wide-monitor horizontal grid

</details>

---

## 📂 Configuration Files

```
~/.config/suckless/
├── dwm/
│   ├── config.def.h         # Main DWM configuration (edit this)
├── st/
│   └── config.def.h         # ST terminal configuration (scratchpad terminal)
├── slstatus/
│   └── config.def.h         # Status bar configuration
├── sxhkd/
│   └── sxhkdrc              # Keybindings for sxhkd
├── dunst/
│   └── dunstrc              # Notification settings
├── picom/
│   └── picom.conf           # Compositor configuration
├── rofi/
│   └── keybinds.rasi        # Rofi keybinding cheatsheet
└── scripts/
    ├── autostart.sh         # Startup script
    └── help                 # Launches keybind viewer

~/.config/wezterm/
└── wezterm.lua              # Terminal configuration
```

---

## 🧩 Patches Summary

| Patch                  | Category                |
|------------------------|-------------------------|
| alwayscenter           | Floating windows        |
| attachbottom           | Window order            |
| cool-autostart         | Autostart               |
| fixborders             | Visual fix              |
| focusadjacenttag       | Navigation              |
| focusedontop           | Floating windows        |
| focusonnetactive       | Compatibility           |
| fullscreen             | Window management       |
| movestack              | Window management       |
| pertag                 | Layout memory           |
| preserveonrestart      | Session persistence     |
| restartsig             | Restart ability         |
| scratchpads            | Workflow                |
| status2d-systray       | Bar features            |
| togglefloatingcenter   | Floating windows        |
| vanitygaps             | Visual spacing          |
| windowfollow           | Navigation              |

---

## 📜 Patch Documentation

<details>
<summary>Click to expand Patch Documenation</summary>

### 1. `dwm-alwayscenter-20200625-f04cac6.diff`
**What it does:**  
Ensures that floating windows (new ones) always appear centered on the screen.

**Why it's useful:**  
Prevents floating windows from opening at weird edges or offsets, especially useful for dialogs or apps you want neatly centered (like file pickers or floating terminal windows).

---

### 2. `dwm-attachbottom-6.3.diff`
**What it does:**  
Newly spawned windows are added at the **bottom** of the stack instead of at the top.

**Why it's useful:**  
This can help keep your active window in focus instead of being immediately pushed out when new windows are created. Provides a more "natural" stacking order for some users.

---

### 3. `dwm-cool-autostart-20240312-9f88553.diff`
**What it does:**  
Adds an **autostart mechanism** to DWM without using `.xinitrc`.

**Why it's useful:**  
You can easily manage startup scripts directly in DWM’s codebase, making it more portable (especially when using login managers instead of `startx`). This patch also gracefully re-runs your autostart scripts if DWM is restarted.

---

### 4. `dwm-fixborders-6.2.diff`
**What it does:**  
Fixes a bug where **border width may be incorrect** after switching between floating and tiled layouts.

**Why it's useful:**  
Prevents graphical glitches and ensures windows always have the correct borders, especially on tiling/floating transitions.

---

### 5. `dwm-focusadjacenttag-6.3.diff`
**What it does:**  
Adds keybindings to **quickly switch to the next or previous tag**.

**Why it's useful:**  
Great for workflows where you spread work across multiple tags. Makes it easier to quickly switch to adjacent tags without a numeric jump.

---

### 6. `dwm-focusedontop-6.5.diff`
**What it does:**  
Forces the currently focused floating window to always be on top.

**Why it's useful:**  
Prevents floating windows from accidentally being covered by tiled windows when they lose focus.

**[This is a patch created by Bakkeby for dwm-flexipatch](https://github.com/bakkeby/patches/blob/master/dwm/dwm-focusedontop-6.5.diff)**

---

### 7. `dwm-focusonnetactive-6.2.diff`
**What it does:**  
Ensures DWM correctly focuses windows that request focus via _NET_ACTIVE_WINDOW (like some app popups).

**Why it's useful:**  
Improves compatibility with external programs and scripts (e.g., notification popups, some dialogs, and xdg-open behavior).

---

### 8. `dwm-fullscreen-6.2.diff`
**What it does:**  
Adds the ability for windows to be **faked fullscreen**, which is basically just a borderless, statusbar-less window that fits the entire screen.

**Why it's useful:**  
Some applications (like browsers, video players, and games) expect to be able to go fullscreen. This patch allows DWM to handle fullscreen requests properly while maintaining window management control. Unlike true fullscreen modes that bypass the window manager entirely, this keeps DWM in control while giving applications the fullscreen experience they expect.

**Usage:** Press `Super + Shift + F` to toggle fullscreen mode for the focused window.

---

### 9. `dwm-movestack-20211115-a786211.diff`
**What it does:**  
Allows you to **move windows up/down the stack**.

**Why it's useful:**  
Essential for organizing windows in the master-stack layout, letting you reorder windows directly instead of closing/reopening them.

---

### 10. `dwm-pertag-20200914-61bb8b2.diff`
**What it does:**  
Each tag remembers its own **layout, master count, and gaps settings**.

**Why it's useful:**  
This is one of the most **essential DWM patches** if you use multiple tags. It allows each workspace (tag) to have its own independent configuration instead of all tags sharing the same layout.

---

### 11. `dwm-preserveonrestart-6.3.diff`
**What it does:**  
Preserves window positions when restarting DWM.

**Why it's useful:**  
Critical if you like to restart DWM to reload config changes, keeping windows in place instead of resetting them.

---

### 12. `dwm-restartsig-20180523-6.2.diff`
**What it does:**  
Adds a **restart signal handler** so you can restart DWM without logging out.

**Why it's useful:**  
Allows easy config reloads and minor changes without logging out, pairing well with `preserveonrestart`.

---

### 13. `dwm-scratchpads-20200414-728d397b.diff`
**What it does:**  
Implements **scratchpads**, allowing you to spawn hidden windows (like a drop-down terminal).

**Why it's useful:**  
A classic feature from workflows like i3 and bspwm. Scratchpads are great for terminals, music players, or quick note apps.

---

### 14. `dwm-status2d-systray-6.4.diff`
**What it does:**  
Adds support for **color-embedded status text and a systray** in DWM’s status bar.

**Why it's useful:**  
Combines two essential features:
- Colored status text for aesthetic and information clarity.
- Systray support for handling system tray icons (volume, network, etc.), which is not natively supported in DWM.

---

### 15. `dwm-togglefloatingcenter-20210806-138b405f.diff`
**What it does:**  
Toggles a window between floating and tiled **while centering it if floating**.

**Why it's useful:**  
Combines two useful actions into one — not only toggling float, but also ensuring floating windows are neatly centered.

---

### 16. `dwm-vanitygaps-6.2.diff`
**What it does:**  
Adds support for **customizable outer and inner gaps** between windows.

**Why it's useful:**  
Essential for those who like cleaner layouts with space between windows. Especially good for aesthetic "rice" setups.

---

### 17. `dwm-windowfollow-20221002-69d5652.diff`
**What it does:**  
Makes it so that when you move a window to another tag, DWM will **follow you to that tag**.

**Why it's useful:**  
Enhances workflow — instead of moving a window to another tag and then manually switching to that tag, DWM follows automatically.

</details>

---

## ☕ Support

If this setup has been helpful, consider buying me a coffee:

<a href="https://www.buymeacoffee.com/justaguylinux" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy me a coffee" /></a>

## 📺 Watch on YouTube

Want to see how it looks and works?  
🎥 Check out [JustAGuy Linux on YouTube](https://www.youtube.com/@JustAGuyLinux)
