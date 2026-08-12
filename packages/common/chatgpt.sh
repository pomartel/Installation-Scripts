
if [ "$(omarchy-default-agent)" != "codex" ]; then
  omarchy-default-agent codex
fi

omarchy-pkg-add openai-codex-desktop
