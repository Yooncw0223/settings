-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
-- vim.api.nvim_command([[
-- autocmd BufEnter *.py :setlocal tabstop=4 shiftwidth=4 expandtab
-- autocmd BufEnter *.js :setlocal tabstop=2 shiftwidth=2 expandtab
-- autocmd BufEnter *.ts :setlocal tabstop=2 shiftwidth=2 expandtab
-- ]])

vim.cmd('set so=7')
vim.cmd('map <C-U> <C-Y><C-Y><C-Y>')
vim.cmd('map <C-D> <C-E><C-E><C-E>')

vim.api.nvim_create_user_command("Warn", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	}
end, { desc = "toggle diagnostic" })
