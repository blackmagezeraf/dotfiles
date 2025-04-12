colorscheme_chooser = 0
if colorscheme_chooser == 1 then
	-- TokyoNight colorscheme
	return {
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
				styles = {
					sidebars = "transparent",
				},
			}
		end,
	}
else
	-- Rose Pine colorscheme
	return {
		{
			"rose-pine/neovim",
			priority = 1000,
			config = function()
				require("rose-pine").setup({
					variant = "auto", -- auto, main, moon, or dawn
					dark_variant = "main", -- main, moon, or dawn
					dim_inactive_windows = false,
					extend_background_behind_borders = false,

					enable = {
						terminal = true,
						legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
						migrations = true, -- Handle deprecated options automatically
					},

					styles = {
						bold = true,
						italic = true,
						transparency = true,
					},

					groups = {
						border = "muted",
						link = "iris",
						panel = "surface",

						error = "love",
						hint = "iris",
						info = "foam",
						note = "pine",
						todo = "rose",
						warn = "gold",

						git_add = "foam",
						git_change = "rose",
						git_delete = "love",
						git_dirty = "rose",
						git_ignore = "muted",
						git_merge = "iris",
						git_rename = "pine",
						git_stage = "iris",
						git_text = "rose",
						git_untracked = "subtle",

						h1 = "iris",
						h2 = "foam",
						h3 = "rose",
						h4 = "gold",
						h5 = "pine",
						h6 = "foam",
					},

					highlight_groups = {
						-- Comment = { fg = "foam" },
						-- VertSplit = { fg = "muted", bg = "muted" },
						NormalFloat = { bg = "none" },
					},
				})

				vim.cmd("colorscheme rose-pine")
				-- vim.cmd("colorscheme rose-pine-main")
				-- vim.cmd("colorscheme rose-pine-moon")
				-- vim.cmd("colorscheme rose-pine-dawn")
			end,
		},
		{
			"LazyVim/LazyVim",
			opts = {
				colorscheme = "rose-pine-moon",
			},
		},
	}
end
