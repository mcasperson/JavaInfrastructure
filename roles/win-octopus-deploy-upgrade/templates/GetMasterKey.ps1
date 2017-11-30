#jinja2: newline_sequence:'\r\n'

Start-Process -FilePath "C:\Program Files\Octopus Deploy\Octopus\Octopus.Server.exe" -ArgumentList "show-master-key --console" -Wait -NoNewWindow