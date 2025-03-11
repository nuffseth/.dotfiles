return {
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                }),
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
        },
        init = function()
            -- Reserve a space in the gutter
            -- This will avoid an annoying layout shift in the screen
            vim.opt.signcolumn = 'yes'
        end,
        config = function()
            local lsp = require('lspconfig')
            local lsp_defaults = lsp.util.default_config

            -- Add cmp_nvim_lsp capabilities settings to lspconfig
            -- This should be executed before you configure any language server
            lsp_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lsp_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )
            lsp.pyright.setup {
                settings = {
                    pyright = {
                        -- Using Ruff's import organizer
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            -- Ignore all files for analysis to exclusively use Ruff for linting
                            ignore = { '*' },
                        },
                    },
                },
            }
            -- These are just examples. Replace them with the language
            -- servers you have installed in your system
            lsp.gopls.setup({})
            lsp.bashls.setup({})
            lsp.yamlls.setup({})
            lsp.lua_ls.setup({})
            lsp.pyright.setup({})
            lsp.jdtls.setup({})
        end
    },
    -- Mason
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim"
        },
        config = function()
            local mason = require("mason")
            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })

            -- local mason_config = require("mason-lspcon")
            -- local capabilities = vim.tbl_deep_extend(
            --       "force",
            --       {},
            --       vim.lsp.protocol.make_client_capabilities(),
            --       cmp_lsp.default_capabilities())

            -- mason_config.setup({
            --   ensure_installed = {
            --     "lua_ls",
            --     "rust_analyzer",
            --     "gopls",
            --   },
            --   handlers = {
            --     function(server_name) -- default handler (optional)
            --       require("lspconfig")[server_name].setup {
            --           capabilities = capabilities
            --       }
            --   end,
            --   }
            -- })
        end
    }
}

