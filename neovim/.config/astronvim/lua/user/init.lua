local config = {

  colorscheme = require "user.colorscheme",

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      -- tab settings
      tabstop = 2,
      softtabstop = 2,
      shiftwidth = 2,
      -- visuals
      relativenumber = true,
      number = true,
      cursorline = true,
      cursorcolumn = true,
      wrap = false,
      scrolloff = 8,
      colorcolumn = "100",
      signcolumn = "yes",
      -- search settings
      smartcase = true,
      incsearch = true,
      hlsearch = false,
      -- swap and undo settings
      swapfile = false,
      backup = false,
      -- misc
      termguicolors = true,
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
    },
  },

}

return config
