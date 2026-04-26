return {
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts.
      -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
      vim.g.no_plugin_maps = true

      -- Or, disable per filetype (add as you like)
      -- vim.g.no_python_maps = true
      -- vim.g.no_ruby_maps = true
      -- vim.g.no_rust_maps = true
      -- vim.g.no_go_maps = true
    end,
    config = function()
      -- put your config here
      require('nvim-treesitter-textobjects').setup {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- Functions
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            -- Classes
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            -- Params / Attributes
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            -- Tags HTML/TSX
            ['at'] = '@tag.outer',
            ['it'] = '@tag.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
            [']a'] = '@parameter.inner',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
            ['[a'] = '@parameter.inner',
          },
        },
      }
    end,
  },
}
