-- Automatically run: PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- latex
  use 'lervag/vimtex'

  -- lazygit
  use {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }

  -- Emmet for html tag completions and abbreviations
  use "mattn/emmet-vim"

  -- Auto close html tags etc.
  use {
    "windwp/nvim-ts-autotag",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        per_filetype = {
        --  ["html"] = {
        --    enable_close = false,
        --  },
        },
      }
    end,
  }

  -- Editorconfig
  use "editorconfig/editorconfig-vim"

  -- Simple plugins can be specified as strings
  use "nvim-tree/nvim-web-devicons"
  use "nvim-tree/nvim-tree.lua"

  -- Plugin to format code (e.g. to use prettier on Typescript)
  use "sbdchd/neoformat"

  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  }

  use {
    'nvim-pack/nvim-spectre',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
  }
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  }

  -- LSP Config
  use "mason-org/mason.nvim"
  use "mason-org/mason-lspconfig.nvim"

  use 'neovim/nvim-lspconfig'

  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"

  -- Highlighting
  use "nvim-treesitter/nvim-treesitter"
  
  -- Template literal support for JS/TS
  use {
    "axelvc/template-string.nvim",
    config = function()
      require('template-string').setup({
        filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'html' },
        jsx_brackets = true,
        remove_template_string = false,
        restore_quotes = {
          normal = [[']],
          jsx = [["]],
        },
      })
    end
  }

  -- Themes
  --use 'navarasu/onedark.nvim'
  --use "folke/tokyonight.nvim"
  --use({ 'projekt0n/github-nvim-theme'})
  --use { "catppuccin/nvim", as = "catppuccin" }
  --
  use({
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit for latest
  config = function()
    require("nvim-surround").setup({})
  end,
})

-- GitHub Copilot with cmp integration (DISABLED)
-- use {
--   "zbirenbaum/copilot.lua",
--   config = function()
--     require("copilot").setup({
--       suggestion = { enabled = false },
--       panel = { enabled = false },
--     })
--   end,
-- }

-- use {
--   "zbirenbaum/copilot-cmp",
--   after = { "copilot.lua" },
--   config = function()
--     require("copilot_cmp").setup()
--   end,
-- }

end)
