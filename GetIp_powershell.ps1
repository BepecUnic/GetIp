$ipServices = @(
    "https://api.ipify.org"
    "https://ipv4-internet.yandex.net/api/v0/ip"
    "https://chek.zennolab.com/proxy.php"
    "https://ifconfig.me/ip"
    "https://icanhazip.com"
)

foreach ($url in $ipServices) {
    try {
        $ip = Invoke-RestMethod -Uri $url -TimeoutSec 5
        if ($ip -match '^\d{1,3}(\.\d{1,3}){3}$') {
            Write-Output $ip
            break
        }
    } catch {
        continue
    }
}
