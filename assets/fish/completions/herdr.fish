# herdr completions for fish shell

complete -c herdr -f -n "__fish_use_subcommand" \
  -a "run list status logs config auth update doctor version help"

complete -c herdr -n "__fish_seen_subcommand_from run" -f \
  -a "--model --provider --toolsets --yolo --worktree --verbose --help"

complete -c herdr -n "__fish_seen_subcommand_from config" -f \
  -a "set get list edit show --profile --help"