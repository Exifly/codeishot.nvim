-- Dependencies
-- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim): Una libreria Lua piena di utilità per scrivere plugin Neovim.


-- Checks for neovim version
if vim.fn.has("nvim-0.7.0") ~= 1 then
	vim.api.nvim_err_writeln("Example.nvim requires at least nvim-0.7.0.")
end

-- Checks for Dependencies
local status_ok, plenary = pcall(require, "plenary")
if not status_ok then
	error("This plugin requires plenary.nvim (https://github.com/nvim-lua/plenary.nvim)")
	return
end

-- Imports the plugin's additional Lua modules.
local codeishot = require("codeishot.setup")

-- Creates an object for the module. All of the module's
-- functions are associated with this object, which is
-- returned when the module is called with `require`.
local M = {}

-- Routes calls made to this module to functions in the
-- plugin's other modules.
M.setup = codeishot.setup

return M
