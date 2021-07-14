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
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'codota/tabnine-vim'
    Plug 'sindrets/diffview.nvim'
    Plug 'jaredgorski/spacecamp'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'prettier/vim-prettier', { 'do': 'pnpm i' }
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'jparise/vim-graphql'
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
    "Telescope settings
lua << EOF
    require("telescope").setup {
      defaults = {
        file_ignore_patterns = {
          "node_modules/.*",
          ".git/.*"
        }
      }
    }
EOF
    "Telescope keybinds
      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    "Tabination-Keybind
      nnoremap <leader>nt <cmd>tabn<cr>
      nnoremap <leader>pt <cmd>tabp<cr>
      nnoremap <leader>tn <cmd>tabnew .<cr>
    "Highlighting-Keybinds
      nnoremap <F3> :set hlsearch!<CR>
    "Coc-Keybinds
      nnoremap <leader>toi <cmd>CocCommand tsserver.organizeImports<cr>
  "ColorScheme
  set background=dark
  colorscheme palenight
