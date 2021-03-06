param(
	[String]$linuxHost,
	[String]$account
)

$hostName="http://localhost"

$headers = @{"X-Octopus-ApiKey"="{{api_key.stdout_lines[0]}}"}

$existing = Invoke-RestMethod "$hostName/api/machines/all" -Headers $headers -Method Get

foreach ($machine in $existing) {
	if ($machine.Endpoint.Host -eq $linuxHost) {
		Write-Host "Host $linuxHost already exists, so skipping"
		exit
	}
}

$environments = Invoke-RestMethod "$hostName/api/environments/all" -Headers $headers -Method Get
$theEnvironment = $environments | ? { $_.Name -eq "DukeLegion" }

$accounts = Invoke-RestMethod "$hostName/api/accounts/all" -Headers $headers -Method Get
$theAccount = $accounts | ? { $_.Name -eq "$account" }

$discovered = Invoke-RestMethod "$hostName/api/machines/discover?host=$linuxHost&type=Ssh" -Headers $headers -Method Get

#$discovered.Name = "MySshTargetName" # If you wanted to change the name of the deployment target (default is host name)
$discovered.Roles += "linux"
$discovered.Roles += "wildfly"
$discovered.Roles += "wildfly10"
$discovered.Roles += "wildfly11"
$discovered.Roles += "eap6"
$discovered.Roles += "eap7"
$discovered.Roles += "tomcat"
$discovered.Roles += "tomcat7"
$discovered.Roles += "tomcat8"
$discovered.Roles += "tomcat9"
$discovered.EnvironmentIds += $theEnvironment.Id
$discovered.Endpoint.AccountId = $theAccount.Id

Invoke-RestMethod "$hostName/api/machines" -Headers $headers -Method Post -Body ($discovered | ConvertTo-Json -Depth 10)

Write-Host "Host $linuxHost added under account $account"