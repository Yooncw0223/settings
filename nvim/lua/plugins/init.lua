-- All plugins have lazy=true by default,to load a plugin on startup just lazy=false
-- List of all default plugins & their definitions
return {

	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			-- your configuration comes here
	-- 			-- or leave it empty to use the default settings
	-- 			style = "night",
	-- 			light_style = "day", -- The theme is used when the background is set to light
	-- 			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
	-- 			styles = {
	-- 				-- Style to be applied to different syntax groups
	-- 				-- Value is any valid attr-list value for `:help nvim_set_hl`
	-- 				comments = { italic = true },
	-- 				keywords = { italic = true },
	-- 				functions = {},
	-- 				variables = {},
	-- 				-- Background styles. Can be "dark", "transparent" or "normal"
	-- 				sidebars = "dark", -- style for sidebars, see below
	-- 				floats = "dark", -- style for floating windows
	-- 			},
	-- 			sidebars = { "qf", "help", "nvimtree" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	-- 			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	-- 			hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	-- 			dim_inactive = false, -- dims inactive windows
	-- 			lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
	--
	-- 			--- You can override specific color groups to use other groups or a hex color
	-- 			--- function will be called with a ColorScheme table
	-- 			---@param colors ColorScheme
	-- 			on_colors = function(colors)
	-- 				local blue = "#008ECC"
	-- 				colors.red = blue
	-- 				colors.red1 = blue
	-- 			end,
	--
	-- 			--- You can override specific highlights to use other groups or a hex color
	-- 			--- function will be called with a Highlights and ColorScheme table
	-- 			---@param highlights Highlights
	-- 			---@param colors ColorScheme
	-- 			on_highlights = function(highlights, colors) end,
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	config = function()
	-- 		require("onedark").setup({
	-- 			style = "deep",
	-- 			-- style = "darker",
	-- 		})
	-- 		vim.cmd("colorscheme onedark")
	-- 	end,
	-- },
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	config = function()
	-- 		local palettes = {
	-- 			-- Everything defined under `all` will be applied to each style.
	-- 			all = {
	-- 				-- Each palette defines these colors:
	-- 				--   black, red, green, yellow, blue, magenta, cyan, white, orange, pink
	-- 				--
	-- 				-- These colors have 3 shades: base, bright, and dim
	-- 				--
	-- 				-- Defining just a color defines it's base color
	-- 				red = "#B0E0E6",
	-- 			},
	-- 			-- nightfox = {
	-- 			-- 	-- A specific style's value will be used over the `all`'s value
	-- 			-- 	red = "#c94f6d",
	-- 			-- },
	-- 			-- dayfox = {
	-- 			-- 	-- Defining multiple shades is done by passing a table
	-- 			-- 	blue = { base = "#4d688e", bright = "#4e75aa", dim = "#485e7d" },
	-- 			-- },
	-- 			-- nordfox = {
	-- 			-- 	-- A palette also defines the following:
	-- 			-- 	--   bg0, bg1, bg2, bg3, bg4, fg0, fg1, fg2, fg3, sel0, sel1, comment
	-- 			-- 	--
	-- 			-- 	-- These are the different foreground and background shades used by the theme.
	-- 			-- 	-- The base bg and fg is 1, 0 is normally the dark alternative. The others are
	-- 			-- 	-- incrementally lighter versions.
	-- 			-- 	bg1 = "#2e3440",
	-- 			--
	-- 			-- 	-- sel is different types of selection colors.
	-- 			-- 	sel0 = "#3e4a5b", -- Popup bg, visual selection bg
	-- 			-- 	sel1 = "#4f6074", -- Popup sel bg, search bg
	-- 			--
	-- 			-- 	-- comment is the definition of the comment color.
	-- 			-- 	comment = "#60728a",
	-- 			-- },
	-- 		}
	-- 		require("nightfox").setup({ palettes = palettes })
	--
 --      vim.cmd("colorscheme nightfox")
	-- 	end,
	-- },
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				overrides = function(colors) -- add/modify highlights
					-- local theme = colors.theme
					-- return {
					-- 	NormalFloat = { bg = "none" },
					-- 	FloatBorder = { bg = "none" },
					-- 	FloatTitle = { bg = "none" },
					--
					-- 	-- Save an hlgroup with dark background and dimmed foreground
					-- 	-- so that you can use it where your still want darker windows.
					-- 	-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
					-- 	NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
					--
					-- 	-- Popular plugins that open floats will link to NormalFloat by default;
					-- 	-- set their background accordingly if you wish to keep them dark and borderless
					-- 	LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
					-- 	MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
					-- }
					return {
            LineNr = { bg = "none" },
            SignColumn = { bg = "none" },
          }
				end,
				theme = "wave", -- Load "wave" theme when 'background' option is not set
				background = { -- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus",
				},
			})
		end,
	},
	-- {
	-- 	"sainnhe/everforest",
	-- 	config = function()
	-- 		vim.cmd([[let g:everforest_background = 'hard']])
	-- 	end,
	-- },

	-- {
	-- 	"MetriC-DT/balance-theme.nvim",
	-- },
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
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
					require("plugins.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"elixir",
					"heex",
					"javascript",
					"html",
					"java",
					"css",
					"python",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
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
			return require("plugins.configs.mason")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
		end,
	},

	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
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
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
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
			return require("plugins.configs.cmp")
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},

	-- file managing , picker etc
	{
		"nvim-tree/nvim-tree.lua",
		opts = function()
			return require("plugins.configs.nvimtree")
		end,
	},

	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- },
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	dependencies = {
	-- 		{
	-- 			"zbirenbaum/copilot-cmp",
	-- 			config = function()
	-- 				require("copilot_cmp").setup()
	-- 			end,
	-- 		},
	-- 	},
	-- 	opts = {
	-- 		sources = {
	-- 			{ name = "nvim_lsp", group_index = 2 },
	-- 			{ name = "copilot", group_index = 2 },
	-- 			{ name = "luasnip", group_index = 2 },
	-- 			-- { name = "buffer", group_index = 2 },
	-- 			{ name = "nvim_lua", group_index = 2 },
	-- 			{ name = "path", group_index = 2 },
	-- 		},
	-- 	},
	-- },
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
			{ "J", "<cmd>TroubleToggle<cr>", "Hover Documentation" },
		},
	},
	-- To make a plugin not be loaded
	-- {
	-- 	"NvChad/nvim-colorizer.lua",
	-- 	enabled = false,
	-- },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		cmd = "Telescope",
		opts = function()
			return require("plugins.configs.telescope")
		end,
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				-- All these keys will be mapped to their corresponding default scrolling animation
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
				hide_cursor = true, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = "sine", -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
				performance_mode = false, -- Disable "Performance Mode" on all buffers.
			})
		end,
	},
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
  {
    "yorickpeterse/vim-paper"
  },
	-- {
	-- 	"NTBBloodbath/sweetie.nvim",
	-- },
	-- {
	-- 	"utilyre/barbecue.nvim",
	-- 	name = "barbecue",
	-- 	version = "*",
	-- 	dependencies = {
	-- 		"SmiteshP/nvim-navic",
	-- 		"nvim-tree/nvim-web-devicons", -- optional dependency
	-- 	},
	-- 	opts = {
	-- 		-- configurations go here
	-- 	},
	-- },
}
