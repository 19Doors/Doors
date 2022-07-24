local modules = { 'nvimtree', 'lualine', 'bufferline',
  'autopair',
  'smoothscrolling',
  'betterescape',
  'cmp',
  'indent',
  'dashboard',
  'dressing',
  'session'}

for _,j in pairs(modules) do
	require("config/"..j)
end

local lsp = { 'pyright', 'lualsp' }

for _,j in pairs(lsp) do
	require("config/lsp/"..j)
end

