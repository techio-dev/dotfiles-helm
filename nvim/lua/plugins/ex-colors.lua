return {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
      vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    "aileot/ex-colors.nvim",
    lazy = true,
    enabled = true,
    cmd = "ExColors",
    config = function()
      -- Please arrange the patterns for your favorite plugins by yourself.
      require("ex-colors").setup({
        -- included_patterns = require("ex-colors.presets").recommended.included_patterns + {
        --   "^Cmp%u", -- hrsh7th/nvim-cmp
        --   '^GitSigns%u', -- lewis6991/gitsigns.nvim
        --   '^RainbowDelimiter%u', -- HiPhish/rainbow-delimiters.nvim
        -- },
        autocmd_patterns = {
          CmdlineEnter = {
            ["*"] = {
              "^debug%u",
              "^health%u",
            },
          },
          -- FileType = {
          --   ['Telescope*'] = {
          --     '^Telescope%u', -- nvim-telescope/telescope.nvim
          --   },
          -- },
        },
      })
    end,
  },
}
