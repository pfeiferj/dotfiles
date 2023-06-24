# pfeiferj dot files
Managed using chezmoi.
```bash
# Chezmoi already installed
chezmoi init --apply pfeiferj

# ssh:

chezmoi init --apply git@github.com:pfeiferj/dotfiles.git
```
```bash
# Chezmoi not installed
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply pfeiferj

# ssh:

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:pfeiferj/dotfiles.git
```
