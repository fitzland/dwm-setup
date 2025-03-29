# 🪟 openbox-setup

A complete Openbox configuration setup by [JustAGuy Linux](https://www.youtube.com/@JustAGuyLinux), featuring a polished, minimal desktop experience with theming, tools, and smart automation via a single `install.sh` script.

![2025-03-27_14-36_3](https://github.com/user-attachments/assets/7c5a4f82-3ec8-48e2-aab6-924d5f41b261)

## 📦 What's Included

- 🖼️ Openbox configuration with custom theme: `Simply_Circles_Dark`
- 🧠 Smart workspace keybinds, window snapping, and mouse actions
- 📁 File manager: Thunar with archive plugin
- 🖥️ Terminal: [WezTerm](https://wezfurlong.org/wezterm/)
- 🔍 App launcher: XFCE4-appfinder
- 🔔 Notifications: Dunst
- 💡 Compositor: Picom (FT-Labs build)
- 📊 Panel: Polybar
- 🌗 Redshift toggle + volume scripts
- 🎛️ GTK & icon themes (Orchis & Colloid)
- 📄 Keybind viewer: `Super + h` for Rofi
- 🧰 `obmenu-generator` with dynamic menu support

## 📂 `~/.config/openbox` Layout

This is what your Openbox environment will look like after installation:

```
~/.config/openbox/
├── rc.xml                 # Main Openbox configuration
├── autostart              # Startup applications
├── environment            # Session environment variables
├── menu.xml               # Right-click menu (static fallback)
├── keybinds.rasi          # Rofi template to display keybinds
├── wallpaper/             # Default and user wallpapers
├── dunst/                 # Notification system configuration
│   └── dunstrc
├── picom/                 # Picom compositor configuration
│   └── picom.conf
├── polybar/               # Panel bar setup
│   ├── config.ini
│   └── launch.sh
├── rofi/                  # Rofi theme and launcher config
│   ├── config.rasi
│   └── keybinds.rasi
├── scripts/               # Custom helper scripts
│   ├── redshift-on
│   ├── redshift-off
│   ├── changevolume
│   └── keyhelper.sh
└── obmenu-generator/      # Dynamic Openbox menu system
    └── schema.pl
```

## 🚀 Installation

1. Clone the repository:
```bash
git clone https://github.com/drewgrif/openbox-setup.git
cd openbox-setup
chmod +x install.sh
```

2. Run the installer:
```bash
./install.sh
```

3. Follow the prompts — your Openbox environment will be ready in minutes!

## 💾 What It Installs

The script will:

- Back up any existing `~/.config/openbox` directory
- Install required packages (`openbox`, `rofi`, `picom`, `thunar`, etc.)
- Set up themes and GTK appearance
- Install [fastfetch](https://github.com/fastfetch-cli/fastfetch) and your preferred config
- Install [wezterm](https://github.com/wez/wezterm)
- Optionally replace `.bashrc` with one from [jag_dots](https://github.com/drewgrif/jag_dots)
- Install and configure `obmenu-generator` with a custom schema
- Apply user directories and screenshot folder
- Enable relevant services (`avahi-daemon`, `acpid`)

## 🧷 Key Features

| Shortcut            | Action                           |
|---------------------|----------------------------------|
| `Super + Enter`     | Launch terminal (WezTerm)        |
| `Super + Space`     | App launcher (xfce4-appfinder)              |
| `Super + H`         | Show keybinds in terminal        |
| `Super + Arrow Keys`| Snap window to side/center       |
| `Super + 1-0`       | Switch to desktop                |
| `Super + Shift + 1-0`| Move window to desktop          |
| `Print`             | Screenshot via `maim`            |
| `Super + Print`     | Screenshot via `flameshot`       |
| `XF86Audio*`        | Multimedia keys support          |

## 🧠 Notes

- Menu is generated dynamically via `obmenu-generator -p -i`
- Wallpapers live in `~/.config/openbox/wallpaper/`
- Scripts are in `~/.config/openbox/scripts/`
- Keybind reference opens via `Super + H`

## 🎨 Themes

- **Openbox theme:** `Simply_Circles_Dark` (included in this repo)
- **GTK Theme:** [Orchis](https://github.com/vinceliuice/Orchis-theme) — dark with teal & grey tweaks
- **Icon Theme:** [Colloid](https://github.com/vinceliuice/Colloid-icon-theme) — Everforest/Dracula variants  
  > 💡 _Special thanks to [vinceliuice](https://github.com/vinceliuice) for creating these excellent GTK and icon themes._

## 🛠️ Repo Directory Structure

```
openbox-setup/
├── install.sh              # One script to install and configure everything
├── README.md               # This file
└── config/
    ├── rc.xml              # Main Openbox config
    ├── autostart           # Startup applications
    ├── environment         # Session environment variables
    ├── menu.xml            # Static right-click menu
    ├── keybinds.rasi       # Rofi cheatsheet theme
    ├── dunst/              # Notification settings
    ├── picom/              # FT-Labs Picom config
    ├── polybar/            # Panel configuration
    ├── rofi/               # Rofi themes/configs
    ├── scripts/            # Custom volume/redshift/keybind tools
    ├── wallpaper/          # Default and custom wallpapers
    ├── obmenu/             # obmenu-generator schema
    └── themes/
        └── Simply_Circles_Dark/  # Openbox window border theme
```


## 📺 Watch on YouTube

Want to see how it looks and works?  
🎥 Check out [JustAGuy Linux on YouTube](https://www.youtube.com/@JustAGuyLinux)
