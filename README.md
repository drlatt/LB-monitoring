# LB-monitoring
Tasks:
1. Create a set of scripts/cookbooks/manifests/etc. that would fire up 3 virtual machines/containers of
your choice, with OS of your choice on AWS.
2. Make the first virtual machine a load balancer and monitoring node for the other 2 vm's. The
monitoring machine should monitor the installed services, availability of the machines themselves. The
flavor of the monitoring software does not matter.
3. Install on the other two vm’s a web server of your choice which serves a text page with the machine
hostname in web root
4. Write a short explanation of your work and describe why you chose those specific technologies/tools
instead of others available

How to test the code
1. Create a terraform.tfvars file to store aws_access_key and aws_secret_key
2. Install terraform
3. run `terraform init` in the folder containing terraform config
4. run `terraform plan -out first` to get an idea of what exactly the code does and output it to a file called `first`
5. run `terraform apply first` to apply the changes saved in the `test` file and create your infrastructure
6. run `terraform destroy` to delete all resources created so we don't incur unnecessary cost
