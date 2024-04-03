-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      opt = { -- vim.opt.<key>
        colorcolumn = "150",
      },
    },
    mappings = {
      n = {
        -- avic keybindings https://gist.github.com/M3NIX/36ad2581256a6a017b42565d4d652602
        ["<Leader>v"] = { desc = "ansible-vault" },
        ["<leader>ve"] = { ":w | silent execute \"! avic -e -f % > /tmp/avic.tmp && mv /tmp/avic.tmp %\"<CR>",
          desc = "ansible-vault inline encrypt" },
        ["<leader>vd"] = { ":w | silent execute \"! avic -d -f % > /tmp/avic.tmp && mv /tmp/avic.tmp %\"<CR>",
          desc = "ansible-vault inline decrypt" },
    }
    },
  },
}
