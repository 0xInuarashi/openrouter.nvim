-- Complete Neovim Configuration Example
-- Shows all the different ways to load and configure nvim-ai-openrouter

-- =============================================================================
-- METHOD 1: Native Neovim Package Management (Recommended for 0.10+)
-- =============================================================================

-- Minimal setup with environment variable
vim.pack.add('https://github.com/0xinuarashi/nvim-ai-openrouter')

-- OR with full configuration
-- vim.pack.add({
--     'https://github.com/0xinuarashi/nvim-ai-openrouter',
--     config = function()
--         vim.g.ai_openrouter_api_key = vim.env.OPENROUTER_API_KEY
--         vim.g.ai_openrouter_model = 'openrouter/auto'
--         vim.g.ai_openrouter_temperature = 0.7
--     end
-- })

-- =============================================================================
-- METHOD 2: Traditional Package Managers (Alternative)
-- =============================================================================

-- Uncomment ONE of these if you're not using native packages:

-- packer.nvim
-- require('packer').startup(function(use)
--     use '0xinuarashi/nvim-ai-openrouter'
-- end)

-- lazy.nvim
-- require('lazy').setup({
--     { '0xinuarashi/nvim-ai-openrouter' }
-- })

-- vim-plug (in init.vim)
-- Plug '0xinuarashi/nvim-ai-openrouter'

-- =============================================================================
-- METHOD 3: Manual Lua Require (Simple)
-- =============================================================================

-- require('ai_openrouter')

-- =============================================================================
-- CONFIGURATION OPTIONS
-- =============================================================================

-- Set API key from environment
vim.g.ai_openrouter_api_key = vim.env.OPENROUTER_API_KEY or ''

-- Configure the model to use
-- Defaults: 'openrouter/auto', 'openai/gpt-4', 'anthropic/claude-2', etc.
vim.g.ai_openrouter_model = 'openrouter/auto'

-- Configure temperature (creativity)
-- Range: 0.0 (deterministic) to 1.0+ (creative)
vim.g.ai_openrouter_temperature = 0.7

-- =============================================================================
-- BASIC EDITOR SETTINGS
-- =============================================================================

vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- =============================================================================
-- USAGE
-- =============================================================================

-- After configuration, use these commands:
--
-- :AI              - Open the AI chat window
-- :AIClear         - Clear the chat history
--
-- In the chat window:
-- <C-CR> (insert)  - Send message
-- <CR> (normal)    - Send message
-- <C-c> (insert)   - Close chat
-- q (normal)       - Close chat

-- =============================================================================
-- ADVANCED: Multiple Plugins with vim.pack.add()
-- =============================================================================

-- vim.pack.add('https://github.com/nvim-lua/plenary.nvim')
-- vim.pack.add('https://github.com/neovim/nvim-lspconfig')
-- vim.pack.add({
--     'https://github.com/0xinuarashi/nvim-ai-openrouter',
--     config = function()
--         vim.g.ai_openrouter_api_key = vim.env.OPENROUTER_API_KEY
--     end
-- })

-- =============================================================================
-- KEYMAPS: Optional Custom Keybindings
-- =============================================================================

-- vim.keymap.set('n', '<leader>ai', ':AI<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>ac', ':AIClear<CR>', { noremap = true, silent = true })

-- =============================================================================
-- TROUBLESHOOTING
-- =============================================================================

-- If you get "OPENROUTER_API_KEY not set":
-- 1. Set the environment variable: export OPENROUTER_API_KEY="your-key"
-- 2. Or set it in this config: vim.g.ai_openrouter_api_key = "your-key"
--
-- Get an API key at: https://openrouter.ai/
--
-- If :AI command is not available:
-- 1. Check that plugin loaded: :checkhealth
-- 2. Make sure you're using Neovim 0.7+ (0.10+ for vim.pack.add)
-- 3. Check for any Lua errors in :messages
