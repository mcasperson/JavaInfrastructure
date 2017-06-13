# Octopus Deploy Test Infrastructure

This scripts allow us to spin us test infrastructure in AWS for Java application
servers and CI servers.

## Prerequisites 

The Linux instances being configures are based on Centos 7.

### Dependencies

Install Ansible and Boto:

```
sudo apt-get install python-pip
sudo pip install ansible boto3
```

### Configure AWS

Configure the AWS CLI locally with your credentials:

```
aws configure
```

### Encrypted Passwords

A number of playbooks make reference to encrypted variable files. To use
these playbooks you will need to recreate the encrypted files yourself.
Each encrypted file has a file called `encrypted-example.yml` that shows
you the variables that need to be defined in the encrypted file. Replace
the dummy values with your own and encrypt the file with your own password
replacing the `encrypted.yml` file.

## Overall Structure

There are two types of playbooks in this repo: those that deploy a standalone role 
on an existing instance, and those that create an instance in EC2 and deploy
multiple roles.

### Standalone playbooks

Deploying standalone playbooks is useful when you want to create an environment
where a server hosts an individual role. For example, you might have 3 servers,
one hosting Octpus Deploy, one hosting a WildFly Domain Controller, and another
hosting a WildFly Slave.

Standalone playbooks refer to hosts like `tag_Appplication_WildflyDC`, which
is how the `ec2.py` inventory script groups EC2 instances with the tag
`Application` and the tag value `WildflyDC`.

To deploy a standalone playbook you would first create the instance in EC2,
assign the `Application` tag with the appropriate value, and then run the
playbook with the command:

```
ansible-playbook -i ec2.py --private-key /key/location/mykey.pem --vault-password-file ~/password.txt linux-wildfly-dc.yml
```

If you are not using EC2 but have a local VM, you can add the VM's IP address
to the file `hosts` like so:

```
[tag_Appplication_WildflyDC]
0.0.0.0
```

Then run the playbook with the command:

```
ansible-playbook -i hosts --private-key /key/location/mykey.pem --vault-password-file ~/password.txt linux-wildfly-dc.yml
```

### Combined Playbooks

Combined playbooks are useful when you want to spin up a single server
with multiple roles. For example the `win-OD-WF-with-server.yml` playbook
will create an EC2 Windows Server instance and install Octopus Deploy,
along with a Wildfly Domain Controller, WildFly Slave and a WildFly Standalone 
instance.

To deploy a combined playbook, run the command:

```
ansible-playbook --private-key /key/location/mykey.pem --vault-password-file ~/password.txt win-OD-WF-with-server.yml
```

## Notes

### Keystore
The WildFly vault keystore needs to be created as a JCEKS store type i.e.

```
keytool -genseckey -storetype jceks -alias vault -keyalg aes -keysize 256 -sigalg SHA1withRSA -keystore vault.keystore
```

If you create the wrong kind of keystore, you may see an error like:

```
org.jboss.security.vault.SecurityVaultException: java.lang.RuntimeException: PBOX00137: Security Vault does not contain SecretKey entry under alias (vault)
```

### Domain Controller S3 Discovery

The domain controllers and slaves need to be able to find each other via a central S3 bucket. The access and secret keys
for this bucket are defined in host-master-11-0-0-Alpha1.xml and host-slave-11-0-0-Alpha1.xml:

```
<discovery-option name="s3-discovery" code="org.jboss.as.host.controller.discovery.S3Discovery" module="org.jboss.as.host-controller">
    <property name="access-key" value="${VAULT::MyVault::s3_access_key::1}"/>
    <property name="secret-access-key" value="${VAULT::MyVault::s3_secret_key::1}"/>
    <property name="location" value="${VAULT::MyVault::s3_bucket::1}"/>
</discovery-option>
```

These credentials need to belong to a IAM user with the following permissions to allow access to the bucket and its subfolders.

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "id goes here",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::bucketname",
                "arn:aws:s3:::bucketname/*"
            ]
        }
    ]
}
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
ansible-playbook -i hosts --vault-password-file ~/password.txt --private-key /key/location/mykey.pem bamboo.yml
```