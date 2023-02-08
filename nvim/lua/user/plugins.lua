-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').reset()
require('packer').init({})

local use = require('packer').use

use 'wbthomason/packer.nvim'

use({
    'jessarcher/onedark.nvim',
    config = function()
        vim.cmd('colorscheme onedark')

        vim.api.nvim_set_hl(0, 'FloatBorder', {
            fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
            bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
        })

        vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })

        vim.api.nvim_set_hl(0, 'StatusLineNonText', {
            fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
            bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
        })

    end,
})

use 'tpope/vim-commentary'

use 'tpope/vim-surround'

use 'tpope/vim-unimpaired'

use 'jessarcher/vim-heritage'

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
        require('user/plugins/telescope')
    end,
})

use({
    'kyazdani42/nvim-tree.lua',
    require = 'kyazdani42/nvim-web-devicons',
    config = function()
        require('user/plugins/nvim-tree')
    end,
})

use({
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani41/nvim-web-devicons',
    config = function ()
        require('user/plugins/lualine')
    end,
})

use({
    'akinsho/bufferline.nvim',
    requires = 'kyazdani41/nvim-web-devicons',
    after = 'onedark.nvim',
    config = function ()
        require('user/plugins/bufferline')
    end,
})

use {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
    }
  end,
  requires = {'nvim-tree/nvim-web-devicons'}
}

use {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
    
    vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
    vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
    vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
    vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
    vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
    vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
  end,
}

use({
    'neovim/nvim-lspconfig',
    requires = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        require('user/plugins/lspconfig')
    end,
})

use({
    'hrsh7th/nvim-cmp',
    requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'L3MON4d3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'onsails/lspkind-nvim',
    },
    config = function()
        require('user/plugins/cmp')
    end,
})

use({
    'voldikss/vim-floaterm',
    config = function()
        vim.g.floaterm_width = 0.8
        vim.g.floaterm_height = 0.8
        vim.keymap.set('n', '<C-j>', ':FloatermToggle<CR>')
        vim.keymap.set('t', '<C-j>', '<C-\\><C-n>:FloatermToggle<CR>')
        vim.cmd([[
            highlight link Floaterm CursorLine
            highlight link FloatermBorder CursorLineBg
        ]])
    end
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

