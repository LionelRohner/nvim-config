-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Python LSP base >> customise lua/plugins/extend-lsp.lua
vim.g.lazyvim_python_lsp = "basedpyright"

-- Set to false to disable auto format
vim.g.lazyvim_eslint_auto_format = true
