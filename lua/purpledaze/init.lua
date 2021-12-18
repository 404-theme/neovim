local util = require "purpledaze.util"
local theme = require "purpledaze.theme"

local M = {}

function M.colorscheme()
  util.load(theme)
end

return M
