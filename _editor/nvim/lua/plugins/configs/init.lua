function a(a,b)
	print(a,b)
end

local configs = {
  "impatient",
	"theme",
	"lualine",
	"mason",
	"treesitter",
	"cmp",
	"illuminate",
	"nvimtree",
	"toggleterm",
	"comments",
	"nullls",
	"lsp",
	"lsp_sign",
	"outline",
	"bufferline"
}

for k,v in pairs(configs) do
	require("plugins/configs/"..v)
end
