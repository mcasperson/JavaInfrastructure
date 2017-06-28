param(
	[String]$linuxHost,
	[String]$account
)

$headers = @{"X-Octopus-ApiKey"="API-6IH8WFHTAZXTND1AJNOYH5PCATC"}

$environments = Invoke-RestMethod "http://localhost/api/environments/all" -Headers $headers -Method Get
$theEnvironment = $environments | ? { $_.Name -eq "DukeLegion" }

$accounts = Invoke-RestMethod "http://localhost/api/accounts/all" -Headers $headers -Method Get
$theAccount = $accounts | ? { $_.Name -eq "$account" }

$discovered = Invoke-RestMethod "http://localhost/api/machines/discover?host=$linuxHost&type=Ssh" -Headers $headers -Method Get

#$discovered.Name = "MySshTargetName" # If you wanted to change the name of the deployment target (default is host name)
$discovered.Roles += "DukeLegion"
$discovered.EnvironmentIds += $theEnvironment.Id
$discovered.Endpoint.AccountId = $theAccount.Id

$discovered | ConvertTo-Json -Depth 10

Invoke-RestMethod "http://localhost/api/machines" -Headers $headers -Method Post -Body ($discovered | ConvertTo-Json -Depth 10)