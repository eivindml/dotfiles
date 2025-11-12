require "plugins"

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })

vim.g.mapleader = " "
vim.wo.number = true


local kind_icons = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = " ",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = " ",
	Misc = " ",
}

-- set termguicolors to enable highlight groups
--vim.opt.termguicolors = true
--set termguicolors

-- lsp
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "ts_ls", "eslint", "emmet_ls", "tailwindcss", "html", "cssls", "biome" },
	automatic_installation = true,
	automatic_enable = false, -- Disable automatic setup since we do manual configuration
})

-- Set up lspconfig.
-- Forteller hverandre hva de kan gjøre
local capabilities = require("cmp_nvim_lsp").default_capabilities()


-- Common LSP key mappings function
local function setup_lsp_keymaps(client, bufnr)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
	vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { buffer = bufnr })
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = bufnr })
	vim.keymap.set("n", "cA", vim.lsp.buf.code_action, { buffer = bufnr, noremap = true, silent = true, desc = "Code Action" })
end

-- Manual LSP server setup (setup_handlers not available in current version)
local lspconfig = require("lspconfig")

-- TypeScript/JavaScript
lspconfig.ts_ls.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		setup_lsp_keymaps(client, bufnr)
		-- Disable document formatting for ts_ls to avoid conflicts with prettier
		client.server_capabilities.documentFormattingProvider = false
	end,
	init_options = {
		preferences = {
			importModuleSpecifier = "non-relative",
			includePackageJsonAutoImports = "auto",
		},
	},
	settings = {
		typescript = {
			preferences = {
				importModuleSpecifier = "non-relative",
				includePackageJsonAutoImports = "auto",
				includeCompletionsForImportStatements = true,
				includeCompletionsForModuleExports = true,
				includeAutomaticOptionalChainCompletions = true,
				useAliasesForRenames = false,
			},
			suggest = {
				includeCompletionsForModuleExports = true,
				includeCompletionsForImportStatements = true,
				autoImports = true,
			},
			format = {
				enable = true,
			},
			inlayHints = {
				includeInlayParameterNameHints = 'all',
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			}
		},
		javascript = {
			preferences = {
				importModuleSpecifier = "non-relative",
				includePackageJsonAutoImports = "auto",
				includeCompletionsForImportStatements = true,
				includeCompletionsForModuleExports = true,
				includeAutomaticOptionalChainCompletions = true,
				useAliasesForRenames = false,
			},
			suggest = {
				includeCompletionsForModuleExports = true,
				includeCompletionsForImportStatements = true,
			},
			inlayHints = {
				includeInlayParameterNameHints = 'all',
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			}
		}
	}
}

-- ESLint
lspconfig.eslint.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		-- Disable completion from eslint
		client.server_capabilities.completionProvider = false
		client.server_capabilities.hoverProvider = false
		client.server_capabilities.definitionProvider = false
	end,
}

-- Emmet
lspconfig.emmet_ls.setup {
	capabilities = capabilities,
	filetypes = { "html", "css", "scss", "less", "vue", "svelte" },
	on_attach = setup_lsp_keymaps,
}

-- Tailwind CSS
lspconfig.tailwindcss.setup {
	capabilities = capabilities,
	on_attach = setup_lsp_keymaps,
}

-- HTML
lspconfig.html.setup {
	capabilities = capabilities,
	filetypes = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	on_attach = setup_lsp_keymaps,
}

-- CSS
lspconfig.cssls.setup {
	capabilities = capabilities,
	filetypes = { "css", "scss", "less", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	settings = {
		css = { validate = true, lint = { unknownAtRules = "ignore" } },
		scss = { validate = true, lint = { unknownAtRules = "ignore" } },
		less = { validate = true, lint = { unknownAtRules = "ignore" } },
	},
	on_attach = function(client, bufnr)
		setup_lsp_keymaps(client, bufnr)
		-- Disable formatting from cssls to avoid conflicts
		client.server_capabilities.documentFormattingProvider = false
		-- Enable CSS completions in template literals
		if client.name == "cssls" then
			client.server_capabilities.completionProvider.triggerCharacters = { ".", ":", "-", "@" }
		end
	end,
}

-- Biome
lspconfig.biome.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		setup_lsp_keymaps(client, bufnr)
	end,
}
-- All LSP servers are now configured through mason-lspconfig setup_handlers above

vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- cssls and htmlls are now configured through mason-lspconfig setup_handlers above

-- Set up nvim-cmp.
local cmp = require "cmp"

cmp.setup {
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert {
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm { select = false }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.menu = ({
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = cmp.config.sources({   
		{ name = "nvim_lsp", priority = 1000 },
		{ name = "luasnip", priority = 750 }, -- For luasnip users.
	}, {
		{ name = "buffer", priority = 250 },
	}, {
		{ name = "path", priority = 100 },
	}),
}
-- eslint is now configured through mason-lspconfig setup_handlers above
--

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' },
	}, {
		{ name = 'buffer' },
	})
})
require("cmp_git").setup() ]]
--require('lspconfig').tsserver.setup {}

