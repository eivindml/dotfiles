-- Mist color scheme for Neovim
-- A dark theme with transparent background

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "mist"

local colors = {
  none = "NONE",
  bg = "NONE", -- Transparent background
  fg = "#f2f2f7", -- macOS primary text
  
  -- macOS traffic light colors
  red = "#ff5f56",     -- Close button red
  yellow = "#ffbd2e",  -- Minimize button yellow
  green = "#27ca3f",   -- Maximize button green
  
  -- macOS system colors
  blue = "#007aff",      -- System blue
  indigo = "#5856d6",    -- System indigo
  purple = "#af52de",    -- System purple
  pink = "#ff2d92",      -- System pink
  cyan = "#32ade6",      -- Custom cyan
  orange = "#ff9500",    -- System orange
  
  -- macOS grays (dark mode)
  black = "#000000",
  white = "#ffffff",
  gray = "#8e8e93",      -- System gray
  gray2 = "#636366",     -- System gray 2
  gray3 = "#48484a",     -- System gray 3
  gray4 = "#3a3a3c",     -- System gray 4
  gray5 = "#2c2c2e",     -- System gray 5
  gray6 = "#1c1c1e",     -- System gray 6
  
  -- Semantic colors
  light_gray = "#aeaeb2",
  dark_gray = "#2c2c2e",
  darker_gray = "#1c1c1e",
  
  -- macOS accent colors
  tint = "#007aff",      -- Default tint color
  selection = "#007aff", -- Selection color
}

local function hi(group, opts)
  local cmd = "hi " .. group
  if opts.fg then cmd = cmd .. " guifg=" .. opts.fg end
  if opts.bg then cmd = cmd .. " guibg=" .. opts.bg end
  if opts.style then
    if opts.style == "bold" then cmd = cmd .. " gui=bold"
    elseif opts.style == "italic" then cmd = cmd .. " gui=italic"
    elseif opts.style == "underline" then cmd = cmd .. " gui=underline"
    elseif opts.style == "NONE" then cmd = cmd .. " gui=NONE"
    end
  end
  vim.cmd(cmd)
end

-- Editor highlights
hi("Normal", { fg = colors.fg, bg = colors.bg })
hi("NormalFloat", { fg = colors.fg, bg = colors.gray5 })
hi("ColorColumn", { bg = colors.gray6 })
hi("Cursor", { fg = colors.bg, bg = colors.fg })
hi("CursorLine", { bg = colors.gray6 })
hi("CursorLineNr", { fg = colors.yellow, style = "bold" })
hi("LineNr", { fg = colors.gray3 })
hi("SignColumn", { bg = colors.bg })
hi("VertSplit", { fg = colors.gray4 })
hi("Folded", { fg = colors.gray, bg = colors.gray6 })
hi("FoldColumn", { fg = colors.gray, bg = colors.bg })
hi("IncSearch", { fg = colors.white, bg = colors.orange })
hi("Search", { fg = colors.black, bg = colors.yellow })
hi("MatchParen", { fg = colors.yellow, style = "bold" })
hi("NonText", { fg = colors.gray3 })
hi("Whitespace", { fg = colors.gray4 })
hi("SpecialKey", { fg = colors.gray3 })
hi("Pmenu", { fg = colors.fg, bg = colors.gray5 })
hi("PmenuSel", { fg = colors.white, bg = colors.blue })
hi("PmenuSbar", { bg = colors.gray4 })
hi("PmenuThumb", { bg = colors.gray2 })
hi("WildMenu", { fg = colors.black, bg = colors.yellow })
hi("StatusLine", { fg = colors.fg, bg = colors.gray5 })
hi("StatusLineNC", { fg = colors.gray, bg = colors.gray6 })
hi("TabLine", { fg = colors.gray, bg = colors.gray5 })
hi("TabLineFill", { bg = colors.gray6 })
hi("TabLineSel", { fg = colors.white, bg = colors.blue })
hi("Title", { fg = colors.green, style = "bold" })
hi("Visual", { bg = colors.gray4 })
hi("WarningMsg", { fg = colors.orange })
hi("ErrorMsg", { fg = colors.red })
hi("ModeMsg", { fg = colors.green })
hi("MoreMsg", { fg = colors.cyan })
hi("Question", { fg = colors.blue })
hi("Directory", { fg = colors.blue })

