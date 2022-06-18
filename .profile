export QT_STYLE_OVERRIDE=kvantum
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_FONT_DPI=116 Roboto

export XCURSOR_SIZE=32

export DOTNET_CLI_TELEMETRY_OPTOUT=1

# change xfce4-terminal colorscheme
XFCE_TERM_PATH="$HOME/.config/xfce4/terminal"
cp "$XFCE_TERM_PATH"/colorschemes/tokyo-night "$XFCE_TERM_PATH"/terminalrc

# replace neovim colorscheme
sed -i "s/theme =.*$/theme = \"tokyonight\",/g" "$HOME"/.config/nvim/lua/custom/chadrc.lua

# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

/usr/bin/plank &

mkdir /tmp/torrent-stream
mkdir /tmp/Recordings
