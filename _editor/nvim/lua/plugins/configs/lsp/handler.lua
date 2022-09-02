local servers = {'sumneko_lua', 'clangd'}
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _,v in pairs(servers) do
	require('lspconfig')[v].setup {
    capabilities = capabilities,
	}
end
