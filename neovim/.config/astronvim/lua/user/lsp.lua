return {
  servers = {
    "ansiblels",
    "bashls",
    "cssls",
    "jsonls",
    "gopls",
    "html",
    "pyright",
    "sumneko_lua",
    "tsserver",
    "yamlls",
    "zk"
  },
  server_settings = {
    yamlls = {
      settings = {
        yaml = {
          schemas = {
            ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
            ["https://json.schemastore.org/github-action.json"] = ".github/action.{yml,yaml}",
            ["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible.json#/definitions/tasks"] = "roles/tasks/*.{yml,yaml}",
          },
        },
      },
    },
  },
}
