-- ================================================================================================
-- TITLE : auto-commands
-- ABOUT : automatically run code on defined events (e.g. save, yank)
-- ================================================================================================

-- Restore last cursor position when reopening a file
local last_cursor_group = vim.api.nvim_create_augroup("LastCursorGroup", {})
vim.api.nvim_create_autocmd("BufReadPost", {
  group = last_cursor_group,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Highlight the yanked text for 200ms
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_yank_group,
  pattern = "*",
  callback = function()
    vim.hl.on_yank({
      higroup = "IncSearch",
      timeout = 200,
    })
  end,
})


vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if ft == "javascript" or ft == "typescript" or ft == "javascriptreact" or ft == "typescriptreact" then
      vim.lsp.buf.format({ name = "ts_ls", async = false })
    else
      vim.lsp.buf.format({ async = false }) -- mặc định cho các ngôn ngữ khác

      if ft == "cs" or ft == "csharp" or ft == "c_sharp" then
        vim.lsp.buf.format({ name = "roslyn" })
      end
    end
  end,
})
-- Lint code khi save hoặc khi rời Insert mode
vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
