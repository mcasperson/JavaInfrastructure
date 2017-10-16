#jinja2: newline_sequence:'\r\n'

& "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" configure --instance "OctopusServer" --storageConnectionString "Data Source=(local)\SQLEXPRESS;Initial Catalog=Octopus;Integrated Security=True"
& "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" database --instance "OctopusServer" --create --grant "NT AUTHORITY\SYSTEM"
& "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" service --instance "OctopusServer" --stop
& "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" service --instance "OctopusServer" --install --reconfigure --start