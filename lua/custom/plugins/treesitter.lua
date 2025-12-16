return {
  { 'jlcrochet/vim-crystal', event = 'VeryLazy' },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    lazy = false,
  },
}
