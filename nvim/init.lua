-- lets go
return require('packer').startup(function()
 -- Packer can manage itself
  use 'wbthomason/packer.nvim'
 	use 'neovim/nvim-lspconfig'
	-- ocmpletion framework
	use "hrsh7th/nvim-cmp" --completion
	-- LSP completion source for nvim-cmp
	use 'hrsh7th/cmp-nvim-lsp'
	-- Snippet completion source for nvim-cmp
	use 'hrsh7th/cmp-vsnip'
	-- Other usefull completion sources
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-buffer'
	use	'simrat39/rust-tools.nvim'
	use	'nvim-lua/popup.nvim'
	use	'nvim-lua/plenary.nvim'
	use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
	use 'windwp/nvim-autopairs'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
		'lewis6991/gitsigns.nvim', 
		requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('gitsigns').setup() end
	}
	use 'https://github.com/sts10/vim-pink-moon'
	use 'glepnir/dashboard-nvim'
	use 'folke/tokyonight.nvim'
  use 'shaunsingh/nord.nvim'
  use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
		require'nvim-tree'.setup {} end 
	}
  use {'nvim-lualine/lualine.nvim',requires = {'kyazdani42/nvim-web-devicons', opt = true}}
	use {'nvim-telescope/telescope.nvim',requires = { {'nvim-lua/plenary.nvim'} }}
	use 'overcache/NeoSolarized'
	use 'ful1e5/onedark.nvim'
	use 'EdenEast/nightfox.nvim'
	use 'akinsho/bufferline.nvim'


vim.api.nvim_command('set termguicolors')

local nvim_lsp = require'lspconfig'
local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    server = {
        settings = {
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)
-- setup completion
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})


-- nord styles
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.api.nvim_command('set rnu') -- sets relative numbers
vim.api.nvim_command('set completeopt=menuone')  
vim.api.nvim_command('set shortmess+=c')
vim.api.nvim_command('set updatetime=200')
vim.api.nvim_command('set noswapfile')
vim.api.nvim_command('autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)')
vim.api.nvim_command("let g:dashboard_default_executive ='telescope'")
vim.o.background = "dark" 
-- Show diagnostic popup on cursor hold
vim.api.nvim_command('autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()')
-- vim.api.nvim_command('let g:neosolarized_vertSplitBgTrans = 1')
require('telescope').setup()

-- require('nightfox').load('nordfox')
require('nvim-tree').setup()
require('nvim-autopairs').setup()
-- require('nord').set()

require'lspconfig'.rust_analyzer.setup({})

local nvim_lsp = require'lspconfig'

require('rust-tools').setup({})
nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})


--vim.api.nvim_command("autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE")
--vim.api.nvim_command("colorscheme NeoSolarized")
--vim.api.nvim_command('highlight LineNr guibg=NONE')
require('onedark').setup()
require('lualine').setup{
options = {
  theme = 'auto',          -- lualine theme
  component_separators = {left = '', right = ''},
  section_separators = {left = '', right = ''},
  always_divide_middle = true, -- When true left_sections (a,b,c) can't
}}
require('bufferline').setup{}

end)

