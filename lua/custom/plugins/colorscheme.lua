return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        compile = false,
        transparent = true,
        dimInactive = false,
        terminalColors = true,
        theme = 'wave',
        background = {
          dark = 'wave',
          light = 'lotus',
        },
        overrides = function(colors)
          local theme = colors.theme
          local makeDiagnosticColor = function(color)
            local c = require 'kanagawa.lib.color'
            return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
          end
          return {
            -- Window
            Normal = { bg = 'none' },
            NormalNC = { bg = 'none' },
            NormalFloat = { bg = 'none' },
            -- Borders
            FloatBorder = { bg = 'none' },
            FloatTitle = { bg = 'none' },
            -- Cols
            SignColumn = { bg = 'none' },
            LineNr = { bg = 'none' },
            CursorLineNr = { bg = 'none' },

            -- Transparent Gutter
            StatusLine = { bg = 'none' },
            VertSplit = { bg = 'none' },

            -- Plugins
            TelescopeNormal = { bg = 'none' },
            TelescopeBorder = { bg = 'none' },
            NvimTreeNormal = { bg = 'none' },
            NvimTreeNormalNC = { bg = 'none' },

            LazyNormal = { bg = 'none' },
            MasonNormal = { bg = 'none' },

            NoiceFormatProgressDone = { fg = colors.theme.syn.string, bg = 'none' },
            NoiceFormatProgressTodo = { fg = colors.theme.syn.comment, bg = 'none' },
            NoiceLspProgressSpinner = { fg = colors.theme.syn.constant, bg = 'none' },
            NoiceLspProgressClient = { fg = colors.theme.syn.identifier, bg = 'none' },
            NoiceLspProgressTitle = { fg = colors.theme.syn.statement, bg = 'none' },

            DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
            DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
            DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
            DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
          }
        end,
      }

      vim.cmd 'colorscheme kanagawa'
    end,
  },
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    -- 'folke/tokyonight.nvim',
    -- priority = 1000, -- Make sure to load this before all the other start plugins.
    -- config = function()
    -- diagnostic disable-next-line: missing-fields
    -- require('tokyonight').setup {
    --   transparent = true,
    --   styles = {
    --     sidebars = 'transparent',
    --     floats = 'transparent',
    --     comments = { italic = false }, -- Disable italics in comments
    --   },
    -- }
    --   -- Load the colorscheme here.
    --   -- Like many other themes, this one has different styles, and you could load
    --   -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    --   vim.cmd.colorscheme 'tokyonight-storm'
    -- end,
  },
}
