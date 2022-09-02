local home = os.getenv('HOME')
local db = require('dashboard')

db.custom_header = {
  "  ██╗ █████╗ ██████╗  ██████╗  ██████╗ ██████╗ ███████╗",
  "  ███║██╔══██╗██╔══██╗██╔═══██╗██╔═══██╗██╔══██╗██╔════╝",
  " ╚██║╚██████║██║  ██║██║   ██║██║   ██║██████╔╝███████╗",
  "  ██║ ╚═══██║██║  ██║██║   ██║██║   ██║██╔══██╗╚════██║",
  "  ██║ █████╔╝██████╔╝╚██████╔╝╚██████╔╝██║  ██║███████║",
  "  ╚═╝ ╚════╝ ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝",
  "",
}
db.custom_center = {
      {icon = '  ',
      desc = 'Recently latest session                 ',
      shortcut = 'SPC s l',
      action ='SessionManager load_last_session'},
      {icon = '  ',
      desc = 'Recently opened files                   ',
      action =  'DashboardFindHistory',
      shortcut = 'SPC f h'},
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f'},
      {icon = '  ',
      desc ='File Browser                            ',
      action =  'Telescope file_browser',
      shortcut = 'SPC f b'},
      {icon = '  ',
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f w'},
      {icon = '  ',
      desc = 'Open Personal dotfiles                  ',
      action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
      shortcut = 'SPC f d'},
}

vim.cmd([[
highlight DashboardHeader guifg=#7DDAC5
highlight DashboardCenter guifg=#74BEE9
highlight DashboardCenterIcon guifg=#74BEE9
highlight DashboardShortCut guifg=#C68AEE
highlight DashboardFooter guifg=#70A5EB
]])
