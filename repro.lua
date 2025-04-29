vim.env.LAZY_STDPATH = '.repro'

load(vim.fn.system 'curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua')()

require('lazy.minit').repro {
    spec = {
        { 
            'folke/snacks.nvim', 
            ---@type snacks.Config 
            opts = {} 
        },
        "williamboman/mason.nvim", 
        "williamboman/mason-lspconfig.nvim", 
        {
            'neovim/nvim-lspconfig', 
            dependencies = {
                -- Automatically install LSPs and related tools to stdpath for Neovim
                { 
                    'williamboman/mason.nvim', 
                    config = true 
                },
                -- NOTE: Must be loaded before dependants
                'williamboman/mason-lspconfig.nvim', 
                'WhoIsSethDaniel/mason-tool-installer.nvim', -- Useful status updates for LSP.
                -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
                { 
                    'j-hui/fidget.nvim', 
                    opts = {} 
                },
                -- Allows extra capabilities provided by nvim-cmp
                'hrsh7th/cmp-nvim-lsp',
            },
        },
        { 
            -- Highlight, edit, and navigate code
            'nvim-treesitter/nvim-treesitter', 
            build = ':TSUpdate', 
            main = 'nvim-treesitter.configs', -- Sets main module to use for opts
            -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
            opts = { 
                ensure_installed = { 'lua', 'luadoc', 'vim', 'vimdoc', 'jsdoc' }, -- Autoinstall languages that are not installed
                auto_install = true, 
                highlight = { 
                    enable = true, 
                    -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
                    -- If you are experiencing weird indenting issues, add the language to
                    -- the list of additional_vim_regex_highlighting and disabled languages for indent.
                    additional_vim_regex_highlighting = { 'ruby' },
                }, 
                indent = { enable = true, disable = { 'ruby' } }
            }, 
        }
    }
}

-- Main LSP Configuration
require("mason").setup({
    ensure_installed = {"stylua"}, -- Add your preferred language servers here
})

require("mason-lspconfig").setup({
    ensure_installed = {"lua_ls"}, -- Add your preferred language servers here
})

