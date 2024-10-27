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
        {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
        {
	        "lukas-reineke/indent-blankline.nvim",
            main = 'ibl',
            opts = function(_, opts)
		    -- Other blankline configuration here
		    return require("indent-rainbowline").make_opts(opts)
	        end,
	        dependencies = {
		        "TheGLander/indent-rainbowline.nvim",
	        }
        }   
    }
end
