return {
	-- LSP and Mason
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"gopls",

					"pyright",
					"pylint",
					"mypy",
					"lua_ls",

					"bashls",
					"shfmt",
					"typos_lsp",
				},
			})
		end,
	},

	-- GitHub Copilot
	{
		"zbirenbaum/copilot.lua",
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = true, auto_trigger = true },
				panel = { enabled = false },
			})
		end,
	},

	-- Copilot CMP source
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	lazy = true,
	-- 	dependencies = {
	-- 		"zbirenbaum/copilot.lua",
	-- 	},
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- },

	-- Completion framework
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	lazy = true,
	-- 	event = "InsertEnter",
	-- 	dependencies = {
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		"L3MON4D3/LuaSnip",
	-- 		"saadparwaiz1/cmp_luasnip",
	-- 		"zbirenbaum/copilot-cmp",
	-- 		"zbirenbaum/copilot.lua",
	-- 	},
	-- 	config = function()
	-- 		require("cmp").setup({
	-- 			snippet = {
	-- 				expand = function(args)
	-- 					require("luasnip").lsp_expand(args.body)
	-- 				end,
	-- 			},
	-- 			sources = {
	-- 				{ name = "nvim_lsp" },
	-- 				{ name = "copilot" },
	-- 				{ name = "luasnip" },
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{
		"max397574/better-escape.nvim",
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},
}
