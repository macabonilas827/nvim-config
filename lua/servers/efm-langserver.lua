return function(lspconfig, capabilities, on_attach)
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")

	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")

	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local hadolint = require("efmls-configs.linters.hadolint")

	local cpplint = require("efmls-configs.linters.cpplint")
	local clang_format = require("efmls-configs.formatters.clang_format")

	lspconfig.efm.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"c",
			"cpp",
			"lua",
			"python",
			"sh",
			"docker",
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
				c = { cpplint, clang_format },
				cpp = { cpplint, clang_format },
				lua = { luacheck, stylua },
				python = { flake8, black },
				sh = { shellcheck, shfmt },
				docker = { hadolint, prettier_d },
			},
		},
	})
end
