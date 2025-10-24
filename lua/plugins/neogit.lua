return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- dependência obrigatória
    'sindrets/diffview.nvim', -- opcional, mas recomendado (visualização de diffs)
    'nvim-telescope/telescope.nvim', -- opcional, integração com telescope
  },
  config = function()
    require('neogit').setup {
      integrations = {
        diffview = true, -- habilita Diffview se instalado
        telescope = true, -- habilita integração com Telescope
      },
    }
  end,
  cmd = 'Neogit', -- carrega apenas quando o comando Neogit for chamado
}
