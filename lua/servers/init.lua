local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("utils.lsp").on_attach
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
				},
			},
		},
	},
})

local luacheck = require("efmls-configs.linters.luacheck")
local stylua = require("efmls-configs.formatters.stylua")

local flake8 = require("efmls-configs.linters.flake8")
local black = require("efmls-configs.formatters.black")

lspconfig.efm.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"lua",
    "python",
	},
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
		hover = true,
		documentSymbol = true,
		codeAction = true,
		completion = true,
	},
	settings = {
		languages = {
			lua = { luacheck, stylua },
      python = { flake8, black },
		},
	},
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		pyright = {
			disableOrganizeImport = false,
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
				autoImportCompletion = true,
			},
		},
	},
})