-- Syntax highlighting
hi("Comment", { fg = colors.gray2, style = "italic" })
hi("Constant", { fg = colors.orange })
hi("String", { fg = colors.green })
hi("Character", { fg = colors.green })
hi("Number", { fg = colors.orange })
hi("Boolean", { fg = colors.purple })
hi("Float", { fg = colors.orange })
hi("Identifier", { fg = colors.fg })
hi("Function", { fg = colors.blue })
hi("Statement", { fg = colors.indigo })
hi("Conditional", { fg = colors.indigo })
hi("Repeat", { fg = colors.indigo })
hi("Label", { fg = colors.cyan })
hi("Operator", { fg = colors.light_gray })
hi("Keyword", { fg = colors.purple })
hi("Exception", { fg = colors.red })
hi("PreProc", { fg = colors.cyan })
hi("Include", { fg = colors.indigo })
hi("Define", { fg = colors.purple })
hi("Macro", { fg = colors.purple })
hi("PreCondit", { fg = colors.cyan })
hi("Type", { fg = colors.yellow })
hi("StorageClass", { fg = colors.indigo })
hi("Structure", { fg = colors.indigo })
hi("Typedef", { fg = colors.yellow })
hi("Special", { fg = colors.pink })
hi("SpecialChar", { fg = colors.pink })
hi("Tag", { fg = colors.blue })
hi("Delimiter", { fg = colors.light_gray })
hi("SpecialComment", { fg = colors.gray })
hi("Debug", { fg = colors.red })
hi("Underlined", { fg = colors.blue, style = "underline" })
hi("Ignore", { fg = colors.gray3 })
hi("Error", { fg = colors.red })
hi("Todo", { fg = colors.yellow, style = "bold" })

-- Treesitter highlights
hi("@variable", { fg = colors.fg })
hi("@variable.builtin", { fg = colors.red })
hi("@variable.parameter", { fg = colors.orange })
hi("@variable.member", { fg = colors.fg })
hi("@constant", { fg = colors.orange })
hi("@constant.builtin", { fg = colors.orange })
hi("@constant.macro", { fg = colors.orange })
hi("@module", { fg = colors.fg })
hi("@string", { fg = colors.green })
hi("@string.escape", { fg = colors.cyan })
hi("@string.regex", { fg = colors.cyan })
hi("@character", { fg = colors.green })
hi("@number", { fg = colors.orange })
hi("@boolean", { fg = colors.orange })
hi("@annotation", { fg = colors.yellow })
hi("@attribute", { fg = colors.cyan })
hi("@error", { fg = colors.red })
hi("@keyword", { fg = colors.purple })
hi("@keyword.function", { fg = colors.purple })
hi("@keyword.return", { fg = colors.purple })
hi("@keyword.operator", { fg = colors.cyan })
hi("@keyword.import", { fg = colors.purple })
hi("@punctuation.delimiter", { fg = colors.fg })
hi("@punctuation.bracket", { fg = colors.fg })
hi("@punctuation.special", { fg = colors.cyan })
hi("@comment", { fg = colors.gray, style = "italic" })
hi("@tag", { fg = colors.red })
hi("@tag.attribute", { fg = colors.orange })
hi("@tag.delimiter", { fg = colors.fg })
hi("@tag.builtin", { fg = colors.blue })
hi("@type", { fg = colors.yellow })
hi("@type.builtin", { fg = colors.yellow })
hi("@type.definition", { fg = colors.yellow })
hi("@type.qualifier", { fg = colors.purple })
hi("@storageclass", { fg = colors.cyan })
hi("@function", { fg = colors.blue })
hi("@function.builtin", { fg = colors.cyan })
hi("@function.macro", { fg = colors.blue })
hi("@function.call", { fg = colors.blue })
hi("@function.method", { fg = colors.blue })
hi("@function.method.call", { fg = colors.blue })
hi("@parameter", { fg = colors.orange })
hi("@method", { fg = colors.blue })
hi("@field", { fg = colors.fg })
hi("@property", { fg = colors.fg })
hi("@constructor", { fg = colors.cyan })
hi("@conditional", { fg = colors.purple })
hi("@repeat", { fg = colors.purple })
hi("@label", { fg = colors.cyan })
hi("@operator", { fg = colors.cyan })
hi("@exception", { fg = colors.purple })
hi("@include", { fg = colors.purple })
hi("@namespace", { fg = colors.fg })

