#!/bin/bash
# vim: set ft=sh:
# vim version 8.0+ automatically support plugins under a `pack` directory
# package must follow a guideline in order to automatically start or start upon :<packagename> command
# <some name> can be any chosen name, `themes` or `syntax` if you want to logically group packages
# `plugins` is used in this script.
# For automatic loading of a plugin:
# pack/<some name>/start
# For optional loading of a plugin:
# pack/<some name>/opt
# git submodule add --depth 1 is used so it doesn't pull entire package repo history/clutter
# NOTE: Do not use absolute paths when directing where submodules should download to
# NOTE: Use relative paths from the vim/pack directory or else submodule updating breaks

# NOTE: Regarding udating packages
# git submodule update --init --recursive
# If a cyclic dependency exists, command will fail

# git submodule foreach --recursive git submodule update --init
# Basically the same as the above command, but `git submodule update --init --recursive`
# needs to occur first so `git foreach` updating won't fail
# Not strictly needed for first installation, but here for posterity

vim_config_dir="~/.vim"
[[ ! -d "${vim_config_dir}" ]] && mkdir "${vim_config_dir}"

afterdir="${vim_config_dir}/after"
[[ ! -d "${afterdir}" ]] && mkdir "${afterdir}"

ftdetectdir="${afterdir}/ftdetect"
[[ ! -d "${ftdetectdir}" ]] && mkdir "${ftdetectdir}"

ftplugindir="${afterdir}/ftplugin"
[[ ! -d "${ftplugindir}" ]] && mkdir "${ftplugindir}"
mv ./python.vim "${ftplugindir}"

indentdir="${afterdir}/indent"
[[ ! -d "${indentdir}" ]] && mkdir "${indentdir}"

syntaxdir="${afterdir}/syntax"
[[ ! -d "${syntaxdir}" ]] && mkdir "${syntaxdir}"

packdir="${vim_config_dir}/pack"
[[ ! -d "${packdir}" ]] && mkdir "${packdir}"

backupdir="${vim_config_dir}/backup"
[[ ! -d "${backupdir}" ]] && mkdir "${backupdir}"

swapdir="${vim_config_dir}/swap"
[[ ! -d "${swapdir}" ]] && mkdir "${swapdir}"

undodir="${vim_config_dir}/undo"
[[ ! -d "${undodir}" ]] && mkdir "${undodir}"

viewdir="${vim_config_dir}/view"
[[ ! -d "${viewdir}" ]] && mkdir "${viewdir}"

cd "${packdir}"

# Used for testing in docker containers, else commits fail
# git config --global user.email admin@localhost
# git config --global user.name admin
# Would you kindly remove warning messages, change default branch name
# git config --global init.defaultBranch trunk
git init

# Add a file so repo can commit
touch README.rst
git add .
git commit -m "Initial commit"

# packages: syntax
pluginsdir=./plugins/start
mkdir --parents "${pluginsdir}"

git submodule add --depth 1 https://github.com/dense-analysis/ale.git "${pluginsdir}/ale"
git add .gitmodules "${pluginsdir}/ale"
git commit -m "Add submodule ale"
vim -u NONE -c "helptags plugins/start/ale/doc" -c q

# package :: jedi-vim
# python code completion
git submodule add --depth 1 https://github.com/davidhalter/jedi-vim.git "${pluginsdir}/jedi-vim"
git add .gitmodules "${pluginsdir}/jedi-vim"
git commit -m "Add submodule jedi-vim"
vim -u NONE -c "helptags plugins/start/jedi-vim/doc" -c q

# package :: vim-colorschemes
# color theme pack with lots of options
# edit your `.vimrc` file to change the theme
git submodule add --depth 1 https://github.com/flazz/vim-colorschemes.git "${pluginsdir}/vim-colorschemes"
git add .gitmodules "${pluginsdir}/vim-colorschemes"
git commit -m "Add submodule vim-colorschemes"
# NOTE: No documentation

# NERDtree browser
# Haven't fooled with it yet, but looks solid
# git submodule add https://github.com/scrooloose/nerdtree.git "${pluginsdir}/nerdtree"
# git add .gitmodules "${pluginsdir}/nerdtree"
# git commit -m "Add submodule nerdtree"
# vim -u NONE -c "helptags plugins/start/nerdtree/doc" -c q

git submodule update --init --recursive
git submodule foreach git submodule update --init --recursive
# Add file so commit can happen for the main repo
date >> README.rst
git add .
git commit -m 'Update submodules to latest versions'

cd "${HOME}"
