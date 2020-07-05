kubectl set image deployment/nginx nginx=rabinprj123/udacityprj5:latest
if ! kubectl rollout status deployment nginx; then
    kubectl rollout undo deployment nginx
    kubectl rollout status deployment nginx
    exit 1
fi