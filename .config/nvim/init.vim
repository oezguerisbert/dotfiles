"Notes:
"This is the neovim configuration of 'Özgür Isbert'.
"I will be updating this file on my behalf
"and add/remove certain tools/plugins/setups
"
"Have fun with my neovim config!
  "Global Setup
  set number
  set mouse=a
  set number relativenumber
  set clipboard=unnamedplus
  set nobackup
  set nowritebackup
  set noswapfile

  "Plugins
    call plug#begin()
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'neovim/nvim-lspconfig'
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
    Plug 'voldikss/vim-floaterm'
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'wakatime/vim-wakatime'
    Plug 'junegunn/goyo.vim'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'nvim-telescope/telescope-file-browser.nvim'
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
        "Floaterm keybinds
      nnoremap <leader>ft <cmd>FloatermNew --autoclose=1 --autohide=1<cr>
      nnoremap <leader>ftp <cmd>FloatermPrev<cr>
      nnoremap <leader>ftn <cmd>FloatermNext<cr>
    "Goyo keybinds
      nnoremap <leader>g <cmd>Goyo<cr>

  "ColorScheme
  set termguicolors

  let g:tokyonight_style = 'night' " available: night, storm
  let g:tokyonight_enable_italic = 1

  colorscheme tokyonight

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  "set number relativenumber
  set noshowcmd
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
  
lua require("oezguerisbert") 
