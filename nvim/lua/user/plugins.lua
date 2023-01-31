-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').reset()
require('packer').init({})

local use = require('packer').use

use 'wbthomason/packer.nvim'

use ('tpope/vim-commentary')

use ('tpope/vim-surround')

use ('tpope/vim-unimpaired')

use ('jessarcher/vim-heritage')

use ({
    'airblade/vim-rooter',
    setup = function ()
        vim.g.rooter_manual_only = 1
    end,
    config = function ()
        vim.cmd('Rooter')
    end
})

use({
    'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup()
    end,
})

use({
    'karb94/neoscroll.nvim',
    config = function()
        require('neoscroll').setup()
    end,
})

use({
    'AndrewRadev/splitjoin.vim',
    config = function()
        vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
        vim.g.splitjoin_trailing_comma = 1
        vim.g.splitjoin_php_method_chain_full = 1
    end,
})

use({
    'sickill/vim-pasta',
    config = function()
        vim.g.pasta_disabled_filetypes = { 'fugitive' }
    end,
})

use({
    'nvim-telescope/telescope.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
        'nvim-telescope/telescope-live-grep-args.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'make',
        },
    },
    config = function()
        require('telescope').setup()
    end,
})

if packer_bootstrap then
    require('packer').sync()
end

vim.cmd([[
augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

