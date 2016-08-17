# My dotfiles

These are _my_ dotfiles. I don't recommend using this unreviewed. These are my
private settings for my private workflow and may not be in line with your preferences.

* gitrc
* zshrc
* vimrc
* tmux.conf

# Installation

    git clone git@github.com:bka/dotfiles.git
    cd dotfiles
    git submodule init
    git submodule update
    ./install.sh

Type and enjoy:

    zsh

Or replace bash completly with

    chsh -s $(which bash)

# tmux

I like to autostart tmux within zsh. This is achieved by following lines in ```.zshrc```:

    case $- in *i*)
        if [ -z "$TMUX" ]; then exec tmux; fi;;
    esac


## Keybindings

Press hotkey ```Ctrl+a``` to switch to command mode. In command mode following bindings available:



| Key        | Action |
| ------------- |:-------------:|
| a | switch to scroll mode (scroll with arrow keys or page up/down) |
| q | end scroll mode |

## Windows

| Key        | Action |
| ------------- |:-------------:|
| c | create new window |
| Number Keys | switch between windows |
| n | switch to next window |

## Panes

| Key        | Action |
| ------------- |:-------------:|
| b | split pane horizontally |
| v | split pane vertically |
| UP or k  | Move Pane up |
| DOWN or j | Move Pane up |
| LEFT or h | Move Pane up |
| RIGHT or l | Move Pane up |
| Ctrl+UP | Resize current Pane up |
| Ctrl+DOWN | Resize current Pane down |
| Ctrl+LEFT | Resize current Pane left |
| Ctrl+RIGHT | Resize current Pane right |


## Sessions

Press Ctrl+a and enter commands by typing : e.g. create a new session:

    new-session -s blog

Press `Ctrl+a` and `s` to switch between session.


