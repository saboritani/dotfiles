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
        "nvim-tree/nvim-web-devicons",
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
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            dependencies = {
                "nvim-treesitter/nvim-treesitter-textobjects",
            },
            main = "nvim-treesitter.configs",
            opts = {
                highlight = {enable = true},
            },
        },
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            event = "CursorMoved",
        },
        {
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            ---@module "ibl"
            ---@type ibl.config
            opts = {},
        }
    }
end
