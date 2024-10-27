if vim.g.vscode then
-- VSCode
    return {
        "mattn/vim-maketable",
        "monaqa/dial.nvim",
        {
            "kylechui/nvim-surround",
            version = "*",
            event = "VeryLazy",
            config = function()
            require("nvim-surround").setup({
                --Configure here
            })
            end
        }
    }
else
-- NeoVim
    return {
        "mattn/vim-maketable",
        "monaqa/dial.nvim",
        "ixru/nvim-markdown",
        {
            "kylechui/nvim-surround",
            version = "*",
            event = "VeryLazy",
            config = function()
            require("nvim-surround").setup({
                --Configure here
            })
        end
        }
    }
end