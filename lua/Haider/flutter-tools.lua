require('flutter-tools').setup {

flutter_path = "/var/lib/snapd/snap/bin/flutter",
  outline ={
    open_cmd = "50vnew",
    auto_open = false,
  },
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = true, -- highlight the background
      background_color = {r = 19, g = 17, b = 24}, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
  },
};
vim.cmd('command! -nargs=* Format DartFmt <args>')
