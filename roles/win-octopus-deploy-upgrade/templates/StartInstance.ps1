#jinja2: newline_sequence:'\r\n'

Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "service --start" -Wait -NoNewWindow