# Spotify desktop client
if omarchy-cmd-missing spotify; then
  omarchy install service spotify
fi

if omarchy-cmd-missing spotifyd; then
  omarchy-pkg-add spotifyd
  systemctl --user enable --now spotifyd.service
fi
