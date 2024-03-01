return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		-- LSP Support
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",

		-- Autocompletion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",

		-- Snippets
		{ "L3MON4D3/LuaSnip", version = "2.*", build = "make install_jsregexp" },
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",

		-- Yooo
		{ "j-hui/fidget.nvim", opts = {} },
	},
	event = "VeryLazy",
	config = function()
		local function isNixOS()
			local file = io.open("/etc/os-release", "r")

			if file then
				local content = file:read("*all")
				file:close()

				-- Check if the content of the file contains "NixOS"
				return string.match(content, "NixOS") ~= nil
			else
				return false -- File not found, not NixOS
			end
		end

		local nixhost = isNixOS()

		local lsp = require("lsp-zero").preset({
			manage_nvim_cmp = {
				set_extra_mappings = true,
			},
		})

		lsp.extend_cmp()
		lsp.set_sign_icons({
			error = "✘",
			warn = "▲",
			hint = "⚑",
			info = "»",
		})

		lsp.on_attach(function(client, buf)
			lsp.default_keymaps({
				buffer = buf,
				include = {
					"K", -- Hover
					"gl", -- diagnostic open float
					"gr", -- references
					"gd", -- definition
					"gD", -- declaration
					"gi", -- implementation
					"go", -- type definition
					"gs", -- signiture help
					"[d", -- next/prev error
					"]d",
				},
				exclude = { "f2", "f3", "f4" },
			})

			local opts = { buffer = buf, remap = false }
			vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
			vim.keymap.set("n", "<leader>ra", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			vim.keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)

			vim.keymap.set("n", "<leader>f", function()
				require("conform").format({ async = true, lsp_fallback = true })
			end)
		end)

		local lsp_langs = {
			"jsonls",
			"lua_ls",
			"pyright",
		}
		if nixhost then
			lsp_langs = {
				"gopls",
				"html",
				"htmx",
				"jdtls",
				"jsonls",
				"kotlin_language_server",
				"lua_ls",
				"nil_ls",
				"pyright",
				"rnix",
			}
		end

		require("mason").setup({})
		Map("n", "<leader>m", vim.cmd.Mason)
		require("mason-tool-installer").setup({ ensure_installed = { "stylua", "isort" } })
		vim.api.nvim_command("MasonToolsInstall")
		require("mason-lspconfig").setup({
			ensure_installed = lsp_langs,
			handlers = { lsp.default_setup },
		})

		local lspconfig = require("lspconfig")
		lspconfig.jsonls.setup({})
		lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
		lspconfig.pyright.setup({})

		if nixhost then
			lspconfig.clangd.setup({}) -- Not installed with Mason
			lspconfig.dartls.setup({}) -- Not installed with Mason
			lspconfig.gopls.setup({})
			lspconfig.html.setup({})
			lspconfig.htmx.setup({})
			lspconfig.jdtls.setup({})
			lspconfig.kotlin_language_server.setup({})
			lspconfig.nil_ls.setup({})
			lspconfig.rnix.setup({})
		end

		require("luasnip.loaders.from_vscode").lazy_load()

		local cmp = require("cmp")
		local cmp_action = require("lsp-zero").cmp_action()

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "nvim_lua" },
				{ name = "path" },
				{ name = "buffer" },
			},
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp_action.tab_complete(),
				["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
			},
		})
	end,
}
