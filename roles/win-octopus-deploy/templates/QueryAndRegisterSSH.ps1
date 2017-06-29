$instances = & "C:\Program Files\Amazon\AWSCLI\aws.exe" ec2 describe-instances `
    --region us-east-1 `
    --filters "Name=tag:OS,Values=centos" "Name=tag:Purpose,Values=DukeLegion" `
    --query "Reservations[*].Instances[*].PublicIpAddress" `
    --output=text

foreach ($line in $instances.Split("`n"))
{
    ./RegisterSSH.ps1 -LinuxHost $line -Account "Centos Duke Legion"
}

$instances = & "C:\Program Files\Amazon\AWSCLI\aws.exe" ec2 describe-instances `
    --region us-east-1 `
    --filters "Name=tag:OS,Values=ubuntu" "Name=tag:Purpose,Values=DukeLegion" `
    --query "Reservations[*].Instances[*].PublicIpAddress" `
    --output=text

foreach ($line in $instances.Split("`n"))
{
    ./RegisterSSH.ps1 -LinuxHost $line -Account "Ubuntu Duke Legion"
}