# Development

## Project Structure

```
nvim-ai-router/
├── plugin/
│   └── ai_router.vim          # Plugin entry point and commands
├── lua/
│   └── ai_router.lua          # Main plugin logic
├── README.md                  # User documentation
├── package.json               # Plugin metadata
├── LICENSE                    # MIT License
├── example_init.lua          # Example configuration
└── DEVELOPMENT.md            # This file
```

## Architecture

### Main Components

1. **Plugin Entry Point** (`plugin/ai_router.vim`)
   - Defines `:AI` and `:AIClear` commands
   - Sets up global configuration variables

2. **Main Module** (`lua/ai_router.lua`)
   - Manages chat state and history
   - Handles API communication with OpenRouter
   - Creates and manages UI windows
   - Handles user input and message sending

### State Management

The plugin maintains state in `M.state`:
- `chat_history`: Array of messages with role and content
- `window_id`: Main chat display window
- `buffer_id`: Chat display buffer
- `input_buffer_id`: User input buffer
- `input_window_id`: User input window

### API Integration

Uses OpenRouter API via curl:
- Base URL: `https://openrouter.ai/api/v1`
- Endpoint: `/chat/completions`
- Authentication: Bearer token in Authorization header
- Format: JSON request/response

## Extending the Plugin

### Adding New Commands

Edit `plugin/ai_router.vim`:

```vim
command! AICommand call luaeval('require("ai_router").function_name()')
```

Then add the function in `lua/ai_router.lua`:

```lua
function M.function_name()
    -- Implementation
end
```

### Customizing UI

The UI is created in the `create_windows()` function. Modify:
- `window_width` and `window_height` for window sizes
- Border style (currently `'rounded'`)
- Chat message formatting in `update_chat_display()`

### Adding Model Support

The plugin works with any model available on OpenRouter. Just set:

```lua
vim.g.ai_router_model = 'model-name'
```

See [OpenRouter documentation](https://openrouter.ai/docs) for available models.

## Testing

To test the plugin:

1. Set your API key:
   ```bash
   export OPENROUTER_API_KEY="your-key"
   ```

2. Start Neovim with the plugin loaded:
   ```bash
   nvim --cmd "set rtp+=$(pwd)" -u example_init.lua
   ```

3. Run `:AI` to open the chat window

4. Type a message and press `<C-CR>` to send

## Troubleshooting

### "Error: OPENROUTER_API_KEY not set"
- Set the environment variable: `export OPENROUTER_API_KEY="..."`
- Or set it in your Neovim config: `vim.g.ai_router_api_key = '...'`

### API returns error
- Check your API key is valid
- Check your OpenRouter account has credits
- Look at the error message in the chat window

### Messages not being sent
- Make sure you're in insert mode in the input window
- Use `<C-CR>` or `<CR>` to send

## Contributing

Contributions welcome! Areas for improvement:
- Async API calls (non-blocking)
- Better error handling and recovery
- Configuration options for UI styling
- Syntax highlighting for code in responses
- Streaming responses
- Export/save conversations
