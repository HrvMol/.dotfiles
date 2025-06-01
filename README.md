https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles/

```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/hrvmol/.dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```
