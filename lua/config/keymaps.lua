-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

----------------------------------------------------
--- Navigation
----------------------------------------------------

vim.api.nvim_set_keymap("n", "<leader>än", ":tabnew<CR>", { noremap = true, silent = true, desc = "Open new tab" })
vim.api.nvim_set_keymap(
  "n",
  "<leader>äc",
  ":tabclose:<CR>",
  { noremap = true, silent = true, desc = "Close current tab" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>äd",
  ":Dashboard<CR>",
  { noremap = true, silent = true, desc = "Open Dashboard" }
)

----------------------------------------------------
--- Python
----------------------------------------------------

-- Run current script
vim.keymap.set("n", "<leader>üü", ":w<CR>:!python %<CR>", { noremap = true, desc = "Run Current Python Script" })

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
vim.keymap.set("n", "<leader>öp", quarto.quartoPreview, { silent = true, noremap = true, desc = "QuartoPreview" })

--- Disable LSP Diagnostic disabling
vim.keymap.set("n", "<leader>öl", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true, desc = "Toggle LSP-Diagnostic" })

--- ToC for Markdown
vim.keymap.set("n", "<leader>öt", ":Mtoc i[nsert]<CR>", { noremap = true, silent = true, desc = "Add ToC" })

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
end, { desc = "Insert aligned LaTeX math env" })

--- Add Quarto Callout Block
--- https://quarto.org/docs/authoring/callouts.html
vim.keymap.set("n", "<leader>öc", function()
  vim.api.nvim_put({
    '::: {.callout-note collapse="false"}',
    "",
    ":::",
  }, "l", true, true)

  -- Move cursor into the empty line inside align*
  vim.cmd("normal! 2k$")
end, { desc = "Insert Callout Block" })

--- Add div tag for center alignment

vim.keymap.set("n", "<leader>öd", function()
  vim.api.nvim_put({
    '<div style="text-align: center;">',
    "",
    "<div>",
  }, "l", true, true)

  -- Move cursor into the empty line inside align*
  vim.cmd("normal! 2k$")
end, { desc = "Insert centered <div> tag" })
