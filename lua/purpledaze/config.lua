local config

vim = vim or { g = {}, o = {} }

local function opt(key, default)
  key = "purpledaze_" .. key
  if vim.g[key] == nil then
    return default
  end
  if vim.g[key] == 0 then
    return false
  end
  return vim.g[key]
end

config = {
  darkSidebar = opt("dark_sidebar", false),
  dev = opt("dev", false),
}

return config
