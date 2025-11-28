set scrolloff=8

set number 
set relativenumber 
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set termguicolors 

lua require("config.lazy")
lua require("mason").setup()
lua require("mason-lspconfig").setup()

lua require('copilot').setup()

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Lsp setup Typescript 
" lua require("lsp_config_ts")


autocmd BufWritePre *.go lua vim.lsp.buf.format()
" autocmd BufWritePre *.go lua goimports(1000)


"Theme configuration
let ayucolor="dark"
colorscheme ayu

"Setup toggleterm

"Node Debugger
"lua require("debugger_nodeJS")

"UI for debugger
"lua require("debugger_ui") 

"Mason
" lua require("mason").setup()


" Remaps
let mapleader = " "
nnoremap <leader>pv :Vex <bar> :vertical resize 120 <CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Ex<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
vnoremap <leader>p "d_P
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>g :Git
nnoremap <leader>gw <cmd>Gwrite<cr>
nnoremap <leader>t <cmd>ToggleTerm size=35<cr>
nnoremap <leader>wk <C-w>k
nnoremap <leader>wj <C-w>j
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>fp :let @" = expand("%")<cr>
nnoremap <leader>f :lua vim.lsp.buf.format()<cr>


"Debugger Remaps
nnoremap <leader>dt :lua require'dap'.toggle_breakpoint()<cr>
nnoremap <leader>dc :lua require'dap'.continue()<cr>
nnoremap <leader>dso :lua require'dap'.step_over()<cr>
nnoremap <leader>dsi :lua require'dap'.step_into()<cr>
nnoremap <leader>do :lua require'dap'.repl.open()<cr>
nnoremap <leader>dh :help dap-widgets<cr>

" Harpoon Remaps
nnoremap <leader>h :lua require('harpoon.mark').add_file()<cr>
nnoremap <leader>l :lua require('harpoon.ui').toggle_quick_menu()<cr>


" Show help actions with telescope
nnoremap <leader>P :lua require("CopilotChat.actions"); require("CopilotChat.integrations.telescope").pick(require("CopilotChat.actions").help_actions())<CR>

" Show prompts actions with telescope
nnoremap <leader>p :lua require("CopilotChat.actions"); require("CopilotChat.integrations.telescope").pick(require("CopilotChat.actions").prompt_actions())<CR>
