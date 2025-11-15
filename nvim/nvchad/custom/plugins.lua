return {
  -- Configs for the Nvim LSP client (:help lsp)
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("custom.configs.lspconfig")
    end,
  },

  -- Allows you to easily manage external editor tooling such as LSP servers (:help mason.nvim)
  {
    "williamboman/mason.nvim",
    opts = require("custom.configs.mason")
  },

  -- A file explorer tree for neovim written in lua
  {
    "nvim-tree/nvim-tree.lua",
    opts = require("custom.configs.nvim-tree")
  },

  -- Nvim Treesitter configurations and abstraction layer
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("custom.configs.nvim-treesitter")
  },

  -- A Vim/Neovim plugin for escaping insert mode without lagging (jj or jk)
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- Lightweight yet powerful formatter plugin for Neovim
  {
    "stevearc/conform.nvim",
    config = function()
      require("custom.configs.conform")
    end,
  },

  -- Extensible Neovim Scrollbar
  {
    "petertriho/nvim-scrollbar",
    event = "WinScrolled",
    config = function ()
      require("scrollbar").setup()
      require("scrollbar.handlers.search").setup()
      require("scrollbar.handlers.gitsigns").setup()
    end
  },

  -- Status column plugin that provides a configurable 'statuscolumn' and click handlers
  {
    "luukvbaal/statuscol.nvim",
    lazy = false,
    config = function ()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        setopt = true,
      -- TODO: set close, open, sep correctly
        fold = {
          close = "",
          open = "",
          sep = " "
        },
        segments = {
          { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
          { text = { '%s' }, click = 'v:lua.ScSa' },
          {
            text = { builtin.lnumfunc, ' ' },
            condition = { true, builtin.not_empty },
            click = 'v:lua.ScLa',
          }
        }
      })
    end
  },

  -- All the lua functions I don't want to write twice
  {
    "nvim-lua/plenary.nvim",
      config = function ()
        require("lazy")
      end
  },

  -- Highlight, list and search todo comments in your projects
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function ()
      require("todo-comments").setup()
    end
  },

  -- Hlsearch Lens for Neovim
  {
    "kevinhwang91/nvim-hlslens"
  },

  ---------- Git ----------

  -- Git integration for buffers
  {
    "lewis6991/gitsigns.nvim"
  },

  -- Fugitive is the premier Vim plugin for Git
  {
    "tpope/vim-fugitive",
    cmd = "G"
  },

  -- GitHub copilot for neovim
  {
    "github/copilot.vim",
    lazy = false
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" }
    },
    build = "make tiktoken",
    lazy = false,
    config = function()
      require("CopilotChat").setup()
    end
  }
}
