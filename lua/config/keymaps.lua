local mapKey = require("utils.KeyMapper").mapKey

-- Neotree toggle
mapKey("<leader>e", function()
  local is_open = false

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local bufname = vim.api.nvim_buf_get_name(buf)
    if bufname:match("neo%-tree") then
      is_open = true
      break
    end
  end

  vim.cmd("Neotree toggle")

  if is_open then
    print("📁 Neo-tree closed!")
  else
    print("📂 Neo-tree opened!")
  end
end)

-- pane navigation
mapKey("<C-h>", "<C-w>h") --Left
mapKey("<C-j>", "<C-w>j") --Left
mapKey("<C-k>", "<C-w>k") --Left
mapKey("<C-l>", "<C-w>l") --Left

--move directory
-- <leader>nc: 네오빔 설정 디렉토리로 이동
vim.keymap.set("n", "<leader>nc", function()
  vim.cmd("cd ~/.config/nvim")
  print("📁 Changed to Neovim Config")
end, { noremap = true, silent = true })

-- <leader>ws: 작업 디렉토리로 이동
vim.keymap.set("n", "<leader>ws", function()
  vim.cmd("cd /mnt/c/dev")
  print("📁 Changed to WorkSpace")
end, { noremap = true, silent = true })

-- buffer

-- 버퍼 탐색
vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- 버퍼 이동
vim.api.nvim_set_keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })

-- 버퍼 닫기
vim.api.nvim_set_keymap("n", "<leader>c", ":bdelete<CR>", { noremap = true, silent = true })

-- clear search hl
mapKey("<leader>h", ":nohlsearch<CR>")

-- indent
mapKey("<", "<gv", "v")
mapKey(">", ">gv", "v")

-- next line(command mode)
vim.keymap.set("n", "<Leader>o", "o<Esc>", { desc = "Insert new line below without entering insert mode" })
vim.keymap.set("n", "<Leader>O", "O<Esc>", { desc = "Insert new line above without entering insert mode" })

-- ESC replacement key
vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape insert mode using jk" })
--speed limit(max wait time limit)
vim.opt.timeoutlen = 300

-- ZenMode toggle
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { desc = "Toggle Zen Mode" })

-- twilight toggle
vim.keymap.set("n", "<leader>tw", ":Twilight<CR>", { desc = "Toggle Twilight only" })

-- focusing mode(ZenMode + twilight)
vim.keymap.set("n", "<leader>zt", function()
  vim.cmd("ZenMode")
end, { desc = "Toggle ZenMode (with Twilight)" })

-- save & quit command
vim.keymap.set("n", "<Leader>w", ":w!<CR>", { desc = "Save file" })
vim.keymap.set("n", "<Leader>q", ":q!<CR>", { desc = "Quit file" })
vim.keymap.set("n", "<Leader>x", ":wq<CR>", { desc = "Save and quit" })
