## Docker playground

Simple app configuration for node and react apps

in order to run as-is, add in `/etc/hosts` following:

`
127.0.0.1 websystem-docker-demo.com
127.0.0.1 websystem-docker-dev.com
`


### API

Node - basic express app with mongoose and 1 entity (to enable db interation)


### Frontend

Create react app boilerplate (without changes),
for details see https://create-react-app.dev/

### Mongodb

Db image for mongoose


### Nginx

nginx configuration for prod and dev versions



## Cloud deploy

In order to deploy this to the cloud (on example of aws) proper account with cli access should be pre-configured.
(take into account needed permissions for the service for selected user).

Login to registry
```
aws ecr get-login-password --region {region - replace this} | docker login --username AWS --password-stdin {aws_account_id -replace this}.dkr.ecr.{region - replace this}.amazonaws.com
```

Create registry
```
aws ecr create-repository \
    --repository-name hello-repository \
    --image-scanning-configuration scanOnPush=true \
    --region region
```

Tag image to push to repo

```
docker tag hello-world:latest aws_account_id.dkr.ecr.region.amazonaws.com/hello-repository
```

Push image

```
docker push aws_account_id.dkr.ecr.region.amazonaws.com/hello-repository
```

Create and select remote context

```
# assumes that docker login was performed!
docker context create ecs ecs-workshop

docker context use ecs-workshop
```



### Resources
 - https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html
 - https://aws.amazon.com/ru/blogs/containers/deploy-applications-on-amazon-ecs-using-docker-compose/
 - https://docs.docker.com/cloud/ecs-integration/
