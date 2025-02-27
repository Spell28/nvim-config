require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("n", "<leader>s", ":write! <CR>", { desc = "Save current file" })
map("n", "<leader>q", ":qa! <CR>", { desc = "Quite from nvim" })
map("n", "<leader>fl", ":OrganizeImports <CR>", { desc = "Organize imports" })
map("n", "<leader>tt", ":tabnew <CR>", { desc = "New tab" })
map("n", "<leader>tx", ":tabclose <CR>", { desc = "Close current tab" })
map("n", "<Tab>", ":tabnext <CR>", { desc = "Next tab" })
map("n", "<S-Tab>", ":tabprev <CR>", { desc = "Previous tab" })
map("v", ">", ">gv", { desc = "Indent right" })
map("v", "<", "<gv", { desc = "Indent left" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })

-- Прокрутка на начало файла с динамическим расчетом
map(
  "n",
  "gg",
  ':lua require("neoscroll").scroll(-2 * vim.api.nvim_buf_line_count(0), { move_cursor = true, duration = 0.5, easing = quadratic, info = { kind = "gg", winid = vim.api.nvim_get_current_win(), bufnr = vim.api.nvim_get_current_buf()} })<CR>',
  { noremap = true, silent = true, desc = "Smooth scroll to the top" }
)

-- Прокрутка в конец файла с динамическим расчетом
map(
  "n",
  "G",
  ':lua require("neoscroll").scroll(2 * vim.api.nvim_buf_line_count(0), { move_cursor = true, duration = 0.5, easing = quadratic, info = { kind = "G", winid = vim.api.nvim_get_current_win(), bufnr = vim.api.nvim_get_current_buf()} })<CR>',
  { noremap = true, silent = true, desc = "Smooth scroll to the bottom" }
)


map("n", "gn", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer Goto next" })

map("n", "gp", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer Goto prev" })

map("n", "<BS>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer Close" })

map({ "n", "t" }, "<leader>]", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm", size = 0.4 }
end, { desc = "Terminal Toggleable vertical term" })

map({ "n", "t" }, "<leader>\\", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm", size = 0.3 }
end, { desc = "Terminal New horizontal term" })

map("n", "<leader>fm", function()
  require("conform").format { async = true, lsp_fallback = true }
end, { desc = "Format Files" })

map("n", "<leader>ld", function()
  vim.diagnostic.open_float()
end, { desc = "Debug Continue" })

map("n", "<C-t>", function()
  require("plenary.reload").reload_module "minty.huefy"
  require("minty.huefy").open()
end, {})

vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

-- Disable mappings
nomap("n", "<leader>v") -- drop vertical terminal keys
