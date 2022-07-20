param ($clustername, $infra, $token)
$ProgressPreference = 'SilentlyContinue'

Invoke-WebRequest -Uri https://raw.githubusercontent.com/PacketAI/winlogbeat-installation/main/example.config.wlb.yml -OutFile winlogbeat.yml
(Get-Content winlogbeat.yml) -Replace '\$\{X-PAI-IID\}', $infra | Set-Content winlogbeat.yml
(Get-Content winlogbeat.yml) -Replace '\$\{CLUSTER_NAME\}', $clustername | Set-Content winlogbeat.yml
(Get-Content winlogbeat.yml) -Replace '\$\{X-PAI-TOKEN\}', $token | Set-Content winlogbeat.yml
