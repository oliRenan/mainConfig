function ColorMyPencils(color)
  color = color or 'miasma'
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
end

return {
  'xero/miasma.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd 'colorscheme miasma'
    ColorMyPencils()
  end,
}
