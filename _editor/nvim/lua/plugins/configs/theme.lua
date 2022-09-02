local decay = require('decay')
decay.setup({
  style = 'dark',
	 italics = {
    code = false,
    comments = false -- to disable italic comments, replace to true to enable
   },
  nvim_tree = {
    contrast = false, -- or false to disable tree contrast
  },
})

