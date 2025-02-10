-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "everblush",

  hl_override = {
    ["@comment"] = { italic = true },

    Comment = {
      italic = true,
    },

    NvDashAscii = {
      fg = "red",
      bg = "black",
    },

    NvDashButtons = {
      fg = "green",
    },
  },
}

M.ui = {
  statusline = {
    theme = "minimal",
    separator_style = "block",
  },

  cmp = {
    style = "flat_dark",
  },
}

M.colorify = {
  enabled = true,
  mode = "virtual", -- fg, bg, virtual
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = false },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "                         .^!^                   SPELL                   .!~:                        ",
    "                    ^!JPB&B!.                                            !&&BPJ!:                   ",
    "                ^?P#@@@@@G.                   :       :                   !@@@@@&BY!:               ",
    "             ^JB@@@@@@@@@7                   .#~     ?P                   .&@@@@@@@@&G?:            ",
    "          .7G@@@@@@@@@@@@#!                  ?@#^   ~@@^                 .5@@@@@@@@@@@@@G7.         ",
    "        .?#@@@@@@@@@@@@@@@@BY!^.             B@@&BBB&@@Y              :~Y&@@@@@@@@@@@@@@@@#?.       ",
    "       !#@@@@@@@@@@@@@@@@@@@@@@#G5Y?!~^:..  !@@@@@@@@@@#.   ..::^!7J5B&@@@@@@@@@@@@@@@@@@@@@B!      ",
    "     .5@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&##B#@@@@@@@@@@@BBBB##&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y     ",
    "    :B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@5    ",
    "   .B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@?   ",
    "   5@&#BGGPPPPPGGB&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&BGGPP5PPPGBB#&#.  ",
    "   ^:..           .^!YB@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&57^.            .:^.  ",
    "                       ~G@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y.                      ",
    "                         P@@@#BGGGGB#@@@@@@@@@@@@@@@@@@@@@@@@@#BP5555PG#@@@P                        ",
    "                         :J!:.      .^!JG&@@@@@@@@@@@@@@@@#57^.        .:!5~                        ",
    "                                         :?G@@@@@@@@@@@@P!.                                         ",
    "                                            ~5@@@@@@@@5^                                            ",
    "                                              ^P@@@@G^                                              ",
    "                                                !#@?                                                ",
    "                                                 :^                                                 ",
  },
}

M.mason = {
  command = true,
  pkgs = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",
    "eslint-lsp",
    "marksman",
    "mdx-analyzer",
    "stylelint-lsp",
    "tailwindcss-language-server",
    "astro-language-server",
    "bash-language-server",
    "jsonlint",
    "stylelint",
    "stylelint-lsp",
  },
}

return M
