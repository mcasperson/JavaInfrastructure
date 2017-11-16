#jinja2: newline_sequence:'\r\n'

Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "create-instance --instance `"OctopusServer`" --config `"C:\Octopus\OctopusServer\OctopusServer-OctopusServer.config`" --console" -Wait -NoNewWindow
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "database --instance `"OctopusServer`" --connectionString `"Data Source=(local)\SQLEXPRESS;Initial Catalog=Octopus;Integrated Security=True`" --create --grant `"NT AUTHORITY\SYSTEM`" --console" -Wait -NoNewWindow
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "configure --instance `"OctopusServer`" --upgradeCheck `"True`" --upgradeCheckWithStatistics `"True`" --webForceSSL `"False`" --webListenPrefixes `"http://localhost:80/`" --commsListenPort `"10943`" --serverNodeName `"EC2AMAZ-UGB2SVB`" --usernamePasswordIsEnabled `"True`" --console" -Wait -NoNewWindow
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "service --instance `"OctopusServer`" --stop --console" -Wait -NoNewWindow
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "admin --instance `"OctopusServer`" --username `"admin`" --email `"a@a.com`" --password `"{{octopus_admin_password}}`" --console" -Wait -NoNewWindow
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "service --instance `"OctopusServer`" --install --reconfigure --start --dependOn `"MSSQL`$SQLEXPRESS`" --console" -Wait -NoNewWindow

