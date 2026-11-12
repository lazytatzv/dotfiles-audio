#!/usr/bin/env bash
# ==============================================================================
# dotfiles-audio: Headphone Spatial Audio & EasyEffects Presets Installer
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Setting up Spatial Audio Presets & HRIRs for EasyEffects..."

# Target directories (EasyEffects 7/8+ standard)
EE_LOCAL_IRS="${HOME}/.local/share/easyeffects/irs"
EE_LOCAL_OUTPUT="${HOME}/.local/share/easyeffects/output"

mkdir -p "${EE_LOCAL_IRS}" "${EE_LOCAL_OUTPUT}"

# 1. Symlink all IRS & WAV files
echo "==> Linking HRIR & IRS files..."
for file in "${SCRIPT_DIR}/easyeffects/irs"/*; do
    [ -f "${file}" ] || continue
    fname="$(basename "${file}")"
    ln -sf "${file}" "${EE_LOCAL_IRS}/${fname}"
done

# 2. Symlink EasyEffects output presets
echo "==> Linking EasyEffects presets (.json)..."
for file in "${SCRIPT_DIR}/easyeffects/output"/*.json; do
    [ -f "${file}" ] || continue
    fname="$(basename "${file}")"
    ln -sf "${file}" "${EE_LOCAL_OUTPUT}/${fname}"
done

echo ""
echo "==> Installation complete!"
echo "Available presets linked:"
ls -1 "${SCRIPT_DIR}/easyeffects/output"
