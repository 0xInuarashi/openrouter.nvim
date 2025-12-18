" AI OpenRouter Plugin
" A Neovim plugin for conversational AI chat using OpenRouter
" Supports vim.pack.add() native package management

if exists('g:loaded_ai_openrouter')
    finish
endif
let g:loaded_ai_openrouter = 1

" Set default configuration
let g:ai_openrouter_api_key = get(g:, 'ai_openrouter_api_key', '')
let g:ai_openrouter_model = get(g:, 'ai_openrouter_model', 'openrouter/auto')
let g:ai_openrouter_temperature = get(g:, 'ai_openrouter_temperature', 0.7)

" Command to open AI chat
command! AI lua require('ai_openrouter').open_chat()
command! AIClear lua require('ai_openrouter').clear_history()
