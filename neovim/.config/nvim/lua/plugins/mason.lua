if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        -- "asm_lsp",
        "bashls",
        "clangd",
        "cssls",
        "dockerls",
        "gopls",
        "jsonls",
        "lemminx",
        "marksman",
        -- add more arguments for adding more language servers
      })
    end,
  },
}
