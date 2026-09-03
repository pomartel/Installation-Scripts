# Voxtype dictation tool
omarchy-pkg-add wtype voxtype-bin

if ! systemctl --user is-active --quiet voxtype; then
  voxtype setup --no-post-install
  voxtype setup --download --model large-v3-turbo --quiet
  voxtype setup systemd
  sudo voxtype setup gpu --enable
fi
