return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local mode = {
      'mode',
      fmt = function(str)
        return '' .. str
      end,
    }
    local filename = {
      'filename',
      file_status = true, -- displays file statu (readonly status, modified status)
      path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = '', warn = '', info = '', hint = '󱩎' },
      -- colored = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      colors = true,
      symbols = { added = '', modified = '', removed = '' }, -- change diff symbols
      cond = hide_in_width,
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          'alpha',
          'neo-tree',
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { 'fugitive' },
    }
  end,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}
