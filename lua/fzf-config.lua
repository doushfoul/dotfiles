local actions = require "fzf-lua.actions"
require('fzf-lua').setup {
  winopts = {
    -- split         = "belowright new",-- open in a split instead?
    -- "belowright new"  : split below
    -- "aboveleft new"   : split above
    -- "belowright vnew" : split right
    -- "aboveleft vnew   : split left
    -- Only valid when using a float window
    -- (i.e. when 'split' is not defined)
    height           = 0.85,            -- window height
    width            = 0.80,            -- window width
    row              = 0.35,            -- window row position (0=top, 1=bottom)
    col              = 0.50,            -- window col position (0=left, 1=right)
    -- border argument passthrough to nvim_open_win(), also used
    -- to manually draw the border characters around the preview
    -- window, can be set to 'false' to remove all borders or to
    -- 'none', 'single', 'double' or 'rounded' (default)
    border           = 'single',
    fullscreen       = false,           -- start fullscreen?
    hl = {
      normal         = 'Normal',        -- window normal color (fg+bg)
      border         = 'Normal',        -- border color (try 'FloatBorder')
      -- Only valid with the builtin previewer:
      cursor         = 'Cursor',        -- cursor highlight (grep/LSP matches)
      cursorline     = 'CursorLine',    -- cursor line
      title       = 'Normal',        -- preview border title (file/buffer)
      -- scrollbar_f = 'PmenuThumb',    -- scrollbar "full" section highlight
      -- scrollbar_e = 'PmenuSbar',     -- scrollbar "empty" section highlight
    },
    preview = {
      -- default     = 'bat',           -- override the default previewer?
      -- default uses the 'builtin' previewer
      border         = 'noborder',        -- border|noborder, applies only to
      -- native fzf previewers (bat/cat/git/etc)
      wrap           = 'nowrap',        -- wrap|nowrap
      hidden         = 'nohidden',      -- hidden|nohidden
      vertical       = 'down:45%',      -- up|down:size
      horizontal     = 'right:60%',     -- right|left:size
      layout         = 'flex',          -- horizontal|vertical|flex
      flip_columns   = 120,             -- #cols to switch to horizontal on flex
      -- Only valid with the builtin previewer:
      title          = true,            -- preview border title (file/buf)?
      scrollbar      = 'border',         -- `false` or string:'float|border'
      -- float:  in-window floating border
      -- border: in-border chars (see below)
      scrolloff      = '-2',            -- float scrollbar offset from right
      -- applies only when scrollbar = 'float'
      scrollchars    = {'?', '' },      -- scrollbar chars ({ <full>, <empty> }
      -- applies only when scrollbar = 'border'
      delay          = 100,             -- delay(ms) displaying the preview
      -- prevents lag on fast scrolling
      winopts = {                       -- builtin previewer window options
        number            = true,
        relativenumber    = false,
        cursorline        = true,
        cursorlineopt     = 'both',
        cursorcolumn      = false,
        signcolumn        = 'no',
        list              = false,
        foldenable        = false,
        foldmethod        = 'manual',
      },
    },
    on_create = function()
      -- called once upon creation of the fzf main window
      -- can be used to add custom fzf-lua mappings, e.g:
      --   vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<Down>",
      --     { silent = true, noremap = true })
    end,
  },

	-- fzf_bin             = 'sk',        -- use skim instead of fzf?
	fzf_layout          = 'reverse',      -- fzf '--layout='
	fzf_args            = '',             -- adv: fzf extra args, empty unless adv
	flip_columns        = 120,            -- #cols to switch to horizontal on flex
	default_previewer   = "bat",       -- override the default previewer?
	-- by default auto-detect bat|cat
	previewers = {
		cmd = {
			-- custom previewer, will execute:
			-- `<cmd> <args> <filename>`
			cmd             = "echo",
			args            = "",
		},
		cat = {
			cmd             = "cat",
			args            = "-n",
		},
		bat = {
			cmd             = "bat",
			args            = "--style=numbers,changes --color always",
			theme           = 'Coldark-Dark', -- bat preview theme (bat --list-themes)
			config          = nil,            -- nil uses $BAT_CONFIG_PATH
		},
		head = {
			cmd             = "head",
			args            = nil,
		},
		git_diff = {
			cmd             = "git diff",
			args            = "--color",
		},
	},
	-- provider setup
	files = {
		-- previewer         = "cat",       -- uncomment to override previewer
		prompt            = 'Files❯ ',
		cmd               = 'fd --hidden',             -- "find . -type f -printf '%P\n'",
		git_icons         = true,           -- show git icons?
		file_icons        = true,           -- show file icons?
		color_icons       = true,           -- colorize file|git icons
		actions = {
			["default"]     = actions.file_edit,
			["ctrl-s"]      = actions.file_split,
			["ctrl-v"]      = actions.file_vsplit,
			["ctrl-t"]      = actions.file_tabedit,
			["ctrl-q"]      = actions.file_sel_to_qf,
			["ctrl-y"]      = function(selected) print(selected[2]) end,
		}
	},
	git = {
		files = {
			prompt          = 'GitFiles❯ ',
			cmd             = 'git ls-files --exclude-standard',
			git_icons       = true,           -- show git icons?
			file_icons      = true,           -- show file icons?
			color_icons     = true,           -- colorize file|git icons
		},
		status = {
			prompt        = 'GitStatus❯ ',
			cmd           = "git status -s",
			previewer     = "git_diff",
			file_icons    = false,
			git_icons     = false,
			color_icons   = false,
		},
		commits = {
			prompt          = 'Commits❯ ',
			cmd             = "git log --pretty=oneline --abbrev-commit --color",
			preview         = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
			actions = {
				["default"] = nil,
			},
		},
		bcommits = {
			prompt          = 'BCommits❯ ',
			cmd             = "git log --pretty=oneline --abbrev-commit --color --",
			preview         = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
			actions = {
				["default"] = nil,
			},
		},
		branches = {
			prompt          = 'Branches❯ ',
			cmd             = "git branch --all --color",
			preview         = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
			actions = {
				["default"] = actions.git_switch,
			},
		},
		icons = {
			["M"]           = { icon = "M", color = "yellow" },
			["D"]           = { icon = "D", color = "red" },
			["A"]           = { icon = "A", color = "green" },
			["?"]           = { icon = "?", color = "magenta" },
			-- ["M"]          = { icon = "★", color = "red" },
			-- ["D"]          = { icon = "✗", color = "red" },
			-- ["A"]          = { icon = "+", color = "green" },
		},
	},
	grep = {
		prompt            = 'Rg❯ ',
		input_prompt      = 'Grep❯ ',
		cmd               = "rg --vimgrep",
    rg_opts           = "--column --line-number --no-heading --color=always --smart-case --max-columns=512",
		git_icons         = false,           -- show git icons?
		file_icons        = false,           -- show file icons?
		color_icons       = false,           -- colorize file|git icons
		actions = {
			["default"]     = actions.file_edit,
			["ctrl-s"]      = actions.file_split,
			["ctrl-v"]      = actions.file_vsplit,
			["ctrl-t"]      = actions.file_tabedit,
			["ctrl-q"]      = actions.file_sel_to_qf,
			["ctrl-y"]      = function(selected) print(selected[2]) end,
		}
	},
	oldfiles = {
		prompt            = 'History❯ ',
		cwd_only          = false,
	},
	buffers = {
		prompt            = 'Buffers❯ ',
		file_icons        = true,         -- show file icons?
		color_icons       = true,         -- colorize file|git icons
		sort_lastused     = true,         -- sort buffers() by last used
		actions = {
			["default"]     = actions.buf_edit,
			["ctrl-s"]      = actions.buf_split,
			["ctrl-v"]      = actions.buf_vsplit,
			["ctrl-t"]      = actions.buf_tabedit,
			["ctrl-x"]      = actions.buf_del,
		}
	},
	colorschemes = {
		prompt            = 'Colorschemes❯ ',
		live_preview      = true,       -- apply the colorscheme on preview?
		actions = {
			["default"]     = actions.colorscheme,
			["ctrl-y"]      = function(selected) print(selected[2]) end,
		},
		winopts = {
			win_height        = 0.55,
			win_width         = 0.30,
			window_on_create  = function()
				vim.cmd("set winhl=Normal:Normal")
			end,
		},
		post_reset_cb     = function()
			-- reset statusline highlights after
			-- a live_preview of the colorscheme
			-- require('feline').reset_highlights()
		end,
	},
	quickfix = {
		-- cwd               = vim.loop.cwd(),
		file_icons        = true,
		git_icons         = true,
	},
	lsp = {
		prompt            = '❯ ',
		-- cwd               = vim.loop.cwd(),
		cwd_only          = false, -- show workspace diagnostics only for the files in cwd
		file_icons        = false,
		git_icons         = false,
		lsp_icons         = false,
		severity          = "hint",
		icons = {
			["Error"]       = { icon = "", color = "red" },       -- error
			["Warning"]     = { icon = "", color = "yellow" },    -- warning
			["Information"] = { icon = "", color = "blue" },      -- info
			["Hint"]        = { icon = "", color = "magenta" },   -- hint
		},
	},
	-- placeholders for additional user customizations
	loclist = {},
	helptags = {},
	manpages = {},
	-- optional override of file extension icon colors
	-- available colors (terminal):
	--    clear, bold, black, red, green, yellow
	--    blue, magenta, cyan, grey, dark_grey, white
	file_icon_colors = {
		["lua"]   = "blue",
	},
}
