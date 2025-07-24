return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    lazy = false,
    opts = {
      enable = true,
      max_lines = 0,
      trim_scope = 'outer',
      mode = 'cursor',
      zindex = 20,
      separator = nil,
    },
    keys = {
      {
        'gC',
        function()
          require('treesitter-context').go_to_context()
        end,
        desc = 'Go to context',
      },
    },
  },
}
