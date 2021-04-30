# Building image

## Building locally

```bash
# Build
docker build --build-arg user=crater-user --build-arg uid=1000 --no-cache -t rgulden7/crater-php:v1.0 .

# Then push
docker push rgulden7/crater-php:v1.0
```

NOTE: Change rgulden7 to your own docker username if you would like to keep/maintain your own image.