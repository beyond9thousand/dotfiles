<!-- BADGES -->

<div align="center">

![Github stargazers](https://img.shields.io/github/stars/beyond9thousand/dotfiles?color=555555&label=Stargazers&logo=github&labelColor=70a5eb)
&ensp;
![GitHub last commit (by committer)](https://img.shields.io/github/last-commit/beyond9thousand/dotfiles?color=555555&label=Last%20commit&logo=git&labelColor=79dcaa&logoColor=ffffff)
&ensp;
![GitHub open issues](https://img.shields.io/github/issues/beyond9thousand/dotfiles?color=555555&label=Issues&logo=gnubash&labelColor=e05f65&logoColor=ffffff)
&ensp;
![GitHub forks](https://img.shields.io/github/forks/beyond9thousand/dotfiles?style=social)

<!-- [![issues](https://img.shields.io/github/issues/beyond9thousand/dotfiles?color=%23f87070&style=for-the-badge)](https://github.com/beyond9thousand/dotfiles/issues) -->
<!-- [![size](https://img.shields.io/github/repo-size/beyond9thousand/dotfiles?color=c386c0&style=for-the-badge)](github.com/beyond9thousand/dotfiles) -->
<!-- [![stars](https://img.shields.io/github/stars/beyond9thousand/dotfiles?color=79dcaa&style=for-the-badge)](https://github.com/beyond9thousand/dotfiles/stargazers) -->
<!-- [![Visitors](https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Fbeyond9thousand%2Fdotfiles&label=visitors&countColor=%237bc5e4)](https://github.com/beyond9thousand/dotfiles) -->

</div>

# beyond9thousand dotfiles

You are expected to have a basic understanding of the unix system. If you are new to linux, please visit [here](https://linuxjourney.com/lesson/the-shell) or look for similar resources online. Do **NOT** proceed

- [Information](#pencil-information)
- [Specifications](#mag-specifications)
- [Showcase](#mag-showcase)
  - [Tokyo Night Colorscheme](#tokyo-night-colorscheme)
  - [Application Launcher](#application-launcher)
  - [Right-click Application Menu](#right-click-application-menu)
  - [Notifications](#notifications)
  - [Drop-down Systray](#drop-down-systray)
- [Fonts](#ab-fonts)
- [Configuration](#gear-configuration)
- [Dependencies](#pushpin-dependencies)
  - [Packages](#packages)
  - [Environment Variables](#environment-variables)
  - [Miscellaneous](#miscellaneous)
- [Troubleshooting](#question-troubleshooting)
- [Credits](#sparkles-credits)

## :pencil: Information

My configuration is personalized to utilize keyboard shortcuts as well as mouse actions to keep my workflow meaningful and flexible under varying conditions.

<details close>
  <summary><b>Before proceeding</b></summary>
  
  - This readme is still a work in progress. Please open an issue for queries beyond its scope
  - All the visual config parameters have been written for a [resolution](https://wiki.archlinux.org/title/Xrandr) of 1920x1080 pixels
  - Non GUI apps will need to be configured manually to be correctly displayed in lower/higher resolutions
  - Please read the [man-page](https://wiki.archlinux.org/title/Man_page) for an app before asking specific questions not addressed here

</details>

<img src="assets/1-pre.png">

## :mag: Specifications

| Feature              | Package                                                 |
| -------------------- | ------------------------------------------------------- |
| Window Manager       | [`bspwm`](https://github.com/baskerville/bspwm)         |
| Compositor           | [`pijulius/picom`](https://github.com/pijulius/picom)   |
| Terminal             | [`alacritty`](https://github.com/alacritty/alacritty)   |
| Shell                | [`zsh`](https://www.zsh.org/)                           |
| Editor               | [`neovim`](https://github.com/neovim/neovim)            |
| Panel                | [`eww`](https://github.com/elkowar/eww)                 |
| System Tray          | [`stalonetray`](https://github.com/kolbusa/stalonetray) |
| Dock                 | [`plank`](https://github.com/ricotz/plank)              |
| Notification Manager | [`dunst`](https://github.com/dunst-project/dunst)       |
| Application Launcher | [`rofi`](https://github.com/davatorium/rofi)            |
| Application Menu     | [`jgmenu`](https://github.com/johanmalm/jgmenu)         |

## :camera: Showcase

<div align="center">

##### Tokyo Night Colorscheme

Tokyo night colorscheme ported from [zatchheems](https://github.com/zatchheems/tokyo-night-alacritty-theme) for alacritty

<img src="assets/2.png">

##### Application Launcher

A slightly modified version of the fancy rofi app launcher found on [siduck's repo](https://github.com/siduck/chadwm/tree/main/rofi)

<img src="assets/rofimenu.jpg" width="400">

##### Right-click Application Menu

  <div align="left">

The menu is spawned with the help of [xqp](https://github.com/baskerville/xqp) (or X Query Pointer) which prints the ID of the window under the pointer. This is used to check if RMB is being triggered on an empty space, which then calls `jgmenu` to spawn out from the position of the pointer. This method works most accurately since it allows you to spawn the application menu even if your current desktop is occupied (assuming you have gaps between windows)

</div>

<img src="assets/jgmenu.gif" width="400">

##### Notifications

Dunst for a simple notification daemon.

<img src="assets/dunst.png" width="400">

##### Drop-down Systray

<div align="left">

Stalonetray is run at bootup and hid right after using [xdo](https://github.com/baskerville/xdo). [`system_tray.zsh`](https://github.com/beyond9thousand/dotfiles/blob/master/.config/eww/shell/system_tray.zsh) is integrated into the eww bar to hide or unhide the tray icons on demand.

</div>

<img src="assets/stalonetray.gif" width="400">

</div>

## :ab: Fonts

| Font List                                                                                                | Use                 |
| -------------------------------------------------------------------------------------------------------- | ------------------- |
| [`Roboto`](https://github.com/googlefonts/roboto)                                                        | Primary Font        |
| [`JetBrainsMono Nerd Font`](https://github.com/jtbx/jetbrainsmono-nerdfont)                              | Primary UI Font     |
| [`Font Awesome`](https://github.com/FortAwesome/Font-Awesome)                                            | Primary Icon Font   |
| [`Phoshphor Icons`](https://github.com/phosphor-icons/phosphor-icons/blob/master/src/fonts/Phosphor.ttf) | Secondary Icon Font |

## :gear: Configuration

Create a **backup** of your dotfiles (if any). Take a look at [this](https://news.ycombinator.com/item?id=11070797) article for a more long term solution, thank me later. Now clone this repository and symlink the respective files.

```bash
git clone --depth 1 https://github.com/beyond9thousand/dotfiles $HOME/Downloads/b9k_dotfiles
ln -s $HOME/Downloads/b9k_dotfiles/.config/* $HOME/.config/
```

Mark binaries as executable

```bash
chmod u+x $HOME/.bin/* $HOME/.local/bin/*
```

Install the fonts mentioned in the previous section.

## :pushpin: Dependencies

#### Environment Variables

Copy the [`.profile`](https://github.com/beyond9thousand/dotfiles/blob/bspwm/.profile) to your `$HOME` directory to set the correct [environment variables](https://wiki.archlinux.org/title/Environment_variables) at startup

- Refer to [XDG Base Directory](https://wiki.archlinux.org/title/XDG_Base_Directory) for more details

<details close>
 <summary><b>Optional</b></summary>

- Copy the [`zshrc-personal`](https://github.com/beyond9thousand/dotfiles/blob/bspwm/.config/zsh/zshrc-personal) to use my aliases
- Install [zinit](https://github.com/zdharma-continuum/zinit) as a plugin manager for zsh

</details>

#### Packages

:warning: **The following instructions have only been written for arch-based distros**
Install an [AUR helper](https://wiki.archlinux.org/title/AUR_helpers) of your choice

- Using the [yay](https://github.com/Jguer/yay#installation) helper

```bash
yay -S --needed \
sxhkd bspwm alacritty zsh neovim stalonetray \
plank dunst rofi jgmenu xprintidle i3lock-color zathura \
broot fzf mpv neofetch ranger ueberzug xdo perl cava \
xbanish xss-lock pavucontrol nitrogen flameshot exa bat copyq \
maim ant-dracula-kvantum-theme-git ant-dracula-theme-git \
papirus-icon-theme kvantum pacman-contrib xorg-xbacklight \
imagemagick
```

- Install eww by following the instructions [here](https://elkowar.github.io/eww/eww.html?highlight=install#how-to-install-eww)

#### Miscellaneous

- [powerlevel10k](https://github.com/romkatv/powerlevel10k) as a prompt theme for zsh

## :rotating_light: Troubleshooting

Topics mentioned in this section may not necessarily be relevant to the ricing setup. It includes obscure erros that I have run into in my time using linux.

#### Backlight

To allow users in the video group to change the brightness, a udev rule such as the following can be used:

```ini
#/etc/udev/rules.d/backlight.rules
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video $sys$devpath/brightness", RUN+="/bin/chmod g+w $sys$devpath/brightness"
```

- Refer to [Backlight](https://wiki.archlinux.org/title/Backlight#Udev_rule) for better coverage on the subject

## :sparkles: Credits

- [pagankeymaster](https://github.com/pagankeymaster) for his extensive research on bspwm & eww
- [elkowar](https://github.com/elkowar) for his fantastic work on the eww widget framework
- Excellent neovim config by [NvChad](https://github.com/NvChad/NvChad)
  bspwm scripts
- Beautiful wallpaper artwork created by [BisBiswas](https://www.deviantart.com/bisbiswas/art/Scattered-Lights-898482741)
- Some configs have been derived from [axyl-os](https://github.com/axyl-os)
