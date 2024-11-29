require "nvchad.options"

local autocmd = vim.api.nvim_create_autocmd
local o = vim.opt

vim.cmd "set noswapfile"
o.scrolloff = 8 -- cursor space between edges horizontal
o.sidescrolloff = 8 -- cursor space between edges vertical
o.backup = false -- creates a backup file
o.cmdheight = 0 -- more space in the neovim command line for displaying messages
o.fileencoding = "utf-8" -- the encoding written to a file
o.swapfile = false -- creates a swapfile
o.termguicolors = true -- set term gui colors (most terminals support this)
o.updatetime = 300 -- faster completion
o.expandtab = true -- convert tabs to spaces
o.shiftwidth = 2 -- the number of spaces inserted for each indentation
o.softtabstop = 2 -- soft tab stop
o.tabstop = 2 -- insert 2 spaces for a tab
o.numberwidth = 2 -- set number column width to 2 {default 4}
o.list = true

o.wrap = true
o.linebreak = true
o.textwidth = 100

o.breakindent = true
o.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly

o.listchars:append "space:⋅"
o.listchars:append "trail:⋅"
o.listchars:append "tab:──"

-- Rainbow for indent-blankline v2.20.7
-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]



-- start Disabling statusline in nvdash buffer
vim.api.nvim_create_autocmd("FileType", {
  pattern = "nvdash",
  callback = function()
    vim.opt.laststatus = 0
  end,
})

vim.api.nvim_create_autocmd("BufWinLeave", {
  callback = function()
    if vim.bo.ft == "nvdash" then
      vim.opt.laststatus = 3
    end
  end,
})
-- end Disabling statusline in nvdash buffer

-- start fix padding

autocmd("VimEnter", {
  command = ":silent !kitty @ set-spacing padding=0 margin=0",
})

autocmd("VimLeavePre", {
  command = ":silent !kitty @ set-spacing padding=20 margin=10",
})

-- end fix padding

-- start restore cursor position

autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

-- end restore cursor position


-- start Add mdx

-- vim.filetype.add {
--   extension = {
--     mdx = "mdx",
--   },
-- }
--
-- local get_option = vim.filetype.get_option
-- vim.filetype.get_option = function(filetype, option)
--   return option == "commentstring"
--     and require("ts_context_commentstring.internal").calculate_commentstring()
--     or get_option(filetype, option)
-- end
--
-- vim.treesitter.language.register("markdown", "mdx")

-- end Add mdx
