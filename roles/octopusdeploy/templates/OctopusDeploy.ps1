#jinja2: newline_sequence:'\r\n'
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "create-instance --instance `"OctopusServer`" --config `"C:\Octopus\OctopusServer.config`"" -Wait
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "database --instance `"OctopusServer`" --connectionString `"Data Source=(local)\SQLEXPRESS;Initial Catalog=OctopusDeploy;Integrated Security=True`" --create --grant `"NT AUTHORITY\SYSTEM`"" -Wait
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "configure --instance `"OctopusServer`" --upgradeCheck `"True`" --upgradeCheckWithStatistics `"True`" --webAuthenticationMode `"UsernamePassword`" --webForceSSL `"False`" --webListenPrefixes `"http://localhost:80/`" --commsListenPort `"10943`" --serverNodeName `"OctopusDeploy`"" -Wait
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "service --instance `"OctopusServer`" --stop" -Wait
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "admin --instance `"OctopusServer`" --username `"admin`" --email `"a@a.com`" --password `"Password01!`"" -Wait
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "service --instance `"OctopusServer`" --install --reconfigure --start --dependOn `"MSSQL`$SQLEXPRESS`"" -Wait

