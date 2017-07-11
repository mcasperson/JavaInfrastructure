#jinja2: newline_sequence:'\r\n'
cd C:\E2ETests
& C:\Java\x86\jre1.8.0_131\bin\java.exe "-DsaveReportsInHomeDir=true" "-DstartInternalProxy=-browserMob" "-DtestSource=hello-world-project.feature" "-DtestDestination=Chrome" -jar C:\Apps\IridiumApplicationTesting.jar
