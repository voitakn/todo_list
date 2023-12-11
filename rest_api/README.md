# Task manager REST API with using Fibel library

## Getting started

### Configure and run databse with migrations
1. Before starting local test version of the Task API you need to prepare your envirintment. 
To do this please install docker and docker compose to your laptop.  
2. In the beginning we should check our configuration in the .env file using command
```
cat .env
```
3. Then you have to install goose library for migrating your database. For this please execute a command bellow.
```
make install-deps
```
4. Nest step is a running our test database which is defined in the file docker-compose.yml to do that run the command
```
docker compose up -d pg-tasks
```
Also when you need stop the database, execute the command bellow
```
docker compose stop pg-tasks
```
5. To add new migration to the `migrations` folder run command
```
make local-migration-add migration_name=new_name
```
6. To update database to new migrationn execute command bellow
```
make local-migration-up
```
7. To downgrade database  run the command
```
make local-migration-down
``` 