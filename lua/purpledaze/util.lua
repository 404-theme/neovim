local hsluv = require "purpledaze.hsluv"

local util = {}

util.bg = "#000000"
util.fg = "#ffffff"

local function hexToRgb(hex_str)
  local hex = "[abcdef0-9][abcdef0-9]"
  local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
  hex_str = string.lower(hex_str)

  assert(string.find(hex_str, pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_str))

  local r, g, b = string.match(hex_str, pat)
  return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

function util.blend(fg, bg, alpha)
  bg = hexToRgb(bg)
  fg = hexToRgb(fg)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

function util.darken(hex, amount, bg)
  return util.blend(hex, bg or util.bg, math.abs(amount))
end

function util.lighten(hex, amount, fg)
  return util.blend(hex, fg or util.fg, math.abs(amount))
end

function util.brighten(color, percentage)
  local hsl = hsluv.hex_to_hsluv(color)
  local larpSpace = 100 - hsl[3]
  if percentage < 0 then
    larpSpace = hsl[3]
  end
  hsl[3] = hsl[3] + larpSpace * percentage
  return hsluv.hsluv_to_hex(hsl)
end

function util.highlight(group, color)
  local style = color.style and "gui=" .. color.style or "gui=NONE"
  local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
  local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
  local sp = color.sp and "guisp=" .. color.sp or ""

  local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

  if color.link then
    vim.cmd("highlight! link " .. group .. " " .. color.link)
  else
    vim.cmd(hl)
  end
end

--- Delete the autocmds when the theme changes to something else
function util.onColorScheme()
  if vim.g.colors_name ~= "purpledaze" then
    vim.cmd [[autocmd! PurpleDaze]]
    vim.cmd [[augroup! PurpleDaze]]
  end
end

function util.autocmds(config)
  vim.cmd [[augroup PurpleDaze]]
  vim.cmd [[  autocmd!]]
  vim.cmd [[  autocmd ColorScheme * lua require("purpledaze.util").onColorScheme()]]
  if config.dev then
    vim.cmd [[  autocmd BufWritePost */lua/purpledaze/** nested colorscheme purpledaze]]
  end
  vim.cmd [[augroup end]]
end

function util.syntax(syntax)
  for group, colors in pairs(syntax) do
    util.highlight(group, colors)
  end
end

function util.terminal(colors)
  -- dark
  vim.g.terminal_color_0 = colors.fg
  vim.g.terminal_color_8 = colors.comment

  -- colors
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_9 = colors.red

  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_10 = colors.green

  vim.g.terminal_color_3 = colors.fuchsia
  vim.g.terminal_color_11 = colors.fuchsia

  vim.g.terminal_color_4 = colors.cyan
  vim.g.terminal_color_12 = colors.cyan

  vim.g.terminal_color_5 = colors.purple3
  vim.g.terminal_color_13 = colors.purple3

  vim.g.terminal_color_6 = colors.purple3
  vim.g.terminal_color_14 = colors.purple3
end

function util.load(theme)
  -- only needed to clear when not the default colorscheme
  if vim.g.colors_name then
    vim.cmd "hi clear"
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "purpledaze"

  -- load base theme
  util.syntax(theme.base)
  util.syntax(theme.plugins)
  util.terminal(theme.colors)
  util.autocmds(theme.config)
end

return util
