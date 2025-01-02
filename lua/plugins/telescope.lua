return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
        },
    },
    config = function()
        local builtin = require("telescope.builtin")
        require('telescope').setup {
            pickers = {
                find_files = {
                    theme = "ivy"
                }
            },
            extensions = {
                fzf = {}
            }
        }
        vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>ep', function()
            builtin.find_files {
                cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
            }
        end)

        -- Look in nvim config
        vim.keymap.set("n", "<leader>en", function()
            builtin.find_files {
                cwd = vim.fn.stdpath("config")
            }
        end)
        require ".telescope.multigrep".setup()
    end
}
