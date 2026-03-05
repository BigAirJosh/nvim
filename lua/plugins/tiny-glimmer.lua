return {
	{
		"rachartier/tiny-glimmer.nvim",
		event = "TextYankPost",
		config = function()
			require('tiny-glimmer').setup({
				enabled = true,
				default_animation = "fade",
				refresh_interval_ms = 6,

				-- Only use if you have a transparent background
				-- It will override the highlight group background color for `to_color` in all animations
				transparency_color = nil,

				animations = {
					fade = {
						max_duration = 250,
						chars_for_max_duration = 10,
					},
				},
				virt_text = {
					priority = 2048,
				},
			})
		end,
	}
}
