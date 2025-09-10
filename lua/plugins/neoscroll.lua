return {
  'karb94/neoscroll.nvim',
  config = function()
    require('neoscroll').setup({
      -- 커서를 스크롤하는 동안 숨깁니다.
      hide_cursor = true,

      -- Neovim의 기본 스크롤 동작을 멈춥니다.
      stop_manual_scroll = false,

      -- 스크롤 속도를 조절하는 시간 (밀리초 단위). 숫자가 낮을수록 빠릅니다.
      scroll_time = 150,

      -- 스크롤 효과를 적용할 키 매핑 목록.
      -- 필요에 따라 커스텀 매핑을 추가하거나 삭제할 수 있습니다.
      mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },

      -- 특정 파일 타입에서 스크롤을 비활성화합니다.
      -- 터미널, 파일 탐색기 등에서 스크롤이 어색할 때 유용합니다.
      disabled_filetypes = { 'TelescopePrompt', 'packer', 'neotree', 'startify', 'alpha', 'dashboard' },
    })
  end
}
