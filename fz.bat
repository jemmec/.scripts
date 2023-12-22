:: Fuzzy search piped into a command
:: Use -a, --all to show hidden files
@echo off

set "isAll=false"
if /I "%2"=="--all" set "isAll=true"
if /I "%2"=="-a" set "isAll=true"

set FZF_DEFAULT_COMMAND=fd --type d --type l --threads 20 --exclude node_modules --glob
if %isAll%==true set "FZF_DEFAULT_COMMAND=%FZF_DEFAULT_COMMAND% --hidden"

for /F "tokens=*" %%i in ('fzf') do %1 %%i