# Jenkins Distributed Build

Creates a Jenkins master and nodes.

## Usage

Setup variables (existing SSH Key in AWS required)
```
export TF_VAR_project_name=jenkins
export TF_VAR_key_name=key-name
```
Change backend details in `meta.tf`.

Run Terraform
```
terraform init
terraform plan
terraform apply
```

## Setting up Jenkins

SSH into master
```
ssh ubuntu@JENKINS_MASTER_ADDRESS
```
`jenkins_master_address` will be outputted by terraform.

Retrieve administrator password:
```bash
sudo cat /root/.jenkins/secrets/initialAdminPassword
```

If using `user_data_for_docker.sh` use:
```bash
cat /opt/jenkins_home/secrets/initialAdminPassword
```

Go to `jenkins_master_address` on port 80 and paste admin password.

Install suggested plugins.

![Installing plugins](docs/images/installing-plugins.png)

Setup the first admin user, click Next and Save and Finish.

![Setup admin user](docs/images/setup-admin-user.png)

- Click Next and Start using Jenkins.
- Click Manage Jenkins
- Configure System
- Set # of executors to `0` for master and Save

## Setup nodes

- Click Manage Jenkins
- Manage Nodes
- New Node
- Node name: `node 0`, tick Permanent Agent and click Create
- Set # of executors to `2`
- Remote root directory to `/home/jenkins/jenkins_slave`
- Launch method: Launch agents via SSH
- Enter private ip of node-0 as Host
- Add Credentials `SSH Username with private key`
- Enter `jenkins` for the username
- Enter the private key directly pasting in the private SSH key used to provision the instances
- Select Non verifying Vericiation Strategy
- Click Save

Repeat for the other nodes except use `Copy from Existing Node` and enter the name of the first node.
- Click ok
- Change the private ip of the node and click save

![Setup node](docs/images/setup-node.png)
