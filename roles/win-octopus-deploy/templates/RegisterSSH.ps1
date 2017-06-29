param(
	[String]$linuxHost,
	[String]$account
)

$headers = @{"X-Octopus-ApiKey"="{{api_key.stdout_lines[0]}}"}

$existing = Invoke-RestMethod "http://localhost/api/machines/all" -Headers $headers -Method Get

foreach ($machine in $existing) {
	if ($machine.Endpoint.Host -eq $linuxHost) {
		Write-Host "Host $linuxHost already exists, so skipping"
		exit
	}
}

$environments = Invoke-RestMethod "http://localhost/api/environments/all" -Headers $headers -Method Get
$theEnvironment = $environments | ? { $_.Name -eq "DukeLegion" }

$accounts = Invoke-RestMethod "http://localhost/api/accounts/all" -Headers $headers -Method Get
$theAccount = $accounts | ? { $_.Name -eq "$account" }

$discovered = Invoke-RestMethod "http://localhost/api/machines/discover?host=$linuxHost&type=Ssh" -Headers $headers -Method Get

#$discovered.Name = "MySshTargetName" # If you wanted to change the name of the deployment target (default is host name)
$discovered.Roles += "DukeLegion"
$discovered.EnvironmentIds += $theEnvironment.Id
$discovered.Endpoint.AccountId = $theAccount.Id

Invoke-RestMethod "http://localhost/api/machines" -Headers $headers -Method Post -Body ($discovered | ConvertTo-Json -Depth 10)

Write-Host "Host $linuxHost added under account $account"