return {
  -- Copilot.lua (자동완성)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "VeryLazy",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = false,
          keymap = {
            accept = "<C-a>",
            next = "<M-j>",
            prev = "<M-k>",
          },
        },
        panel = { enabled = false },
        should_attach = function(bufnr)
          local ft = vim.bo[bufnr].filetype
          if ft == "help" or ft == "gitcommit" then
            return false
          end
          return true
        end,
      })
    end,
  },

  -- Copilot-cmp (nvim-cmp와 연동)
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua", "hrsh7th/nvim-cmp" },
    event = "InsertEnter",
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  -- CopilotChat.nvim (Chat)
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "zbirenbaum/copilot.lua",
      "nvim-telescope/telescope.nvim", -- CopilotChat에서 사용
    },
    -- "lazy" will automatically load plugins that have a `cmd` on startup.
    -- To ensure the keymaps work on startup, we will remove `cmd`.
    -- If you want to lazy-load this plugin, use `event` instead of `cmd`.
    -- For example: `event = "VeryLazy"`
    event = "VeryLazy",
    config = function()
      require("CopilotChat").setup({
        debug = false,
        show_help_at_start = false,

        -- 개선된 창 설정: 화면 중앙에 플로팅 창으로 띄웁니다.
        window = {
          layout = "float",
          width = 0.8,
          height = 0.8,
          border = "rounded", -- 둥근 테두리 사용
          relative = "editor",
          title = "CopilotChat",
        },

        -- 채팅창 하이라이트 그룹 설정
        -- 사용하는 테마에 맞게 색상을 직접 지정할 수 있습니다.
        -- 아래는 Catppuccin 테마를 기준으로 한 예시입니다.
        matches = {
          {
            pattern = "CopilotChatNormal",
            highlight = "NormalFloat",
          },
          {
            pattern = "CopilotChatBorder",
            highlight = "FloatBorder",
          },
          -- 마크다운 코드 블록 하이라이트
          {
            pattern = "markdownCodeBlock",
            highlight = { bg = "#313244" },
          },
        },

        -- 채팅창 명령어 커스텀
        prompts = {
          -- 기본 명령어 외에 자신만의 명령어를 추가할 수 있습니다.
          -- 예를 들어, "refactor" 명령어를 추가
          refactor = {
            prompt = "Please refactor the following code to be more concise and readable.",
            model = "gpt-4",
          },
        },
      })

      -- 키맵핑 설정: CopilotChat을 더 쉽게 사용하도록 합니다.
      -- Normal 모드와 Visual 모드에서 모두 사용 가능
      vim.keymap.set('n', '<leader>mm', '<cmd>CopilotChatToggle<cr>', { desc = 'Toggle CopilotChat' })
      vim.keymap.set('v', '<leader>ms', '<cmd>CopilotChat<cr>', { desc = 'Chat with selected code' })
    end,
  },
}
