# 🚀 Getting Started with vim.pack.add()

Your nvim-ai-openrouter plugin is now ready to use with Neovim's native package management!

## 📋 Quick Reference

### The Easiest Way (Copy-Paste)

```lua
-- In your init.lua (Neovim 0.10+)
vim.pack.add('https://github.com/0xinuarashi/nvim-ai-openrouter')

-- In your shell
export OPENROUTER_API_KEY="your-api-key"
```

Then:
```vim
:AI
```

That's it! You're done.

---

## 📚 Installation Methods

### Method 1: vim.pack.add() (NEW - Recommended)

```lua
-- init.lua
vim.pack.add('https://github.com/0xinuarashi/nvim-ai-openrouter')
vim.g.ai_openrouter_api_key = vim.env.OPENROUTER_API_KEY
```

**Requires**: Neovim 0.10+

### Method 2: Traditional require() (Still Works)

```lua
-- init.lua
require('ai_openrouter')
vim.g.ai_openrouter_api_key = vim.env.OPENROUTER_API_KEY
```

**Works with**: All Neovim versions 0.7+

### Method 3: Package Managers (Still Works)

```lua
-- packer.nvim
use '0xinuarashi/nvim-ai-openrouter'

-- lazy.nvim
{ '0xinuarashi/nvim-ai-openrouter' }
```

---

## ⚙️ Configuration

### Minimal (Uses Environment Variable)

```bash
export OPENROUTER_API_KEY="sk-..."
```

```lua
vim.pack.add('https://github.com/0xinuarashi/nvim-ai-openrouter')
```

### With Neovim Config

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

### All Options

```lua
-- API Key (Required)
vim.g.ai_openrouter_api_key = 'sk-...'

-- Model (Optional, default: 'openrouter/auto')
vim.g.ai_openrouter_model = 'openai/gpt-4'
-- Other options: 'openai/gpt-4-turbo', 'anthropic/claude-2', etc.

-- Temperature (Optional, default: 0.7)
-- Range: 0.0 (deterministic) to 1.0+ (creative)
vim.g.ai_openrouter_temperature = 0.7
```

---

## 🎮 Usage

### Commands

```vim
:AI              " Open AI chat
:AIClear         " Clear conversation history
```

### Keybindings (in Chat Window)

| Key | Mode | Action |
|-----|------|--------|
| `<C-CR>` | Insert | Send message |
| `<CR>` | Normal | Send message |
| `<C-c>` | Insert | Close chat |
| `q` | Normal | Close chat |

### Example Session

```
:AI              → Opens floating window
Type: "Hello"    → Type your message
<C-CR>           → Send message
(AI responds)    → Chat updates
```

---

## 🔧 Troubleshooting

### Error: "OPENROUTER_API_KEY not set"

**Solution 1**: Set environment variable
```bash
export OPENROUTER_API_KEY="your-key"
nvim
```

**Solution 2**: Set in config
```lua
vim.g.ai_openrouter_api_key = 'your-key'
```

### Error: ":AI command not found"

**Check 1**: Verify Neovim version (0.7+ required)
```vim
:version
```

**Check 2**: Verify plugin loaded
```vim
:checkhealth
```

**Check 3**: Check for errors
```vim
:messages
```

### API Errors (401, 403, etc.)

- Verify your API key is valid at https://openrouter.ai
- Check that your account has credits
- Verify internet connectivity

---

## 📁 What's New

### New Features
- ✨ Native Neovim package management support
- ✨ Faster command execution (no luaeval())
- ✨ Better organized module structure

### New Files
- `nvim.json` - Package metadata
- `lua/ai_router/init.lua` - Module entry point
- `lua/ai_router/core.lua` - Core logic
- Documentation files (guides and examples)

### Backward Compatible
- ✅ All old methods still work
- ✅ All package managers supported
- ✅ No breaking changes

---

## 🎓 Learn More

### Quick Guides
- **README.md** - Basic usage and setup
- **init_examples.lua** - Configuration examples
- **NATIVE_PACKAGES.md** - vim.pack.add() details

### Deep Dives
- **PROJECT_SUMMARY.md** - Architecture and features
- **DEVELOPMENT.md** - Developer documentation
- **MIGRATION.md** - What changed and why

---

## 🌟 Common Configurations

### GPT-4 Setup

```lua
vim.pack.add({
    'https://github.com/0xinuarashi/nvim-ai-openrouter',
    config = function()
        vim.g.ai_openrouter_api_key = vim.env.OPENROUTER_API_KEY
        vim.g.ai_openrouter_model = 'openai/gpt-4'
        vim.g.ai_openrouter_temperature = 0.5
    end
})
```

### Claude 2 Setup

```lua
vim.pack.add({
    'https://github.com/0xinuarashi/nvim-ai-openrouter',
    config = function()
        vim.g.ai_openrouter_api_key = vim.env.OPENROUTER_API_KEY
        vim.g.ai_openrouter_model = 'anthropic/claude-2'
        vim.g.ai_openrouter_temperature = 0.7
    end
})
```

### With Custom Keybinding

```lua
vim.pack.add('https://github.com/0xinuarashi/nvim-ai-openrouter')
vim.keymap.set('n', '<leader>ai', ':AI<CR>', { noremap = true })
```

---

## 🚀 Tips & Tricks

### Tip 1: Set API Key Securely

```bash
# In ~/.bashrc or ~/.zshrc
export OPENROUTER_API_KEY="sk-..."
```

Then just use environment variable - never hardcode in config!

### Tip 2: Multiple Models

You can switch models by setting:
```vim
:set g:ai_openrouter_model=openai/gpt-4
:AI
```

### Tip 3: Saving Conversations

Copy the chat window text and paste into a file:
```vim
" Inside chat window
gg              " Go to top
V               " Select all
"+y             " Copy to clipboard
```

---

## 📞 Support

### Documentation
1. Check `README.md` for basic help
2. Check `init_examples.lua` for configuration patterns
3. Check `NATIVE_PACKAGES.md` for vim.pack.add() details

### OpenRouter API
- Website: https://openrouter.ai
- Docs: https://openrouter.ai/docs
- Get API Key: https://openrouter.ai/keys

---

## ✨ What Makes This Plugin Great

1. **Minimal** - No bloat, just what you need
2. **Practical** - Clean UI, works great
3. **Modern** - Uses native Neovim APIs
4. **Flexible** - Multiple models available
5. **Open** - MIT licensed, fully open source

---

**Ready to chat with AI in Neovim?** 

Run `:AI` and start typing! 🚀
