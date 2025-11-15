return {
	-- A collection of QOL plugins
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			scroll = { enabled = false },
			indent = {
				enabled = false,
				animate = { enabled = false },
				scope = { enabled = false },
			},
			lazygit = { enabled = true },
		},
		config = function(_, opts)
			require("snacks").setup(opts)

			vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#202020" })

			vim.api.nvim_create_user_command("LazyGit", function()
				require("snacks.lazygit").open()
			end, {})
		end,
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "iceberg_dark",
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
				},
			})
		end,
	},

	-- Scrollbar
	{
		"petertriho/nvim-scrollbar",
		lazy = false,
		event = "WinScrolled",
		config = function()
			require("scrollbar").setup({
				excluded_filetypes = { "snacks_picker_list" },
				handlers = { cursor = false },
			})
			require("scrollbar.handlers.search").setup()
			require("scrollbar.handlers.gitsigns").setup()
		end,
	},

	-- TODO Comments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- FIXME: Highlight search results
	{
		"kevinhwang91/nvim-hlslens",
	},

	-- {
	--     "lewis6991/gitsigns.nvim"
	-- },
	--
	-- {
	--     "tpope/vim-fugitive",
	--     cmd = "G"
	-- },
}
