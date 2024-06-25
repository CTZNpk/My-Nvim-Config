return {
	"lewis6991/gitsigns.nvim",

	config = function()
		local status_ok, gitsigns = pcall(require, "gitsigns")
		if not status_ok then
			return
		end

		gitsigns.setup({
			signcolumn = true, -- toggle with `:gitsigns toggle_signs`
			numhl = false, -- toggle with `:gitsigns toggle_numhl`
			linehl = false, -- toggle with `:gitsigns toggle_linehl`
			word_diff = false, -- toggle with `:gitsigns toggle_word_diff`
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			attach_to_untracked = true,
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- use default
			max_file_length = 40000,
			preview_config = {
				-- Options passed to nvim_open_win
				border = "rounded",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		})
	end,
}
