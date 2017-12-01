#jinja2: newline_sequence:'\r\n'

$process = Start-Process -FilePath "C:\Apps\SSMS-Setup-ENU.exe" -ArgumentList "/install /quiet /norestart" -Wait -NoNewWindow -PassThru -RedirectStandardOutput "C:\Apps\SSMSInstall.out" -RedirectStandardError "C:\Apps\SSMSInstall.err"
exit $process.ExitCode