local modules = { 'plugins','theme', 'variables', 'keymaps', 'treesitter' , 'lsp_installer', 
'highlight'}

for _,j in pairs(modules) do
	require("core/"..j)
end

