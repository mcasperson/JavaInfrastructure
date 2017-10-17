#jinja2: newline_sequence:'\r\n'
Start-Process -Wait -NoNewWindow -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "create-instance --instance `"OctopusServer"`" --config `"C:\Octopus\test\OctopusServer-test.config`" --console"
Start-Process -Wait -NoNewWindow -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "configure --instance `"OctopusServer"`" --home `"C:\Octopus\test`" --storageConnectionString `"Data Source=(local)\SQLEXPRESS;Initial Catalog=OctopusDeploy;Integrated Security=True`" --upgradeCheck `"True`" --upgradeCheckWithStatistics `"True`" --webAuthenticationMode `"UsernamePassword`" --webForceSSL `"False`" --webListenPrefixes `"http://localhost:80/`" --commsListenPort `"10943`" --serverNodeName `"EC2AMAZ-ULJ4L4Q`" --console"
Start-Process -Wait -NoNewWindow -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "database --instance `"OctopusServer"`" --create --grant `"NT AUTHORITY\SYSTEM`" --console"
Start-Process -Wait -NoNewWindow -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "service --instance `"OctopusServer"`" --stop --console"
Start-Process -Wait -NoNewWindow -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "admin --instance `"OctopusServer"`" --username `"{{octopus_admin_username}}`" --password `"{{octopus_admin_password}}`" --console"
Start-Process -Wait -NoNewWindow -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "license --instance `"OctopusServer"`" --licenseBase64 `"PExpY2Vuc2UgU2lnbmF0dXJlPSJjMjZPY2dWY0l6TU83ZUZybUNnRWY1K21zdU5iejNsUE9aS1lzR0VXR0gxTTVlS1lvRmwyUURIMUN5bExsZUdXalJTUDUwSy85TXFoZDVaTmJUck4vQT09Ij4NCiAgPExpY2Vuc2VkVG8+T2N0b3B1czwvTGljZW5zZWRUbz4NCiAgPExpY2Vuc2VLZXk+MjMxNjUtMjk1OTUtMTU0MjEtNTgxMDI8L0xpY2Vuc2VLZXk+DQogIDxWZXJzaW9uPjIuMDwhLS0gTGljZW5zZSBTY2hlbWEgVmVyc2lvbiAtLT48L1ZlcnNpb24+DQogIDxWYWxpZEZyb20+MjAxNy0xMC0xNjwvVmFsaWRGcm9tPg0KICA8VmFsaWRUbz4yMDE3LTExLTMwPC9WYWxpZFRvPg0KICA8UHJvamVjdExpbWl0PlVubGltaXRlZDwvUHJvamVjdExpbWl0Pg0KICA8TWFjaGluZUxpbWl0PlVubGltaXRlZDwvTWFjaGluZUxpbWl0Pg0KICA8VXNlckxpbWl0PlVubGltaXRlZDwvVXNlckxpbWl0Pg0KPC9MaWNlbnNlPg==`" --console"
Start-Process -Wait -NoNewWindow -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "service --instance `"OctopusServer"`" --install --reconfigure --start --console"