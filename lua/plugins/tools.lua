-- ~/.config/nvim/lua/plugins/tools.lua

return {
  -- Gutentags: Automatically generates ctags files.
  {
    "ludovicchabant/vim-gutentags",
    event = "VeryLazy", -- Load late to prevent conflicts
    config = function()
      -- Basic Gutentags settings
      vim.g.gutentags_enabled = 1
      vim.g.gutentags_generate_on_write = 1
      vim.g.gutentags_generate_on_missing = 1
      vim.g.gutentags_project_root_priority = { '.git', '.hg', '.svn', '.root' }
      vim.g.gutentags_ctags_ignore = { 'vim', 'lua' }
      vim.g.gutentags_ctags_extra_args = { '--fields=+l' }

      -- Solution to the Neo-tree conflict
      -- Disable Gutentags specifically for Neo-tree buffers
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "neo-tree",
        callback = function()
          vim.b.gutentags_enabled = 0
          vim.opt_local.buflisted = false
        end,
      })
    end,
  },

  -- Tagbar: Displays a code outline based on ctags.
  {
    "preservim/tagbar",
    cmd = "TagbarToggle",
    keys = {
      { "<F8>", ":TagbarToggle<CR>", desc = "Toggle Tagbar" }
    }
  },

  -- Neo-tree: A file explorer plugin.
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- For icons
      "MunifTanjim/nui.nvim",
      {
        "s1n7ax/nvim-window-picker",
        name = "window-picker",
        event = "VeryLazy",
        config = function()
          require("window-picker").setup({})
        end,
      },
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        sort_case_insensitive = true,
        default_component_configs = {
          indent = {
            padding = 1,
            with_markers = true,
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
          },
          git_status = {
            symbols = {
              added = "",
              modified = "",
              deleted = "",
              renamed = "",
              untracked = "",
              ignored = "",
              unstaged = "",
              staged = "",
              conflict = "",
            },
          },
        },
        window = {
          position = "left",
          width = 35,
          mappings = {
            ["<space>"] = "toggle_node",
            ["<cr>"] = "open",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["a"] = { "add", config = { show_path = "relative" } },
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy",
            ["m"] = "move",
            ["q"] = "close_window",
          },
          window_picker = {
            enabled = true,
            picker = "default",
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          },
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
          filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_by_name = {
              "node_modules",
              ".git",
              ".DS_Store",
            },
          },
        },
        buffers = {
          follow_current_file = {
            enabled = true,
          },
        },
      })
    end,
  },
}
