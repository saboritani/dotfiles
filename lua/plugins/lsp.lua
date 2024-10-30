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
                { "hrsh7th/cmp-nvim-lsp" },
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
                        local capabilities = require("cmp_nvim_lsp").default_capabilities()
                        require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
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
        },
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                { "hrsh7th/cmp-emoji" },
                { "hrsh7th/cmp-nvim-lsp" },
            },
            ---@param opts cmp.ConfigSchema
            opts = function(_, opts)
                local has_words_before = function()
                    unpack = unpack or table.unpack
                    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
                end

                local cmp = require("cmp")

                cmp.sources = {
                    {name = "emoji"},
                    {name = "nvim_lsp"},
                }
                opts.mapping = {
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
                            cmp.select_next_item()
                        elseif vim.snippet.active({ direction = 1 }) then
                            vim.schedule(function()
                            vim.snippet.jump(1)
                            end)
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif vim.snippet.active({ direction = -1 }) then
                            vim.schedule(function()
                                vim.snippet.jump(-1)
                            end)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }
            end,
        }
    }
end
