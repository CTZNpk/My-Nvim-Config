local colorscheme = "tokyonight"

local status_ok, err = vim.cmd("autocmd VimEnter * colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("Failed to set colorscheme " .. colorscheme .. ": " .. err)
    return
end

