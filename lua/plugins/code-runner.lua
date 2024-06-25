return {
	"CRAG666/code_runner.nvim",

	config = function()
		require("code_runner").setup({
			-- put here the commands by filetype
			startinsert = true,
			filetype = {
				java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
				python = "python3 -u",
				typescript = "deno run",
				rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
				cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
				dart = "cd $dir && dart $fileName",
			},
		})
	end,
}
