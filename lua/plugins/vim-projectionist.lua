return {
	{
		"tpope/vim-projectionist",
		config = function()
			vim.g.projectionist_heuristics = {
				-- js file test alternates
				["*.js"] = {
					["*.test.js"] = {
						alternate = "{}.js",
						type = "source",
					},
					["*.js"] = {
						alternate = "{}.test.js",
						type = "test",
					},
				},
				-- go file test alternates
				["*.go"] = {
					["*_test.go"] = {
						alternate = "{}.go",
						type = "source",
					},
					["*.go"] = {
						alternate = "{}_test.go",
						type = "test",
					},
				},
				-- ruby file test alternates, this is a little hacky
				["*.rb"] = {
					["spec/*_spec.rb"] = {
						alternate = "app/{}.rb",
						type = "source",
					},
					["app/*.rb"] = {
						alternate = "spec/{}_spec.rb",
						type = "test",
					},
					["spec/lib/*_spec.rb"] = {
						alternate = "lib/{}.rb",
						type = "source",
					},
					["lib/*.rb"] = {
						alternate = "spec/lib/{}_spec.rb",
						type = "test",
					},
				},
				-- java file test alternates, this is a little hacky
				['pom.xml|build.gradle|settings.gradle'] = {

					-- projections for java
					['src/main/java/*.java'] = {
						type = "source",
						alternate = { "src/test/java/{}Test.java", "src/test/java/{}ITCase.java", "src/test/java/{}Tests.java",
							"src/test/java/{}IT.java" },
					},
					['src/test/java/*Test.java'] = {
						type = "test",
						alternate = "src/main/java/{}.java"
					},
					['src/test/java/*IT.java'] = {
						type = "test",
						alternate = "src/main/java/{}.java"
					},
					['src/test/java/*Tests.java'] = {
						type = "test",
						alternate = "src/main/java/{}.java"
					},
					['src/test/java/*ITCase.java'] = {
						type = "test",
						alternate = "src/main/java/{}.java"
					}
				},
			}
			vim.keymap.set('n', '<leader>a', '<Cmd>A<CR>', { desc = '[A]lternate' })
			vim.keymap.set('n', '<leader>A', '<Cmd>AV<CR>', { desc = '[A]lternate [V]ertical split' })
		end,
	},
}
