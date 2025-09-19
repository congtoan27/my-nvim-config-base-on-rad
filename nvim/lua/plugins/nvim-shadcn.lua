return {
	"BibekBhusal/nvim-shadcn",
	opts = {},
	cmd = { "ShadcnAdd" },
	keys = {
		{ "<leader>sa", ":ShadcnAdd<CR>", desc = "Add shadcn component" },
		{ "<leader>si", ":ShadcnInit<CR>", desc = "Init shadcn" },
		{ "<leader>sI", ":ShadcnAddImportant<CR>", desc = "Add important shadcn component" },
	},
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("nvim-shadcn").setup({
			default_installer = "npm",

			format = {
				doc = "https://ui.shadcn.com/docs/components/%s", -- or https://mynaui.com/components/%s
				npm = "npx shadcn@latest add %s",
				pnpm = "pnpm dlx shadcn@latest add %s",
				yarn = "npx shadcn@latest add %s",
				bun = "bunx --bun shadcn@latest add %s",
			},

			verbose = false,
			important = { "button", "card", "checkbox", "tooltip" }, -- this will be added when running `:ShadcnAddImportant`

			keys = { -- for telescope
				i = { doc = "<C-o>" },
				n = { doc = "<C-o>" },
			},

			init_command = {
				commands = {
					npm = "npx shadcn@latest init",
					pnpm = "pnpm dlx shadcn@latest init",
					yarn = "npx shadcn@latest init",
					bun = "bunx --bun shadcn@latest init",
				},
				flags = { defaults = false, force = false },
				default_color = "Gray", -- Must be capitalized
			},

			telescope_config = {
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
				},
				prompt_title = "Shadcn UI components",
			},
		})
	end,
}
