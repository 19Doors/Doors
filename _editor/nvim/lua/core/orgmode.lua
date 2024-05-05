require("orgmode").setup_ts_grammar()

require("orgmode").setup({
  org_agenda_files = { "~/Documents/org/*", "~/my-orgs/**/*" },
  org_default_notes_file = "~/Documents/org/refile.org",
  org_hide_emphasis_markers = true,
})

require("headlines").setup({
  org = {
    headline_highlights = { "Headline1", "Headline2" },
  },
})

vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"
