
# Deploy A Simple Python WebApp Using Terraform, Kubernetes and Docker

## 1- Steps To Deploy Terraform IaC On GCP
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
![App Screenshot](https://github.com/mostafahassan097/GCP-DevOps-Task/blob/main/Screenshots/c-3.png)


## 2- Steps To Dockerize Hello Wolrd WebApp
#### Before go through commands make sure you that you have enabled the Container Registry API ([Link](https://console.cloud.google.com/apis/enableflow?apiid=containerregistry.googleapis.com)
).
#### You have gcloud cli tool on your local setup  ([Link](https://cloud.google.com/sdk/docs/install)
#### You have docker on your local setup ([Link](https://docs.docker.com/engine/install/ubuntu/)
``` sh
#from Hello World WebApp Dir
(1)  gcloud auth configure-docker
(2)  docker build -t front-app . #Genrate a  Local image that will be used to deploy app
(3)  docker pull redis
(4)  docker tag front-app gcr.io/{YOUR PROJECT_ID}/front-app-v1
(5)  docker tag redis gcr.io/{YOUR PROJECT_ID}/redis-image
(6)  docker push   gcr.io/{YOUR PROJECT_ID}/front-app-v1
(7)  docker push gcr.io/{YOUR PROJECT_ID}/redis-image 
```
## Screenshots
### Images On Google Container Registry
![App Screenshot](https://github.com/mostafahassan097/GCP-DevOps-Task/blob/main/Screenshots/img.png)
