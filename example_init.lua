vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Load the plugin
require('ai_router')

-- Set your API key (or use environment variable)
-- vim.g.ai_router_api_key = 'your-key-here'

-- Optional: Configure model and temperature
-- vim.g.ai_router_model = 'openrouter/auto'
-- vim.g.ai_router_temperature = 0.7
