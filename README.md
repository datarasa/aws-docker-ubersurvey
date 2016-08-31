# aws-docker-ubersurvey
Amazon AWS EC2 servers running Docker with containerized datarasa/ubersurvey daemon. It uses default Amazon AMI PV image for us-east-1 datacenter.

To run, not forget to fill your personal information in terraform.tfvars.

Create SSH Key Pair:
We will need an SSH key to be bootstrapped on the newly created instances to be able to login. Make sure you have the ssh directory and generate a new key by running:
$ ssh-keygen -t rsa -C "insecure-deployer" -P '' -f ssh/insecure-deployer
The above command will create a public-private key pair in the ssh directory. This is an insecure key and should be replaced after the instance is bootstrapped.


To check what resourses will be created:

$ terraform plan

To create EC2 instances and their dependencies:

$ terraform apply

Finally point your server ip that will be printed by outputs.tf as follow for ubersurvey

http://ec2-instance-ip:8080

You can access newly created ec2 instance as follow:

ssh -i ssh/insecure-deployer ec2-user@ec2-instance-ip



