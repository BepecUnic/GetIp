@echo off
setlocal ENABLEDELAYEDEXPANSION

set SERVICES=https://api.ipify.org https://ipv4-internet.yandex.net/api/v0/ip https://chek.zennolab.com/proxy.php https://ifconfig.me/ip https://icanhazip.com

for %%S in (%SERVICES%) do (
    curl -s --max-time 5 %%S > tmp_ip.txt 2>nul
    set /p ip=<tmp_ip.txt
    echo.!ip!| findstr /r "^[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$" >nul
    if not errorlevel 1 (
        echo !ip!
        del tmp_ip.txt >nul 2>&1
        exit /b 0
    )
)
del tmp_ip.txt >nul 2>&1
exit /b 1
