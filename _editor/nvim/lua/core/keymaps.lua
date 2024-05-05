local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

-- ========== Telescope ===========
map("n", "<Space>ff", ":Telescope find_files<CR>", opts)

-- ========== Trouble ===========
map("n", "<Space>y", ":TroubleToggle<CR>", opts)

-- ========== Null-ls ============
map("n", "<Space>p", ":lua vim.lsp.buf.formatting()<CR>", opts)

-- ========== Lspsaga ============
map("n", "<Space>lr", ":Lspsaga rename<CR>", opts)
map("n", "<Space>ll", ":Lspsaga lsp_finder<CR>", opts)
map("n", "<Space>ld", ":Lspsaga hover_doc<CR>", opts)
map("n", "<Space>lg", ":Lspsaga goto_definition<CR>", opts)
map("n", "<Space>lp", ":Lspsaga preview_definition<CR>", opts)
map("n", "<Space>ls", ":Lspsaga signature_help<CR>", opts)
map("n", "<Space>lc", ":Lspsaga code_action<CR>", opts)
map("n", "<Space>lt", ":Lspsaga open_floaterm<CR>", opts)
map("n", "<Space>lr", ":Lspsaga close_floaterm<CR>", opts)
map("n", "<Space>lo", ":Lspsaga outline<CR>", opts)

-- ========== LuaSnip ===========
vim.cmd([[ 
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'map

" NOTE: You can use other key to expand snippet.
]])

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
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map("n", "<A-p>", ":BufferLinePick<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", ":BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", ":BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", ":BufferOrderByLanguage<CR>", opts)

-- NvimTree
--map("n", "<Leader>t", "<cmd>Neotree action=focus toggle<cr>", opts)
map("n", "<Leader>t", "<cmd>NvimTreeToggle<cr>", opts)
local NTKeymaps = {
  { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
  { key = "<C-e>", action = "edit_in_place" },
  { key = "O", action = "edit_no_picker" },
  { key = { "<C-]>", "<2-RightMouse>" }, action = "cd" },
  { key = "<C-v>", action = "vsplit" },
  { key = "<C-x>", action = "split" },
  { key = "<C-t>", action = "tabnew" },
  { key = "<", action = "prev_sibling" },
  { key = ">", action = "next_sibling" },
  { key = "P", action = "parent_node" },
  { key = "<BS>", action = "close_node" },
  { key = "<Tab>", action = "preview" },
  { key = "K", action = "first_sibling" },
  { key = "J", action = "last_sibling" },
  { key = "I", action = "toggle_git_ignored" },
  { key = "H", action = "toggle_dotfiles" },
  { key = "U", action = "toggle_custom" },
  { key = "R", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "D", action = "trash" },
  { key = "r", action = "rename" },
  { key = "<C-r>", action = "full_rename" },
  { key = "<C-p>", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "y", action = "copy_name" },
  { key = "Y", action = "copy_path" },
  { key = "gy", action = "copy_absolute_path" },
  { key = "[e", action = "prev_diag_item" },
  { key = "[c", action = "prev_git_item" },
  { key = "]e", action = "next_diag_item" },
  { key = "]c", action = "next_git_item" },
  { key = "-", action = "dir_up" },
  { key = "s", action = "system_open" },
  { key = "f", action = "live_filter" },
  { key = "F", action = "clear_live_filter" },
  { key = "q", action = "close" },
  { key = "W", action = "collapse_all" },
  { key = "E", action = "expand_all" },
  { key = "S", action = "search_node" },
  { key = ".", action = "run_file_command" },
  { key = "<C-k>", action = "toggle_file_info" },
  { key = "g?", action = "toggle_help" },
  { key = "m", action = "toggle_mark" },
  { key = "bmv", action = "bulk_move" },
}

local M = {}

M.keymaps = NTKeymaps

return M
