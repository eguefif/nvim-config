return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup {
                options = {
                    separator_style = 'slant',
                    auto_toggle_bufferline = true,
                }
            }
            vim.keymap.set("n", "<leader>bd", "<Cmd>BufferLineCloseOthers<CR>")
            vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>")
            vim.keymap.set("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>")
            vim.keymap.set("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>")
            vim.keymap.set("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>")
            vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>")
            vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>")
            vim.keymap.set("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>")
        end
    }
}
