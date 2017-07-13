#jinja2: newline_sequence:'\r\n'

Start-Process -FilePath "C:\ProgramData\chocolatey\bin\Octo.exe" -ArgumentList "push --package C:\Apps\demo.0.0.1.zip --replace-existing --server=http://localhost --apiKey={{api_key.stdout_lines[0]}}" -Wait -NoNewWindow
Start-Process -FilePath "C:\ProgramData\chocolatey\bin\Octo.exe" -ArgumentList "push --package C:\Apps\samplewebapp.1.0.0.0.nupkg --replace-existing --server=http://localhost --apiKey={{api_key.stdout_lines[0]}}" -Wait -NoNewWindow