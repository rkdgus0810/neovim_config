-- plugins/ctags.lua

return {
  {
    "ludovicchabant/vim-gutentags",
    config = function()
      -- gutentags 기본 설정
      vim.g.gutentags_enabled = 1
      vim.g.gutentags_generate_on_write = 1
      vim.g.gutentags_generate_on_missing = 1

      -- Neo-tree 충돌 해결을 위한 핵심 설정
      -- 프로젝트 루트를 찾을 때 `.git`과 같은 버전 관리 시스템을 최우선으로 찾도록 설정합니다.
      -- 이는 Neovim 내부 파일을 프로젝트로 인식하지 않게 합니다.
      vim.g.gutentags_project_root_priority = { '.git', '.hg', '.svn', '.root' }

      -- ctags 생성 시 무시할 파일 형식을 지정합니다.
      -- 'vim'과 'lua'는 Neovim의 내부 스크립트 파일이므로, 이들을 무시하도록 설정합니다.
      vim.g.gutentags_ctags_ignore = { 'vim', 'lua' }

      -- ctags 추가 인자 설정
      vim.g.gutentags_ctags_extra_args = { '--fields=+l' }
    end
  },
  {
    "preservim/tagbar",
    cmd = "TagbarToggle",
    keys = {
      { "<F8>", ":TagbarToggle<CR>", desc = "Toggle Tagbar" }
    }
  }
}
