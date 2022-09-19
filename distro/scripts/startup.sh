#! /bin/sh

LOG_PATH="/var/log/wsl-vpnkit.log"
USERPROFILE=$(wslpath "$(powershell.exe -NoLogo -NoProfile -c 'Write-Host -NoNewline $env:USERPROFILE')")
if [ -z "$WIN_PATH" ]; then
  WIN_PATH="$USERPROFILE/wsl-vpnkit"
fi
VERSION="$(cat /app/version)"

touch $LOG_PATH

echo "
wsl-vpnkit $VERSION
This distro is only intended for running wsl-vpnkit. 

Run the following commands from Windows or other WSL 2 distros to use.

    wsl.exe -d $WSL_DISTRO_NAME service wsl-vpnkit start
    wsl.exe -d $WSL_DISTRO_NAME service wsl-vpnkit stop

The following file will be copied if it does not already exist.

    $WIN_PATH/wsl-vpnkit/wsl-gvproxy.exe

Logs for wsl-vpnkit can be viewed here.

    wsl.exe -d $WSL_DISTRO_NAME tail -f $LOG_PATH

Config for wsl-vpnkit can be edited here.

    $WIN_PATH/wsl-vpnkit/wsl-vpnkit.conf

Run the following command to see the default values.

    wsl.exe -d $WSL_DISTRO_NAME cat /app/defaults.conf

Press [enter] key to continue...
"
read _
exit 0
