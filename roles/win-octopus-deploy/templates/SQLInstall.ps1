#jinja2: newline_sequence:'\r\n'

$username = 'sqlexpress_install'
$password = '{{sql_install_user_password}}'

$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $username, $securePassword

Start-Process -Credential $credential -FilePath "C:\Apps\SqlServerExpress\Setup.exe" -ArgumentList "/Q /UPDATEENABLED=False /ACTION=INSTALL /FEATURES=SQLENGINE /INSTANCENAME=`"{{sql_instance_name}}`" /INSTANCEID=`"{{sql_instance_name}}`" /IACCEPTSQLSERVERLICENSETERMS" -Wait -NoNewWindow -RedirectStandardOutput "C:\Apps\SqlInstall.out" -RedirectStandardError "C:\Apps\SQLInstall.err"