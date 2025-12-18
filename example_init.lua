-- Example Neovim Configuration for nvim-ai-openrouter
-- This demonstrates loading the plugin with vim.pack.add()

vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Method 1: Using vim.pack.add() (Recommended for Neovim 0.10+)
-- ============================================================
-- vim.pack.add({
--     'https://github.com/0xinuarashi/nvim-ai-openrouter',
--     config = function()
--         -- Set your API key (or use environment variable)
--         -- vim.g.ai_openrouter_api_key = 'your-key-here'
--
--         -- Optional: Configure model and temperature
--         -- vim.g.ai_openrouter_model = 'openrouter/auto'
--         -- vim.g.ai_openrouter_temperature = 0.7
--     end
-- })

-- Method 2: Using require() directly
-- ====================================
require('ai_openrouter')

-- Set your API key (or use environment variable)
-- vim.g.ai_openrouter_api_key = 'your-key-here'

-- Optional: Configure model and temperature
-- vim.g.ai_openrouter_model = 'openrouter/auto'
-- vim.g.ai_openrouter_temperature = 0.7

-- Usage:
-- :AI           - Open the AI chat window
-- :AIClear      - Clear chat history
