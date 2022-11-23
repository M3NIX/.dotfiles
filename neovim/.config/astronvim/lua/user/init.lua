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
  mappings = {
    n = {
      ["<leader>ve"] = { ":w | silent execute \"! avic -e -f % > /tmp/avic.tmp && mv /tmp/avic.tmp %\"<CR>",
        desc = "ansible-vault inline encrypt" },
      ["<leader>vd"] = { ":w | silent execute \"! avic -d -f % > /tmp/avic.tmp && mv /tmp/avic.tmp %\"<CR>",
        desc = "ansible-vault inline decrypt" },
    }
  },
  ["which-key"] = {
    -- Add bindings which show up as group name
    register = {
      n = {
        ["<leader>"] = {
          ["v"] = { name = "ansible-vault" },
        },
      },
    },
  },
}

return config
