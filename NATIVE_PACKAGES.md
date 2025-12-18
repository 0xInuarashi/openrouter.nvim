# Native Neovim Package Management

This plugin supports Neovim's native `vim.pack.add()` function for managing plugins directly without external package managers.

## What is vim.pack.add()?

`vim.pack.add()` is a native Neovim API (available in 0.10+) that allows you to manage plugins declaratively without requiring external tools like packer.nvim or vim-plug.

The plugin metadata is stored in `nvim.json` which defines the plugin name, description, version, and other information used by the package manager.

## Installation Methods

### Simple Installation

```lua
-- init.lua
vim.pack.add('https://github.com/0xinuarashi/nvim-ai-openrouter')
```

### With Configuration

```lua
vim.pack.add({
    'https://github.com/0xinuarashi/nvim-ai-openrouter',
    config = function()
        -- Plugin configuration
        vim.g.ai_openrouter_api_key = 'your-api-key'
        vim.g.ai_openrouter_model = 'openrouter/auto'
    end
})
```

### With Dependencies and Build

```lua
vim.pack.add({
    'https://github.com/0xinuarashi/nvim-ai-openrouter',
    config = function()
        vim.g.ai_openrouter_api_key = vim.env.OPENROUTER_API_KEY
    end,
    dependencies = {
        -- Other plugins if needed
    }
})
```

## Module Structure

The plugin is organized for both traditional and native package management:

```
lua/ai_router/
├── init.lua          # Package entry point
├── core.lua          # Main logic
└── ...               # Future modules
```

### How It Works

1. When the plugin is loaded, Neovim reads `nvim.json` for metadata
2. The `plugin/ai_router.vim` script is automatically loaded
3. It requires `lua/ai_router/init.lua` which re-exports the core module
4. The `:AI` and `:AIClear` commands become available

## Configuration Priority

When using `vim.pack.add()`, configuration can be set in multiple ways:

### Option 1: Environment Variable (Highest Priority)

```bash
export OPENROUTER_API_KEY="sk-..."
```

### Option 2: Neovim Config

```lua
vim.pack.add({
    'https://github.com/0xinuarashi/nvim-ai-openrouter',
    config = function()
        vim.g.ai_openrouter_api_key = 'sk-...'
        vim.g.ai_openrouter_model = 'openrouter/auto'
        vim.g.ai_openrouter_temperature = 0.7
    end
})
```

### Option 3: Global Variables (Last Resort)

```lua
-- Set before loading the plugin
vim.g.ai_openrouter_api_key = 'sk-...'
```

## Backward Compatibility

This plugin maintains full backward compatibility with traditional plugin managers:

- **packer.nvim**: `use '0xinuarashi/nvim-ai-openrouter'`
- **vim-plug**: `Plug '0xinuarashi/nvim-ai-openrouter'`
- **lazy.nvim**: `{ '0xinuarashi/nvim-ai-openrouter' }`
- **Manual require**: `require('ai_openrouter')`

## Plugin Metadata (nvim.json)

The `nvim.json` file contains metadata that native package management uses:

```json
{
  "name": "nvim-ai-openrouter",
  "description": "A minimal Neovim plugin for conversational AI chat using OpenRouter API",
  "version": "0.1.0",
  "author": "0xinuarashi",
  "license": "MIT",
  "spec": "1.0.0"
}
```

This allows Neovim's package manager to:
- Identify the plugin correctly
- Manage versions
- Provide plugin information
- Handle dependencies (future)

## Quick Start

### Minimal Setup

```lua
-- init.lua
vim.pack.add('https://github.com/0xinuarashi/nvim-ai-openrouter')
vim.g.ai_openrouter_api_key = vim.env.OPENROUTER_API_KEY
```

Then use:
```vim
:AI
```

### Full Setup

```lua
-- init.lua
vim.pack.add({
    'https://github.com/0xinuarashi/nvim-ai-openrouter',
    config = function()
        vim.g.ai_openrouter_api_key = vim.env.OPENROUTER_API_KEY or ''
        vim.g.ai_openrouter_model = 'openrouter/auto'
        vim.g.ai_openrouter_temperature = 0.7
    end,
})
```

## Troubleshooting

### Plugin not loading

Check that:
1. You're using Neovim 0.10+ (vim.pack.add() requires this)
2. The plugin URL is correct
3. The `nvim.json` file exists in the repository root
4. Your Neovim config is valid Lua

### Commands not available

Make sure the plugin loaded correctly:
```vim
:checkhealth
```

Look for any lua errors in the messages.

### API errors still appearing

Verify:
1. `OPENROUTER_API_KEY` environment variable is set
2. The API key is valid
3. You have credits on your OpenRouter account
4. You have internet connectivity

## Advanced Usage

### Lazy Loading

While vim.pack.add() doesn't have built-in lazy loading, you can achieve similar results:

```lua
vim.pack.add({
    'https://github.com/0xinuarashi/nvim-ai-openrouter',
    lazy = false, -- Load on startup
    config = function()
        vim.g.ai_openrouter_api_key = vim.env.OPENROUTER_API_KEY
    end
})
```

### Multiple Plugins

Manage all plugins declaratively:

```lua
vim.pack.add('https://github.com/nvim-lua/plenary.nvim')
vim.pack.add('https://github.com/0xinuarashi/nvim-ai-openrouter')
vim.pack.add('https://github.com/neovim/nvim-lspconfig')
```

## See Also

- [Neovim Package Management](https://neovim.io/doc/user/packages.html)
- [OpenRouter API Documentation](https://openrouter.ai/docs)