-- empty setup using defaults
require("nvim-tree").setup {
	update_focused_file = {
		enable = true,
	},
	git = {
		enable = true,
	},
	filters = {
		exclude = { ".env", ".env.local", ".env.development", ".env.production", ".env.test" },
	},
	view = {
		width = 50,
	},
	actions = {
		open_file = {
			quit_on_open = true, -- Lukk NvimTree når du åpner en fil
		},
	},
}

vim.cmd('colorscheme mist')

-- Key:         Ctrl-e
-- Action:      Show treesitter capture group for textobject under cursor.
vim.keymap.set("n", "<C-e>", function()
	local result = vim.treesitter.get_captures_at_cursor(0)
	print(vim.inspect(result))
end, { noremap = true, silent = false })

require("telescope").setup {
	pickers = {
		find_files = {
			hidden = true
		},
	},
	extensions = {
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {},
				["n"] = {},
			},
		},
	},
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

vim.keymap.set('n', '<leader>S', function()
	require('spectre').open()
end, { noremap = true, silent = true, desc = 'Åpne Spectre for global søk og erstatt' })


-- require'lspconfig'.tsserver.setup {}
--
--
require("nvim-treesitter.configs").setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "css", "typescript", "tsx" },
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,
	highlight = {
		enable = true,
		-- Enable additional vim regex highlighting for specific languages
		additional_vim_regex_highlighting = { "javascript", "typescript" },
	},
	-- Enable injections for template literals
	injections = {
		enable = true,
	},
}

-- inoremap <leader>w <Esc>:w<cr><Space>
vim.api.nvim_set_keymap("n", "<leader>w", "<Esc>:w<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", "<Esc>:q<cr>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>nn", "<Esc>:NvimTreeToggle<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>no", "<Esc>:NvimTreeFocus<cr>", { noremap = true })

vim.opt.background = "dark"
vim.cmd "hi LineNr ctermfg=236"
vim.cmd "hi Comment ctermfg=237"
vim.cmd "hi Statement ctermfg=220"
vim.cmd "hi Identifier ctermfg=7"
vim.cmd "hi NvimTreeCursorLine ctermfg=9"
vim.cmd "hi @variable ctermfg=229"
vim.cmd "hi @variable.member ctermfg=226"
vim.cmd "hi @function.call ctermfg=13"
vim.cmd "hi @keyword ctermfg=9"
vim.cmd "hi @keyword.import ctermfg=238"
vim.cmd "hi @keyword.return ctermfg=238"
vim.cmd "hi @punctuation.bracket ctermfg=52"
vim.cmd "hi @function ctermfg=4"
vim.cmd "hi @string ctermfg=39"
vim.cmd "hi @number ctermfg=42"
vim.cmd "hi @tag.builtin ctermfg=2"
vim.cmd "hi @tag.attribute ctermfg=5"
vim.cmd "hi @tag.delimiter ctermfg=1"
vim.cmd "hi @type ctermfg=2"
vim.cmd "hi Search ctermfg=234 ctermbg=3"
vim.cmd "hi CurSearch ctermbg=3 ctermfg=1"

-- Farge for aktiv statuslinje
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#ffffff", bg = "#005f87", bold = true })
-- Farge for inaktiv statuslinje
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#808080", bg = "#1c1c1c" })

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argv(0) == "" then
			require("telescope.builtin").find_files()
		end
	end,
})

vim.keymap.set("n", "<leader>sn", ":luafile $MYVIMRC<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fF", ":Telescope live_grep<CR>", { noremap = true, silent = true })

-- Manual formatting key mapping (preserves folds)
vim.keymap.set("n", "<leader>f", function()
	local filetype = vim.bo.filetype
	if filetype == "typescript" or filetype == "typescriptreact" or filetype == "javascript" or filetype == "javascriptreact" then
		vim.cmd("Neoformat")
	elseif filetype == "html" then
		vim.cmd("Neoformat")
	else
		vim.lsp.buf.format()
	end
end, { noremap = true, silent = true, desc = "Format file" })

