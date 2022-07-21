# winlogbeat-installation
## Download the winlogbeat
Download the winlogbeat zip from [official site](https://www.elastic.co/cn/downloads/beats/winlogbeat).  
Unzip the resource and go to the folder of winlogbeat.
## Download the config generation script
Run as admin
```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/PacketAI/winlogbeat-installation/main/generate-config.ps1" -OutFile generate-config.ps1

```
## Configure the winlogbeat
- you need to go to the [web interface](https://app-gcpdev.packetai.co/deploy/agent) to find your token named `X_PAI_TOKEN` and infra named `PAI_API_KEY`
- run the script with infra and token found in the step above and a cluster name you choose matching regex [a-z0-9]
```powershell
.\generate-config.ps1 -clustername "" -infra "" -token ""
  ``` 
- You may need to change the long list of the input source ```winlogbeat.event_logs:```. Detailed doc could be found [here](https://www.elastic.co/guide/en/beats/winlogbeat/current/configuration-winlogbeat-options.html)
## Start or stop the service
```powershell
.\install-service-winlogbeat.ps1
Start-Service winlogbeat

# Stop-Service winlogbeat
# services.msc
```


## Debug
Logs are by default in the following path
```powershell
C:\ProgramData\winlogbeat\Logs
```
## FAQ
- TLS Issue
    ```powershell
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    ```
- 

