$headers = @{
	"X-Octopus-ApiKey"="{{api_key.stdout_lines[0]}}";
	"Content-Type"="application/json"
}

$centosSSHAccountDetails = @{
	"AccountType"="SshKeyPair";
	"Username"="centos";
	"PrivateKeyFile"=@{
	    "HasValue"="true";
	    "NewValue"="{{duke_legion_pem}}";
    };
    "PrivateKeyPassphrase"=@{
        "HasVaule"="false";
    };
	"Name"="Centos Duke Legion";
	"Description"="Centos Duke Legion Account"
}

$addAccount = Invoke-RestMethod "http://localhost/api/accounts" `
    -Headers $headers `
    -Method Post `
    -Body ($centosSSHAccountDetails  | ConvertTo-Json -Depth 10)

$centosSSHAccountDetails = @{
	"AccountType"="SshKeyPair";
	"Username"="ubuntu";
	"PrivateKeyFile"=@{
	    "HasValue"="true";
	    "NewValue"="{{duke_legion_pem}}";
    };
    "PrivateKeyPassphrase"=@{
        "HasVaule"="false";
    };
	"Name"="Ubuntu Duke Legion";
	"Description"="Ubuntu Duke Legion Account"
}

$addAccount = Invoke-RestMethod "http://localhost/api/accounts" `
    -Headers $headers `
    -Method Post `
    -Body ($centosSSHAccountDetails  | ConvertTo-Json -Depth 10)