local http = require('plenary.curl')
local endpoint = "https://api.codeishot.com/api/snippets/"
local base_url = "https://codeishot.com/%s"

local M = {}

local function get_visual_selection()
	-- Get the original cursor position
	local save_pos = vim.fn.getpos(".")

	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	-- Calculates the beginning of the rows and positions
	local start_line, start_col = start_pos[2], start_pos[3]
	local end_line, end_col = end_pos[2], end_pos[3]

	-- Extract the text
	local lines = vim.fn.getline(start_line, end_line)
	if #lines == 0 then return '' end
	lines[1] = string.sub(lines[1], start_col)
	lines[#lines] = string.sub(lines[#lines], 1, end_col)

	-- Restore the cursor position
	vim.fn.setpos('.', save_pos)

	return table.concat(lines, '\n')
end

local function show_response_window(response)
	local buf = vim.api.nvim_create_buf(false, true) -- Temporary Buffer

	local decoded_response
	if response and response["body"] then
		decoded_response = vim.json.decode(response["body"])
	else
		print("Not a valid response")
		return
	end

	-- Extract the id from the response
	local id = decoded_response and decoded_response["id"]
	if not id then
		print("ID not found")
		return
	end

	local full_endpoint = string.format(base_url, id)
	local lines = { full_endpoint }

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

	local width = vim.api.nvim_get_option("columns")
	local height = vim.api.nvim_get_option("lines")

	local win_height = math.ceil(height * 0.01)
	local win_width = math.ceil(width * 0.15)

	local row = height - win_height - 2 -- Below the status line
	local col = math.ceil((width - win_width) / 2)

	local opts = {
		relative = "editor",
		width = win_width,
		height = win_height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded"
	}

	vim.api.nvim_open_win(buf, true, opts) -- Open window buffer
end

function M.share()
	local data = {
		title = "untitled",
		language = "python",
		style = "androidstudio",
		code = get_visual_selection(),
	}

	-- Going back to normal mode
	vim.api.nvim_command('visual!')

	http.post(endpoint, {
		body = data,
		callback = function(response)
			vim.schedule(function()
				show_response_window(response)
			end)
		end
	})
end

return M
