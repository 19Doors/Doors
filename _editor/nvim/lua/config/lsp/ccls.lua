-- Language server for C/C++/Objective-C.

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.ccls.setup{
  capabilities = capabilities,
 --  init_options = {
 --      compilationDatabaseDirectory = "build";
 --      index = {
	-- threads = 0;
 --      };
 --      clang = {
	-- excludeArgs = { "-frounding-math"} ;
 --      };
 --    }
}
