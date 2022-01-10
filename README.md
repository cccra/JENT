# JENT 🎩

**J**ust **E**nough **N**ice **T**hings

JENT is an aesthetically minimal and lightning fast Neovim configuration with
just enough niceties to be easy to work with.

It's made for note-taking, LaTeX editing and a little light coding.

## The obligatory GIFs
![a gif](https://gitlab.com/cccra/jent/uploads/25fa1034c508617abfe95832f685b1a6/output3.gif)

Comes with loads of snippets for LaTeX:
![another gif](https://gitlab.com/cccra/jent/uploads/f04c40612f98eb1f51285cc4e6e02ea3/output1.gif)

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

## Features

- Sane (according to yours truly) defaults
- Handy shortcuts
- Loads of LaTeX snippets
- A custom colourscheme
- A small and functional set of configured and lazy-loaded plugins

Of those plugins, the interesting ones are listed below in alphabetical order:

- [comment.nvim](https://github.com/numToStr/Comment.nvim): automatically comment anything
- [vim-mundo](https://github.com/simnalamburt/vim-mundo): utilise Neovim's branching undo history
- [neogit](https://github.com/TimUntersberger/neogit): easily manage git from Neovim
- [neorg](https://github.com/nvim-neorg/neorg): note-taking and todo
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): code completion
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): fuzzy find anything
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): consistent highlighting across languages
- [vim-sandwich](https://github.com/machakann/vim-sandwich): easily add, remove and change brackets etc.
- [which-key.nvim](https://github.com/folke/which-key.nvim): an interactive prompt for keybindings

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

The next time you run Neovim JENT will automatically install its plugins.

If perchance this is your first time using a vi-like editor, definitely take a
look at Neovim's built-in tutorial (`:Tutor`).

## Updating

Just run:

```sh
git -C ${XDG_CONFIG_HOME:-$HOME/.config}/nvim pull
```

JENT binds this to `<leader>j` so you can update from Neovim.

## Aims

I'll be honest, the primary reason I made this is that I use Neovim on more
machines than I have my Linux setup on, so it made sense to separate my nvim
config from the rest of my dotfiles. That said, there's always the chance that
an actual real person besides myself will see this and find it informative and
useful. One can dream.

## Donations

HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAH let's not get ahead of ourselves.
