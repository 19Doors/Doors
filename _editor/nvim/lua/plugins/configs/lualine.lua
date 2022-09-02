require('lualine').setup {
  options = {
		section_separators = {},
		component_separators = {},
		globalstatus = true,
    theme = 'decay',
  },
	sections = {
		lualine_b = {'branch', 'diff','filename'},
		lualine_c = {'diagnostics'},
		lualine_x = {},
		lualine_y = {'filetype'}
	},
	inactive_sections = {
		lualine_c = {},
		lualine_x = {}
	}
}
