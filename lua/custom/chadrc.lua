-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme = "gruvchad",
  changed_themes = {
    gruvchad = {
      base_30 = {
        yellow = "#ffb64d",
        sun = "#ffb64d",
      },
      base_16 = {
        base0A = "#ffb64d",
      },
    },
  },
  hl_override = {
    Comment = { italic = true },
    CursorLine= { bg = "#191717" },
    CursorLineNr = { fg = "#ffb64d", bold = true },
    SpellCap = { bg = "blue", fg = "black", bold = true, undercurl = false },
    SpellBad = { bg = "red", fg = "black", bold = true, undercurl = false },
    SpellLocal = { bg = "green", fg = "black", bold = true, undercurl = false },
  },
  hl_add = {
    Heading1 = { fg = "#ffb64d", bold = true },
    Heading2 = { fg = "#f38b35", bold = true },
    Heading3 = { fg = "#ee5634", bold = true },
    Heading4 = { fg = "#e24b81", bold = true },
    Heading5 = { fg = "#e25ad1", bold = true },
    Heading6 = { fg = "#bd7ed8", bold = true },
  },
}

M.plugins = {}

return M
