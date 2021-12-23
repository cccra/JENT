# Jent 🎩

**J**ust **E**nough **N**ice **T**hings

Jent is an aesthetically minimal and lightning fast Neovim configuration with just enough niceties to be easy to work with.

It's made with note-taking, LaTeX editing and a little light coding in mind.

## Philosophy

- A guest on your system, Jent won't eat you out of house and home. No resource-munching fripperies.
- Ever tactful, Jent doesn't bore you by talking endlessly about himself. You'll find no branded dashboard here.
- Jent doesn't get in your way: there is no configuration framework between you and Neovim.
- Always willing to help, Jent puts the things you need just a few keypresses away.

## Installation

Installation takes a jiffy.

Back your old config up (if you have one)...

```sh
mv ${XDG_CONFIG_HOME:-$HOME/.config}/nvim ${XDG_CONFIG_HOME:-$HOME/.config}/nvim.bak
```

... and then clone this repo in its place.

```sh
git clone --depth 1 https://gitlab.com/cccra/jent-nvim.git ${XDG_CONFIG_HOME:-$HOME/.config}/nvim
```

## Updating

Just run:

```sh
git -C ${XDG_CONFIG_HOME:-$HOME/.config}/nvim pull
```

Jent binds this to `<leader>j`
