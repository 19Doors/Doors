vim.o.number = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.winborder = "rounded"
vim.api.nvim_set_hl(0, "FloatBorder", {
	fg = "#a5b6cf", -- white border
	bg = "#0d0f18", -- black background
})

vim.api.nvim_set_hl(0, "NormalFloat", {
	bg = "#0d0f18", -- dark gray background
})
vim.cmd([[
set clipboard+=unnamedplus
set completeopt=menu,menuone,noselect
]])

require("config.pluginConfigs.nvim_lsp")
vim.lsp.enable("lua_ls")

require("config.pluginConfigs.float")

-- keymaps
vim.keymap.set("n","<leader>a", "<CMD>Oil<CR>")
vim.keymap.set("n","LC", function() vim.lsp.buf.code_action() end)
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-s-n>")
vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end)
vim.keymap.set("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end)
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ title = " Preview ", border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" } })
end)
vim.keymap.set("n", "LD", function()
	vim.lsp.buf.declaration()
end)
vim.keymap.set("n", "LF", function()
	vim.lsp.buf.format()
end)
-- Custom

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
			vim.keymap.set("i", "<C-Space>", function()
				vim.lsp.completion.get()
			end)
		end
	end,
})

local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }
-- ========== BarBar ==========
-- Move to previous/next
map("n", "<A-,>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<A-.>", ":BufferLineCycleNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", ":BufferLineMovePrev<CR>", opts)
map("n", "<A->>", ":BufferLineMoveNext<CR>", opts)
-- Goto buffer in position...
for i = 1, 9 do
	map("n", "<A-" .. i .. ">", ":BufferLineGoToBuffer " .. i .. "<CR>", opts)
end
map("n", "<A-0>", ":BufferLast<CR>", opts)
-- Close buffer
map("n", "<A-k>", ":BufferLinePickClose<CR>", opts)
