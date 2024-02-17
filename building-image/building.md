# Building image

## Building locally

```bash
# Build
docker build --progress=plain --no-cache -t rgulden7/crater:4.2.0 .

# Then push
docker push rgulden7/crater:4.2.0
```

NOTE: Change rgulden7 to your own docker username if you would like to keep/maintain your own image.