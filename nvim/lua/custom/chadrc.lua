---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "bearded-arc",
  theme_toggle = { "bearded-arc", "bearded-arc" },

  -- hl_override = highlights.override,
  hl_override = {
    ["Comment"] = {italic = true},
    ["Keyword"] = {italic = true},
    ["Function"] = {italic = true},
    ["@method.call"] = {italic = true},
    ["@keyword.return"] = {italic = true},
    ["@keyword.function"] = {italic = true},

    -- for, while loops
    Repeat = {
      italic = true,
    },
    -- if statements
    Conditional = {
      italic = true,
    },
  },
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
