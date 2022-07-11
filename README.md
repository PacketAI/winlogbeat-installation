# winlogbeat-installation
## Download the script
Run as admin
```powershell
curl -o install.ps1 "https://raw.githubusercontent.com/PacketAI/winlogbeat-installation/main/install.ps1"
```
## Configure the winlogbeat
- you need to go to the [web interface](https://app-gcpdev.packetai.co/deploy/agent) to find your token named `X_PAI_TOKEN` and infra named `PAI_API_KEY`
- run the script with infra and token found in the step above and a cluster name you choose matching regex [a-z0-9]
```powershell
.\install.ps1 -clustername "" -infra "" -token ""
  ``` 
- You may need to change the long list of the input source ```winlogbeat.event_logs:```. Detailed doc could be found [here](https://www.elastic.co/guide/en/beats/winlogbeat/current/configuration-winlogbeat-options.html)
## Start the service
```powershell
.\install-service-winlogbeat.ps1
Start-Service winlogbeat
```


