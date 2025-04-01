local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "markdown",
    "markdown_inline",
    "prisma"
  },
  indent = {
    enable = true,
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.devicons = {
  override_by_extension = {
    astro = {
      icon = "",
      color = "#EF8547",
      name = "astro",
    },
  },
}

return M
