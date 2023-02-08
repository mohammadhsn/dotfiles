require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- PHP
require'lspconfig'.intelephense.setup({ capabilities = capabilities })
-- Go
require'lspconfig'.gopls.setup({ capabilities = capabilities })
-- Lua
-- require'lspconfig'.luau_lsp.setup{ filetypes = {"luau", "lua"} }

-- keymaps
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostinc.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostinc.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostinc.goto_next()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

vim.diagnostic.config({
    virtual_text = false,
    float = {
        source = true,
    },
})

