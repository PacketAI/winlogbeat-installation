param ($clustername, $infra, $token)
$ProgressPreference = 'SilentlyContinue'
# curl -o wlb.zip  https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-8.3.2-windows-x86_64.zip
Invoke-WebRequest -Uri https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-8.3.2-windows-x86_64.zip -OutFile wlb.zip
Expand-Archive .\wlb.zip
mv .\wlb\winlogbeat-8.3.2-windows-x86_64\ .\winlogbeat\
rm -r .\wlb
rm .\wlb.zip
cd .\winlogbeat
