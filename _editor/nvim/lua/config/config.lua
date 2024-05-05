local modules = {
  -- 'whichkey',
  -- 'null_ls',
  'telescope',
  -- 'trouble', 
  'lspsaga',
  'nvimtree',
  'lualine',
  'bufferline',
  'autopair',
  'smoothscrolling',
  -- 'betterescape',
  'cmp',
  'indent',
  'debug',
  'dashboard',
  'dressing',
  -- 'session'
}

for _,j in pairs(modules) do
	require("config/"..j)
end

local lsp = { 'pyright', 'lualsp','ccls', 'tsserver', 'cssls', 'htmllsp'}

for _,j in pairs(lsp) do
	require("config/lsp/"..j)
end

