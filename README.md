# pfeiferj dot files
Managed using chezmoi.

**Chezmoi already installed**
```bash
chezmoi init --apply pfeiferj
```
ssh:
```bash
chezmoi init --apply git@github.com:pfeiferj/dotfiles.git
```

**Chezmoi not installed**
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply pfeiferj
```
ssh:
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:pfeiferj/dotfiles.git
```
