require 'core.options'
require 'core.keymaps'
require 'core.autocmds'

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    require 'core.plugins.colorscheme',
    require 'core.plugins.gitsigns',
    require 'core.plugins.autopairs',
    require 'core.plugins.neo-tree',
    require 'core.plugins.which-key',
    require 'core.plugins.telescope',
    require 'core.plugins.lsp',
    -- require 'core.plugins.conform',
    require 'core.plugins.nvim-cmp',
    require 'core.plugins.todo-comments',
    require 'core.plugins.mini',
    require 'core.plugins.treesitter',
    require 'core.plugins.lualine',
    require 'core.plugins.tabout',
    require 'core.plugins.obsidian'
    -- require 'core.plugins.debug',
    -- require 'core.plugins.indent_line',
    -- require 'core.plugins.lint',
  },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
