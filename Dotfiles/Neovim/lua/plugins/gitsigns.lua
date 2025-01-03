-- GitHub Repository: https://github.com/lewis6991/gitsigns.nvim
-- Description: Git decorations
require('gitsigns').setup({

  on_attach = function(bufnr)

    local gs = require('gitsigns')

    local map = function(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']h', function()
      if vim.wo.diff then
        vim.cmd.normal({ ']h', bang = true })
      else
        gs.nav_hunk('next')
      end
    end,
    { desc = 'Next hunk'})

    map('n', '[h', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[h', bang = true })
      else
        gs.nav_hunk('prev')
      end
    end,
    { desc = 'Previous hunk'})

    -- Action
    map('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage Hunk' })
    map('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset Hunk' })
    map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Stage Hunk' })
    map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Reset Hunk' })
    map('n', '<leader>hS', gs.stage_buffer, { desc = 'Stage Buffer' })
    map('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset Buffer' })

  end

})

