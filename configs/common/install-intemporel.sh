plugin_id="intemporel"
plugin_url="https://github.com/pomartel/intemporel.git"

if ! omarchy plugin list --json | jq -e --arg id "$plugin_id" \
  'any(.[]; .id == $id)' >/dev/null; then
  omarchy plugin add "$plugin_url" --enable --yes
fi
