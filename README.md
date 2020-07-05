  As the final project of the Udacity Devops Nanodegree program this project requires to build CI/CD pipeline using jenkins and deploy application in EKS Cluster

# Jenkins Pipeline Steps
  The pipeline steps include the Lint HTML which validate the html,BUILD docker image,Upload image to docker hub, deploy app to EKS cluster, apply rolling update
    
# Create EKS cluster
  The project required to create Amazon EKS cluster using cloud formation scripts. However i used ekstl command as it also uses cloud formation script to create a 
  cluster. https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html
  
# Deploy to EKS Cluster & Rolling Update
  Since i am realtively new to docker and kubernetes i choose the simple ngingx hello world to deploy in the cluster. For the deployment startegy rolling update is
  used since its reatively simple application.
  
# Useful Resources for kubernetes deployment
  1.https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#deployment-status
  2.https://learnk8s.io/kubernetes-rollbacks
  3.https://dev.to/wingkwong/how-to-fix-insufficient-pods-issue-when-deploying-to-amazon-eks-d35
  
