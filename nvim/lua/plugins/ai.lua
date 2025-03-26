return {
  { "github/copilot.vim" },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- add any opts here
      -- for example
      auto_suggestions_provider = "copilot",
      provider = "deepseek",
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        if not hub then
          return "Only answer in Vietnamese"
        end
        return hub:get_active_servers_prompt()
      end,
      -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
      custom_tools = function()
        return {
          require("mcphub.extensions.avante").mcp_tool(),
        }
      end,
      vendors = {
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "DEEPSEEK_API_KEY",
          endpoint = "https://api.deepseek.com",
          model = "deepseek-coder",
          timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
          temperature = 0,
          max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
        },
        lmstudio = {
          __inherited_from = "openai",
          api_key_name = "",
          endpoint = "http://localhost:1234/v1",
          model = "deepseek-coder-v2-lite-instruct-mlx",
          timeout = 60000, -- Timeout in milliseconds, increase this for reasoning models
          temperature = 0,
          max_tokens = 20480,
        },
      },
      ollama = {
        __inherited_from = "openai",
        api_key_name = "",
        endpoint = "http://localhost:11434",
        model = "deepseek-coder-v2",
      },
      copilot = {
        model = "claude-3.7-sonnet",
      },
      mappings = {
        suggestion = {
          accept = "<tab>",
          dismiss = "<esc>",
        },
        submit = {
          insert = "<C-Enter>", -- Super + Enter (D stands for Command key on macOS)
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
