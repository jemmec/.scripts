$BinDir = "$PSScriptRoot\bin"
$ScriptDir = "$PSScriptRoot\src"

if (-not (Test-Path $BinDir -PathType Container)) {
    New-Item -ItemType Directory -Force -Path $BinDir | Out-Null
}

# Install path
$UserEnv = [System.Environment]::GetEnvironmentVariable("PATH", "User")
if ($UserEnv -notlike "*$BinDir*") {
    [System.Environment]::SetEnvironmentVariable("PATH", "$UserEnv;$BinDir", "User")
}

if (Test-Path $ScriptDir -PathType Container) {
    Copy-Item -Path $ScriptDir\* -Destination $BinDir -Recurse -Force  
}

if (-not (Test-Path "$BinDir\fd" -PathType Container)) {
    New-Item -ItemType Directory -Force -Path "$BinDir\fd" | Out-Null
}
Invoke-WebRequest -Uri "https://github.com/sharkdp/fd/releases/download/v9.0.0/fd-v9.0.0-i686-pc-windows-msvc.zip" -OutFile "$BinDir\fd\fd.zip"
Expand-Archive -Path "$BinDir\fd\fd.zip" -DestinationPath "$BinDir\fd"
Copy-Item -Path "$BinDir\fd\fd-v9.0.0-i686-pc-windows-msvc\fd.exe" -Destination $BinDir -Force
Remove-Item -Path "$BinDir\fd" -Force -Recurse

if (-not (Test-Path "$BinDir\fzf" -PathType Container)) {
    New-Item -ItemType Directory -Force -Path "$BinDir\fzf" | Out-Null
}
Invoke-WebRequest -Uri "https://github.com/junegunn/fzf/releases/download/0.44.1/fzf-0.44.1-windows_amd64.zip" -OutFile "$BinDir\fzf\fzf.zip"
Expand-Archive -Path "$BinDir\fzf\fzf.zip" -DestinationPath "$BinDir\fzf"
Copy-Item -Path "$BinDir\fzf\fzf.exe" -Destination $BinDir -Force
Remove-Item -Path "$BinDir\fzf" -Force -Recurse
