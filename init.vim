
set relativenumber
set nu
set nohlsearch
set hidden
"set nowrap
set expandtab
set shiftwidth=4
set incsearch
set scrolloff=8
"set signcolumn=yes
set autoindent
set smartindent
set guicursor=i:block
set mouse+=a
set clipboard=unnamed

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'preservim/nerdtree'

if has("nvim")
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'vim-airline/vim-airline'
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons' 
    Plug 'kyazdani42/nvim-tree.lua'

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    Plug 'cocopon/iceberg.vim'
    Plug 'junegunn/seoul256.vim'

    Plug 'folke/lua-dev.nvim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }


    Plug 'rakr/vim-one'
endif


call plug#end()



if exists("&termguicolors") && exists("&winblend")
    syntax enable
    set termguicolors
    "set winblend=0
    "set wildoptions=pum
    "set pumblend=5
    
"    let ayucolor="light"
"    colorscheme ayu 
    
    colorscheme iceberg 
"    colorscheme toast
"    set termguicolors


"    let hour = strftime("%H")
"    if 7 < hour && hour < 17
"        colorscheme one
"        set background=light
"        let g:airline_theme='one'
"    else

"    set background=dark
    
"    let g:miramare_enable_italic = 1
"    let g:miramare_disable_italic_comment = 1
"    " might need another line here just in case; 2:48 of the video 
"    let g:miramare_palette = {
"                            \ 'bg0': ['#161514', '111', 'LightGrey'],
"                            \ 'bg1':  ['#161514', '111', 'DarkGrey'],     
"                            \ 'bg2': ['#161514', '111', 'DarkGrey'],
"                            \ 'bg3': ['#161514', '111', 'DarkGrey'],
"                            \ 'bg4': ['#161514', '111', 'Grey'],
"                            \ }
"    
"    runtime ./colors/miramare.vim
"    colorscheme miramare
"    endif
endif


"let NERDTreeShowHidden=1

lua << EOF
-- examples for your init.lua

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF

"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1

lua << EOF
require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
    },    indent = {
        enable = false,
        disable = {},
    },
    ensure_installed = {
        "tsx",
        "typescript",
        "javascript",
        "python",
        "html",
        "scss"
    }
}
EOF



" autocomplete settings
set nobackup
set nowritebackup
set updatetime=200

nnoremap <SPACE> <Nop>
map <Space> <Leader>
nnoremap <Leader>nt :NvimTreeToggle<CR>
nmap gh <C-w>h<CR>
nmap gj <C-w>j<CR>
nmap gk <C-w>k<CR>
nmap gl <C-w>l<CR>

nnoremap <Leader>h gT<CR>
nnoremap <Leader>l gt<CR>

command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>


set completeopt=menu,menuone,noselect

"______________________________________________________________________________________________________________________-

lua <<EOF
    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
      vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
    end

    local lsp_flags = {
      -- This is the default in Nvim 0.7+
      debounce_text_changes = 150,
    }
    require('lspconfig')['pyright'].setup{
        on_attach = on_attach,
        flags = lsp_flags,
    }
    require('lspconfig')['tsserver'].setup{
        on_attach = on_attach,
        flags = lsp_flags,
    }



EOF
"___________________________________________________________________________________________________________________________



lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<Tab>'] = cmp.mapping(function(fallback)
          local col = vim.fn.col('.') - 1

          if cmp.visible() then
            cmp.select_next_item(select_opts)
          elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            fallback()
          else
            cmp.complete()
          end
      end, {'i', 's'}),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item(select_opts)
          else
            fallback()
          end
      end, {'i', 's'}),
      }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  cmp.setup.filetype({ 'markdown', 'help' }, {
    window = {
      documentation = cmp.config.enable
    }
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
EOF
