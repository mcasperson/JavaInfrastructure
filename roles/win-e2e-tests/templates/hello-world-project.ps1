#jinja2: newline_sequence:'\r\n'
cd C:\E2ETests
& C:\Java\x86\jre1.8.0_131\bin\java.exe "-DscreenZoomFactor=1.0" "-DmoveCursorToElement=true" "-DfeatureGroupName=local" "-Dconfiguration=config.xml" "-Ddataset=dataset.xml" "-DmoveCursorToElement=true" "-DsaveReportsInHomeDir=true" "-DstartInternalProxy=-browserMob" "-DtestSource=hello-world-project.feature" "-DtestDestination=CHROMEFULLSCREEN" -jar C:\Apps\IridiumApplicationTesting.jar
