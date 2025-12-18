# Migration Guide: vim.pack.add() Support

This document explains how the plugin now supports Neovim's native `vim.pack.add()` function.

## What Changed

### 1. New File: nvim.json
- Added `nvim.json` metadata file that vim.pack.add() uses to identify and configure the plugin
- Contains plugin name, version, description, and other metadata

### 2. Updated Lua Module Structure
```
Before:
lua/ai_router.lua

After:
lua/ai_router/
├── init.lua        # Entry point
└── core.lua        # Main logic
```

### 3. Updated Plugin Entry Point
`plugin/ai_router.vim` now uses direct Lua commands instead of `luaeval()`:
```vim
lua require('ai_router.init')
command! AI lua require('ai_openrouter').open_chat()
```

### 4. Updated Commands
- Both `:AI` and `:AIClear` now use Lua directly
- No change to user-facing behavior

## For Users: How to Use

### Option 1: With vim.pack.add() (Recommended for Neovim 0.10+)

```lua
-- init.lua
vim.pack.add('https://github.com/0xinuarashi/nvim-ai-openrouter')
vim.g.ai_openrouter_api_key = vim.env.OPENROUTER_API_KEY
```

### Option 2: Traditional Way (Still Works)

```lua
-- init.lua
require('ai_openrouter')
vim.g.ai_openrouter_api_key = vim.env.OPENROUTER_API_KEY
```

Both methods work identically from the user's perspective.

## For Plugin Developers: Extending the Plugin

The new structure makes it easier to organize additional modules:

```lua
-- lua/ai_router/init.lua - Entry point, re-exports core
local M = require('ai_router.core')
return M

-- lua/ai_router/core.lua - Main logic
local M = {}
-- ... implementation

-- lua/ai_router/utils.lua - Can add utilities
local M = {}
-- ... utilities

-- lua/ai_router/ui.lua - Can separate UI logic
local M = {}
-- ... UI code
```

Access them in commands:
```vim
command! AI lua require('ai_router.ui').open_chat()
```

## Backward Compatibility

✅ **Fully backward compatible**

- Existing configurations continue to work
- All plugin managers still supported (packer.nvim, vim-plug, lazy.nvim)
- No breaking changes to the API
- Old `luaeval()` calls replaced with direct Lua for better performance

## Testing

To verify the migration:

1. **With vim.pack.add():**
   ```bash
   nvim --version  # Should be 0.10+
   ```
   
   ```lua
   -- init.lua
   vim.pack.add('https://github.com/0xinuarashi/nvim-ai-openrouter')
   vim.g.ai_openrouter_api_key = 'test-key'
   ```

2. **Traditional way:**
   ```lua
   -- init.lua
   require('ai_openrouter')
   ```

3. Both should show `:AI` as an available command

## Files Modified

- ✏️ `plugin/ai_router.vim` - Updated to use Lua directly
- ✏️ `example_init.lua` - Added vim.pack.add() examples
- ✏️ `README.md` - Updated installation section
- ✨ `nvim.json` - New metadata file
- 📁 `lua/ai_router/` - New folder structure
- ✨ `lua/ai_router/init.lua` - New entry point
- ✨ `lua/ai_router/core.lua` - New core module
- 📄 `NATIVE_PACKAGES.md` - New guide document

## Performance Improvements

- Removed `luaeval()` calls → faster command execution
- Direct Lua execution is more efficient
- Keymaps use direct Lua functions

## Next Steps

- Update your Neovim config to use the method that works best for you
- Read `NATIVE_PACKAGES.md` for advanced usage
- Check `example_init.lua` for configuration examples

## Questions?

Refer to:
1. `NATIVE_PACKAGES.md` - Native package management guide
2. `DEVELOPMENT.md` - Developer documentation
3. `README.md` - User documentation
