-- Modules
-- require('codeishot.curl').post();
local snippets = require("codeishot.snippets")

-- Creates an object for the module.
local M = {}

function M.setup(opts)
	opts = opts or {}

	vim.keymap.set("v", "<C-S-l>", function()
		if opts.name then
			print("Publishing on codeishot, " .. opts.name)
		else
			M.publish()
		end
	end)
end

-- Publish a code snippet on codeishot
function M.publish()
	print("Publishing on codeishot..")
	snippets.share()
end

return M
