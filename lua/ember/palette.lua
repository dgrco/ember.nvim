local M = {}

M.colors = {
  -- Backgrounds — Charcoal Slate
  bg         = "#161616",
  bg1        = "#1c1c1e",
  bg2        = "#222222",
  bg3        = "#282828",
  bg4        = "#2e2e2e",
  bg5        = "#343434",

  -- Foregrounds
  fg         = "#ddd0c0",
  fg1        = "#c4b8a8",
  fg2        = "#a89888",
  fg3        = "#7a6e64",
  fg4        = "#3e3830",

  -- Syntax — Ember palette
  keyword    = "#c4605a",  -- crimson red — keywords, control flow
  fn_        = "#c87848",  -- sandstone — functions, methods
  string_    = "#e8c87a",  -- amber gold — strings
  string2    = "#d4b460",  -- deeper amber — string variants
  type_      = "#b8c4a8",  -- sage — types, structs, interfaces
  const_     = "#c87848",  -- wheat — constants
  number_    = "#e8c87a",  -- same as string (amber)
  operator_  = "#7a6e64",  -- muted — punctuation, operators
  comment_   = "#6a5e50",  -- dark warm gray — comments

  -- UI accents derived from the syntax palette
  accent     = "#e0b870",  -- sandstone — primary UI accent
  accent2    = "#b8c4a8",  -- sage — secondary accent
  selection  = "#2d2d2d",
  cursorline = "#1e1c1a",
  linenr     = "#3e3830",
  linenr_cur = "#7a6e64",
  match      = "#2e2a22",
  match_cur  = "#3a3428",

  -- Diagnostics
  error_     = "#c4605a",  -- crimson
  warn       = "#e8c87a",  -- amber
  info       = "#b8c4a8",  -- sage
  hint       = "#e0b870",  -- sandstone
  ok         = "#a0b890",  -- muted green

  -- Git
  git_add    = "#a0b890",
  git_change = "#e0b870",
  git_delete = "#c4605a",
  git_text   = "#e0b870",

  -- Terminal
  term = {
    black          = "#1a1614",
    red            = "#c4605a",
    green          = "#a0b890",
    yellow         = "#e8c87a",
    blue           = "#98a8b8",
    magenta        = "#b8a898",
    cyan           = "#98b8a8",
    white          = "#ddd0c0",
    bright_black   = "#6a5e50",
    bright_red     = "#d47870",
    bright_green   = "#b0c8a0",
    bright_yellow  = "#f0d488",
    bright_blue    = "#a8b8c8",
    bright_magenta = "#c8b8a8",
    bright_cyan    = "#a8c8b8",
    bright_white   = "#ede4d4",
  },

  none = "NONE",
}

return M
