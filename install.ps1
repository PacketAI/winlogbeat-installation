$ProgressPreference = 'SilentlyContinue'
curl -o wlb.zip  https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-8.3.2-windows-x86_64.zip
Expand-Archive .\wlb.zip
mv .\wlb\winlogbeat-8.3.2-windows-x86_64\ .\winlogbeat\
rm -r .\wlb
rm .\wlb.zip
cd .\winlogbeat
curl -o winlogbeat.yaml "https://raw.githubusercontent.com/PacketAI/winlogbeat-installation/main/example.config.wlb.yaml"
param ($clustername, $infra, $token)
(Get-Content winlogbeat.yaml) -Replace '${X-PAI-IID}', $infra | Set-Content winlogbeat.yaml
(Get-Content winlogbeat.yaml) -Replace '${CLUSTER_NAME}', $clustername | Set-Content winlogbeat.yaml
(Get-Content winlogbeat.yaml) -Replace '${X-PAI-TOKEN}', $token | Set-Content winlogbeat.yaml
