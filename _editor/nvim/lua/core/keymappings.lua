local api = vim.api
local map = vim.api.nvim_set_keymap
local opts = {}

-- ========= Packer ==========
map("n", "<Leader>pi", "<CMD>PackerInstall<CR>", opts)
map("n", "<Leader>ps", "<CMD>PackerSync<CR>", opts)
map("n", "<Leader>pc", "<CMD>PackerClean<CR>", opts)

-- ========= Telescope ============
map("n", "<Leader>ff", "<CMD>Telescope find_files<CR>", opts)

-- NvimTree
api.nvim_set_keymap("n", "<Leader>t", "<CMD>NvimTreeToggle<CR>", {})

-- ========== Lspsaga ============
map("n", "<Space>lr", ":Lspsaga rename<CR>", opts)
map("n", "<Space>ll", ":Lspsaga lsp_finder<CR>", opts)
map("n", "<Space>ld", ":Lspsaga hover_doc<CR>", opts)
map("n", "<Space>lp", ":Lspsaga preview_defination<CR>", opts)
map("n", "<Space>ls", ":Lspsaga signature_help<CR>", opts)
map("n", "<Space>lc", ":Lspsaga code_action<CR>", opts)
map("n", "<Space>lt", ":Lspsaga open_floaterm<CR>", opts)
map("n", "<Space>lr", ":Lspsaga close_floaterm<CR>", opts)

-- ========== Null-ls ============
api.nvim_set_keymap("n", "<Space>p", ":lua vim.lsp.buf.format{async=true}<CR>", {})

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

-- ======== BufferLine =========
vim.cmd[[ 
" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent><A-.> :BufferLineCycleNext<CR>
nnoremap <silent><A-,> :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><A->> :BufferLineMoveNext<CR>
nnoremap <silent><A-<> :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent>be :BufferLineSortByExtension<CR>
nnoremap <silent>bd :BufferLineSortByDirectory<CR>
nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

nnoremap <silent><A-c> :BufferLinePickClose<CR>
]]
