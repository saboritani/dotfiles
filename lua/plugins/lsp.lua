if not vim.g.vscode then
    return {
        {
            "williamboman/mason.nvim",
            build = ":MasonUpdate",
            opts = {},
        },
        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = {
                { "williamboman/mason.nvim" },
                { "neovim/nvim-lspconfig" },
            },
            config = function()
                local mason = require("mason")
                local mason_lspconfig = require("mason-lspconfig")
                local lspconfig = require("lspconfig")

                mason.setup()
                mason_lspconfig.setup()

                mason_lspconfig.setup_handlers {
                    -- The first entry (without a key) will be the default handler
                    -- and will be called for each installed server that doesn't have
                    -- a dedicated handler.
                    function (server_name) -- default handler (optional)
                        require("lspconfig")[server_name].setup {}
                    end,
                    -- Next, you can provide a dedicated handler for specific servers.
                    -- For example, a handler override for the `rust_analyzer`:
                }


                vim.api.nvim_create_autocmd("LspAttach", {
                    callback = function(_)
                    vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
                    vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
                    vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
                    vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
                    vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
                    vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
                    vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
                    vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
                    end
                    })
                vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                    vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
                )
            end
        }
    }
end
