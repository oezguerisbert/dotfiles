"Notes:
"This is the neovim configuration of 'Özgür Isbert'.
"I will be updating this file on my behalf
"and add/remove certain tools/plugins/setups
"
"Have fun with my neovim config!
  "Global Setup
  set number
  "Plugins
    call plug#begin()
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'codota/tabnine-vim'
    Plug 'jaredgorski/spacecamp'
    call plug#end()
  "Keybinds
    let mapleader=" "
    "Global keybinds
      noremap <up> <nop>
      noremap <down> <nop>
      noremap <left> <nop>
      noremap <right> <nop>
      nnoremap <SPACE> <nop>

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
  "ColorScheme
  colorscheme spacecamp
