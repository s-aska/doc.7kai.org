# Sublime Text 2

## Settings (User)

	// Settings in here override those in "Default/Preferences.sublime-settings", and
	// are overridden in turn by file type specific settings.
	{
		"draw_white_space": "all",
		"trim_trailing_white_space_on_save": true,
		"tab_completion": true,
		"save_on_focus_lost": true,
		"highlight_line": false,
		"scroll_past_end": true
	}

## Key Bindings

タブで変換候補巡れるようにするにはコメントアウトが必要

	// { "keys": ["tab"], "command": "insert_best_completion", "args": {"default": "\t", "exact": true} },
	// { "keys": ["tab"], "command": "insert_best_completion", "args": {"default": "\t", "exact": false},
	// 	"context":
	// 	[
	// 		{ "key": "setting.tab_completion", "operator": "equal", "operand": true }
	// 	]
	// },
