# 📚 Documentation Index

## Quick Navigation

### 🚀 Getting Started
1. **[QUICKSTART.md](QUICKSTART.md)** ⭐ START HERE
   - Installation steps
   - Quick usage examples
   - Common configurations
   - Troubleshooting tips

### 📖 Installation & Setup
2. **[README.md](README.md)**
   - Basic overview
   - Installation methods
   - Command reference
   - Configuration options

3. **[init_examples.lua](init_examples.lua)**
   - Multiple installation methods
   - Configuration patterns
   - Complete examples

### 🔧 Advanced Topics
4. **[NATIVE_PACKAGES.md](NATIVE_PACKAGES.md)**
   - vim.pack.add() detailed guide
   - Module structure
   - Configuration priority
   - Advanced usage patterns

5. **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)**
   - Architecture overview
   - Feature list
   - Technical highlights
   - Future enhancements

### 📝 For Developers
6. **[DEVELOPMENT.md](DEVELOPMENT.md)**
   - Developer guide
   - Project structure
   - Extending the plugin
   - Contributing guidelines

7. **[MIGRATION.md](MIGRATION.md)**
   - What changed
   - Migration guide
   - Backward compatibility notes

### ✨ What's New
8. **[CHANGES.md](CHANGES.md)**
   - Summary of updates
   - New features
   - Files added/updated
   - Performance improvements

---

## Reading Guide by Use Case

### "I just want to use it"
👉 Read: **QUICKSTART.md** → **README.md**

### "I want to use vim.pack.add()"
👉 Read: **init_examples.lua** → **NATIVE_PACKAGES.md**

### "I want to understand the architecture"
👉 Read: **PROJECT_SUMMARY.md** → **DEVELOPMENT.md**

### "I want to extend/modify it"
👉 Read: **DEVELOPMENT.md** → **NATIVE_PACKAGES.md**

### "I'm migrating from the old version"
👉 Read: **MIGRATION.md** → **CHANGES.md**

---

## File Directory

```
nvim-ai-openrouter/
├── 📖 QUICKSTART.md           ← Start here!
├── 📖 README.md               ← Main documentation
├── 📖 NATIVE_PACKAGES.md      ← vim.pack.add() guide
├── 📖 PROJECT_SUMMARY.md      ← Architecture overview
├── 📖 DEVELOPMENT.md          ← Developer guide
├── 📖 MIGRATION.md            ← What changed
├── 📖 CHANGES.md              ← Update summary
├── 📖 init_examples.lua       ← Configuration examples
│
├── 🔧 nvim.json              ← Package metadata
├── 🔧 plugin/ai_router.vim   ← Plugin entry point
└── 🔧 lua/ai_router/
    ├── init.lua              ← Module entry
    └── core.lua              ← Main logic
```

---

## Quick Reference

### Installation (Pick One)

**Native (Neovim 0.10+):**
```lua
vim.pack.add('https://github.com/0xinuarashi/nvim-ai-openrouter')
```

**Traditional:**
```lua
require('ai_openrouter')
```

### Setup
```bash
export OPENROUTER_API_KEY="your-key"
```

### Usage
```vim
:AI              " Open chat
:AIClear         " Clear history
```

### In Chat
- `<C-CR>` (insert) - Send
- `<CR>` (normal) - Send  
- `<C-c>` (insert) - Close
- `q` (normal) - Close

---

## Documentation Stats

| Document | Pages | Topic |
|----------|-------|-------|
| QUICKSTART.md | 5 | Getting started |
| README.md | 3 | Basic usage |
| init_examples.lua | 4 | Configuration |
| NATIVE_PACKAGES.md | 5 | Native packages |
| PROJECT_SUMMARY.md | 5 | Architecture |
| DEVELOPMENT.md | 3 | Development |
| MIGRATION.md | 3 | Migration guide |
| CHANGES.md | 4 | Update summary |

---

## Key Concepts

### vim.pack.add()
Neovim's native package management system (0.10+). Allows declaring plugins directly in your config without external tools.

### OpenRouter
API service providing access to 100+ AI models (GPT-4, Claude, Llama, etc.) with a single interface.

### Module Structure
Plugin code organized in `lua/ai_router/` with separate modules for easy extension and maintenance.

### Backward Compatibility
All installation methods (vim.pack.add, require, package managers) work seamlessly.

---

## Support Resources

- **OpenRouter Docs**: https://openrouter.ai/docs
- **Neovim Docs**: https://neovim.io/doc/
- **Plugin Repo**: https://github.com/0xinuarashi/nvim-ai-openrouter

---

## Troubleshooting Quick Links

- **Plugin won't load** → See QUICKSTART.md "Troubleshooting"
- **API errors** → See NATIVE_PACKAGES.md "Troubleshooting"
- **Configuration issues** → See init_examples.lua
- **Want to modify** → See DEVELOPMENT.md "Extending"

---

## Status: ✅ Complete & Ready

All features implemented. Documentation complete. Ready for production use.

Start with **QUICKSTART.md** for the fastest way to get running!
