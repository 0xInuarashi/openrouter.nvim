local ok, ai = pcall(require, "ai_openrouter")
if not ok then
  return
end

vim.api.nvim_create_user_command("ai", function()
  ai.open_chat()
end, {})
