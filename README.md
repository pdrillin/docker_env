Web env with Docker
==============

* **"app/"** --> App/Website folder, contain all code
* **"nginx/"** --> contain the nginx server config file
* **"pgadmin/"** --> contain the pgadmin config file
* **"php/"** --> contain the Dockerfile
* **"scripts/"** --> contain the sh file to switch between pgsql and mysql as db for this docker env

# How to use ?

## With Makefile
First you need to run:
```bash
make conf
```
This command check your docker-compose version to set the default docker command (docker-compose or docker compose).

### Manage your database
Default this docker environement use PostgreSQL. Then you can use MySQl.
```bash
make use-mysql
```

### How to start ?
* Build container
```bash
make docker-build
```
* Start container
```bash
make docker-run
```
### How to remove ?
* Remove container
```bash
make docker-clear
```

## Without Makefile
    
### Manage your database
Default this docker environement use PostgreSQL. Then you can use MySQl.
```bash
./script/db_manager.sh mysql
```

### How to start ?
* Build container
```bash
docker compose buil
```
* Start container
```bash
docker compose up
```
### How to remove ?
* Remove container
```bash
docker compose down
```

