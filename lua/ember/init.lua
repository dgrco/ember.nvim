-- ember.nvim — init.lua
-- Usage: require("ember").setup()
-- or just: vim.cmd("colorscheme ember")

local M = {}

---@class EmberConfig
---@field italic_comments boolean   default: false
---@field bold_keywords   boolean   default: false
---@field transparent     boolean   default: false
---@field terminal_colors boolean   default: true
---@field on_highlights   function? optional: fn(highlights, colors)
---@field on_colors       function? optional: fn(colors)

---@type EmberConfig
M.defaults = {
  italic_comments = false,
  bold_keywords   = false,
  transparent     = false,
  terminal_colors = true,
  on_highlights   = nil,
  on_colors       = nil,
}

---@type EmberConfig
M.config = {}

---@param opts? EmberConfig
function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

function M.load()
  local cfg = vim.tbl_deep_extend("force", M.defaults, M.config or {})

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name   = "ember"

  local palette = require("ember.palette")
  local colors  = vim.deepcopy(palette.colors)

  if cfg.on_colors then
    cfg.on_colors(colors)
  end

  if cfg.transparent then
    colors.bg  = "NONE"
    colors.bg1 = "NONE"
  end

  local hl = require("ember.highlights")
  hl.apply(colors, cfg)

  if cfg.on_highlights then
    local overrides = {}
    cfg.on_highlights(overrides, colors)
    for name, vals in pairs(overrides) do
      vim.api.nvim_set_hl(0, name, vals)
    end
  end
end

return M
