# dotfiles-audio

Personal spatial audio & EQ presets for Linux (**PipeWire** + **EasyEffects 8+**).

Tuned specifically for headphone listening with tight bass, clear drums/synths, and natural holographic speaker staging.

---

## 🎧 Presets Overview

| Preset | Description | When to use |
| :--- | :--- | :--- |
| **`Ultimate-Spatial-OutOfYourHead`** *(Default)* | Natural speaker soundstage (measured room HRTF) | General listening, YouTube, long sessions |
| **`Music-Crystal-UltraWide`** | Wide stereo + zero reverb/mud | EDM, Synthwave, fast-paced music |
| **`Ultimate-Spatial-MaxxSpace`** | Wide 3D dome immersion | Movies, anime, atmospheric tracks |
| **`Spatial-GSX-Gaming`** | Sennheiser GSX binaural matrix | Competitive FPS (Apex, CS2, Valorant) |

---

## ⚡ Quick Start

```bash
# Clone and install
git clone https://github.com/lazytatzv/dotfiles-audio.git ~/dotfiles-audio
cd ~/dotfiles-audio
./install.sh
```

The script symlinks the presets and `.irs` files directly into your EasyEffects configuration folders.

---

## 🕹️ Switch Presets via CLI

You can switch profiles on the fly directly from the terminal or keybind them in your window manager (Sway / Hyprland / i3):

```bash
# Natural acoustic room
easyeffects -l Ultimate-Spatial-OutOfYourHead

# Zero-reverb wide stereo
easyeffects -l Music-Crystal-UltraWide

# 3D cinema feel
easyeffects -l Ultimate-Spatial-MaxxSpace

# FPS footsteps
easyeffects -l Spatial-GSX-Gaming
```

---

## 🛠️ Notes

- **Anti-Clipping**: All presets include a `-6.5 dB` preamp headroom to prevent digital distortion when boosting bass/treble. If the volume feels a bit quiet, turn up your system/amp master volume.
- **Uninstall**: Run `./uninstall.sh` to cleanly remove all symlinks.
