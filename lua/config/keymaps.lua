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
--- Python
----------------------------------------------------

-- Create f-string type print of highlighted variable

vim.keymap.set("n", "<leader>üp", function()
  local line = vim.api.nvim_get_current_line()

  -- capture indentation
  local indent = line:match("^(%s*)")

  -- extract variable before =
  local var = line:match("^%s*([%w_%.]+)%s*=")

  if not var then
    print("No variable assignment found")
    return
  end

  local print_line = indent .. string.format('print(f"%s : {%s}")', var, var)

  vim.api.nvim_put({ print_line }, "l", true, true)
end, { desc = "Print variable debug" })

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

--- Add LateX math equation with alignment environment
vim.keymap.set("n", "<leader>öm", function()
  vim.api.nvim_put({
    "$$",
    "\\begin{align*}",
    "y &= x",
    "\\end{align*}",
    "$$",
  }, "l", true, true)

  -- Move cursor into the empty line inside align*
  vim.cmd("normal! 2k$")
end, { desc = "Insert LaTeX align* math block" })
