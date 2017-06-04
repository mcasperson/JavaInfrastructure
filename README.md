# Octopus Deploy Test Infrastructure

This scripts allow us to spin us test infrastructure in AWS for Java application
servers and CI servers.

## How to run

Tag EC2 instances with the `Application` tag set to one of the following:
* Bamboo
* BambooAgent
* Bamboo5
* Bamboo5Agent
* Tomcat
* WildflyStandalone

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