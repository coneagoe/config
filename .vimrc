" environment specific {{{
let s:os = "linux"
if system('uname') == "CYGWIN_NT-6.1"
  let s:os = "cygwin"
endif

let s:hostname = system('hostname')

"let s:VIM_DIR = expand($HOME).'/.vim'
" }}}


" vim-plug {{{
    " Specify a directory for plugins
    " - For Neovim: ~/.local/share/nvim/plugged
    " - Avoid using standard Vim directory names like 'plugin'
    call plug#begin('~/.vim/plugged')

    " Make sure you use single quotes

    " Language Server Protocol{{{
"        Plug 'neoclide/coc.nvim', {'branch': 'release'}
"        Plug 'prabirshrestha/async.vim'
"        Plug 'prabirshrestha/vim-lsp'
"        Plug 'mattn/vim-lsp-settings'
    " }}}

    " autocomplete {{{
        Plug 'ervandew/supertab'
        Plug 'tpope/vim-surround'
"        Plug 'prabirshrestha/asyncomplete.vim'
"        Plug 'prabirshrestha/asyncomplete-lsp.vim'
    " }}}

    " search {{{
        Plug 'yegappan/grep'
        Plug 'mileszs/ack.vim'
    " }}}

    " replace {{{
        Plug 'brooth/far.vim'
    " }}}

    " undo {{{
        Plug 'mbbill/undotree'
    " }}}

    " increment {{{
        Plug 'triglav/vim-visual-increment'
        Plug 'vim-scripts/VisIncr'
    " }}}

    " DrawIt {{{
        Plug 'vim-scripts/DrawIt'
    " }}}

    " Tabular {{{
        Plug 'godlygeek/tabular'
    " }}}

    " TaskList {{{
        Plug 'vim-scripts/TaskList.vim'
    " }}}

    " Diff {{{
        Plug 'will133/vim-dirdiff'
    " }}}

    " other {{{
        Plug 'vim-scripts/highlight.vim'
"        Plug 'lfv89/vim-interestingwords'
        Plug 'myusuf3/numbers.vim'

        " match parentheses in different colors
        Plug 'frazrepo/vim-rainbow'

        " show keybindings in popup
"        Plug 'liuchengxu/vim-which-key'
    " }}}

    " customized menu {{{
        Plug 'skywind3000/quickmenu.vim'
    " }}}

    " tags {{{
"        Plug 'ludovicchabant/vim-gutentags'
        Plug 'majutsushi/tagbar'
        Plug 'joe-skb7/cscope-maps'
        Plug 'lvht/tagbar-markdown'
    " }}}

    " align {{{
        Plug 'junegunn/vim-easy-align'
    " }}}

    " async {{{
        Plug 'skywind3000/asyncrun.vim'
    " }}}

    " make {{{
        Plug 'mh21/errormarker.vim'
    " }}}

    " VCS {{{
        Plug 'mhinz/vim-signify'

        " hg {{{
            Plug 'phleet/vim-mercenary'
            Plug 'ludovicchabant/vim-lawrencium'
        " }}}

        " git {{{
            Plug 'tpope/vim-fugitive'
        " }}}
    " }}}

    " location {{{
        Plug 'tpope/vim-unimpaired'

        Plug 'justinmk/vim-dirvish'

        " vim-easymotion {
            Plug 'easymotion/vim-easymotion'
            Plug 'haya14busa/incsearch.vim'
            Plug 'haya14busa/incsearch-easymotion.vim'
        " }

        " fzf {
            Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
            Plug 'junegunn/fzf.vim'
        " }
    " }}}

    " comments {{{
        Plug 'scrooloose/nerdcommenter'
    " }}}

    " status line {{{
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'bling/vim-bufferline'
    " }}}

    " colorscheme {{{
        Plug 'tomasr/molokai'
        Plug 'joshdick/onedark.vim'
        " Plug 'altercation/vim-colors-solarized'
    " }}}

    " session {{{
        Plug 'xolox/vim-misc'
        Plug 'xolox/vim-session'
    " }}}

    " language {{{
        Plug 'kana/vim-textobj-user'
        Plug 'kana/vim-textobj-indent'
        Plug 'kana/vim-textobj-syntax'
        Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim'] }
        Plug 'sgur/vim-textobj-parameter'

        " Plug 'Valloric/YouCompleteMe', { 'for':['c', 'cpp'] }

        Plug 'Shougo/echodoc.vim'

        " C++ {
            Plug 'octol/vim-cpp-enhanced-highlight', { 'for':['c', 'cpp'] }
            Plug 'WolfgangMehner/c-support', { 'for': ['c', 'cpp'] }
