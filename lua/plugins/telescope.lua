if not vim.g.vscode then
    return {           
        {
            "nvim-telescope/telescope.nvim",
            cmd = { "Telescope" },
            config = function()
                require("telescope").setup {
                    defaults = {
                        file_ignore_patterns = {".venv/", "git/", "node_modules"}
                    },
                }
                local builtin = require("telescope.builtin")
                vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
                vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
                vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
                vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            end
        },
        { "nvim-lua/plenary.nvim", lazy = true }
    }
end
