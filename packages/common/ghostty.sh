if omarchy-pkg-missing ghostty; then
  omarchy-install-terminal ghostty
  omarchy-pkg-add ghostty-nautilus
fi

if [ "$(omarchy default terminal)" != "ghostty" ]; then
  omarchy default terminal ghostty
fi
