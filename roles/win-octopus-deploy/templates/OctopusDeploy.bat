#jinja2: newline_sequence:'\r\n'

"C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" create-instance --instance "OctopusServer" --config "C:\Octopus\OctopusServer.config"
"C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" database --instance "OctopusServer" --connectionString "Data Source=(local)\{{sql_instance_name}};Initial Catalog=OctopusDeploy;Integrated Security=True" --create --grant "NT AUTHORITY\SYSTEM"
"C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" configure --instance "OctopusServer" --upgradeCheck "True" --upgradeCheckWithStatistics "False" --webAuthenticationMode "UsernamePassword" --webForceSSL "False" --webListenPrefixes "http://localhost:80/" --commsListenPort "10943" --serverNodeName "OctopusDeploy"
"C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" service --instance "OctopusServer" --stop
"C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" admin --instance "OctopusServer" --username "{{octopus_admin_username}}" --email "a@a.com" --password "{{octopus_admin_password}}"
"C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" service --instance "OctopusServer" --install --reconfigure --start --dependOn "MSSQL`${{sql_instance_name}}"
"C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" configure --instance "OctopusServer" --webForceSSL "False"
"C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" configure --instance "OctopusServer" --webListenPrefixes "http://localhost/,http://{{ansible_ip_addresses[0]}}/"
"C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" service --instance "OctopusServer" --stop --start