-- LSP highlights
hi("DiagnosticError", { fg = colors.red })
hi("DiagnosticWarn", { fg = colors.yellow })
hi("DiagnosticInfo", { fg = colors.blue })
hi("DiagnosticHint", { fg = colors.cyan })
hi("DiagnosticUnderlineError", { style = "underline", fg = colors.red })
hi("DiagnosticUnderlineWarn", { style = "underline", fg = colors.yellow })
hi("DiagnosticUnderlineInfo", { style = "underline", fg = colors.blue })
hi("DiagnosticUnderlineHint", { style = "underline", fg = colors.cyan })
hi("LspReferenceText", { bg = colors.dark_gray })
hi("LspReferenceRead", { bg = colors.dark_gray })
hi("LspReferenceWrite", { bg = colors.dark_gray })

-- Git highlights
hi("DiffAdd", { fg = colors.green })
hi("DiffChange", { fg = colors.yellow })
hi("DiffDelete", { fg = colors.red })
hi("DiffText", { fg = colors.blue })
hi("diffAdded", { fg = colors.green })
hi("diffRemoved", { fg = colors.red })
hi("diffChanged", { fg = colors.yellow })
hi("diffFile", { fg = colors.cyan })
hi("diffNewFile", { fg = colors.green })
hi("diffOldFile", { fg = colors.red })
hi("diffLine", { fg = colors.blue })
hi("gitcommitSelectedType", { fg = colors.green })
hi("gitcommitSelectedFile", { fg = colors.green })
hi("gitcommitDiscardedType", { fg = colors.red })
hi("gitcommitDiscardedFile", { fg = colors.red })

-- NvimTree highlights
hi("NvimTreeNormal", { fg = colors.fg, bg = colors.bg })
hi("NvimTreeFolderIcon", { fg = colors.blue })
hi("NvimTreeFolderName", { fg = colors.blue })
hi("NvimTreeOpenedFolderName", { fg = colors.blue, style = "bold" })
hi("NvimTreeRootFolder", { fg = colors.purple, style = "bold" })
hi("NvimTreeSpecialFile", { fg = colors.yellow })
hi("NvimTreeExecFile", { fg = colors.green })
hi("NvimTreeGitDirty", { fg = colors.yellow })
hi("NvimTreeGitNew", { fg = colors.green })
hi("NvimTreeGitDeleted", { fg = colors.red })
hi("NvimTreeIndentMarker", { fg = colors.dark_gray })
hi("NvimTreeCursorLine", { bg = colors.dark_gray })

-- Telescope highlights
hi("TelescopeBorder", { fg = colors.dark_gray })
hi("TelescopeSelection", { bg = colors.dark_gray })
hi("TelescopeSelectionCaret", { fg = colors.cyan })
hi("TelescopeMultiSelection", { fg = colors.purple })
hi("TelescopeNormal", { fg = colors.fg })
hi("TelescopeMatching", { fg = colors.yellow, style = "bold" })
hi("TelescopePromptPrefix", { fg = colors.cyan })