ensure_omarchy_plugin() {
  local plugin_id="$1"
  local plugin_url="$2"
  local plugins

  plugins=$(omarchy plugin list --json) || return

  if jq -e --arg id "$plugin_id" 'any(.[]; .id == $id)' <<<"$plugins" >/dev/null; then
    if ! jq -e --arg id "$plugin_id" \
      'any(.[]; .id == $id and .enabled)' <<<"$plugins" >/dev/null; then
      omarchy plugin enable "$plugin_id"
    fi
  else
    omarchy plugin add "$plugin_url" --enable --yes
  fi
}

ensure_omarchy_plugin \
  "intemporel" \
  "https://github.com/pomartel/intemporel.git"
ensure_omarchy_plugin \
  "io.github.aryan-techie.todoist" \
  "https://github.com/Aryan-Techie/omarchy-todoist.git"

unset -f ensure_omarchy_plugin
