# How to use

## Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

## Git Clone dotfiles

## Make symblolic link
* Cygwin

  Run Command Prompt as Administrator

  ```
> cd PATH\TO\CYGWIN\HOME
> del .screenrc
> del .zshrc
> mklink .screenrc PATH\TO\dotfiles\.screenrc
> mklink .zshrc PATH\TO\dotfiles\.zshrc
  ```

* Other

  ```
$ rm ~/.screenrc
$ rm ~/.zshrc
$ cd PATH/TO/dotfiles
$ ln -s .screenrc ~/.screenrc
$ ln -s .zshrc ~/.zshrc
  ```
