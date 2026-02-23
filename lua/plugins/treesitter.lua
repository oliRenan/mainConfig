return {
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'rust',
      'regex',
      'js',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<C-space>',
        node_incremental = '<C-space>',
        scope_incremental = false,
        node_decremental = '<bs>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>xs'] = {
            query = '@parameter.inner',
            desc = 'Swap with next',
          },
        },
        swap_previous = {
          ['<leader>xS'] = {
            query = '@parameter.inner',
            desc = 'Swap with previous',
          },
        },
      },
    },
  },
}
