-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local configs = require "nvchad.configs.lspconfig"

local servers = {
  html = {},
  emmet_ls = {},
  cssls = {},
  eslint = {},
  astro = {},
  lua_ls = {},
  marksman = {},
  mdx_analyzer = {},
  stylelint_lsp = {},
  tailwindcss = {},
  ts_ls = {
    commands = {
      OrganizeImports = {
        Organize_imports,
        description = "Organize Imports"
      }
    }
  },
  bashls = {},
  prismals = {},
  pyright = {},
}

-- lsps with default config
for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end
