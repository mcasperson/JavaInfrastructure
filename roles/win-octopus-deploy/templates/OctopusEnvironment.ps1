#jinja2: newline_sequence:'\r\n'

Start-Process -FilePath "C:\ProgramData\chocolatey\bin\Octo.exe" -ArgumentList "create-environment --name=local --ignoreIfExists --server=http://localhost --apiKey={{api_key.stdout_lines[0]}}" -Wait -NoNewWindow
Start-Process -FilePath "C:\ProgramData\chocolatey\bin\Octo.exe" -ArgumentList "create-environment --name=DukeLegion --ignoreIfExists --server=http://localhost --apiKey={{api_key.stdout_lines[0]}}" -Wait -NoNewWindow