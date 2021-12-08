# Jenkins Distributed Build

Creates a Jenkins master and nodes.

## Usage

Setup variables (existing SSH Key in AWS required)
```
export TF_VAR_region=ap-southeast-2
export TF_VAR_project_name=jenkins
export TF_VAR_key_name=key-name
export TF_VAR_backend_bucket=jenkins
```

Run Terraform
```
terraform init
terraform plan
terraform apply
```

## Setting up Jenkins

SSH into master
```
ssh -l ubuntu -i ~/.ssh/key-name.pem JENKINS_MASTER_ADDRESS
```
`jenkins_master_address` will be outputted by terraform.

Retrieve administrator password
```bash
cat /opt/jenkins_home/secrets/initialAdminPassword
```

Go to `jenkins_master_address` on port 80 and paste admin password.

- Install default plugins.
- Setup the first admin user, Next and start.
