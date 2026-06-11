local M = {}

---@param groups table<string, table>
local function set(groups)
  for name, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, name, opts)
  end
end

---@param c table  palette colors
---@param opts table  user config
function M.apply(c, opts)
  local italic = opts.italic_comments and "italic" or nil
  local bold   = opts.bold_keywords   and "bold"   or nil

  set({
    Normal          = { fg = c.fg,        bg = c.bg },
    NormalFloat     = { fg = c.fg,        bg = c.bg2 },
    NormalNC        = { fg = c.fg1,       bg = c.bg },
    FloatBorder     = { fg = c.bg4,       bg = c.bg2 },
    FloatTitle      = { fg = c.accent,    bg = c.bg2 },
    FloatFooter     = { fg = c.fg2,       bg = c.bg2 },

    Cursor          = { fg = c.bg,        bg = c.fg },
    CursorIM        = { fg = c.bg,        bg = c.fg },
    CursorLine      = { bg = c.cursorline },
    CursorColumn    = { bg = c.cursorline },
    CursorLineNr    = { fg = c.linenr_cur, bg = c.cursorline, bold = true },
    CursorLineFold  = { fg = c.linenr_cur },
    CursorLineSign  = { bg = c.cursorline },

    LineNr          = { fg = c.linenr },
    LineNrAbove     = { fg = c.linenr },
    LineNrBelow     = { fg = c.linenr },

    SignColumn      = { fg = c.fg3,       bg = c.none },
    ColorColumn     = { bg = c.bg3 },
    Conceal         = { fg = c.fg4 },
    FoldColumn      = { fg = c.fg3,       bg = c.none },
    Folded          = { fg = c.fg2,       bg = c.bg3 },

    StatusLine      = { fg = c.fg1,       bg = c.bg1 },
    StatusLineNC    = { fg = c.fg3,       bg = c.bg1 },
    TabLine         = { fg = c.fg2,       bg = c.bg1 },
    TabLineFill     = { fg = c.none,      bg = c.bg1 },
    TabLineSel      = { fg = c.fg,        bg = c.bg },

    WinBar          = { fg = c.fg2,       bg = c.bg },
    WinBarNC        = { fg = c.fg3,       bg = c.bg },
    WinSeparator    = { fg = c.bg4 },

    Pmenu           = { fg = c.fg,        bg = c.bg2 },
    PmenuSel        = { fg = c.fg,        bg = c.selection },
    PmenuSbar       = { bg = c.bg3 },
    PmenuThumb      = { bg = c.accent },
    PmenuKind       = { fg = c.type_,     bg = c.bg2 },
    PmenuKindSel    = { fg = c.type_,     bg = c.selection },
    PmenuExtra      = { fg = c.fg2,       bg = c.bg2 },
    PmenuExtraSel   = { fg = c.fg1,       bg = c.selection },

    Visual          = { bg = c.selection },
    VisualNOS       = { bg = c.selection },

    Search          = { fg = c.fg,        bg = c.match },
    IncSearch       = { fg = c.bg,        bg = c.accent },
    CurSearch       = { fg = c.bg,        bg = c.accent2 },
    Substitute      = { fg = c.bg,        bg = c.error_ },

    MatchParen      = { fg = c.accent2,   bold = true, underline = true },

    Directory       = { fg = c.fn_ },
    Title           = { fg = c.accent,    bold = true },
    EndOfBuffer     = { fg = c.bg4 },
    NonText         = { fg = c.fg4 },
    Whitespace      = { fg = c.bg5 },
    SpecialKey      = { fg = c.bg5 },

    WildMenu        = { fg = c.fg,        bg = c.match_cur },
    QuickFixLine    = { fg = c.fn_,       bold = true },

    MsgArea         = { fg = c.fg1 },
    MsgSeparator    = { fg = c.bg4 },
    MoreMsg         = { fg = c.ok,        bold = true },
    Question        = { fg = c.hint },
    ErrorMsg        = { fg = c.error_ },
    WarningMsg      = { fg = c.warn },

    SpellBad        = { undercurl = true, sp = c.error_ },
    SpellCap        = { undercurl = true, sp = c.warn },
    SpellLocal      = { undercurl = true, sp = c.info },
    SpellRare       = { undercurl = true, sp = c.hint },

    Comment         = { fg = c.comment_,  italic = italic },
    SpecialComment  = { fg = c.comment_,  italic = italic },

    Constant        = { fg = c.const_ },
    String          = { fg = c.string_ },
    Character       = { fg = c.string_ },
    Number          = { fg = c.number_ },
    Boolean         = { fg = c.number_ },
    Float           = { fg = c.number_ },

    Identifier      = { fg = c.fg },
    Function        = { fg = c.fn_ },

    Statement       = { fg = c.keyword,   bold = bold },
    Conditional     = { fg = c.keyword,   bold = bold },
    Repeat          = { fg = c.keyword,   bold = bold },
    Label           = { fg = c.keyword },
    Operator        = { fg = c.operator_ },
    Keyword         = { fg = c.keyword,   bold = bold },
    Exception       = { fg = c.keyword },

    PreProc         = { fg = c.type_ },
    Include         = { fg = c.keyword },
    Define          = { fg = c.type_ },
    Macro           = { fg = c.type_ },
    PreCondit       = { fg = c.type_ },

    Type            = { fg = c.type_ },
    StorageClass    = { fg = c.keyword },
    Structure       = { fg = c.type_ },
    Typedef         = { fg = c.type_ },

    Special         = { fg = c.const_ },
    SpecialChar     = { fg = c.keyword },
    Tag             = { fg = c.keyword },
    Delimiter       = { fg = c.operator_ },

    Bold            = { bold = true },
    Italic          = { italic = true },
    Underlined      = { underline = true },
    Ignore          = { fg = c.fg4 },
    Error           = { fg = c.error_,    bold = true },
    Todo            = { fg = c.bg,        bg = c.warn, bold = true },
  })

  set({
    ["@comment"]                    = { fg = c.comment_,  italic = italic },
    ["@comment.documentation"]      = { fg = c.fg2,       italic = italic },
    ["@comment.todo"]               = { fg = c.bg,        bg = c.warn,    bold = true },
    ["@comment.note"]               = { fg = c.bg,        bg = c.hint,    bold = true },
    ["@comment.warning"]            = { fg = c.bg,        bg = c.warn,    bold = true },
    ["@comment.error"]              = { fg = c.bg,        bg = c.error_,  bold = true },

    ["@keyword"]                    = { fg = c.keyword,   bold = bold },
    ["@keyword.function"]           = { fg = c.keyword,   bold = bold },
    ["@keyword.operator"]           = { fg = c.keyword },
    ["@keyword.return"]             = { fg = c.keyword,   bold = bold },
    ["@keyword.import"]             = { fg = c.keyword },
    ["@keyword.conditional"]        = { fg = c.keyword,   bold = bold },
    ["@keyword.conditional.ternary"]= { fg = c.operator_ },
    ["@keyword.repeat"]             = { fg = c.keyword },
    ["@keyword.exception"]          = { fg = c.keyword },
    ["@keyword.modifier"]           = { fg = c.keyword },
    ["@keyword.type"]               = { fg = c.keyword },
    ["@keyword.coroutine"]          = { fg = c.keyword },
    ["@keyword.directive"]          = { fg = c.type_ },
    ["@keyword.directive.define"]   = { fg = c.type_ },

    ["@variable"]                   = { fg = c.fg },
    ["@variable.builtin"]           = { fg = c.keyword },
    ["@variable.parameter"]         = { fg = c.fg },
    ["@variable.parameter.builtin"] = { fg = c.keyword },
    ["@variable.member"]            = { fg = c.fg },

    ["@function"]                   = { fg = c.fn_ },
    ["@function.builtin"]           = { fg = c.fn_ },
    ["@function.call"]              = { fg = c.fn_ },
    ["@function.macro"]             = { fg = c.type_ },
    ["@function.method"]            = { fg = c.fn_ },
    ["@function.method.call"]       = { fg = c.fn_ },

    ["@constructor"]                = { fg = c.type_ },

    ["@type"]                       = { fg = c.type_ },
    ["@type.builtin"]               = { fg = c.type_ },
    ["@type.definition"]            = { fg = c.type_ },
    ["@type.qualifier"]             = { fg = c.keyword },

    ["@string"]                     = { fg = c.string_ },
    ["@string.documentation"]       = { fg = c.string2,   italic = italic },
    ["@string.regexp"]              = { fg = c.string_ },
    ["@string.escape"]              = { fg = c.keyword },
    ["@string.special"]             = { fg = c.keyword },
    ["@string.special.symbol"]      = { fg = c.const_ },
    ["@string.special.url"]         = { fg = c.info,      underline = true },
    ["@string.special.path"]        = { fg = c.info },

    ["@character"]                  = { fg = c.string_ },
    ["@character.special"]          = { fg = c.keyword },

    ["@number"]                     = { fg = c.number_ },
    ["@number.float"]               = { fg = c.number_ },
    ["@boolean"]                    = { fg = c.number_,   bold = bold },

    ["@constant"]                   = { fg = c.const_ },
    ["@constant.builtin"]           = { fg = c.number_ },
    ["@constant.macro"]             = { fg = c.type_ },

    ["@operator"]                   = { fg = c.operator_ },
    ["@punctuation.bracket"]        = { fg = c.operator_ },
    ["@punctuation.delimiter"]      = { fg = c.fg3 },
    ["@punctuation.special"]        = { fg = c.operator_ },

    ["@attribute"]                  = { fg = c.type_ },
    ["@attribute.builtin"]          = { fg = c.type_ },

    ["@namespace"]                  = { fg = c.keyword },
    ["@module"]                     = { fg = c.fg },
    ["@module.builtin"]             = { fg = c.fg },

    ["@label"]                      = { fg = c.keyword },

    ["@markup.heading.1"]           = { fg = c.string_,   bold = true },
    ["@markup.heading.2"]           = { fg = c.fn_,       bold = true },
    ["@markup.heading.3"]           = { fg = c.type_,     bold = true },
    ["@markup.heading.4"]           = { fg = c.keyword,   bold = true },
    ["@markup.heading.5"]           = { fg = c.const_,    bold = true },
    ["@markup.heading.6"]           = { fg = c.fg1,       bold = true },
    ["@markup.raw"]                 = { fg = c.string_,   bg = c.bg3 },
    ["@markup.raw.block"]           = { fg = c.string_ },
    ["@markup.quote"]               = { fg = c.fg2,       italic = true },
    ["@markup.math"]                = { fg = c.number_ },
    ["@markup.link"]                = { fg = c.info,      underline = true },
    ["@markup.link.url"]            = { fg = c.info,      underline = true },
    ["@markup.link.label"]          = { fg = c.keyword },
    ["@markup.list"]                = { fg = c.operator_ },
    ["@markup.list.checked"]        = { fg = c.ok },
    ["@markup.list.unchecked"]      = { fg = c.fg2 },
    ["@markup.strong"]              = { bold = true },
    ["@markup.italic"]              = { italic = true },
    ["@markup.strikethrough"]       = { strikethrough = true },
    ["@markup.underline"]           = { underline = true },

    ["@tag"]                        = { fg = c.keyword },
    ["@tag.attribute"]              = { fg = c.fn_ },
    ["@tag.builtin"]                = { fg = c.keyword },
    ["@tag.delimiter"]              = { fg = c.operator_ },

    ["@diff.plus"]                  = { fg = c.git_add },
    ["@diff.minus"]                 = { fg = c.git_delete },
    ["@diff.delta"]                 = { fg = c.git_change },
  })

  set({
    ["@lsp.type.class"]          = { link = "@type" },
    ["@lsp.type.comment"]        = { link = "@comment" },
    ["@lsp.type.decorator"]      = { link = "@attribute" },
    ["@lsp.type.enum"]           = { link = "@type" },
    ["@lsp.type.enumMember"]     = { link = "@constant" },
    ["@lsp.type.event"]          = { link = "@variable.member" },
    ["@lsp.type.function"]       = { link = "@function" },
    ["@lsp.type.interface"]      = { fg = c.type_ },
    ["@lsp.type.keyword"]        = { link = "@keyword" },
    ["@lsp.type.macro"]          = { link = "@constant.macro" },
    ["@lsp.type.method"]         = { link = "@function.method" },
    ["@lsp.type.modifier"]       = { link = "@keyword.modifier" },
    ["@lsp.type.namespace"]      = { link = "@module" },
    ["@lsp.type.number"]         = { link = "@number" },
    ["@lsp.type.operator"]       = { link = "@operator" },
    ["@lsp.type.parameter"]      = { link = "@variable.parameter" },
    ["@lsp.type.property"]       = { link = "@variable.member" },
    ["@lsp.type.regexp"]         = { link = "@string.regexp" },
    ["@lsp.type.string"]         = { link = "@string" },
    ["@lsp.type.struct"]         = { link = "@type" },
    ["@lsp.type.type"]           = { link = "@type" },
    ["@lsp.type.typeParameter"]  = { fg = c.type_ },
    ["@lsp.type.variable"]       = { link = "@variable" },
    ["@lsp.mod.deprecated"]      = { strikethrough = true },
    ["@lsp.mod.readonly"]        = { fg = c.const_ },
    ["@lsp.mod.static"]          = { italic = true },
    ["@lsp.mod.defaultLibrary"]  = { fg = c.fn_ },
  })

  set({
    DiagnosticError            = { fg = c.error_ },
    DiagnosticWarn             = { fg = c.warn },
    DiagnosticInfo             = { fg = c.info },
    DiagnosticHint             = { fg = c.hint },
    DiagnosticOk               = { fg = c.ok },
    DiagnosticUnnecessary      = { fg = c.fg3,    italic = italic },
    DiagnosticDeprecated       = { fg = c.fg3,    strikethrough = true },

    DiagnosticVirtualTextError = { fg = c.error_, bg = c.bg1, italic = italic },
    DiagnosticVirtualTextWarn  = { fg = c.warn,   bg = c.bg1, italic = italic },
    DiagnosticVirtualTextInfo  = { fg = c.info,   bg = c.bg1, italic = italic },
    DiagnosticVirtualTextHint  = { fg = c.hint,   bg = c.bg1, italic = italic },
    DiagnosticVirtualTextOk    = { fg = c.ok,     bg = c.bg1, italic = italic },

    DiagnosticUnderlineError   = { undercurl = true, sp = c.error_ },
    DiagnosticUnderlineWarn    = { undercurl = true, sp = c.warn },
    DiagnosticUnderlineInfo    = { undercurl = true, sp = c.info },
    DiagnosticUnderlineHint    = { undercurl = true, sp = c.hint },

    DiagnosticSignError        = { fg = c.error_ },
    DiagnosticSignWarn         = { fg = c.warn },
    DiagnosticSignInfo         = { fg = c.info },
    DiagnosticSignHint         = { fg = c.hint },

    LspReferenceText           = { bg = c.bg3 },
    LspReferenceRead           = { bg = c.bg3 },
    LspReferenceWrite          = { bg = c.bg3,    underline = true },
    LspSignatureActiveParameter= { fg = c.fn_,    underline = true },
    LspCodeLens                = { fg = c.fg3,    italic = true },
    LspCodeLensSeparator       = { fg = c.bg4 },
    LspInlayHint               = { fg = c.fg3,    bg = c.bg1, italic = true },
  })

  set({
    DiffAdd    = { fg = c.git_add,    bg = "#171e16" },
    DiffChange = { fg = c.git_change, bg = "#221e14" },
    DiffDelete = { fg = c.git_delete, bg = "#221614" },
    DiffText   = { fg = c.git_change, bg = "#2a2010" },
    diffAdded  = { link = "DiffAdd" },
    diffRemoved= { link = "DiffDelete" },
    diffChanged= { link = "DiffChange" },
    diffFile   = { fg = c.info },
    diffNewFile= { fg = c.ok },
    diffOldFile= { fg = c.error_ },
    diffLine   = { fg = c.fg3 },
  })

  set({
    GitSignsAdd            = { fg = c.git_add },
    GitSignsChange         = { fg = c.git_change },
    GitSignsDelete         = { fg = c.git_delete },
    GitSignsTopdelete      = { fg = c.git_delete },
    GitSignsChangedelete   = { fg = c.git_change },
    GitSignsUntracked      = { fg = c.fg3 },
    GitSignsAddNr          = { link = "GitSignsAdd" },
    GitSignsChangeNr       = { link = "GitSignsChange" },
    GitSignsDeleteNr       = { link = "GitSignsDelete" },
    GitSignsAddLn          = { bg = "#171e16" },
    GitSignsChangeLn       = { bg = "#221e14" },
    GitSignsDeleteLn       = { bg = "#221614" },
    GitSignsCurrentLineBlame = { fg = c.fg4,   italic = true },
    GitSignsAddInline      = { fg = c.bg,      bg = c.git_add },
    GitSignsDeleteInline   = { fg = c.bg,      bg = c.git_delete },
    GitSignsChangeInline   = { fg = c.bg,      bg = c.git_change },
  })

  set({
    BlinkCmpMenu           = { fg = c.fg,      bg = c.bg2 },
    BlinkCmpMenuBorder     = { fg = c.bg4,     bg = c.bg2 },
    BlinkCmpMenuSelection  = { fg = c.fg,      bg = c.selection },
    BlinkCmpScrollBarThumb = { bg = c.accent },
    BlinkCmpScrollBarGutter= { bg = c.bg3 },
    BlinkCmpLabel          = { fg = c.fg },
    BlinkCmpLabelDeprecated= { fg = c.fg3,     strikethrough = true },
    BlinkCmpLabelMatch     = { fg = c.accent,  bold = true },
    BlinkCmpLabelDetail    = { fg = c.fg2 },
    BlinkCmpLabelDescription = { fg = c.fg3 },
    BlinkCmpKind           = { fg = c.accent },
    BlinkCmpKindText       = { fg = c.fg2 },
    BlinkCmpKindMethod     = { fg = c.fn_ },
    BlinkCmpKindFunction   = { fg = c.fn_ },
    BlinkCmpKindConstructor= { fg = c.type_ },
    BlinkCmpKindField      = { fg = c.fg },
    BlinkCmpKindVariable   = { fg = c.fg },
    BlinkCmpKindClass      = { fg = c.type_ },
    BlinkCmpKindInterface  = { fg = c.type_ },
    BlinkCmpKindModule     = { fg = c.keyword },
    BlinkCmpKindProperty   = { fg = c.fg },
    BlinkCmpKindUnit       = { fg = c.number_ },
    BlinkCmpKindValue      = { fg = c.number_ },
    BlinkCmpKindEnum       = { fg = c.type_ },
    BlinkCmpKindKeyword    = { fg = c.keyword },
    BlinkCmpKindSnippet    = { fg = c.string_ },
    BlinkCmpKindColor      = { fg = c.keyword },
    BlinkCmpKindFile       = { fg = c.info },
    BlinkCmpKindReference  = { fg = c.type_ },
    BlinkCmpKindFolder     = { fg = c.info },
    BlinkCmpKindEnumMember = { fg = c.const_ },
    BlinkCmpKindConstant   = { fg = c.const_ },
    BlinkCmpKindStruct     = { fg = c.type_ },
    BlinkCmpKindEvent      = { fg = c.keyword },
    BlinkCmpKindOperator   = { fg = c.operator_ },
    BlinkCmpKindTypeParameter = { fg = c.type_ },
    BlinkCmpDoc            = { fg = c.fg,      bg = c.bg2 },
    BlinkCmpDocBorder      = { fg = c.bg4,     bg = c.bg2 },
    BlinkCmpDocSeparator   = { fg = c.bg4 },
    BlinkCmpDocCursorLine  = { bg = c.bg3 },
    BlinkCmpSignatureHelp       = { fg = c.fg,   bg = c.bg2 },
    BlinkCmpSignatureHelpBorder = { fg = c.bg4,  bg = c.bg2 },
    BlinkCmpSignatureHelpActiveParameter = { fg = c.fn_, underline = true },
    BlinkCmpGhostText      = { fg = c.fg4 },
  })

  set({
    TelescopeNormal         = { fg = c.fg,      bg = c.bg2 },
    TelescopeBorder         = { fg = c.bg4,     bg = c.bg2 },
    TelescopeTitle          = { fg = c.accent,  bg = c.bg2,  bold = true },
    TelescopePromptNormal   = { fg = c.fg,      bg = c.bg3 },
    TelescopePromptBorder   = { fg = c.bg5,     bg = c.bg3 },
    TelescopePromptTitle    = { fg = c.fn_,     bg = c.bg3,  bold = true },
    TelescopePromptPrefix   = { fg = c.accent },
    TelescopePromptCounter  = { fg = c.fg3 },
    TelescopePreviewNormal  = { fg = c.fg,      bg = c.bg },
    TelescopePreviewBorder  = { fg = c.bg4,     bg = c.bg },
    TelescopePreviewTitle   = { fg = c.type_,   bg = c.bg,   bold = true },
    TelescopeResultsNormal  = { fg = c.fg,      bg = c.bg2 },
    TelescopeResultsBorder  = { fg = c.bg4,     bg = c.bg2 },
    TelescopeResultsTitle   = { fg = c.fg3,     bg = c.bg2 },
    TelescopeResultsDiffAdd    = { fg = c.git_add },
    TelescopeResultsDiffChange = { fg = c.git_change },
    TelescopeResultsDiffDelete = { fg = c.git_delete },
    TelescopeResultsDiffUntracked = { fg = c.fg3 },
    TelescopeMatching       = { fg = c.accent,  bold = true },
    TelescopeSelection      = { fg = c.fg,      bg = c.selection },
    TelescopeSelectionCaret = { fg = c.accent,  bg = c.selection },
    TelescopeMultiSelection = { fg = c.type_ },
    TelescopeMultiIcon      = { fg = c.accent },
  })

  set({
    FzfLuaNormal        = { fg = c.fg,      bg = c.bg2 },
    FzfLuaBorder        = { fg = c.bg4,     bg = c.bg2 },
    FzfLuaTitle         = { fg = c.accent,  bg = c.bg2,  bold = true },
    FzfLuaPreviewNormal = { fg = c.fg,      bg = c.bg },
    FzfLuaPreviewBorder = { fg = c.bg4,     bg = c.bg },
    FzfLuaPreviewTitle  = { fg = c.fn_,     bg = c.bg },
    FzfLuaScrollFloat   = { fg = c.bg4 },
    FzfLuaScrollChars   = { fg = c.accent },
    FzfLuaHeaderBind    = { fg = c.type_ },
    FzfLuaHeaderText    = { fg = c.fg1 },
    FzfLuaPathColNr     = { fg = c.number_, bold = true },
    FzfLuaPathLineNr    = { fg = c.fn_,     bold = true },
    FzfLuaBufName       = { fg = c.info },
    FzfLuaBufNr         = { fg = c.number_ },
    FzfLuaBufFlagCur    = { fg = c.accent },
    FzfLuaBufFlagAlt    = { fg = c.fg2 },
    FzfLuaTabTitle      = { fg = c.fn_ },
    FzfLuaTabMarker     = { fg = c.accent },
    FzfLuaDirIcon       = { fg = c.info },
    FzfLuaLiveSym       = { fg = c.keyword },
  })

  set({
    NeoTreeNormal          = { fg = c.fg,      bg = c.bg1 },
    NeoTreeNormalNC        = { fg = c.fg1,     bg = c.bg1 },
    NeoTreeFloatNormal     = { fg = c.fg,      bg = c.bg2 },
    NeoTreeFloatBorder     = { fg = c.bg4,     bg = c.bg2 },
    NeoTreeFloatTitle      = { fg = c.accent,  bg = c.bg2,  bold = true },
    NeoTreeVertSplit       = { fg = c.bg4,     bg = c.bg1 },
    NeoTreeWinSeparator    = { fg = c.bg4,     bg = c.bg1 },
    NeoTreeEndOfBuffer     = { fg = c.bg1,     bg = c.bg1 },
    NeoTreeRootName        = { fg = c.accent,  bold = true },
    NeoTreeFileName        = { fg = c.fg },
    NeoTreeFileNameOpened  = { fg = c.accent },
    NeoTreeFileIcon        = { fg = c.fn_ },
    NeoTreeFileStats       = { fg = c.fg3 },
    NeoTreeFileStatsHeader = { fg = c.fg2,     bold = true },
    NeoTreeDirectoryName   = { fg = c.fn_ },
    NeoTreeDirectoryIcon   = { fg = c.fn_ },
    NeoTreeSymbolicLinkTarget = { fg = c.type_ },
    NeoTreeGitAdded        = { fg = c.git_add },
    NeoTreeGitConflict     = { fg = c.warn },
    NeoTreeGitDeleted      = { fg = c.git_delete },
    NeoTreeGitIgnored      = { fg = c.fg4 },
    NeoTreeGitModified     = { fg = c.git_change },
    NeoTreeGitUnstaged     = { fg = c.git_change },
    NeoTreeGitUntracked    = { fg = c.fg2 },
    NeoTreeGitStaged       = { fg = c.git_add },
    NeoTreeIndentMarker    = { fg = c.bg5 },
    NeoTreeExpander        = { fg = c.fg3 },
    NeoTreeDotfile         = { fg = c.fg3 },
    NeoTreeHiddenByName    = { fg = c.fg4 },
    NeoTreeFilterTerm      = { fg = c.string_ },
    NeoTreeModified        = { fg = c.git_change },
    NeoTreeDimText         = { fg = c.fg4 },
    NeoTreeTabInactive     = { fg = c.fg3,     bg = c.bg1 },
    NeoTreeTabActive       = { fg = c.fg,      bg = c.bg },
    NeoTreeTabSeparatorActive   = { fg = c.accent },
    NeoTreeTabSeparatorInactive = { fg = c.bg4 },
  })

  set({
    WhichKey          = { fg = c.accent },
    WhichKeyBorder    = { fg = c.bg4,    bg = c.bg2 },
    WhichKeyDesc      = { fg = c.fg },
    WhichKeyFloat     = { fg = c.fg,     bg = c.bg2 },
    WhichKeyGroup     = { fg = c.type_,  bold = true },
    WhichKeyIcon      = { fg = c.keyword },
    WhichKeyNormal    = { fg = c.fg,     bg = c.bg2 },
    WhichKeySeparator = { fg = c.fg3 },
    WhichKeyTitle     = { fg = c.accent, bold = true },
    WhichKeyValue     = { fg = c.string_ },
  })

  set({
    IblIndent     = { fg = c.bg4,  nocombine = true },
    IblScope      = { fg = c.bg5,  nocombine = true },
    IblWhitespace = { fg = c.bg4,  nocombine = true },
    IndentBlanklineChar               = { fg = c.bg4,   nocombine = true },
    IndentBlanklineSpaceChar          = { fg = c.bg4,   nocombine = true },
    IndentBlanklineSpaceCharBlankline = { fg = c.bg4,   nocombine = true },
    IndentBlanklineContextChar        = { fg = c.accent, nocombine = true },
    IndentBlanklineContextStart       = { underline = true, sp = c.accent },
  })

  set({
    LualineNormalA  = { fg = c.bg,  bg = c.accent,  bold = true },
    LualineNormalB  = { fg = c.fg,  bg = c.bg3 },
    LualineNormalC  = { fg = c.fg1, bg = c.bg1 },
    LualineInsertA  = { fg = c.bg,  bg = c.fn_,     bold = true },
    LualineInsertB  = { fg = c.fg,  bg = c.bg3 },
    LualineVisualA  = { fg = c.bg,  bg = c.keyword, bold = true },
    LualineVisualB  = { fg = c.fg,  bg = c.bg3 },
    LualineReplaceA = { fg = c.bg,  bg = c.error_,  bold = true },
    LualineReplaceB = { fg = c.fg,  bg = c.bg3 },
    LualineCommandA = { fg = c.bg,  bg = c.string_, bold = true },
    LualineCommandB = { fg = c.fg,  bg = c.bg3 },
    LualineInactive = { fg = c.fg3, bg = c.bg1 },
  })

  set({
    BufferLineBackground     = { fg = c.fg2,    bg = c.bg1 },
    BufferLineBuffer         = { fg = c.fg2,    bg = c.bg1 },
    BufferLineBufferSelected = { fg = c.fg,     bg = c.bg,  bold = true },
    BufferLineBufferVisible  = { fg = c.fg1,    bg = c.bg },
    BufferLineCloseButton    = { fg = c.fg3,    bg = c.bg1 },
    BufferLineCloseButtonSelected = { fg = c.error_, bg = c.bg },
    BufferLineCloseButtonVisible  = { fg = c.fg2,    bg = c.bg },
    BufferLineDiagnostic     = { fg = c.fg3,    bg = c.bg1 },
    BufferLineDiagnosticSelected = { fg = c.fg2, bg = c.bg },
    BufferLineError          = { fg = c.error_, bg = c.bg1 },
    BufferLineErrorSelected  = { fg = c.error_, bg = c.bg },
    BufferLineWarning        = { fg = c.warn,   bg = c.bg1 },
    BufferLineWarningSelected= { fg = c.warn,   bg = c.bg },
    BufferLineInfo           = { fg = c.info,   bg = c.bg1 },
    BufferLineInfoSelected   = { fg = c.info,   bg = c.bg },
    BufferLineHint           = { fg = c.hint,   bg = c.bg1 },
    BufferLineHintSelected   = { fg = c.hint,   bg = c.bg },
    BufferLineModified       = { fg = c.git_change, bg = c.bg1 },
    BufferLineModifiedSelected = { fg = c.git_change, bg = c.bg },
    BufferLineModifiedVisible  = { fg = c.git_change, bg = c.bg },
    BufferLineDuplicate      = { fg = c.fg4,    bg = c.bg1 },
    BufferLineDuplicateSelected = { fg = c.fg3, bg = c.bg },
    BufferLineSeparator      = { fg = c.bg4,    bg = c.bg1 },
    BufferLineSeparatorSelected = { fg = c.bg4, bg = c.bg },
    BufferLineTab            = { fg = c.fg2,    bg = c.bg1 },
    BufferLineTabSelected    = { fg = c.accent, bg = c.bg,  bold = true },
    BufferLineTabClose       = { fg = c.error_, bg = c.bg1 },
    BufferLineTabSeparator   = { fg = c.bg4,    bg = c.bg1 },
    BufferLineTabSeparatorSelected = { fg = c.accent, bg = c.bg },
    BufferLineFill           = { bg = c.bg1 },
    BufferLineIndicatorSelected = { fg = c.accent },
    BufferLineIndicatorVisible  = { fg = c.bg4 },
    BufferLineNumbers        = { fg = c.fg3,    bg = c.bg1 },
    BufferLineNumbersSelected = { fg = c.accent, bg = c.bg, bold = true },
    BufferLineNumbersVisible  = { fg = c.fg2,   bg = c.bg },
    BufferLinePick           = { fg = c.keyword, bg = c.bg1, bold = true },
    BufferLinePickSelected   = { fg = c.keyword, bg = c.bg,  bold = true },
    BufferLinePickVisible    = { fg = c.keyword, bg = c.bg },
    BufferLineGroupLabel     = { fg = c.bg,     bg = c.accent },
    BufferLineGroupSeparator = { fg = c.bg4,    bg = c.bg1 },
    BufferLineOffsetSeparator = { fg = c.bg4,   bg = c.bg },
    BufferLineTruncMarker    = { fg = c.fg3,    bg = c.bg1 },
  })

  set({
    SnacksDashboardNormal = { fg = c.fg,     bg = c.bg },
    SnacksDashboardDesc   = { fg = c.fg1 },
    SnacksDashboardFile   = { fg = c.fn_ },
    SnacksDashboardDir    = { fg = c.fg2 },
    SnacksDashboardDate   = { fg = c.fg3 },
    SnacksDashboardFooter = { fg = c.fg4 },
    SnacksDashboardHeader = { fg = c.accent },
    SnacksDashboardIcon   = { fg = c.accent },
    SnacksDashboardKey    = { fg = c.type_,  bold = true },
    SnacksDashboardTitle  = { fg = c.accent, bold = true },
    SnacksIndent          = { fg = c.bg4 },
    SnacksIndentScope     = { fg = c.accent },
    SnacksNotifierInfo    = { fg = c.info },
    SnacksNotifierWarn    = { fg = c.warn },
    SnacksNotifierError   = { fg = c.error_ },
    SnacksPickerNormal    = { fg = c.fg,     bg = c.bg2 },
    SnacksPickerBorder    = { fg = c.bg4,    bg = c.bg2 },
    SnacksPickerTitle     = { fg = c.accent, bg = c.bg2, bold = true },
    SnacksPickerMatch     = { fg = c.accent, bold = true },
  })

  set({
    MiniStatuslineModeNormal  = { fg = c.bg, bg = c.accent,  bold = true },
    MiniStatuslineModeInsert  = { fg = c.bg, bg = c.fn_,     bold = true },
    MiniStatuslineModeVisual  = { fg = c.bg, bg = c.keyword, bold = true },
    MiniStatuslineModeReplace = { fg = c.bg, bg = c.error_,  bold = true },
    MiniStatuslineModeCommand = { fg = c.bg, bg = c.string_, bold = true },
    MiniStatuslineModeOther   = { fg = c.bg, bg = c.type_,   bold = true },
    MiniStatuslineDevinfo     = { fg = c.fg2, bg = c.bg3 },
    MiniStatuslineFileinfo    = { fg = c.fg2, bg = c.bg3 },
    MiniStatuslineFilename    = { fg = c.fg1, bg = c.bg1 },
    MiniStatuslineInactive    = { fg = c.fg3, bg = c.bg1 },
    MiniTablineCurrent        = { fg = c.fg,  bg = c.bg,  bold = true },
    MiniTablineFill           = { bg = c.bg1 },
    MiniTablineHidden         = { fg = c.fg3, bg = c.bg1 },
    MiniTablineModifiedCurrent = { fg = c.git_change, bg = c.bg, bold = true },
    MiniTablineModifiedHidden  = { fg = c.git_change, bg = c.bg1 },
    MiniTablineVisible         = { fg = c.fg1, bg = c.bg },
    MiniIndentscopeSymbol      = { fg = c.accent },
    MiniCursorword             = { bg = c.bg3 },
    MiniCursorwordCurrent      = { bg = c.bg3 },
    MiniJump                   = { fg = c.bg, bg = c.accent },
    MiniJump2dSpot             = { fg = c.keyword, bold = true, nocombine = true },
    MiniJump2dSpotAhead        = { fg = c.fn_,     nocombine = true },
    MiniJump2dSpotUnique       = { fg = c.type_,   bold = true, nocombine = true },
    MiniJump2dDim              = { fg = c.fg4 },
    MiniHipatternsFixme        = { fg = c.bg, bg = c.error_,   bold = true },
    MiniHipatternsHack         = { fg = c.bg, bg = c.warn,     bold = true },
    MiniHipatternsNote         = { fg = c.bg, bg = c.hint,     bold = true },
    MiniHipatternsTodo         = { fg = c.bg, bg = c.type_,    bold = true },
    MiniPickMatchCurrent       = { bg = c.selection },
    MiniPickMatchRanges        = { fg = c.accent, bold = true },
    MiniPickPrompt             = { fg = c.accent },
  })

  set({
    NoiceCmdline          = { fg = c.fg,     bg = c.bg2 },
    NoiceCmdlineIcon      = { fg = c.accent },
    NoiceCmdlineIconSearch= { fg = c.string_ },
    NoiceCmdlinePopup     = { fg = c.fg,     bg = c.bg2 },
    NoiceCmdlinePopupBorder = { fg = c.bg4,  bg = c.bg2 },
    NoiceCmdlinePopupTitle  = { fg = c.accent, bold = true },
    NoiceFormatLevelError = { fg = c.error_ },
    NoiceFormatLevelWarn  = { fg = c.warn },
    NoiceFormatLevelInfo  = { fg = c.info },
    NoiceFormatProgressDone = { fg = c.ok },
    NoiceFormatTitle      = { fg = c.accent, bold = true },
    NoiceScrollbarThumb   = { bg = c.accent },
  })

  set({
    LazyNormal      = { fg = c.fg,     bg = c.bg2 },
    LazyH1          = { fg = c.bg,     bg = c.accent, bold = true },
    LazyH2          = { fg = c.accent, bold = true },
    LazyButton      = { fg = c.fg,     bg = c.bg3 },
    LazyButtonActive= { fg = c.fg,     bg = c.selection, bold = true },
    LazyCommit      = { fg = c.fn_ },
    LazyCommitType  = { fg = c.keyword, bold = true },
    LazyCommitScope = { fg = c.type_,  italic = true },
    LazyDir         = { fg = c.info },
    LazyUrl         = { fg = c.info,   underline = true },
    LazyProgressDone = { fg = c.ok },
  })

  set({
    TroubleNormal   = { fg = c.fg,     bg = c.bg1 },
    TroubleNormalNC = { fg = c.fg1,    bg = c.bg1 },
    TroubleError    = { fg = c.error_ },
    TroubleWarn     = { fg = c.warn },
    TroubleInfo     = { fg = c.info },
    TroubleHint     = { fg = c.hint },
    TroubleFileName = { fg = c.fn_ },
    TroublePos      = { fg = c.number_ },
    TroubleSource   = { fg = c.type_ },
  })

  set({
    TodoFgFIX  = { fg = c.error_ },
    TodoFgHACK = { fg = c.warn },
    TodoFgNOTE = { fg = c.hint },
    TodoFgTODO = { fg = c.type_ },
    TodoFgWARN = { fg = c.warn },
    TodoBgFIX  = { fg = c.bg, bg = c.error_,  bold = true },
    TodoBgHACK = { fg = c.bg, bg = c.warn,    bold = true },
    TodoBgNOTE = { fg = c.bg, bg = c.hint,    bold = true },
    TodoBgTODO = { fg = c.bg, bg = c.type_,   bold = true },
    TodoBgWARN = { fg = c.bg, bg = c.warn,    bold = true },
    TodoSignFIX  = { link = "TodoFgFIX" },
    TodoSignHACK = { link = "TodoFgHACK" },
    TodoSignNOTE = { link = "TodoFgNOTE" },
    TodoSignTODO = { link = "TodoFgTODO" },
    TodoSignWARN = { link = "TodoFgWARN" },
  })

  set({
    FlashBackdrop  = { fg = c.fg4 },
    FlashLabel     = { fg = c.bg,  bg = c.keyword, bold = true },
    FlashMatch     = { fg = c.accent, bg = c.match },
    FlashCurrent   = { fg = c.bg,  bg = c.accent,  bold = true },
    FlashCursor    = { reverse = true },
    FlashPrompt    = { fg = c.accent, bold = true },
  })

  set({
    TreesitterContext           = { bg = c.bg1 },
    TreesitterContextLineNumber = { fg = c.linenr, bg = c.bg1 },
    TreesitterContextSeparator  = { fg = c.bg4 },
    TreesitterContextBottom     = { underline = true, sp = c.bg4 },
  })

  set({
    RenderMarkdownH1   = { fg = c.string_,  bold = true },
    RenderMarkdownH2   = { fg = c.fn_,      bold = true },
    RenderMarkdownH3   = { fg = c.type_,    bold = true },
    RenderMarkdownH4   = { fg = c.keyword,  bold = true },
    RenderMarkdownH5   = { fg = c.const_,   bold = true },
    RenderMarkdownH6   = { fg = c.fg1,      bold = true },
    RenderMarkdownH1Bg = { bg = "#221e14" },
    RenderMarkdownH2Bg = { bg = "#1e1c16" },
    RenderMarkdownH3Bg = { bg = "#191e18" },
    RenderMarkdownH4Bg = { bg = "#201818" },
    RenderMarkdownH5Bg = { bg = "#1e1c16" },
    RenderMarkdownH6Bg = { bg = "#1c1c1e" },
    RenderMarkdownCode = { bg = c.bg3 },
    RenderMarkdownCodeInline = { fg = c.string_, bg = c.bg3 },
    RenderMarkdownBullet = { fg = c.accent },
    RenderMarkdownLink = { fg = c.info, underline = true },
    RenderMarkdownChecked   = { fg = c.ok },
    RenderMarkdownUnchecked = { fg = c.fg3 },
  })

  set({
    IlluminatedWordText  = { bg = c.bg3 },
    IlluminatedWordRead  = { bg = c.bg3 },
    IlluminatedWordWrite = { bg = c.bg3, underline = true },
  })

  set({
    YankyPut    = { fg = c.bg, bg = c.ok },
    YankyYanked = { fg = c.bg, bg = c.string_ },
  })

  if opts.terminal_colors then
    local tc = c.term
    vim.g.terminal_color_0  = tc.black
    vim.g.terminal_color_1  = tc.red
    vim.g.terminal_color_2  = tc.green
    vim.g.terminal_color_3  = tc.yellow
    vim.g.terminal_color_4  = tc.blue
    vim.g.terminal_color_5  = tc.magenta
    vim.g.terminal_color_6  = tc.cyan
    vim.g.terminal_color_7  = tc.white
    vim.g.terminal_color_8  = tc.bright_black
    vim.g.terminal_color_9  = tc.bright_red
    vim.g.terminal_color_10 = tc.bright_green
    vim.g.terminal_color_11 = tc.bright_yellow
    vim.g.terminal_color_12 = tc.bright_blue
    vim.g.terminal_color_13 = tc.bright_magenta
    vim.g.terminal_color_14 = tc.bright_cyan
    vim.g.terminal_color_15 = tc.bright_white
  end
end

return M
