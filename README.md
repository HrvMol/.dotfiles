https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles/

run `git clone --bare https://github.com/HrvMol/.dotfiles.git $HOME/.dotfiles`

add `alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'` to .bashrc

run `dotfiles config --local status.showUntrackedFiles no`

move conflicting files to .dotfiles/backup
```
mkdir -p .dotfiles-backup
dotfiles checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | while read -r file; do
  mkdir -p "$(dirname ".dotfiles-backup/$file")"
  mv "$file" ".dotfiles-backup/$file"
done
```

run `dotfiles checkout`
