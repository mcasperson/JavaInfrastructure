$centosSSHAccountDetails = @{
	"AccountType"="SshKeyPair";
	"Username"="centos";
	"PrivateKeyFile"=@{
	    "HasValue"="true";
	    "NewValue"="{{duke_legion_pem}}"
    };
	"Name"="Centos Duke Legion";
	"Description"="Centos Duke Legion Account"
}
$headers = @{
	"X-Octopus-ApiKey"="{{api_key.stdout_lines[0]}}";
	"Content-Type"="application/json"
}
$addAccount = Invoke-RestMethod "http://localhost/api/accounts" `
    -Headers $headers `
    -Method Post `
    -Body ($centosSSHAccountDetails  | ConvertTo-Json -Depth 10)