#!/bin/bash

if ! grep -Rqs 'pam_fprintd\.so' /etc/pam.d; then
  omarchy-setup-fingerprint
  fprintd-enroll -f left-index-finger "$USER"

  # Disable fingerprint reader in sudo
  sudo sed -i 's/^auth[[:space:]]\+sufficient[[:space:]]\+pam_fprintd\.so$/# &/' /etc/pam.d/sudo
fi

sudo tee "/etc/udev/rules.d/99-fingerprint-no-autosuspend.rules" >/dev/null <<EOF
# Keep the internal Synaptics Prometheus fingerprint reader awake.
# It intermittently disconnects during fprintd identification after USB autosuspend.
ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="06cb", ATTR{idProduct}=="0123", TEST=="power/control", ATTR{power/control}="on"
EOF
