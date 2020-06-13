aws eks --region us-east-1 update-kubeconfig --name capstoneprj 
kubectl apply -f  app-deployment.yaml
kubectl get nodes
kubectl get pods
