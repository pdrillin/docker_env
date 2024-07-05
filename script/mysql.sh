#!/usr/bin/env bash

# Declare color
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

# Docker comper file path
File=docker-compose.yml

# Check number of parameters
if [ $# -ne 1 ]; then 
    echo -e "${RED}Un seul paramètre attendu ici${NOCOLOR}"
    exit 0
fi

if [ $1 != "mysql" ] && [ $1 != "pgsql" ] ; then 
    echo -e "${RED}Le paramètre attendu peut contenir seulement deux valeurs : mysql, pgsql${NOCOLOR}"
    exit 0
fi

# Check 
if grep -R $1 $File; then
  echo -e "${GREEN} MySQL is already use. No configuration needed${NOCOLOR}"
  exit 0
else
  echo -e "${YELLOW}PostgreSQL is already use as the db for the docker env"
  echo -e "MySQL configuration...${NOCOLOR}"

  echo -e "${GREEN}Docker image set${NOCOLOR}	"
  
  sed -i -e 's/image: postgres:13-alpine/image: mysql:8.0/g' $File

  echo -e "${GREEN}User var set"
  sed -i -e 's/POSTGRES_USER/MYSQL_USER/g' $File

  echo -e "${GREEN}User password var set" 
  sed -i -e 's/POSTGRES_PASSWORD/MYSQL_PASSWORD/g' $File

  echo -e "${GREEN}Database name var set"
  sed -i -e 's/POSTGRES_DB/MYSQL_DATABASE/g' $File

  echo -e "${GREEN}Database ports set"
  sed -i -e 's/- ${DB_PGSQL_PORT}:5432/- ${DB_MYSQL_PORT}:3306/g' $File

  echo -e "${GREEN}Volumes set"
  sed -i -e 's/- db-data:\/var\/lib\/postgresql\/data/- db-data:\/var\/lib\/mysql/g' $File
  
  echo -e "${GREEN}Root password set"
  sed -i -e '7 a \ \ \ \ \ \ MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}' $File

  echo -e "${YELLOW}MySQL is ready${NOCOLOR}"
  echo -e "${YELLOW}PhpMyAdmin configuration..${NOCOLOR}"
  
  echo -e "${GREEN}Docker image set"
  sed -i -e 's/image: dpage\/pgadmin4:latest/image: phpmyadmin\/phpmyadmin/g' $File
  
  echo -e "${GREEN}Add PMA_HOST"
  sed -i -e 's/PGADMIN_DEFAULT_EMAIL: ${DB_ADMIN_USER}/PMA_HOST: myapp_db/g' $File
  
  echo -e "${GREEN}remove unused env var"
  sed -i -e '/PGADMIN_DEFAULT_PASSWORD/d' $File
  
fi
