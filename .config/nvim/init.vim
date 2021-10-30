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
    Plug 'voldikss/vim-floaterm'
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'wakatime/vim-wakatime'
    Plug 'junegunn/goyo.vim'
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


  "GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  "Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

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
  set number relativenumber
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


  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
  
  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)
  
  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)
