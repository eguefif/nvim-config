return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    config = function()
        require("lspconfig").lua_ls.setup {}
        require 'lspconfig'.rust_analyzer.setup {
            settings = {
                ['rust-analyzer'] = {
                    diagnostics = {
                        enable = false,
                    }
                }
            }
        }
        require 'lspconfig'.sqlls.setup {}
        require 'lspconfig'.rubocop.setup {}
        require 'lspconfig'.ruby_lsp.setup {
            filetypes = { 'ruby' },
        }
        require('lspconfig').ruff.setup {}

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client then return end

                if client.supports_method('textDocument/formatting') then
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                        end,
                    })
                end


                if client.supports_method('textDocument/code_action') then
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
                end
                if client.supports_method('textDocument/definition') then
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
                end
                if client.supports_method('textDocument/rename') then
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
                end
                if client.supports_method('textDocument/references') then
                    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, {})
                end
                if client.supports_method('textDocument/implementation') then
                    vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, {})
                end
            end,
        })
    end
}
