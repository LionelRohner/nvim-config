-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Load custom keybindings after plugins are set up
require("config.keymaps")

-- Use catppuccin
vim.cmd.colorscheme("catppuccin")

-- Visualize qmd as markdown
vim.filetype.add({
  extension = {
    qmd = "markdown", -- Treat .qmd files as markdown to enable proper syntax highlighting
  },
})
