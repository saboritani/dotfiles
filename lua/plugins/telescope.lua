if not vim.g.vscode then
    return {           
        { "nvim-telescope/telescope.nvim", cmd = { "Telescope" } },
        { "nvim-lua/plenary.nvim", lazy = true }
    }
end
