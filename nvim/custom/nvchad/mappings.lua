local M = {}

M.general = {
  i = {
    ["<S-tab>"] = { "<C-d>", "move left" }
  },

  n = {
    [";"] = { ":", "enter command mode" },

    -- format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
  },
}

return M
