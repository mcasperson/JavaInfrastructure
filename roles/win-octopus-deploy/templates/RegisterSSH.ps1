param([String]$Host)
param([String]$Account)

$headers = @{"X-Octopus-ApiKey"="{{api_key.stdout_lines[0]}}"}

$environments = Invoke-RestMethod "http://localhost/api/environments/all" -Headers $headers -Method Get
$theEnvironment = $environments | ? { $_.Name -eq "DukeLegion" }

$accounts = Invoke-RestMethod "http://url.to.octopus/api/accounts/all" -Headers $headers -Method Get
$theAccount = $accounts | ? { $_.Name -eq "$Account" }

$discovered = Invoke-RestMethod "http://localhost/api/machines/discover?host=$Host&type=Ssh" -Headers $headers -Method Get

#$discovered.Name = "MySshTargetName" # If you wanted to change the name of the deployment target (default is host name)
$discovered.Roles += "MyRole"
$discovered.EnvironmentIds += $theEnvironment.Id
$discovered.Endpoint.AccountId = $theAccount.Id

$discovered | ConvertTo-Json -Depth 10

Invoke-RestMethod "http://localhost/api/machines" -Headers $headers -Method Post -Body ($discovered | ConvertTo-Json -Depth 10)