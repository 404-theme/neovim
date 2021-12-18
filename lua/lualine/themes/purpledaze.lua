local colors = require "purpledaze.colors"

local purpledaze = {}

purpledaze.normal = {
  a = { bg = colors.purple, fg = colors.fg },
  b = { bg = colors.bg_lighter, fg = colors.fg },
  c = { bg = colors.bg_lighter, fg = colors.fg },
}

purpledaze.insert = {
  a = { bg = colors.green, fg = colors.fg },
  b = { bg = colors.bg_lighter, fg = colors.green },
}

purpledaze.command = {
  a = { bg = colors.cyan, fg = colors.fg },
  b = { bg = colors.bg_lighter, fg = colors.cyan },
}

purpledaze.visual = {
  a = { bg = colors.fuchsia, fg = colors.fg },
  b = { bg = colors.bg_lighter, fg = colors.fuchsia },
}

purpledaze.replace = {
  a = { bg = colors.cyan, fg = colors.fg },
  b = { bg = colors.bg_lighter, fg = colors.cyan },
}

purpledaze.inactive = {
  a = { bg = colors.bg_lighter, fg = colors.purple },
  b = { bg = colors.bg_lighter, fg = colors.pink, gui = "bold" },
  c = { bg = colors.bg_lighter, fg = colors.pink },
}

return purpledaze
