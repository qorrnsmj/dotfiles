local map = vim.keymap.set
local opt = { noremap = true, silent = true }

map("n", ";", ":")
map("i", "<c-[>", "<esc>", opt)
map("v", "<c-[>", "<esc>", opt)
map("i", "<S-Tab>", "<C-d>", opt)

-- FIXME: snacks explorer
map("n", "<C-n>", function()
	require("snacks").explorer()
end, opt)

-- copilot
map("i", "<Tab>", function()
	if require("copilot.suggestion").is_visible() then
		require("copilot.suggestion").accept()
	else
		-- default tab behavior
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
	end
end, opt)

-- lsp
map("n", "K", vim.lsp.buf.hover, opt)
map("n", "<leader>rn", vim.lsp.buf.rename, opt)
map("n", "<leader>ca", vim.lsp.buf.code_action, opt)
map("n", "gd", vim.lsp.buf.definition, opt)
map("n", "gr", vim.lsp.buf.references, opt)
map("n", "gi", vim.lsp.buf.implementation, opt)
map("n", "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end, opt)
