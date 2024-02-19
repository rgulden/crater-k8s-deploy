# crater-k8s-deploy
Files associated with deploying the opensource Crater project to kubernetes

Crater: https://github.com/crater-invoice/crater

## Deploying

Clone the repo and cd into it from terminal.
```bash
git clone https://github.com/rgulden/crater-k8s-deploy.git
cd crater-k8s-deploy/
```

> **Note:** If you plan to use the ingress resource, you must update the `yaml` file before running the below command.

> **Note:** You should update the .env data in the configmaps `yaml` wherever `guldenconsulting.com` is mentioned.

Once those changes are done, run the following
```bash
kubectl apply -f manifests/ -n your-namespace
```
