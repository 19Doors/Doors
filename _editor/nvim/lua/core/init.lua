require('plugins')

local modules = {
	'options',
	'keymappings',
}

for _,v in pairs(modules) do
	require('core/'..v)
end
