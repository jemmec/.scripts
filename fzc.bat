:: Fuzzy search directory to open in vscode
@echo off
set FZF_DEFAULT_COMMAND=fd --type d --type l --threads 20 --exclude node_modules --glob
for /F "tokens=*" %%i in ('fzf') do code %%i