"            Plug 'vim-scripts/refactor', { 'for': ['c', 'cpp'] }
        " }

        " python {
            Plug 'python-mode/python-mode', { 'branch': 'develop', 'for': 'python' }
            Plug 'davidhalter/jedi-vim', { 'for': 'python' }
        " }

        " perl {
            Plug 'WolfgangMehner/perl-support', { 'for': 'perl' }
        " }

        " bash {
"            Plug 'WolfgangMehner/bash-support', { 'for': 'bash' }
            Plug 'WolfgangMehner/bash-support'
        " }

        " Doxygen {
            Plug 'mrtazz/DoxygenToolkit.vim'
        " }

        " Latex {
            Plug 'lervag/vimtex', { 'for': 'latex' }
            Plug 'WolfgangMehner/latex-support', { 'for': 'latex' }
        " }

        " lint {
            Plug 'vim-syntastic/syntastic', { 'for':['sh', 'c', 'cpp', 'perl', 'python'] }
"            Plug 'dense-analysis/ale', { 'for':['sh', 'c', 'cpp', 'perl', 'vim', 'latex', 'matlab'] }
        " }

        " HTML & CSS {
            Plug 'mattn/emmet-vim', { 'for':['html', 'css'] }
        " }

        " vim {
            Plug 'WolfgangMehner/vim-support', { 'for': 'vim' }
        " }

        " jinja {
            Plug 'Glench/Vim-Jinja2-Syntax'
        " }

        " markdown {
            Plug 'plasticboy/vim-markdown'
        " }

        " xml {
            Plug 'sukima/xmledit', { 'for': 'xml' }
        " }

        " risc-v assembly {
            Plug 'kylelaker/riscv.vim', { 'for': 'S' }
        " }
    " }}}

    " tmux {{{
        Plug 'christoomey/vim-tmux-navigator'
        Plug 'benmills/vimux'
    " }}}

    " kernel {{{
        Plug 'vivien/vim-linux-coding-style'
        Plug 'coneagoe/config_in'
    " }}}

    " hex {{{
        Plug 'rootkiter/vim-hexedit'
    " }}}

    " Initialize plugin system
    call plug#end()
" }}}


" Folder text {{{
    augroup ft_vim
        au!
        au FileType vim setlocal foldmethod=marker
    augroup END
" }}}


" General {{{
    set nocompatible
    " share clipboard between vim and system
    set clipboard+=unnamed
    " don't map key alt to menu
    set winaltkeys=no
    " show title in console title bar
    set title
    let g:rainbow_active = 1
" }}}


" GUI {{{
    " don't show tools bar
    set guioptions-=T
" }}}


" Editor {{{
"    if filereadable("home")
"    colorscheme onedark
    colorscheme molokai
"    else
"    colorscheme koehler
"    endif

    set cursorline
    hi CursorLine term=bold cterm=bold guibg=Grey40
    set textwidth=100

    " search {{{
        set hlsearch    " highlight searches
        set incsearch   " do inremental searching
    " }}}

    " Language & Encoding {{{
        set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
        set encoding=utf-8
        let $LANG = 'en_US.UTF-8'
    " }}}

    " indent {{{
        set autoindent
        set smartindent
        set cindent " do C-style indenting
    " }}}

    " tab {{{
        function Tab4()
            set tabstop=4 softtabstop=4 shiftwidth=4 smarttab expandtab
        endfunction

        function Tab2()
            set tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab
        endfunction

        if filereadable("home")
            call Tab4()
        else
            call Tab2()
        endif
    " }}}

    " auto remove trailing whitespace
    autocmd FileType c,cpp,python,perl autocmd BufWritePre <buffer> %s/\s\+$//e

    filetype plugin on
" }}}


" diff {{{
if &diff
    set diffopt+=iwhite
endif

function IwhiteToggle()
    if &diffopt =~ 'iwhite'
        set diffopt-=iwhite
    else
        set diffopt+=iwhite
    endif
endfunction

function IcaseToggle()
    if &diffopt =~ 'icase'
        set diffopt-=icase
    else
        set diffopt+=icase
    endif
endfunction

" }}}


" makefile
autocmd FileType make setlocal noexpandtab

" C++ {{{
au BufNewFile,BufRead *.impl set filetype=c++
" }}}


" tags {{{
set tags=./.tags;,.tags;,tags

" set project identification file for gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" use .tags instead of tags as tagfile so that it can be ignored in .gitignore
let g:gutentags_ctags_tagfile = '.tags'

" put all tags generated in ~/.cache/tags to avoid polluting project
"let s:vim_tags = expand('~/.cache/tags')
"let g:gutentags_cache_dir = s:vim_tags

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"if !isdirectory(s:vim_tags)
"   silent! call mkdir(s:vim_tags, 'p')
"endif
" }}}


" asyncrun {{{
" automatically open quickfix window when AsyncRun command is executed
" set the quickfix window 6 lines height.
let g:asyncrun_open = 6

" ring the bell to notify you job finished
let g:asyncrun_bell = 1

