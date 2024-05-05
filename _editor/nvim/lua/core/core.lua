-- local modules = { "plugins", "theme", "variables", "keymaps", "treesitter", "lsp_installer", "orgmode","highlight" }
local modules = { "lazy","theme", "variables", "keymaps", "treesitter","mason" ,"highlight" }

for _, j in pairs(modules) do
   require("core/" .. j)
end
