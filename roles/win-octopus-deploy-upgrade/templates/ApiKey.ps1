#jinja2: newline_sequence:'\r\n'
# https://github.com/OctopusDeploy/OctopusDeploy-Api/blob/master/Octopus.Client/PowerShell/Users/APIKey_Create.ps1

##CONFIGURATION##

$OctopusURI = "http://localhost" #Octopus URL

$OctopusUsername = "{{octopus_admin_username}}" #API Key will belong to this user
$OctopusPassword = "{{octopus_admin_password}}" #Password of the user above

$APIKeyPurpose = "Register Tentacle" #Brief text to describe the purpose of your API Key.


##PROCESS##


#Adding libraries. Make sure to modify these paths according to your environment setup.
Add-Type -Path "C:\Program Files\Octopus Deploy\Tentacle\Newtonsoft.Json.dll"
Add-Type -Path "C:\Program Files\Octopus Deploy\Tentacle\Octopus.Client.dll"

#Creating a connection
$endpoint = new-object Octopus.Client.OctopusServerEndpoint $OctopusURI
$repository = new-object Octopus.Client.OctopusRepository $endpoint

#Creating login object
$LoginObj = New-Object Octopus.Client.Model.LoginCommand
$LoginObj.Username = $OctopusUsername
$LoginObj.Password = $OctopusPassword

#Loging in to Octopus
$repository.Users.SignIn($LoginObj)

#Getting current user logged in
$UserObj = $repository.Users.GetCurrent()

#Creating API Key for user. This automatically gets saved to the database.
$ApiObj = $repository.Users.CreateApiKey($UserObj, $APIKeyPurpose)

#Returns the API Key in clear text
$ApiObj.ApiKey