#############################
# COLOURS
#############################

# Highlighting

set fish_color_normal normal                 # the default color
set fish_color_command blue                  # the color for commands
# fish_color_quote,                          # the color for quoted blocks of text
# fish_color_redirection,                    # the color for IO redirections
# fish_color_end,                            # the color for process separators like ';' and '&'
set fish_color_error red                     # the color used to highlight potential errors
# fish_color_param,                          # the color for regular command parameters
# fish_color_comment,                        # the color used for code comments
# fish_color_match,                          # the color used to highlight matching parenthesis
set fish_color_search_match --background=red # the color used to highlight history search matches
# fish_color_operator,                       # the color for parameter expansion operators like '*' and '~'
# fish_color_escape,                         # the color used to highlight character escapes like '\n' and '\x70'
set fish_color_cwd green                     # the color used for the current working directory in the default prompt
# fish_color_autosuggestion,                 # the color used for autosuggestions
# fish_color_user,                           # the color used to print the current username in some of fish default prompts
# fish_color_host,                           # the color used to print the current host system in some of fish default prompts

# Completion pager

# fish_pager_color_prefix, the color of the prefix string, i.e. the string that is to be completed
# fish_pager_color_completion, the color of the completion itself
# fish_pager_color_description, the color of the completion description
# fish_pager_color_progress, the color of the progress bar at the bottom left corner
# fish_pager_color_secondary, the background color of the every second completion


# set __fish_git_prompt_color_prefix   # Anything before %s in the format string
# set __fish_git_prompt_color_suffix   # Anything after  %s in the format string
# set __fish_git_prompt_color_bare     # Marker for a bare repository
# set __fish_git_prompt_color_merging  # Current operation (|MERGING, |REBASE, etc.)
set __fish_git_prompt_color_branch yellow  # Branch name
# set __fish_git_prompt_color_flags    # Optional flags (see below)
# set __fish_git_prompt_color_upstream # Upstream name and flags (with showupstream)

#############################
# GIT
#############################

# Git prompt
set __fish_git_prompt_showdirtystate true

# Status Chars
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_invalidstate '!'
set __fish_git_prompt_char_stagedstate ':'
set __fish_git_prompt_char_untrackedfiles '.'
set __fish_git_prompt_char_cleanstate '='
# set __fish_git_prompt_char_invalidstate ''

#############################
# WSL
#############################
set -Ux LS_COLORS 'ow=96'

function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end
