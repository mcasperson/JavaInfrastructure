$instances = & aws ec2 describe-instances `
    --region us-east-1 `
    --filters "Name=tag:OS,Values=centos" "Name=tag:Purpose,Values=DukeLegion" `
    --query "Reservations[*].Instances[*].PublicIpAddress" `
    --output=text