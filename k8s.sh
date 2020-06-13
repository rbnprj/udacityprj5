aws eks --region us-east-1 update-kubeconfig --name capstone/udacityprj5:v1.0
kubectl apply -f  app-deployment.yaml
kubectl get nodes
kubectl get pods
