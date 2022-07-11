param ($clustername, $infra, $token)
$ProgressPreference = 'SilentlyContinue'
# curl -o wlb.zip  https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-8.3.2-windows-x86_64.zip
Invoke-WebRequest -Uri https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-8.3.2-windows-x86_64.zip -OutFile wlb.zip
Expand-Archive .\wlb.zip
mv .\wlb\winlogbeat-8.3.2-windows-x86_64\ .\winlogbeat\
rm -r .\wlb
rm .\wlb.zip
cd .\winlogbeat
# curl -o winlogbeat.yaml "https://raw.githubusercontent.com/PacketAI/winlogbeat-installation/main/example.config.wlb.yaml"
Invoke-WebRequest -Uri https://raw.githubusercontent.com/PacketAI/winlogbeat-installation/main/example.config.wlb.yaml -OutFile winlogbeat.yaml
(Get-Content winlogbeat.yaml) -Replace '\$\{X-PAI-IID\}', $infra | Set-Content winlogbeat.yaml
(Get-Content winlogbeat.yaml) -Replace '\$\{CLUSTER_NAME\}', $clustername | Set-Content winlogbeat.yaml
(Get-Content winlogbeat.yaml) -Replace '\$\{X-PAI-TOKEN\}', $token | Set-Content winlogbeat.yaml

.\install-service-winlogbeat.ps1
Start-Service winlogbeat
