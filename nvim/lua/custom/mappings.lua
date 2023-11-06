---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["K"] = { vim.lsp.buf.hover, "Hover Documentation" },
    ["J"] = { "<cmd>TroubleToggle<cr>", "Hover Documentation" },
  },
}

-- more keybinds!

return M