-- Configure Neoformat
vim.g.neoformat_enabled_typescript = { "prettier" }
vim.g.neoformat_enabled_typescriptreact = { "prettier" }
-- Run on save with fold preservation (disabled - use <leader>f to format manually)
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = { "*.ts", "*.tsx" },
-- 	callback = function()
-- 		vim.cmd("mkview!")
-- 		local old_shortmess = vim.o.shortmess
-- 		vim.o.shortmess = vim.o.shortmess .. 'F'
-- 		vim.cmd("Neoformat")
-- 		vim.o.shortmess = old_shortmess
-- 		vim.cmd("silent! loadview")
-- 	end,
-- })
-- Run on leave insert mode
-- vim.api.nvim_create_autocmd("InsertLeave", {
	--  pattern = { "*.ts", "*.tsx" },
	--  command = "silent! Neoformat",
	--})
	vim.g.neoformat_try_node_exe = 1
	-- Define an augroup in Lua
	--vim.api.nvim_create_augroup("fmt", { clear = true })

	-- Define an autocmd within that augroup
	--vim.api.nvim_create_autocmd("BufWritePre", {
		--  group = "fmt",
		--  pattern = "*",
		--  command = "undojoin | Neoformat",
		--})

		-- Neoformat for html with fold preservation (disabled - use <leader>f to format manually)
		-- vim.api.nvim_create_autocmd("BufWritePre", {
		-- 	pattern = "*.html",
		-- 	callback = function()
		-- 		vim.cmd("mkview!")
		-- 		local old_shortmess = vim.o.shortmess
		-- 		vim.o.shortmess = vim.o.shortmess .. 'F'
		-- 		vim.cmd("Neoformat")
		-- 		vim.o.shortmess = old_shortmess
		-- 		vim.cmd("silent! loadview")
		-- 	end,
		-- })

		-- Enable Biome for formatting on save
		--vim.cmd([[autocmd BufWritePre *.js,*.ts,*.tsx,*.jsx lua vim.lsp.buf.format({ async = false })]])

		-- Set up Neoformat for Lua files
		vim.g.neoformat_enabled_lua = { "stylua" }

		vim.g.user_emmet_mode = "n"
		vim.g.user_emmet_leader_key = ","
		-- Show horisontal split line
		vim.o.laststatus = 3
		-- Set foldmethod
		vim.o.foldmethod = "marker"


		-- Config lsp diagnostics
		vim.diagnostic.config({
			virtual_text = false, -- Turn off inline diagnostics
		})
		-- Show all diagnostics on current line in floating window
		vim.api.nvim_set_keymap(
			'n', '<Leader>d', ':lua vim.diagnostic.open_float()<CR>', 
			{ noremap = true, silent = true }
		)
		-- Go to next diagnostic (if there are multiple on the same line, only shows
		-- one at a time in the floating window)
		vim.api.nvim_set_keymap(
			'n', '<Leader>n', ':lua vim.diagnostic.goto_next()<CR>',
			{ noremap = true, silent = true }
		)
		-- Go to prev diagnostic (if there are multiple on the same line, only shows
		-- one at a time in the floating window)
		vim.api.nvim_set_keymap(
			'n', '<Leader>p', ':lua vim.diagnostic.goto_prev()<CR>',
			{ noremap = true, silent = true }
		)

		vim.g.maplocalleader = ","

		-- vim.api.nvim_set_hl(0, "TabLineFill", { ctermfg = "LightGreen", ctermbg = "DarkGreen" })
		vim.api.nvim_set_hl(0, "TabLine",     { ctermfg = "White"          })
		vim.api.nvim_set_hl(0, "TabLineSel",  { ctermfg = "Blue"          })


		-- Auto-reload file if changed on disk
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  pattern = "*",
  command = "checktime"
})

-- Setup for CSS/HTML in template literals for web components
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function()
    -- This helps LSP servers identify CSS regions within template strings
    vim.bo.iskeyword = vim.bo.iskeyword .. ",-"
    
    -- Enable multiple LSP servers to attach to the same buffer
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    local has_cssls = false
    local has_html = false
    
    for _, client in ipairs(clients) do
      if client.name == "cssls" then has_cssls = true end
      if client.name == "html" then has_html = true end
    end
    
    -- Manually attach CSS and HTML LSP if not already attached
    if not has_cssls then
      vim.lsp.start({
        name = "cssls",
        cmd = { "vscode-css-language-server", "--stdio" },
        root_dir = vim.fn.getcwd(),
        settings = {
          css = { validate = true, lint = { unknownAtRules = "ignore" } },
        },
      })
    end
    
    if not has_html then
      vim.lsp.start({
        name = "html",
        cmd = { "vscode-html-language-server", "--stdio" },
        root_dir = vim.fn.getcwd(),
      })
    end
  end,
})

-- Debug commands for completion sources
vim.api.nvim_create_user_command('LspClients', function()
  local clients = vim.lsp.get_active_clients()
  for _, client in ipairs(clients) do
    print(string.format("Client: %s, ID: %d, Filetypes: %s", 
      client.name, 
      client.id, 
      vim.inspect(client.config.filetypes or {})))
  end
end, {})

vim.api.nvim_create_user_command('CmpSources', function()
  local cmp = require('cmp')
  local sources = cmp.get_config().sources
  print("CMP Sources:")
  for group_idx, group in ipairs(sources) do
    print(string.format("Group %d:", group_idx))
    for _, source in ipairs(group) do
      print(string.format("  - %s (priority: %s)", source.name, source.priority or "default"))
    end
  end
end, {})

vim.api.nvim_create_user_command('LspRestart', function()
  vim.cmd('LspStop')
  vim.defer_fn(function()
    vim.cmd('LspStart')
  end, 1000)
end, {})
