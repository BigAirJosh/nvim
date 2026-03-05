return {
	{
		"preservim/vimux",
	},
	{
		"pgr0ss/vimux-bazel-test",
		config = function()
			require("config.vimux-bazel-test")
		end,
	},
}
