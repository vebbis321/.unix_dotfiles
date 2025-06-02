return {
	cmd = {
		"harper-ls",
		"--stdio",
	},
	root_markers = {
		".git",
	},
	-- https://writewithharper.com/docs/integrations/language-server#Configuration
	settings = {
		["harper-ls"] = {
			userDictPath = vim.o.spellfile,
			linters = {
				SpellCheck = true,
				SpelledNumbers = false,
				AnA = true,
				SentenceCapitalization = true,
				UnclosedQuotes = true,
				WrongQuotes = false,
				LongSentences = true,
				RepeatedWords = true,
				Spaces = true,
				Matcher = true,
				CorrectNumberSuffix = true,
			},
			codeActions = {
				ForceStable = false,
			},
			markdown = {
				IgnoreLinkTitle = false,
			},
			diagnosticSeverity = "hint",
			isolateEnglish = false,
			dialect = "American",
		},
	},

	single_file_support = true,
}
