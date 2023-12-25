-- All plugins have lazy=true by default,to load a plugin on startup just lazy=false
-- List of all default plugins & their definitions
return {

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "lukas-reineke/indent-blankline.nvim",

  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   lazy = false,
  --   priority = 1000,
  --   cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  --   build = ":TSUpdate",
  --   opts = function()
  --     return require "plugins.configs.treesitter"
  --   end,
  -- },
  --
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "plugins.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "java", "css", "python" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
  },

  -- git stuff
  -- {
  --   "lewis6991/gitsigns.nvim",
  --   ft = { "gitcommit", "diff" },
  --   init = function()
  --     -- load gitsigns only when a git file is opened
  --     vim.api.nvim_create_autocmd({ "BufRead" }, {
  --       group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
  --       callback = function()
  --         vim.fn.system("git -C " .. '"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
  --         if vim.v.shell_error == 0 then
  --           vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
  --           vim.schedule(function()
  --             require("lazy").load { plugins = { "gitsigns.nvim" } }
  --           end)
  --         end
  --       end,
  --     })
  --   end,
  --   opts = function()
  --     return require("plugins.configs.others").gitsigns
  --   end,
  --   config = function(_, opts)
  --     dofile(vim.g.base46_cache .. "git")
  --     require("gitsigns").setup(opts)
  --   end,
  -- },

  -- lsp stuff
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    opts = function()
      return require "plugins.configs.mason"
    end,
  },
  {
  "williamboman/mason-lspconfig.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },

  -- load luasnips + cmp related in insert mode only
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("plugins.configs.others").luasnip(opts)
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      return require "plugins.configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },

  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },

  -- file managing , picker etc
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "plugins.configs.nvimtree"
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot",  group_index = 2 },
        { name = "luasnip",  group_index = 2 },
        { name = "buffer",   group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path",     group_index = 2 },
      },
    },
  },
  {
     "folke/trouble.nvim",
     dependencies = { "nvim-tree/nvim-web-devicons" },
     enabled = true,
     lazy = false,
     opts = {

      -- ["J"] = { "<cmd>TroubleToggle<cr>", "Hover Documentation" },
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
     },
     keys = {
      {"J", "<cmd>TroubleToggle<cr>", "Hover Documentation" },
      },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- {
  --   "psliwka/vim-smoothie",
  --   priority = 1000,
  --   event = "VimEnter",
  -- },

  -- To make a plugin not be loaded
  {
    "NvChad/nvim-colorizer.lua",
    enabled = false
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    -- event = "VimEnter",
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = "Telescope",
    opts = function()
      return require "plugins.configs.telescope"
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function ()
      require('neoscroll').setup {}
    end,
  },
}
