function __fish_using_command
    set cmd (commandline -opc)
    if [ (count $cmd) -eq (count $argv) ]
        for i in (seq (count $argv))
            if [ $cmd[$i] != $argv[$i] ]
                return 1
            end
        end
        return 0
    end
    return 1
end

complete -c repo -n '__fish_using_command repo' -f -a abandon -d 'Permanently abandon a development branch'
complete -c repo -n '__fish_using_command repo abandon' -s h -l help -d 'show this help message and exit'
complete -c repo -n '__fish_using_command repo abandon' -l all -d 'delete all branches in all projects'

complete -c repo -n '__fish_using_command repo' -f -a branch -d 'View current topic branches'
complete -c repo -n '__fish_using_command repo' -f -a branches -d 'View current topic branches'
complete -c repo -n '__fish_using_command repo' -f -a checkout -d 'Checkout a branch for development'
complete -c repo -n '__fish_using_command repo' -f -a cherry-pick -d 'Cherry-pick a change.'
complete -c repo -n '__fish_using_command repo' -f -a diff -d 'Show changes between commit and working tree'
complete -c repo -n '__fish_using_command repo' -f -a diffmanifests -d 'Manifest diff utility'
complete -c repo -n '__fish_using_command repo' -f -a download -d 'Download and checkout a change'
complete -c repo -n '__fish_using_command repo' -f -a grep -d 'Print lines matching a pattern'
complete -c repo -n '__fish_using_command repo' -f -a info -d 'Get info on the manifest branch, current branch or unmerged branches'
complete -c repo -n '__fish_using_command repo' -f -a init -d 'Initialize repo in the current directory'
complete -c repo -n '__fish_using_command repo' -f -a list -d 'List projects and their associated directories'
complete -c repo -n '__fish_using_command repo' -f -a overview -d 'Display overview of unmerged project branches'
complete -c repo -n '__fish_using_command repo' -f -a prune -d 'Prune (delete) already merged topics'
complete -c repo -n '__fish_using_command repo' -f -a rebase -d 'Rebase local branches on upstream branch'
complete -c repo -n '__fish_using_command repo' -f -a smartsync -d 'Update working tree to the latest known good revision'
complete -c repo -n '__fish_using_command repo' -f -a stage -d 'Stage file(s) for commit'
complete -c repo -n '__fish_using_command repo' -f -a start -d 'Start a new branch for development'
complete -c repo -n '__fish_using_command repo' -f -a status -d 'Show the working tree status'
complete -c repo -n '__fish_using_command repo' -f -a sync -d 'Update working tree to the latest revision'
complete -c repo -n '__fish_using_command repo' -f -a upload -d 'Upload changes for code review'

