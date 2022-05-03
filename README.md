
# Deploy A Simple Python WebApp Using Terraform, Kubernetes and Docker

## Steps To Deploy Terraform IaC On GCP
- Make sure that Terraform has credentials to provision infrastructure on GCP
- Create service account on GCP to grant terraform permission as a owner on project  
- Create VPC with no autosubnet creation
- Create two subnets (Management, Restricted)
- Attach Natgateway to managment subnet
- Create prober firewall rules to applied on VPC
- Create secondary ip ranges in restricted subnet for both pods and services that will be created in cluster
- Create instance in Management Subnet  with no external ip to use it as Bastion host to connect cluster.
- Create service account for bastion instance with roles [roles/container.admin, roles/storage.admin] to be able to access cluster and pull images from GCR
- Create cluster using Kubernetes Engine
- Attach cluster to restricted subnet
- Create nodepool of 3 nodes in multiple zones, attach service account used before for bastion instance


## Run Terraform Code Commands
#### To Initilize Project and Provsion IAC
```sh
terrafrom init 
terrafrom apply
```
## Screenshots
### VPC and Subnets
![App Screenshot](https://github.com/mostafahassan097/GCP-DevOps-Task/blob/main/Screenshots/vpc-1.png)
![App Screenshot](https://github.com/mostafahassan097/GCP-DevOps-Task/blob/main/Screenshots/vpc-2.png)
### Natgateway
![App Screenshot](https://github.com/mostafahassan097/GCP-DevOps-Task/blob/main/Screenshots/nat.png)
### Firewall Rules
![App Screenshot](https://github.com/mostafahassan097/GCP-DevOps-Task/blob/main/Screenshots/fw.png)
### Bastion Instance and Nodes
![App Screenshot](https://github.com/mostafahassan097/GCP-DevOps-Task/blob/main/Screenshots/bastion-nodes.png)
### Service Account
![App Screenshot](https://github.com/mostafahassan097/GCP-DevOps-Task/blob/main/Screenshots/sa.png)
### Cluster
![App Screenshot](https://github.com/mostafahassan097/GCP-DevOps-Task/blob/main/Screenshots/c-1.png)
![App Screenshot](https://github.com/mostafahassan097/GCP-DevOps-Task/blob/main/Screenshots/c-2.png)
![App Screenshot](https://github.com/mostafahassan097/GCP-DevOps-Task/blob/main/Screenshots/c3.png)

