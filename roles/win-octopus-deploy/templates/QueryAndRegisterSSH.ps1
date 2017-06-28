$instances = & "C:\Program Files\Amazon\AWSCLI\aws.exe" ec2 describe-instances `
    --region us-east-1 `
    --filters "Name=tag:OS,Values=centos" "Name=tag:Purpose,Values=DukeLegion" `
    --query "Reservations[*].Instances[*].PublicIpAddress" `
    --output=text

ForEach ($host in $($instances -split "`r`n"))
{
    ./RegisterSSH.ps1 -Host $host -Account "Centos Duke Legion"
}