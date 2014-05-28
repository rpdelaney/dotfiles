" Vim syntax file
" Language: tmux(1) configuration file
" Maintainer: Ryan Delaney <ryan dot delaney at gmail dot com> OpenGPG: 0D98863B4E1D07B6
" Last Change: $Tue May 27 14:31:15 PDT 2014$
" License: GNU General Public License v3
"
" This program is free software: you can redistribute it and/or modify it
" under the terms of the GNU General Public License as published by the
" Free Software Foundation, either version 3 of the License, or (at your
" option) any later version.
"
" This program is distributed in the hope that it will be useful, but
" WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
" General Public License for more details.
"
" You should have received a copy of the GNU General Public License along
" with this program.  If not, see <http://www.gnu.org/licenses/>.
"
" Based on tmux.vim by Tiago Cunha <tcunha@users.sourceforge.net>

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syntax case match

setlocal iskeyword+=-

" tmuxCmds {{{1
syn keyword tmuxCmds 
	\ attach[-session]
	\ bind[-key]
	\ break-pane
	\ breakp
	\ capture-pane
	\ capturep
	\ choose-buffer
	\ choose-client
	\ choose-list
	\ choose-session
	\ choose-tree
	\ choose-window
	\ clear-history
	\ clearhist
	\ clock-mode
	\ command-prompt
	\ confirm[-before]
	\ copy-mode
	\ delete-buffer
	\ deleteb
	\ detach[-client]
	\ display[-message]
	\ display-panes
	\ displayp
	\ find-window
	\ findw
	\ has[-session]
	\ if[-shell]
	\ join-pane
	\ joinp
	\ kill-pane
	\ killp
	\ kill-server
	\ kill-session
	\ kill-window
	\ killw
	\ last-pane
	\ lastp
	\ last[-window]
	\ link-window
	\ linkw
	\ list-buffers
	\ lsb
	\ list-clients
	\ lsc
	\ list-commands
	\ lscm
	\ list-keys
	\ lsk
	\ list-panes
	\ lsp
	\ list-sessions
	\ ls
	\ list-windows
	\ lsw
	\ load-buffer
	\ loadb
	\ lock-client
	\ lockc
	\ lock[-server]
	\ lock-session
	\ locks
	\ move-pane
	\ movep
	\ move-window
	\ movew
	\ new[-session]
	\ next-layout
	\ nextl
	\ next[-window]
	\ paste-buffer
	\ pasteb
	\ pipe-pane
	\ pipep
	\ previous-layout
	\ prevl
	\ prev[ious-window]
	\ refresh[-client]
	\ rename[-session]
	\ rename-window
	\ renamew
	\ resize-pane
	\ resizep
	\ respawn-pane
	\ respawnp
	\ respawn-window
	\ respawnw
	\ rotate-window
	\ rotatew
	\ run[-shell]
	\ save-buffer
	\ saveb
	\ select-layout
	\ selectl
	\ select-pane
	\ selectp
	\ select-window
	\ selectw
	\ send[-keys]
	\ send-prefix
	\ server-info
	\ info
	\ set-buffer
	\ setb
	\ set-environment
	\ setenv
	\ set[-option]
	\ set-window-option
	\ setw
	\ show-buffer
	\ showb
	\ show-environment
	\ showenv
	\ show-messages
	\ showmsgs
	\ show[-options]
	\ show-window-options
	\ showw
	\ source[-file]
	\ split-window
	\ splitw
	\ start[-server]
	\ suspend-client
	\ suspendc
	\ swap-pane
	\ swapp
	\ swap-window
	\ swapw
	\ switch-client
	\ switchc
	\ unbind[-key]
	\ unlink-window
	\ unlinkw
	\ wait[-for]
" }}}
" tmuxOptsSet {{{1
syn keyword tmuxOptsSet
	\ assume-paste-time
	\ base-index
	\ bell-action
	\ bell-on-alert
	\ buffer-limit
	\ default-command
	\ default-shell
	\ default-terminal
	\ destroy-unattached
	\ detach-on-destroy
	\ display-panes-active-colour
	\ display-panes-colour
	\ display-panes-time
	\ display-time
	\ escape-time
	\ exit-unattached
	\ focus-events
	\ history-limit
	\ lock-after-time
	\ lock-command
	\ lock-server
	\ message-command-style
	\ message-limit
	\ message-style
	\ mouse-resize-pane
	\ mouse-select-pane
	\ mouse-select-window
	\ mouse-utf8
	\ pane-active-border-style
	\ pane-border-style
	\ prefix
	\ prefix2
	\ quiet
	\ renumber-windows
	\ repeat-time
	\ set-clipboard
	\ set-remain-on-exit
	\ set-titles
	\ set-titles-string
	\ status
	\ status-interval
	\ status-justify
	\ status-keys
	\ status-left
	\ status-left-length
	\ status-left-style
	\ status-position
	\ status-right
	\ status-right-length
	\ status-utf8
	\ staus-right-style
	\ terminal-overrides
	\ update-environment
	\ visual-activity
	\ visual-bell
	\ visual-content
	\ visual-silence
	\ word-separators
" 1}}}
" tmuxOptsSetw {{{1
syn keyword tmuxOptsSetw
	\ aggressive-resize
	\ allow-rename
	\ alternate-screen
	\ automatic-rename
	\ c0-change-interval
	\ c0-change-trigger
	\ clock-mode-colour
	\ clock-mode-style
	\ force-height
	\ force-width
	\ main-pane-height
	\ main-pane-width
	\ mode-keys
	\ mode-mouse
	\ mode-style
	\ monitor-activity
	\ monitor-content
	\ monitor-silence
	\ other-pane-height
	\ other-pane-width
	\ pane-base-index
	\ remain-on-exit
	\ synchronize-panes
	\ utf8
	\ window-status-activity-style
	\ window-status-bell-style
	\ window-status-content-style
	\ window-status-current-format
	\ window-status-current-style
	\ window-status-format
	\ window-status-last-style
	\ window-status-separator
	\ window-status-style
	\ wrap-search
	\ xterm-keys
" 1}}}
syn keyword tmuxTodo FIXME NOTE TODO XXX contained
syn keyword tmuxAction	any current none
syn keyword tmuxBoolean	off on
syn match tmuxKey		/\(C-\|M-\|\^\)\+\S\+/	display
syn match tmuxNumber 		/\d\+/			display
syn match tmuxOptions		/\s-\a\+/		display
syn match tmuxVariable		/\w\+=/			display
syn match tmuxVariableExpansion	/\${\=\w\+}\=/		display

syn region tmuxComment	start=/#/ end=/$/ contains=tmuxTodo display oneline
syn region tmuxString	start=/"/ end=/"/ display oneline
syn region tmuxString	start=/'/ end=/'/ display oneline

" Define {{{1
hi def link tmuxAction				Boolean
hi def link tmuxBoolean				Boolean
hi def link tmuxCmds				Keyword
hi def link tmuxComment				Comment
hi def link tmuxKey					Special
hi def link tmuxNumber				Number
hi def link tmuxOptions				Identifier
hi def link tmuxOptsSet				Function
hi def link tmuxOptsSetw			Function
hi def link tmuxString				String
hi def link tmuxTodo				Todo
hi def link tmuxVariable			Constant
hi def link tmuxVariableExpansion	Constant
" }}}

let b:current_syntax = "tmux"

" vim: ft=vim foldmethod=marker:
