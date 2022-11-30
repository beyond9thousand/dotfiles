--            __            _
--     ____  / /_  ______ _(_)___  _____
--    / __ \/ / / / / __ `/ / __ \/ ___/
--   / /_/ / / /_/ / /_/ / / / / (__  )
--  / .___/_/\__,_/\__, /_/_/ /_/____/
-- /_/            /____/
--
local override = require("custom.plugins.override")

return {
	-- startup dashboard
	["goolord/alpha-nvim"] = {
		disable = false,
	},

	-- save readonly files
	["lambdalisue/suda.vim"] = {},

	["jghauser/mkdir.nvim"] = {},

	["baskerville/vim-sxhkdrc"] = {},

	["elkowar/yuck.vim"] = {},

	["Fymyte/rasi.vim"] = {
		ft = { "rasi" },
		run = ":TSInstall rasi",
	},

	["gpanders/nvim-parinfer"] = {},

	-- formatting and diagnostic
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls").setup()
		end,
	},

	["ggandor/lightspeed.nvim"] = {},

	["nvim-telescope/telescope.nvim"] = {
		override_options = override.telescope,
	},

	["iamcco/markdown-preview.nvim"] = {
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			vim.g["mkdp_browser"] = "firefox"
		end,
	},

	["nvim-treesitter/nvim-treesitter"] = {
		override_options = override.treesitter,
	},

	["williamboman/mason-lspconfig.nvim"] = {
		after = "mason.nvim",
		override_options = override.mason_lspconfig,
	},

	["williamboman/mason.nvim"] = {
		event = "VimEnter",
		override_options = override.mason,
	},

	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("lspconfig").bashls.setup({})
		end,
	},

	["folke/which-key.nvim"] = {
		disable = false,
	},
}
