# crater-k8s-deploy
Files associated with deploying the opensource Crater project to kubernetes

Crater: https://github.com/bytefury/crater

## Building locally

If rancher is causing a issue for building, build locally and push remote.

```bash
# Build
docker build --build-arg user=crater-user --build-arg uid=1000 --no-cache -t 10.10.10.1:5000/crater-php:v1.0 .

# Then push
docker push 10.10.10.1:5000/crater-php:v1.0
```

Update the image in the deployment file and kubectl apply -f manually.

```yaml
image: ${CICD_IMAGE}:${CICD_EXECUTION_SEQUENCE}

# to (or vise versa)
registry:5000/crater-php:v1.0
```
