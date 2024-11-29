require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("n", "<leader>s", ":write! <CR>", {desc = "Save current file"})
map("n", "<leader>q", ":qa! <CR>", {desc = "Quite from nvim"})
map("v", ">", ">gv", {desc = "Indent right"})
map("v", "<", "<gv", {desc = "Indent left"})
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })

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

map("n", "<leader>fl", function()
  require("conform").format { async = true, lsp_fallback = true }
end, { desc = "Format Files" })

map("n", "<leader>ld", function()
  vim.diagnostic.open_float()
end, { desc = "Debug Continue" })


-- Disable mappings
nomap("n", "<leader>v") -- drop vertical terminal keys