" F10 to toggle quickfix window
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
" }}}


" make {{{
    let g:asyncrun_auto = "make"
" }}}


" syntastic {{{
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let g:syntastic_c_config_file = '.syntastic_rc'
" }}}


" ale {{{
    let g:ale_sign_column_always = 1
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_insert_leave = 0
    let g:ale_lint_on_enter = 0

"    let g:ale_linters = {
"                \   'python': ['pylint'],
"                \}

"    let g:ale_linters_explicit = 1
"    let g:ale_completion_delay = 500
"    let g:ale_echo_delay = 20
"    let g:ale_lint_delay = 500
"    let g:ale_echo_msg_format = '[%linter%] %code: %%s'
"    let g:ale_lint_on_text_changed = 'normal'
"    let g:ale_lint_on_insert_leave = 1
"    let g:airline#extensions#ale#enabled = 1
"
"    let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
"    let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
"    let g:ale_c_cppcheck_options = ''
"    let g:ale_cpp_cppcheck_options = ''
"
"    let g:ale_sign_error = "\ue009\ue009"
"    hi! clear SpellBad
"    hi! clear SpellCap
"    hi! clear SpellRare
"    hi! SpellBad gui=undercurl guisp=red
"    hi! SpellCap gui=undercurl guisp=blue
"    hi! SpellRare gui=undercurl guisp=magenta
" }}}


" echodoc {{{
    set noshowmode
" }}}


" airline {{{
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_buffers = 1
  let g:airline#extensions#bufferline#enabled = 1

  "" if !exists('g:airline_symbols')
  ""   let g:airline_symbols = {}
  "" endif

"  let g:airline_left_sep = '▶'
"  let g:airline_right_sep = '◀'
"  if s:hostname[0:3] == "FNSH"
    let g:airline_theme='angr'
"  endif
" }}}


" vim-easymotion {{{
    " <Leader>f{char} to move to {char}
    map  <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)

    " s{char}{char} to move to {char}{char}
    nmap s <Plug>(easymotion-overwin-f2)

    " Move to line
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)

    " Move to word
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)
" }}}


" incsearch-easymotion {{{
    " You can use other keymappings like <C-l> instead of <CR> if you want to
    " use these mappings as default search and somtimes want to move cursor with
    " EasyMotion.
    function! s:incsearch_config(...) abort
        return incsearch#util#deepextend(deepcopy({
                    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                    \   'keymap': {
                    \     "\<CR>": '<Over>(easymotion)'
                    \   },
                    \   'is_expr': 0
                    \ }), get(a:, 1, {}))
    endfunction

    noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
    noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
    noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
" }}}


" DoxygenToolkit {{{
    " let g:DoxygenToolkit_commentType="C"
    " let g:DoxygenToolkit_briefTag_pre="===  FUNCTION  ======================================================================\n "
    let g:DoxygenToolkit_briefTag_funcName = "yes"
    let g:DoxygenToolkit_paramTag_pre="@Param "
    let g:DoxygenToolkit_returnTag="@Returns   "
    " let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
    " let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------"
    let g:DoxygenToolkit_authorName="Wu Xufeng"
" }}}


" ack {{{
    let g:ackprg = 'ag --vimgrep'
" }}}


" xxx-support {{{
    filetype on
    filetype plugin on
" }}}


" vim-dirdiff'{{{
    let g:DirDiffExcludes = "CVS,*.class,*.o,.*.swp,*.exe,.hg,.git"
    let g:DirDiffIgnore = "Id:,Revision:,Date:"
    let g:DirDiffAddArgs = "-w"
" }}}


