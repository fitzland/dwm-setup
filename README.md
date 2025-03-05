# JustAGuy Linux DWM Build

This is my customized build of [dwm](https://dwm.suckless.org/), designed for my personal workflow. It includes essential patches, a customized `config.def.h`, and pre-defined keybindings to enhance the tiling window manager experience.

---

## Features

- Dynamic window management with floating and tiling modes
- Keybindings for window navigation, layouts, and scratchpads
- Integration with `sxhkd` for extended keybinding management
- Custom `rofi` keybinding viewer (optional)

---

## 📥 Installation Summary

| Programs                           | Category          |
|------------------------------------|------------------|-
| ghostty                            | Terminal (main)  |
| tilix                              | Terminal (quake mode)  |
| dmenu                            | Application Launcher  |
| rofi                            | Application Launcher  |


## 📝 Patches Summary

| Patch                              | Category          |
|------------------------------------|------------------|-
| alwayscenter                       | Floating windows  |
| attachbottom                       | Window order      |
| cool-autostart                     | Autostart         |
| fixborders                         | Visual fix        |
| floatrules                         | Floating rules    |
| focusadjacenttag                   | Navigation        |
| focusedontop                       | Floating windows  |
| focusonnetactive                   | Compatibility     |
| movestack                          | Window management |
| pertag                             | Layout memory     |
| preserveonrestart                  | Session persistence
| restartsig                         | Restart ability   |
| scratchpads                        | Workflow          |
| status2d-systray                   | Bar features      |
| togglefloatingcenter               | Floating windows  |
| vanitygaps                         | Visual spacing    |
| windowfollow                       | Navigation        |

---

## 📜 Patch Documentation: Your DWM Patch List

---

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

### 5. `dwm-floatrules-20210801-138b405.diff`
**What it does:**  
Lets you define **rules for certain apps to always open floating** (like `pavucontrol` or `GParted`).

**Why it's useful:**  
Critical for workflow. Some apps (dialogs, settings windows) just don't work well tiled, so you want them **always floating** without manual intervention.

---

### 6. `dwm-focusadjacenttag-6.3.diff`
**What it does:**  
Adds keybindings to **quickly switch to the next or previous tag**.

**Why it's useful:**  
Great for workflows where you spread work across multiple tags. Makes it easier to quickly switch to adjacent tags without a numeric jump.

---

### 7. `dwm-focusedontop-6.5.diff`
**What it does:**  
Forces the currently focused floating window to always be on top.

**Why it's useful:**  
Prevents floating windows from accidentally being covered by tiled windows when they lose focus.

**[This is a patch created by Bakkeby for dwm-flexipatch](https://github.com/bakkeby/patches/blob/master/dwm/dwm-focusedontop-6.5.diff)**

---

### 8. `dwm-focusonnetactive-6.2.diff`
**What it does:**  
Ensures DWM correctly focuses windows that request focus via _NET_ACTIVE_WINDOW (like some app popups).

**Why it's useful:**  
Improves compatibility with external programs and scripts (e.g., notification popups, some dialogs, and xdg-open behavior).

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


