-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--- Quarto Stuff
local quarto = require("quarto")
quarto.setup()
vim.keymap.set("n", "<leader>öp", quarto.quartoPreview, { silent = true, noremap = true, desc = "QuartoPreview" })

--- Disable LSP Diagnostic disabling
vim.keymap.set("n", "<leader>td", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true, desc = "Toggle LSP-Diagnostic" })
