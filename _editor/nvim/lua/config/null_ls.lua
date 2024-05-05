local null_ls = require("null-ls")

--local prettier = require("prettier")

require("null-ls").setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.autopep8
  },
})
--[[
prettier.setup({
   bin = "prettierd", -- or `prettierd`
   filetypes = {
      "css",
      "lua",
      "graphql",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "less",
      "markdown",
      "scss",
      "typescript",
      "typescriptreact",
      "yaml",
   },

   -- prettier format options (you can use config files too. ex: `.prettierrc`)
   arrow_parens = "always",
   bracket_spacing = true,
   embedded_language_formatting = "auto",
   end_of_line = "lf",
   html_whitespace_sensitivity = "css",
   jsx_bracket_same_line = false,
   jsx_single_quote = false,
   print_width = 80,
   prose_wrap = "preserve",
   quote_props = "as-needed",
   semi = true,
   single_quote = false,
   tab_width = 5,
   trailing_comma = "es5",
   use_tabs = false,
   vue_indent_script_and_style = false,
})
]]
