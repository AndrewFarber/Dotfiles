local lspconfig = require('lspconfig')

-- Python LSP
lspconfig.pyright.setup({})

-- Nix LSP
lspconfig.nil_ls.setup({})

-- Lua LSP
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),

  callback = function(event)

    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('<leader>gd', require('telescope.builtin').lsp_definitions, 'Goto Definition')
    map('<leader>gD', vim.lsp.buf.declaration, 'Goto Declaration')
    map('<leader>gr', require('telescope.builtin').lsp_references, 'Goto References')
    map('<leader>gi', require('telescope.builtin').lsp_implementations, 'Goto Implementation')
    map('<leader>gt', require('telescope.builtin').lsp_type_definitions, 'Goto Type Definition')
    map('<leader>gs', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
    map('<leader>gS', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')
    map('<leader>rn', vim.lsp.buf.rename, 'Rename')
    map('<leader>ca', vim.lsp.buf.code_action, 'Code Action', { 'n', 'x' })

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then

      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(event2)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
      end })

    end

  end,
})
