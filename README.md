# Emacs Setup Files
This repository maintains current my emacs setup files so as to download and keep the same configuration in other computers than my PC at home.

## How to use
### MS Windows
``` bash
cd %HOME%
git clone https://github.com/handrake0724/emacsSetup.git
```

### Linux or OS X

``` bash
cd ~
git clone https://github.com/handrake0724/emacsSetup.git
```

## elpa package recompile
It would be necessary to recompile elpa packages after cloning the repository

``` lisp
M-: (byte-recompile-directory package-user-dir nil 'force)
```

## elpa package update
``` lisp
M-x package-list-packages Enter
U Enter
x Enter
```
