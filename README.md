# dotfiles-audio

Personal spatial audio & EQ presets for Linux (**PipeWire** + **EasyEffects 8+**).

Tuned specifically for headphone listening with tight bass, clear drums/synths, and natural holographic speaker staging.

---

## Presets Overview

| Preset | Description | When to use |
| :--- | :--- | :--- |
| **`Sony-WH-CH720N-Custom-Spatial`** *(Recommended)* | Tailored AutoEq profile for Sony WH-CH720N + Drums/Bass/Synth boost + OOYH room staging | Daily driver for Sony WH-CH720N owners |
| **`Ultimate-Spatial-OutOfYourHead`** | Generic natural speaker soundstage (measured room HRTF) | General listening, YouTube, long sessions |
| **`Music-Crystal-UltraWide`** | Wide stereo + zero reverb/mud | EDM, Synthwave, fast-paced music |
| **`Ultimate-Spatial-MaxxSpace`** | Wide 3D dome immersion | Movies, anime, atmospheric tracks |
| **`Spatial-GSX-Gaming`** | Sennheiser GSX binaural matrix | Competitive FPS (Apex, CS2, Valorant) |

---

## Prerequisites & Dependencies

Make sure **PipeWire** and **EasyEffects** along with recommended LV2 DSP plugins (Equalizer, Stereo Tools, Convolver) are installed:

### Arch Linux (`pacman`)

```bash
sudo pacman -S --needed pipewire pipewire-pulse easyeffects lsp-plugins-lv2 calf mda.lv2 zam-plugins-lv2
```

### Debian / Ubuntu (`apt`)

```bash
sudo apt update
sudo apt install pipewire pipewire-pulse easyeffects lsp-plugins-lv2 calf-plugins mda-lv2 zam-plugins
```

---

## Quick Start

```bash
# Clone and install
git clone https://github.com/lazytatzv/dotfiles-audio.git ~/dotfiles-audio
cd ~/dotfiles-audio
./install.sh
```

The script symlinks the presets and `.irs` files directly into your EasyEffects configuration folders (`~/.local/share/easyeffects/output` and `~/.local/share/easyeffects/irs`).

---

## Running EasyEffects & Switching Presets

### 1. Launch in Background (Recommended)

In EasyEffects 8+ (especially on Wayland), always run EasyEffects in hidden background mode first:

```bash
easyeffects -w
```

If you want to open/expand the graphical interface (GUI), launch it while the service is running:

```bash
easyeffects &
```

### 2. Switch Presets via CLI

Once the daemon is running, switch profiles on the fly directly from the terminal or keybind them in your window manager (Sway / Hyprland / i3):

```bash
# Sony WH-CH720N calibrated profile
easyeffects -l Sony-WH-CH720N-Custom-Spatial

# Natural acoustic room (generic)
easyeffects -l Ultimate-Spatial-OutOfYourHead

# Zero-reverb wide stereo
easyeffects -l Music-Crystal-UltraWide

# 3D cinema feel
easyeffects -l Ultimate-Spatial-MaxxSpace

# FPS footsteps
easyeffects -l Spatial-GSX-Gaming
```

---

## Troubleshooting

### QML Error on Wayland (`TypeError: Cannot read property 'height' of null`)

If you see an error like:
```text
qrc:/qt/qml/ee/ui/contents/ui/Main.qml:34: TypeError: Cannot read property 'height' of null
```
or if the CLI hangs / the window does not appear when running `easyeffects -l <Preset>`, this is a known upstream layout initialization issue on EasyEffects 8.3.2+ under Wayland compositors.

**Fix:**
Launch EasyEffects with the `-w` (hide window) flag in the background before applying presets or opening the window:
```bash
# 1. Start daemon in background
easyeffects -w

# 2. Load desired preset
easyeffects -l Sony-WH-CH720N-Custom-Spatial

# 3. (Optional) Open GUI window
easyeffects &
```

---

## Notes

- **Anti-Clipping**: All presets include a safe preamp headroom (`-6.5 dB` to `-7.7 dB`) to prevent digital distortion. If the volume feels a bit quiet, turn up your system/amp master volume.
- **Uninstall**: Run `./uninstall.sh` to cleanly remove all symlinks.
