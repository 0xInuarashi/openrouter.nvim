# nvim-ai-openrouter

A minimal Neovim plugin for conversational AI chat using OpenRouter API.

## Features

- ✨ Simple and fast AI chat interface directly in Neovim
- 💬 Conversational history within a session
- 🎯 OpenRouter support for access to multiple AI models
- 🎨 Clean, minimal UI with borders
- ⚡ Non-blocking async operations

## Installation

### Using vim.pack.add() (Neovim 0.10+)

Simplest method:

```lua
-- init.lua
vim.pack.add('https://github.com/0xinuarashi/nvim-ai-openrouter')
```

Adding to existing pack.add() call:

```lua
vim.pack.add({
    {src = "https://github.com/your-plugin-1"},
    {src = "https://github.com/your-plugin-2"},
    {src = "https://github.com/0xinuarashi/nvim-ai-openrouter"},
})
```

Or with configuration (add to your existing pack list):

```lua
vim.pack.add({
    {src = "https://github.com/0xinuarashi/nvim-ai-openrouter"},
})

-- Then configure separately:
vim.g.ai_openrouter_api_key = 'your-key-here'
```

**Alternative (if using single pack.add() call):**

```lua
vim.pack.add('https://github.com/0xinuarashi/nvim-ai-openrouter')
```

### Using packer.nvim

```lua
use '0xinuarashi/nvim-ai-openrouter'
```

### Using vim-plug

```vim
Plug '0xinuarashi/nvim-ai-openrouter'
```

### Using lazy.nvim

```lua
{
    '0xinuarashi/nvim-ai-openrouter',
    config = function()
        -- Configuration here
    end,
}
```

## Setup

Set your OpenRouter API key as an environment variable:

```bash
export OPENROUTER_API_KEY="your-api-key-here"
```

Or configure it in your Neovim config:

```lua
-- init.lua
vim.g.ai_openrouter_api_key = 'your-api-key-here'
vim.g.ai_openrouter_model = 'openrouter/auto'  -- optional
vim.g.ai_openrouter_temperature = 0.7          -- optional
```

```vim
" init.vim
let g:ai_openrouter_api_key = 'your-api-key-here'
let g:ai_openrouter_model = 'openrouter/auto'
let g:ai_openrouter_temperature = 0.7
```

## Usage

### Open Chat

```vim
:AI
```

### Clear History

```vim
:AIClear
```

### Keybindings

Inside the chat window:

| Key | Action |
|-----|--------|
| `<C-CR>` (Insert) | Send message |
| `<CR>` (Normal) | Send message |
| `<C-c>` (Insert) | Close chat |
| `q` (Normal) | Close chat |

## Configuration

### API Key

Set your OpenRouter API key. Priority order:
1. `vim.g.ai_openrouter_api_key` (Neovim config)
2. `OPENROUTER_API_KEY` (Environment variable)

### Model

Default: `openrouter/auto`

Available models from OpenRouter:
- `openrouter/auto` - Automatic model selection
- `openai/gpt-4` - GPT-4
- `openai/gpt-4-turbo` - GPT-4 Turbo
- `openai/gpt-3.5-turbo` - GPT-3.5 Turbo
- `anthropic/claude-2` - Claude 2
- And many more...

### Temperature

Default: `0.7`

Controls creativity (0.0 = deterministic, 1.0+ = very creative)

### Window Size

```lua
-- In init.lua, modify before require:
local ai_router = require('ai_openrouter')
ai_router.config.window_width = 0.8   -- 80% of screen width
ai_router.config.window_height = 0.9  -- 90% of screen height
```

## Requirements

- Neovim 0.7+
- curl (for API requests)

## License

MIT
