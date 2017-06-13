#jinja2: newline_sequence:'\r\n'

Start-Process -FilePath "C:\Program Files\Octopus Deploy\Tentacle\Tentacle.exe" -ArgumentList "create-instance --instance `"Tentacle`" --config `"C:\Octopus\Tentacle.config`" --console" -Wait -NoNewWindow
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Tentacle\Tentacle.exe" -ArgumentList "new-certificate --instance `"Tentacle`" --if-blank --console" -Wait -NoNewWindow
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Tentacle\Tentacle.exe" -ArgumentList "configure --instance `"Tentacle`" --reset-trust --console" -Wait -NoNewWindow
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Tentacle\Tentacle.exe" -ArgumentList "configure --instance `"Tentacle`" --home `"C:\Octopus`" --app `"C:\Octopus\Applications`" --port `"10933`" --noListen `"True`" --console" -Wait -NoNewWindow
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Tentacle\Tentacle.exe" -ArgumentList "register-with --instance `"Tentacle`" --server `"http://localhost`" --name `"Local Tentacle`" --apiKey `"{{api_key.stdout_lines[0]}}`" --comms-style `"TentacleActive`" --server-comms-port `"10943`" --force --environment `"local`" --role `"web`" --console" -Wait -NoNewWindow
Start-Process -FilePath "C:\Program Files\Octopus Deploy\Tentacle\Tentacle.exe" -ArgumentList "service --instance `"Tentacle`" --install --start --console" -Wait