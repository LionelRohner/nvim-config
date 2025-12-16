-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

----------------------------------------------------
--- Navigation
----------------------------------------------------

vim.api.nvim_set_keymap("n", "<leader>än", ":tabnew<CR>", { noremap = true, silent = true, desc = "[P] Open new tab" })
vim.api.nvim_set_keymap(
  "n",
  "<leader>äc",
  ":tabclose:<CR>",
  { noremap = true, silent = true, desc = "[P] Close current tab" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>äd",
  ":Dashboard<CR>",
  { noremap = true, silent = true, desc = "[P] Open Dashboard" }
)

----------------------------------------------------
--- Quarto and Markdown Stuff
----------------------------------------------------

--- Quarto
local quarto = require("quarto")
quarto.setup()
vim.keymap.set("n", "<leader>öp", quarto.quartoPreview, { silent = true, noremap = true, desc = "[P] QuartoPreview" })

--- Disable LSP Diagnostic disabling
vim.keymap.set("n", "<leader>öd", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true, desc = "[P] Toggle LSP-Diagnostic" })

--- ToC for Markdown
vim.keymap.set("n", "<leader>öt", ":Mtoc i[nsert]<CR>", { noremap = true, silent = true, desc = "[P] Add ToC" })
