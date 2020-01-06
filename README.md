Login to your registry (e.g. hub.docker.com by default)

```
docker login -u {username} -p {password}
```

Build the image

```
docker build --build-arg VERSION=v3 . -t {username}/hostname:v3
docker image ls
```


Push the image

```
docker push {username}/hostname:v3
```
Run the image:
```
docker run --rm --name hostname -p 8080:80 -d edebmit/hostname:v3
```
Test that the image works:
```
curl http://localhost:8080
```
Stop the running instance by ctl+c

docker stop hostname

Clean up the local build/run environment:

docker rmi {username}/hostname:v3
docker rmi nginx:latest

