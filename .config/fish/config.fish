set fish_color_search_match --background=b294bb

# Git colors
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'no'
set __fish_git_prompt_showuntrackedfiles 'no'
set __fish_git_prompt_showupstream 'no'
set __fish_git_prompt_show_informative_status 'no'

# Status Chars
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate ''
set __fish_git_prompt_char_invalidstate ''

set __fish_git_prompt_char_stashstate ''

set __fish_git_prompt_char_untrackedfiles ''

set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_behind ''
set __fish_git_prompt_char_upstream_ahead ''
set __fish_git_prompt_char_upstream_diverged ''

set __fish_git_prompt_char_cleanstate ''
set __fish_git_prompt_char_stateseparator ''

function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end
