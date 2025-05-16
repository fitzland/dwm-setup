# 📺 st-build

A minimal but powerful Simple Terminal (st) build with key usability patches.  
Includes transparency, scrollback, clipboard enhancements, and custom font configuration — ready to use out of the box.

> Part of the [JustAGuy Linux](https://github.com/drewgrif) terminal collection.

---

## 🚀 Installation

```bash
git clone https://github.com/drewgrif/st-build.git
cd st-build
make clean install
```

This assumes you have the necessary X11 development libraries installed.

---

## 📦 Features

| Component        | Description                                   |
|------------------|-----------------------------------------------|
| Transparency     | Adjustable background opacity (95%)           |
| Scrollback       | 2000 line buffer with keyboard navigation     |
| Mouse Scrolling  | Scroll through terminal history               |
| Clipboard        | Enhanced copy/paste functionality             |
| Font Fallback    | Support for multiple fonts including Nerd Font|
| Window Resizing  | Any dimension resizing with the anysize patch |
| Colors           | GitHub-inspired dark theme                    |

---

## 🧩 Patches Applied

| Patch                       | Purpose                                |
|-----------------------------|----------------------------------------|
| `st-alpha-20240814`         | Transparency support                   |
| `st-anysize-20220718`       | Resize to any dimension                |
| `st-bold-is-not-bright`     | Improved text styling                  |
| `st-clipboard-0.8.3`        | Enhanced copy/paste                    |
| `st-delkey-20201112`        | Fixed delete key behavior              |
| `st-font2-0.8.5`            | Fallback fonts support                 |
| `st-scrollback-0.9.2`       | Terminal history buffer                |
| `st-scrollback-mouse-0.9.2` | Mouse-based scrolling                  |

---

## 🎨 Font Configuration

This build uses SauceCodePro Nerd Font Mono as the primary font with FiraCode Nerd Font and Symbols Nerd Font as fallbacks, ensuring excellent symbol coverage while maintaining a clean appearance.

---

## 🔑 Key Shortcuts

| Shortcut             | Action                          |
|----------------------|---------------------------------|
| `Shift+Page Up/Down` | Scroll through terminal history |
| `Ctrl+Shift+C/V`     | Copy/paste                      |
| Mouse wheel          | Scroll through history          |

---

## ⚙️ Technical Details

```
~/.config/suckless/st/
├── config.h          # Main configuration file
├── st.c              # Core terminal code
├── x.c               # X11 integration
└── patches/          # Applied patches
```

---

## 🛠️ Customization

To modify this build:

1. Edit `config.h` to change colors, fonts, or keyboard shortcuts
2. Run `make clean install` to rebuild and install

Current transparency setting: **0.95** opacity
Current scrollback buffer: **2000** lines

---

## 📜 Requirements

- Xlib header files
- Fontconfig
- X11 development libraries

---

## 📺 Watch on YouTube

Want to see how it works?  
🎥 Check out [JustAGuy Linux on YouTube](https://www.youtube.com/@JustAGuyLinux)
