return {

  {
    'nvzone/minty',
    cmd = { 'Shades', 'Huefy' },
    dependencies = { 'nvim-lua/plenary.nvim', 'nvzone/volt' },
    keys = {
      {
        '<leader>tp',
        function()
          require('plenary.reload').reload_module 'minty.huefy'
          require('minty.huefy').open()
        end,
        desc = '[T]oggle Color[P]icker',
      },
    },
  },
}
