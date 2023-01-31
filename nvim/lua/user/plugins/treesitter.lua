require('nvim-treesitter.configs').setup({
    ensure_installed = {"c", "lua", "vim", "help", "go", "python", "php", "javascript"},
    highlights = {
        enable = true,
        additional_vim_regex_highliting = true,
    },
})
