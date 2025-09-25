require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { silent = true, remap = false }

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map('n', 'n', 'gj', opts)
map('n', 'l', 'gk', opts)

map({"v", "x", "o", 's'}, 'n', '<Down>', opts)
map({"v", "x", "o", 's'}, 'l', '<Up>', opts)
map({'n', "v", "x", "o", 's'}, 'e', '<Right>', opts)

map('n', '<leader><cr>',function()
  vim.cmd.so()
  print("sourced current buffer")
end)

map('n', '<leader>o', ':Oil<cr>')

