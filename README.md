# Octopus Deploy Test Infrastructure

This scripts allow us to spin us test infrastructure in AWS for Java application
servers and CI servers.

## How to run

The instances being configures are based on Centos 7.

Tag EC2 instances with the `Application` tag set to one of the following:
* Bamboo
* BambooAgent
* Bamboo5
* Bamboo5Agent
* Tomcat
* WildflyStandalone
* WildflyDC
* WildflySlave

Install Ansible and Boto:

```
sudo apt-get install python-pip
sudo pip install ansible boto3
```

Configure the AWS CLI locally with your credentials:

```
aws configure
```

Run the role from the command line:

```
ansible-playbook -i ec2.py --private-key /key/location/mykey.pem bamboo.yml
```

## Troubleshooting

If you get a message like `skipping: no hosts matched`, force the ec2 inventory script to
refresh by running `./ec2.py --refresh-cache`.

If you know the IP addresses of the EC2 instances you can add them to the `hosts` file, which
looks like this:
```
[tag_Appplication_WildflyDC]
0.0.0.0

[tag_Appplication_WildflySlave]
0.0.0.0
```
 
Then use the hosts file with the command:
```
ansible-playbook -i hosts --private-key /key/location/mykey.pem bamboo.yml
```