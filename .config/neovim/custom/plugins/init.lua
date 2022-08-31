--            __            _
--     ____  / /_  ______ _(_)___  _____
--    / __ \/ / / / / __ `/ / __ \/ ___/
--   / /_/ / / /_/ / /_/ / / / / (__  )
--  / .___/_/\__,_/\__, /_/_/ /_/____/
-- /_/            /____/
--

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

	["iamcco/markdown-preview.nvim"] = {
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	["williamboman/mason-lspconfig.nvim"] = {
		after = "mason.nvim",
		config = function()
			require("custom.plugins.mason-lspconfig").setup()
		end,
	},

	["williamboman/mason.nvim"] = {
		event = "VimEnter",
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
