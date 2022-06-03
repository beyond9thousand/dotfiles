export QT_STYLE_OVERRIDE=kvantum
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_FONT_DPI=116 Roboto
export XCURSOR_SIZE=32

# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
