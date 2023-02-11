-- local separator = {'"| "', color = "StatusLineNonText"}
local separator = {'"| "'}

require('lualine').setup({
    options = {
        section_separators = '',
        component_separators = '',
        global_status = true,
        -- theme = 'onedark',
        theme = {
            normal = {
                a = 'StatusLine',
                b = 'StatusLine',
                c = 'StatusLine',
            },
        },
    },
    sections = {
        lualine_a = {
            'mode',
            separator,
        },
        lualine_b = {
            'branch',
            'diff',
            separator,
            '"" .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
            { 'diagnostics', sources = { 'nvim_diagnostic' } },
        },
        lualine_c = {
        },
        lualine_x = {
            {
                'filetype',
                icon_only = true,
            },
            'filename',
        --     {
        --         'filetype',
        --         icon_only = true,
        --     }
            'encoding',
            'fileformat',
        },
        lualine_y = {
            separator,
            '(vim.bo.expandtab and "␠" or "⇥") .. " " .. vim.bo.shiftwidth',
            separator,
        },
        lualine_z = {
            'location',
            'progress',
        },
    },
})

