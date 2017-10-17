#jinja2: newline_sequence:'\r\n'

Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "create-instance --instance `"OctopusServer`" --config `"C:\Octopus\OctopusServer.config`" --console" -Wait -NoNewWindow -RedirectStandardOutput "C:\Apps\OctopusDeploy1.out" -RedirectStandardError "C:\Apps\OctopusDeploy1.err"
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "database --instance `"OctopusServer`" --connectionString `"Data Source=(local)\{{sql_instance_name}};Initial Catalog=OctopusDeploy;Integrated Security=True`" --create --grant `"NT AUTHORITY\SYSTEM`" --console" -Wait -NoNewWindow -RedirectStandardOutput "C:\Apps\OctopusDeploy2.out" -RedirectStandardError "C:\Apps\OctopusDeploy2.err"
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "configure --instance `"OctopusServer`" --upgradeCheck `"True`" --upgradeCheckWithStatistics `"False`" --webAuthenticationMode `"UsernamePassword`" --webForceSSL `"False`" --webListenPrefixes `"http://localhost:80/`" --commsListenPort `"10943`" --serverNodeName `"OctopusDeploy`" --console" -Wait -NoNewWindow -RedirectStandardOutput "C:\Apps\OctopusDeploy3.out" -RedirectStandardError "C:\Apps\OctopusDeploy3.err"
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "service --instance `"OctopusServer`" --stop --console" -Wait -NoNewWindow -RedirectStandardOutput "C:\Apps\OctopusDeploy4.out" -RedirectStandardError "C:\Apps\OctopusDeploy4.err"
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "admin --instance `"OctopusServer`" --username `"{{octopus_admin_username}}`" --email `"a@a.com`" --password `"{{octopus_admin_password}}`" --console" -Wait -NoNewWindow -RedirectStandardOutput "C:\Apps\OctopusDeploy5.out" -RedirectStandardError "C:\Apps\OctopusDeploy5.err"
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "service --instance `"OctopusServer`" --install --reconfigure --start --dependOn `"MSSQL`${{sql_instance_name}}`" --console" -Wait -NoNewWindow -RedirectStandardOutput "C:\Apps\OctopusDeploy6.out" -RedirectStandardError "C:\Apps\OctopusDeploy6.err"
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "configure --instance `"OctopusServer`" --webForceSSL `"False`"" -Wait -NoNewWindow -RedirectStandardOutput "C:\Apps\OctopusDeploy7.out" -RedirectStandardError "C:\Apps\OctopusDeploy7.err"
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "configure --instance `"OctopusServer`" --webListenPrefixes `"http://localhost/,http://{{ansible_ip_addresses[0]}}/`"" -Wait -NoNewWindow -RedirectStandardOutput "C:\Apps\OctopusDeploy8.out" -RedirectStandardError "C:\Apps\OctopusDeploy8.err"
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "service --instance `"OctopusServer`" --stop --start" -Wait -NoNewWindow -RedirectStandardOutput "C:\Apps\OctopusDeploy9.out" -RedirectStandardError "C:\Apps\OctopusDeploy9.err"
