# JENT 🎩

**J**ust **E**nough **N**ice **T**hings

JENT is an aesthetically minimal and lightning fast Neovim configuration with
just enough niceties to be easy to work with.

It's made for note-taking, LaTeX editing and a little light coding.

## Philosophy

- A guest on your system, JENT won't eat you out of house and home. No
  resource-munching fripperies.
- Ever tactful, JENT doesn't bore you by talking endlessly about himself.
  You'll find no branded dashboard here.
- JENT doesn't get in your way: there is no configuration framework between you
  and Neovim.
- Always willing to help, JENT puts the things you need just a few keypresses
  away, but...
- JENT bows before superior wisdom and experience: if the Vim way isn't too
  cumbersome, JENT leaves it as it is. No mappings for save and quit, thank you
  very much.

## Installation

Installation takes a jiffy.

Make sure you have Neovim 6.0 or later installed, then backup your old config
(if you have one)...

```sh
mv ${XDG_CONFIG_HOME:-$HOME/.config}/nvim ${XDG_CONFIG_HOME:-$HOME/.config}/nvim.bak
```

... and then clone this repo in its place.

```sh
git clone --depth 1 https://gitlab.com/cccra/jent.git ${XDG_CONFIG_HOME:-$HOME/.config}/nvim
```

The next time you run Neovim use the command `nvim +PackerSync`. This will
install the required plugins.

## Updating

Just run:

```sh
git -C ${XDG_CONFIG_HOME:-$HOME/.config}/nvim pull
```

JENT binds this to `<leader>j` so you can update from Neovim.

## Aims

I'll be honest, the primary reason I made this is because I use Neovim on more
machines than I have my Linux setup on, so it made sense to separate my nvim
config from the rest of my dotfiles. That said, there's always the chance that
an actual real person besides myself will see this and find it informative and
useful. One can dream.

## Donations

HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAH let's not get ahead of ourselves.
