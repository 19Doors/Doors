local colors = {
  background = "#0d0f18",
  contrast = "#0b0d16",
  statusline_bg = "#0f111a",
  lighter = "#11131c",
  foreground = "#a5b6cf",
  cursorline = "#11131c",
  comments = "#2b2d36",
  cursor = "#a5b6cf",
  black = "#151720",
  red = "#dd6777",
  pink = "#f09ca7",
  orange = "#E59D8C",
  yellow = "#ecd3a0",
  green = "#90ceaa",
  blue = "#86aaec",
  teal = "#8BBCCB",
  magenta = "#c296eb",
  cyan = "#93cee9",
  white = "#cbced3",
  brightblack = "#2b2d36",
  brightred = "#e26c7c",
  brightgreen = "#95d3af",
  brightyellow = "#f1d8a5",
  brightblue = "#8baff1",
  brightmagenta = "#c79bf0",
  brightcyan = "#98d3ee",
  brightwhite = "#d0d3d8",
  lavender = "#a9acdb",
  accent = "#8baff1",
}
local decay = {}

decay.normal = {
  a = { bg = colors.blue, fg = colors.background },
  b = { bg = colors.lighter, fg = colors.foreground },
  c = { bg = colors.statusline_bg, fg = colors.magenta },
  x = { bg = colors.lighter, fg = colors.foreground },
}

decay.insert = {
  a = { bg = colors.green, fg = colors.background },
  b = { bg = colors.lighter, fg = colors.foreground },
}

decay.command = {
  a = { bg = colors.red, fg = colors.background },
  b = { bg = colors.lighter, fg = colors.foreground },
}

decay.visual = {
  a = { bg = colors.cyan, fg = colors.background },
  b = { bg = colors.lighter, fg = colors.foreground },
}

decay.replace = {
  a = { bg = colors.red, fg = colors.background },
  b = { bg = colors.lighter, fg = colors.foreground },
}

decay.inactive = {
  a = { bg = colors.background, fg = colors.white },
  b = { bg = colors.lighter, fg = colors.foreground },
  c = { bg = colors.statusline_bg, fg = colors.foreground },
}

return decay
