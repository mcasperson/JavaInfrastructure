#jinja2: newline_sequence:'\r\n'
cd "C:\Program Files\Octopus Deploy\Tentacle"

Tentacle.exe create-instance --instance "Tentacle" --config "C:\Octopus\Tentacle.config" --console
Tentacle.exe new-certificate --instance "Tentacle" --if-blank --console
Tentacle.exe configure --instance "Tentacle" --reset-trust --console
Tentacle.exe configure --instance "Tentacle" --home "C:\Octopus" --app "C:\Octopus\Applications" --port "10933" --noListen "True" --console
Tentacle.exe register-with --instance "Tentacle" --server "http://localhost" --name "Local Tentacle" --apiKey "{{api_key.stdout}}" --comms-style "TentacleActive" --server-comms-port "10943" --force --environment "YOUR_TENTACLE_ENVIRONMENTS" --role "YOUR_TENTACLE_ROLES" --console
Tentacle.exe service --instance "Tentacle" --install --start --console