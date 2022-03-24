# crater-k8s-deploy
Files associated with deploying the opensource Crater project to kubernetes

Crater: https://github.com/bytefury/crater

## Deploying

Clone the repo and cd into it from terminal.
```bash
# Create your pvcs first
kubectl apply -f mariadb-pvc.yaml -n your-namespace \
	&& kubectl apply -f crater-pvc.yaml -n your-namespace
```

After you create the pvcs some updates are needed in the deployment file.

* On line 27 change fastcgi_pass crater-service.crater.svc.cluster.local:9000; to fastcgi_pass crater-service.your-namespace.svc.cluster.local:9000;
* In the ingress resource, either delete it if you are not using it, or change the hostname to your domain name.

Once those changes are done, run the following
```bash
# Create your pvcs first

# Create your secrets
kubectl create secret generic mariadb-pass --from-literal=MYSQL_PASSWORD=crater --from-literal=MYSQL_ROOT_PASSWORD=crater -n your-namespace

# Apply config
kubectl apply -f crater-deploy.yaml -n your-namespace
```
