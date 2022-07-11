# winlogbeat-installation
## Download the script
Run as admin
```powershell
curl -o install.ps1 "https://raw.githubusercontent.com/PacketAI/winlogbeat-installation/main/install.ps1"
.\install.ps1
```
## Configure the winlogbeat
- you need to go to the [web interface](https://app-gcpdev.packetai.co/deploy/agent) to find your token named `X_PAI_TOKEN` 
- Open the winlogbeat.yaml and replace the value `${PLEASE_FIND_IT_IN_WEB_INTERFACE}` by the token
- You may need to change the long list of the input source ```winlogbeat.event_logs:```. Detailed doc could be found [here](https://www.elastic.co/guide/en/beats/winlogbeat/current/configuration-winlogbeat-options.html)
## Start the service
```powershell
.\install-service-winlogbeat.ps1
Start-Service winlogbeat
```