"" coc.nvim {{{
"
"    " TextEdit might fail if hidden is not set.
"    set hidden
"
"    " Some servers have issues with backup files, see #649.
"    set nobackup
"    set nowritebackup
"
"    " Give more space for displaying messages.
"    set cmdheight=2
"
"    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
"    " delays and poor user experience.
"    set updatetime=300
"
"    " Don't pass messages to |ins-completion-menu|.
"    set shortmess+=c
"
"    " Always show the signcolumn, otherwise it would shift the text each time
"    " diagnostics appear/become resolved.
"    set signcolumn=yes
"
"    " Use tab for trigger completion with characters ahead and navigate.
"    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"    " other plugin before putting this into your config.
"    inoremap <silent><expr> <TAB>
"        \ pumvisible() ? "\<C-n>" :
"        \ <SID>check_back_space() ? "\<TAB>" :
"        \ coc#refresh()
"    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"    function! s:check_back_space() abort
"        let col = col('.') - 1
"        return !col || getline('.')[col - 1]  =~# '\s'
"    endfunction
"
"    " Use <c-space> to trigger completion.
"    inoremap <silent><expr> <c-space> coc#refresh()
"
"    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
"    " position. Coc only does snippet and additional edit on confirm.
"    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
"    if exists('*complete_info')
"        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"    else
"        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"    endif
"
"    " Use `[g` and `]g` to navigate diagnostics
"    nmap <silent> [g <Plug>(coc-diagnostic-prev)
"    nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
"    " GoTo code navigation.
"    nmap <silent> gd <Plug>(coc-definition)
"    nmap <silent> gy <Plug>(coc-type-definition)
"    nmap <silent> gi <Plug>(coc-implementation)
"    nmap <silent> gr <Plug>(coc-references)
"
"    " Use K to show documentation in preview window.
"    nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"    function! s:show_documentation()
"        if (index(['vim','help'], &filetype) >= 0)
"            execute 'h '.expand('<cword>')
"        else
"            call CocAction('doHover')
"        endif
"    endfunction
"
"    " Highlight the symbol and its references when holding the cursor.
"    autocmd CursorHold * silent call CocActionAsync('highlight')
"
"    " Symbol renaming.
"    nmap <leader>rn <Plug>(coc-rename)
"
"    " Formatting selected code.
"    xmap <leader>f  <Plug>(coc-format-selected)
"    nmap <leader>f  <Plug>(coc-format-selected)
"
"    augroup mygroup
"        autocmd!
"        " Setup formatexpr specified filetype(s).
"        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"        " Update signature help on jump placeholder.
"        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"    augroup end
"
"    " Applying codeAction to the selected region.
"    " Example: `<leader>aap` for current paragraph
"    xmap <leader>a  <Plug>(coc-codeaction-selected)
"    nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"    " Remap keys for applying codeAction to the current line.
"    nmap <leader>ac  <Plug>(coc-codeaction)
"    " Apply AutoFix to problem on the current line.
"    nmap <leader>qf  <Plug>(coc-fix-current)
"
"    " Introduce function text object
"    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"    xmap if <Plug>(coc-funcobj-i)
"    xmap af <Plug>(coc-funcobj-a)
"    omap if <Plug>(coc-funcobj-i)
"    omap af <Plug>(coc-funcobj-a)
"
"    " Use <TAB> for selections ranges.
"    " NOTE: Requires 'textDocument/selectionRange' support from the language server.
"    " coc-tsserver, coc-python are the examples of servers that support it.
"    nmap <silent> <TAB> <Plug>(coc-range-select)
"    xmap <silent> <TAB> <Plug>(coc-range-select)
"
"    " Add `:Format` command to format current buffer.
"    command! -nargs=0 Format :call CocAction('format')
"
"    " Add `:Fold` command to fold current buffer.
"    command! -nargs=? Fold :call CocAction('fold', <f-args>)
"
"    " Add `:OR` command for organize imports of the current buffer.
"    command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')
"
"    " Add (Neo)Vim's native statusline support.
"    " NOTE: Please see `:h coc-status` for integrations with external plugins that
"    " provide custom statusline: lightline.vim, vim-airline.
"    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"    " Mappings using CoCList:
"    " Show all diagnostics.
"    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"    " Manage extensions.
"    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"    " Show commands.
"    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"    " Find symbol of current document.
"    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"    " Search workspace symbols.
"    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"    " Do default action for next item.
"    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"    " Do default action for previous item.
"    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"    " Resume latest coc list.
"    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"
"" }}}


"" asyncomplete {{{
"    let g:asyncomplete_auto_popup = 0
"    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"    inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
"" }}}


" cscope {{{
    " auto load cscope
    if filereadable("cscope.out")
        cs add cscope.out
    endif
" }}}


"" vim-which-key {{{
"    nnoremap <silent> <leader>      :<c-u>WhichKey '\'<CR>
"    nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
"    let g:which_key_map['w'] = {
"          \ 'name' : '+windows' ,
"          \ 'w' : ['<C-W>w'     , 'other-window']          ,
"          \ 'd' : ['<C-W>c'     , 'delete-window']         ,
"          \ '-' : ['<C-W>s'     , 'split-window-below']    ,
"          \ '|' : ['<C-W>v'     , 'split-window-right']    ,
"          \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
"          \ 'h' : ['<C-W>h'     , 'window-left']           ,
"          \ 'j' : ['<C-W>j'     , 'window-below']          ,
"          \ 'l' : ['<C-W>l'     , 'window-right']          ,
"          \ 'k' : ['<C-W>k'     , 'window-up']             ,
"          \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
"          \ 'J' : ['resize +5'  , 'expand-window-below']   ,
"          \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
"          \ 'K' : ['resize -5'  , 'expand-window-up']      ,
"          \ '=' : ['<C-W>='     , 'balance-window']        ,
"          \ 's' : ['<C-W>s'     , 'split-window-below']    ,
"          \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
"          \ '?' : ['Windows'    , 'fzf-window']            ,
"          \ }
"" }}}


