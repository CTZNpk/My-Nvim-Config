local servers = {
	"lua_ls",
	"pylsp",
	"jsonls",
	"clangd",
	-- "dartls",
	"tsserver",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("Haider.lsp.handlers").on_attach,
		capabilities = require("Haider.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "Haider.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end
	-- if server == "pylsp" then
	-- 	-- Adjust configuration for pylsp to disable pyflakes
	-- 	opts = {
	-- 		server = {
	-- 			pylsp = {
	-- 				settings = {
	-- 					pylsp = {
	-- 						plugins = {
	-- 							pyflakes = { enabled = false },
	-- 						},
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 	}
	-- end

	lspconfig[server].setup(opts)
end
