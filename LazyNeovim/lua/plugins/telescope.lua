return {
    -- Extendable fuzzy finder over lists.
    {
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
        require('telescope').setup {
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
            defaults = {
                 mappings = {
                    i = {
                        ["<C-k>"] = {
                            require('telescope.actions').move_selection_previous,
                            type = "action",
                            opts = { silent = true, nowait = true },
                        },
                        ["<C-j>"] = {
                            require('telescope.actions').move_selection_next,
                            type = "action",
                            opts = { silent = true, nowait = true },
                        },
                    },
                }
            },
        }
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')
        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>fh', builtin.help_tags)
        vim.keymap.set('n', '<leader>ff', builtin.find_files)
        vim.keymap.set('n', '<leader>fw', builtin.grep_string)
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics)
        vim.keymap.set('n', '<leader>fr', builtin.resume)
        vim.keymap.set('n', '<leader>fb', builtin.buffers)
        vim.keymap.set('n', '<leader>reg', builtin.registers)

        vim.keymap.set('n', '<leader>/', function()
            -- You can pass additional configuration to Telescope to change the theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = 'Fuzzily search in current buffer' })

        -- Shortcut for searching your Neovim configuration files
        vim.keymap.set('n', '<leader>fc', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = 'Search Neovim configs' })
    end,
    },
}
