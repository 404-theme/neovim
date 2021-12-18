local util = require "purpledaze.util"
local config = require "purpledaze.config"

local colors = {
  none = "NONE",
  bg = "#161926",
  bg_lighter = "#181B28",
  fg = "#D5CED9",
  white = "#FFFFFF",
  comment = "#5F6167",
  selection = "#313343",
  pink = "#FCA7D6",
  mauve = "#DDA2F6",
  fuchsia = "#FF00AA",
  purple = "#7E7EDD",
  purple2 = "#B082FF",
  purple3 = "#9D65FF",
  orange = "#FA8419",
  yellow = "#E7DE79",
  cyan = "#58D1EB",
  blue = "#2A3049",
  green = "#58EBD7",
  green2 = "#5EFF81",
  red = "#E96379",
  git = { add = "#72F1B8", change = "#AF7EFF", delete = "#FE4450", conflict = "#8A7C9C" },
}

colors.bg_darker = util.darken(colors.bg, 0.7)

colors.bg_sidebar = config.darkSidebar and colors.bg_darker or colors.bg_lighter

return colors
