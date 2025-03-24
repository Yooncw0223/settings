local M = {}

-- M.on_attach = function(client, bufnr)
-- 	client.server_capabilities.documentFormattingProvider = false
-- 	client.server_capabilities.documentRangeFormattingProvider = false
--
-- 	-- utils.load_mappings("lspconfig", { buffer = bufnr })
-- 	-- if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method("textDocument/semanticTokens") then
-- 	-- client.server_capabilities.semanticTokensProvider = nil
-- 	-- end
-- end

-- M.capabilities = vim.lsp.protocol.make_client_capabilities()

-- M.capabilities.textDocument.completion.completionItem = {
-- 	documentationFormat = { "markdown", "plaintext", "c" },
-- 	snippetSupport = true,
-- 	preselectSupport = true,
-- 	insertReplaceSupport = true,
-- 	labelDetailsSupport = true,
-- 	deprecatedSupport = true,
-- 	commitCharactersSupport = true,
-- 	tagSupport = { valueSet = { 1 } },
-- 	resolveSupport = {
-- 		properties = {
-- 			"documentation",
-- 			"detail",
-- 			"additionalTextEdits",
-- 		},
-- 	},
-- }

-- vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#e1e2e7]])
-- vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=blue7 guibg=#e1e2e7]])

-- local border = {
-- 	{ "╭", "FloatBorder" },
-- 	{ "─", "FloatBorder" },
-- 	{ "╮", "FloatBorder" },
-- 	{ "│", "FloatBorder" },
-- 	{ "╯", "FloatBorder" },
-- 	{ "─", "FloatBorder" },
-- 	{ "╰", "FloatBorder" },
-- 	{ "│", "FloatBorder" },
-- }
local border = {
  "╭",
  "─",
  "╮",
  "│",
  "╯",
  "─",
  "╰",
  "│",
}

-- local border = {
-- 	{ "🭽", "FloatBorder" },
-- 	{ "▔", "FloatBorder" },
-- 	{ "🭾", "FloatBorder" },
-- 	{ "▕", "FloatBorder" },
-- 	{ "🭿", "FloatBorder" },
-- 	{ "▁", "FloatBorder" },
-- 	{ "🭼", "FloatBorder" },
-- 	{ "▏", "FloatBorder" },
-- }
-- local border = {
-- }
-- local border = {
-- 	 "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" ,
-- }
-- LSP settings (for overriding per client)
-- local handlers = {
-- 	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
-- 	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
-- }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

-- To instead override globally
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
-- 	opts = opts or {}
-- 	opts.border = opts.border or border
-- 	return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

-- Do not forget to use the on_attach function
require("lspconfig").lua_ls.setup({
  -- on_attach = M.on_attach,
  -- capabilities = M.capabilities,
  -- -- handlers = handlers,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
  -- 		workspace = {
  -- 			library = {
  -- 				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
  -- 				[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
  -- 				[vim.fn.stdpath("data") .. "/lazy/extensions/nvchad_types"] = true,
  -- 				[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
  -- 			},
  -- 			maxPreload = 100000,
  -- 			preloadFileSize = 10000,
  -- 		},
  -- 	},
  -- },
})

require("lspconfig").clangd.setup({
  -- on_attach = M.on_attach,
  -- -- handlers = handlers,
  -- capabilities = M.capabilities,
})

require("lspconfig").pyright.setup({
  -- on_attach = M.on_attach,
  -- -- handlers = handlers,
  -- capabilities = M.capabilities,
})

require("lspconfig").gopls.setup({
  -- on_attach = M.on_attach,
  -- handlers = handlers,
  -- capabilities = M.capabilities,
})

return M
