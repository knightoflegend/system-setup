# Hermes CLI completions for fish shell

# Main command completions
complete -c hermes -f -n "__fish_use_subcommand" \
  -a "chat run skill memory config auth doctor update delegate cronjob tools model provider profile version help"

# hermes chat
complete -c hermes -n "__fish_seen_subcommand_from chat" -f \
  -a "--toolsets --model --provider --personality --yolo --worktree --verbose --help"

complete -c hermes -n "__fish_seen_subcommand_from chat" -l toolsets -f \
  -a "terminal file web browser vision image_gen skills todo tts cronjob debugging safe all hermes-cli hermes-telegram hermes-discord hermes-whatsapp hermes-slack"

complete -c hermes -n "__fish_seen_subcommand_from chat" -l model -f \
  -a "nvidia/nemotron-3-ultra-550b-a55b:free google/gemini-3-flash-preview anthropic/claude-sonnet-4 openai/gpt-5 openrouter/auto"

complete -c hermes -n "__fish_seen_subcommand_from chat" -l provider -f \
  -a "openrouter nous anthropic openai-codex copilot gemini zai kimi-coding minimax minimax-cn huggingface nvidia xiaomi arcee ollama-cloud deepinfra kilocode ai-gateway azure-foundry lmstudio custom"

# hermes run
complete -c hermes -n "__fish_seen_subcommand_from run" -f \
  -a "--model --provider --toolsets --yolo --worktree --verbose --help"

# hermes skill
complete -c hermes -n "__fish_seen_subcommand_from skill" -f \
  -a "list view create patch delete search install"

complete -c hermes -n "__fish_seen_subcommand_from skill" -l name -f \
  -a "(hermes skill list --json 2>/dev/null | jq -r '.[].name' 2>/dev/null)"

# hermes memory
complete -c hermes -n "__fish_seen_subcommand_from memory" -f \
  -a "add remove patch list show clear --target"

complete -c hermes -n "__fish_seen_subcommand_from memory" -l target -f \
  -a "memory user"

# hermes config
complete -c hermes -n "__fish_seen_subcommand_from config" -f \
  -a "set get list edit show --profile --help"

complete -c hermes -n "__fish_seen_subcommand_from config" -l profile -f \
  -a "(ls -1 ~/.hermes/profiles/ 2>/dev/null)"

# hermes auth
complete -c hermes -n "__fish_seen_subcommand_from auth" -f \
  -a "add remove list status login logout --provider"

complete -c hermes -n "__fish_seen_subcommand_from auth" -l provider -f \
  -a "openrouter nous anthropic openai-codex copilot gemini github gitlab huggingface nvidia"

# hermes delegate
complete -c hermes -n "__fish_seen_subcommand_from delegate" -f \
  -a "spawn list steer stop --model --provider --toolsets --option"

complete -c hermes -n "__fish_seen_subcommand_from delegate" -l option -f \
  -a "fast deep coder multimodal general"

# hermes cronjob
complete -c hermes -n "__fish_seen_subcommand_from cronjob" -f \
  -a "create list run pause resume remove edit show --profile"

# hermes tools
complete -c hermes -n "__fish_seen_subcommand_from tools" -f \
  -a "list enable disable configure --platform"

# hermes model
complete -c hermes -n "__fish_seen_subcommand_from model" -f \
  -a "list search set show --provider"

# hermes provider
complete -c hermes -n "__fish_seen_subcommand_from provider" -f \
  -a "list set show --model"

# hermes profile
complete -c hermes -n "__fish_seen_subcommand_from profile" -f \
  -a "list create delete switch show --current"

complete -c hermes -n "__fish_seen_subcommand_from profile" -l name -f \
  -a "(ls -1 ~/.hermes/profiles/ 2>/dev/null)"

# hermes mcp
complete -c hermes -n "__fish_seen_subcommand_from mcp" -f \
  -a "list install enable disable authorize status logs --server"