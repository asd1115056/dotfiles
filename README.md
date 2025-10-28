# Dotfiles

This is my dotfiles repo managed using chezmoi

## Install

```bash
# Fresh install
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply <your-repo>

# Or
chezmoi init --apply <your-repo>
```

## Daily Commands

```bash
chezmoi diff                    # Check changes
chezmoi apply                   # Apply changes
chezmoi edit ~/.zshrc           # Edit file
chezmoi add ~/.config/foo       # Add new file

cd ~/.local/share/chezmoi       # Edit source directly
git add . && git commit && git push
```

## Stack

- **Shell**: zsh + zinit + starship
- **Terminal**: JetBrains Mono Nerd Font
- **Tmux**: oh-my-tmux
- **Tools**: atuin, fzf, eza, bat, zoxide, lazygit, lazydocker

## Packages

Edit `.chezmoidata/packages.yaml`, then:
```bash
chezmoi state delete-bucket --bucket=scriptState
chezmoi apply
```

## Sync

```bash
cd ~/.local/share/chezmoi
git pull
chezmoi apply -v
```
