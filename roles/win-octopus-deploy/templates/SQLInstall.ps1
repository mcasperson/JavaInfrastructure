#jinja2: newline_sequence:'\r\n'

Start-Process -FilePath "C:\Apps\SqlServerExpress\Setup.exe" -ArgumentList "/Q /UPDATEENABLED=False /ACTION=INSTALL /FEATURES=SQLENGINE /INSTANCENAME=`"{{sql_instance_name}}`" /INSTANCEID=`"{{sql_instance_name}}`" /IACCEPTSQLSERVERLICENSETERMS" -Wait -NoNewWindow