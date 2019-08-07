# oanhnn/example-wordpress-with-docker

An example for developing Wordpress sites with Docker and deploy to AWS Elastic Beanstalk

## Requiments

- Bash
- Git
- Docker
- Docker Compose

## Dev

#### Setup project

```
$ git clone git@github.com:oanhnn/example-wordpress-with-docker.git project_dir
$ cd project_dir
$ cp .env.example .env
$ docker-compose up -d
```

#### Backup database

```
$ bin/backup-db.sh data/dump-20190807-102134.sql
```

#### Restore database

```
$ bin/restore-db.sh data/dump-20190807-102134.sql
```

#### Change site URL

```
$ bin/change-url.sh http://dev.example.com https://example.com
```

## Deploy to AWS Elastic Beanstalk

Follow the steps below to deploy this application to an Elastic Beanstalk Multi-container Docker environment. Accept the default settings unless indicated otherwise in the steps below:

1. Download the ZIP file from the Releases section of this repository.
2. Login to the [Elastic Beanstalk Management Console](https://console.aws.amazon.com/elasticbeanstalk)
3. Click ***Create New Application*** and give your app a name and description
4. Click ***Create web server*** and select an IAM instance profile to use.
   > Note: Please ensure the IAM instance profile you select has the necessary permissions. For more information, see [Container Instance Role](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_docker_ecs.html#create_deploy_docker_ecs_role)
5. Choose ***Multi-container Docker*** in the ***Predefined configuration*** dropdown and click ***Next***
6. Upload the ZIP file downloaded in step 1
7. Review and launch the application

## Contributing

All code contributions must go through a pull request and approved by a core developer before being merged. 
This is to ensure proper review of all the code.

Fork the project, create a feature branch, and send a pull request.

If you would like to help take a look at the [list of issues](https://github.com/oanhnn/example-nginx-proxy-auto-ssl/issues).

## License

This project is released under the MIT License.   
Copyright © 2019 [Oanh Nguyen](https://github.com/oanhnn)   
Please see [License File](https://github.com/oanhnn/example-nginx-proxy-auto-ssl/blob/master/LICENSE) for more information.
