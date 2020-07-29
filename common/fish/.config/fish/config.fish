#############################
# WSL
#############################

# set -x EDITOR "/usr/bin/vim"

# Android
# set -x ANDROID_HOME "/home/dustin/Android/Sdk"
# set -x PATH "/home/dustin/Android/Sdk/cmdline-tools/tools/bin" $PATH
# set -x PATH "/home/dustin/Android/Sdk/tools" $PATH
# set -x PATH "/home/dustin/Android/Sdk/platform-tools" $PATH

#############################
# MAC OSX
#############################

# $PATH
# set -x PATH "/Users/dustinlam/Library/Android/sdk/platform-tools" $PATH
# set -x PATH "/Users/dustinlam/Library/Android/sdk/tools" $PATH

# JVM
# set JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_77.jdk/Contents/Home"

#############################
# ARCH LINUX
#############################

set -x EDITOR "/usr/bin/vim"
set -x GPG_TTY (tty)

# $PATH
set -x PATH "/snap/bin" $PATH
set -x PATH "$HOME/go/bin" $PATH

# Android
set -x ANDROID_HOME "$HOME/Android/Sdk"
set -x PATH "$HOME/Android/Sdk/cmdline-tools/tools/bin" $PATH
set -x PATH "$HOME/Android/Sdk/tools" $PATH
set -x PATH "$HOME/Android/Sdk/platform-tools" $PATH

#############################
# COLOURS
#############################

# Highlighting

set fish_color_normal                 normal              # the default color
set fish_color_command                blue                # the color for commands
set fish_color_quote                  yellow              # the color for quoted blocks of text
# fish_color_redirection, the color for IO redirections
# fish_color_end, the color for process separators like ';' and '&'
set fish_color_error                  red                 # the color used to highlight potential errors
# fish_color_param, the color for regular command parameters
# fish_color_comment, the color used for code comments
# fish_color_match, the color used to highlight matching parenthesis
set fish_color_search_match           --background=brgrey # the color used to highlight history search matches
# fish_color_operator, the color for parameter expansion operators like '*' and '~'
# fish_color_escape, the color used to highlight character escapes like '\n' and '\x70'
set fish_color_cwd                    green               # the color used for the current working directory in the default prompt
set fish_color_autosuggestion         brgrey              # the color used for autosuggestions
# fish_color_user, the color used to print the current username in some of fish default prompts
# fish_color_host, the color used to print the current host system in some of fish default prompts

# Completion pager

# fish_pager_color_prefix, the color of the prefix string, i.e. the string that is to be completed
# fish_pager_color_completion, the color of the completion itself
# fish_pager_color_description, the color of the completion description
# fish_pager_color_progress, the color of the progress bar at the bottom left corner
# fish_pager_color_secondary, the background color of the every second completion

# Git

# set __fish_git_prompt_color_prefix       # Anything before %s in the format string
# set __fish_git_prompt_color_suffix       # Anything after  %s in the format string
# set __fish_git_prompt_color_bare         # Marker for a bare repository
set __fish_git_prompt_color_merging   red              # Current operation (|MERGING, |REBASE, etc.)
set __fish_git_prompt_color_branch    yellow           # Branch name
# set __fish_git_prompt_color_flags        # Optional flags (see below)
# set __fish_git_prompt_color_upstream     # Upstream name and flags (with showupstream)

#############################
# GIT
#############################

# Git prompt
set __fish_git_prompt_showdirtystate true

# Status Chars
set __fish_git_prompt_char_dirtystate      '*'
set __fish_git_prompt_char_invalidstate    '!'
set __fish_git_prompt_char_stagedstate     ':'
set __fish_git_prompt_char_untrackedfiles  '.'
set __fish_git_prompt_char_stateseparator  '|'

set __fish_git_prompt_char_cleanstate      '='

#############################
# STARTUP
#############################


#############################
# PROMPT
#############################

function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end

#############################
# GREETING
#############################

# function fish_greeting
#   cowthink (fortune -a)
# end

#############################
# EDIT CMDLINE
#############################

function edit_cmd --description 'Edit cmdline in editor'
    set -l f (mktemp)
    set -l p (commandline -C)
    commandline -b > $f
    vim -c set\ ft=fish $f
    commandline -r (more $f)
    commandline -C $p
    rm $f
end

bind \cx edit_cmd
