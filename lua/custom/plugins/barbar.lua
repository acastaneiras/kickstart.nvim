return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    -- Opciones de barbar (se aplican con require('barbar').setup)
    -- animation = true,
    -- insert_at_start = true,
  },
  config = function(_, opts)
    require('barbar').setup(opts)

    local map = vim.keymap.set
    local opts_map = { noremap = true, silent = true }

    -- Move to previous/next
    map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts_map)
    map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts_map)

    -- Re-order to previous/next
    map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts_map)
    map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts_map)

    -- Goto buffer in position...
    for i = 1, 9 do
      map('n', '<A-' .. i .. '>', '<Cmd>BufferGoto ' .. i .. '<CR>', opts_map)
    end
    map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts_map)

    -- Pin/unpin buffer
    map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts_map)

    -- Close buffer
    map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts_map)

    -- Magic buffer-picking mode
    map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts_map)
    map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts_map)

    -- Sort automatically by...
    map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts_map)
    map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts_map)
    map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts_map)
    map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts_map)
    map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts_map)
  end,
  version = '^1.0.0', -- optional
}
