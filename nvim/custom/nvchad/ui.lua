local M = {}

M.theme = "ashes"
M.theme_toggle = { "ashes", "blossom_light" }

M.hl_override = {
  Comment = { italic = true },
  Folded = { bg = "NONE", ctermbg = "NONE" }
}

M.hl_add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true }
}

M.statusline = {
  theme = "vscode",
  separator_style = "default",
  overriden_modules = nil
}

-- lazyload it when there are 1+ buffers
M.tabufline = {
  show_numbers = false,
  enabled = true,
  lazyload = false,
  overriden_modules = nil
}

return M
