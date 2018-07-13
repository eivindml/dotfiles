# Dotfiles 👾

A better dotfile configuration, aiming for good organization, structure and
adaptability. Most other configuration are messy, require dependencies, hard to
grasp and too opinionated.

## How to install? 🤔

Clone the repository to a prefered location (e.g. `~/dotfiles`) and run
`install.sh` script in root folder.

``` 
git clone https://github.com/eivindml/dotfiles ~/dotfiles cd ~/dotfiles
bash install.sh 
```

## How it works 👨

I have divided all dotfile related stuff into four sub-folders (for now).

``` 
.  
├── apps 
├── macos 
├── symlink ── vimrc ...
└── bootstrap.sh
```

- **app/** is responsible for installing all global apps/software/utilities.
  E.g. through brew, cask, mas, npm, gem.
- **symlink/** is for all files which belongs to `$HOME` dir and other config
  files. Typically symlinked files/folders.
- **macos/** is for os configuration. Ideally all settings changes to the os
  should be defined here, so that everything can be set back to normal after a
reinstall with one command.

Each folder have a file named `_install.sh`, which are responsible for
configuring/installing the content inside itself. 

This way everything is super modular, and the setup won't get entagled with
dependencies etc. Everything can also be removed skipped the setup with by just
commenting one line.

All apps are defined in the files `Brewfile`, `Caskfile`, `Masfile` (Apple
Store apps), `Gemfile` and `Npmfile` (node package).

`bootstrap.sh` will run each `_install.sh` defined in all subfolders, while
`update.sh` will run updates for macos and all installed package managers.

## How it looks

![Current screenshot](.github/screenshot.png)

## The small things

If you like to change your dotfiles directory, don't forget to alter the path 
for `vim-plug` and `vim-snippets` within `vimrc`.

Please don't forget to add your Name and eMail Address within `symlink/gitconfig`.
I set a pseudonym, so you are not accedentilly commiting the name of the Author 
of this project. &#x1F609;

Within `symlink` I tossed all dots of dotfiles away. So you are able to
access them via Finder and of course without revealing invisible files.

## Contributions

I want to keep this modular, clean and organized, without dependencies. If you
have any ideas for improvements, I would love to hear it, either through a pull
request or through an issue.

