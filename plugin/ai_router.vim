" AI Router Plugin
" A Neovim plugin for conversational AI chat using OpenRouter

if exists('g:loaded_ai_router')
    finish
endif
let g:loaded_ai_router = 1

" Set default configuration
let g:ai_router_api_key = get(g:, 'ai_router_api_key', '')
let g:ai_router_model = get(g:, 'ai_router_model', 'openrouter/auto')
let g:ai_router_temperature = get(g:, 'ai_router_temperature', 0.7)

" Command to open AI chat
command! AI call luaeval('require("ai_router").open_chat()')
command! AIClear call luaeval('require("ai_router").clear_history()')
