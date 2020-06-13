kubectl set image deployment/nginx nginx=capstone/udacityprj5:latest
kubectl rollout status deployment/nginx