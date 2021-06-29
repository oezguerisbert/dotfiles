  "Telescope
    call plug#begin()
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    call plug#end()
  "Keybinds
    "Global keybinds
      noremap <up> <nop>
      noremap <down> <nop>
      noremap <left> <nop>
      noremap <right> <nop>
      
      inoremap <up> <nop>
      inoremap <down> <nop>
      inoremap <left> <nop>
      inoremap <right> <nop>

      inoremap jk <esc>
    "Telescope keybinds
      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>
