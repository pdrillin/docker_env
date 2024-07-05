ifneq (,$(wildcard ./.env))
    include .env
    export
endif

COMMAND_DC = ${DC_COMMAND}

use-mysql:
	./script/mysql.sh mysql
use-pgsql:
	./script/mysql.sh pgsql

docker-build:
			$(COMMAND_DC) build

docker-run:
			$(COMMAND_DC) up

docker-stop:
			$(COMMAND_DC) stop

docker-clean:
			$(COMMAND_DC) down -v

conf:
ifeq (, $(strip $(COMMAND_DC)))
	@echo "Configuration de la commande docker";
	@if type docker-compose >/dev/null 2>&1; then\
		echo "DC_COMMAND=docker-compose" >> .env ;\
	elif type docker compose >/dev/null 2>&1; then\
		echo "DC_COMMAND=docker compose" >> .env ;\
	else\
		echo "Docker compose is missing";\
	fi
else
	@echo "Commande docker déjà configure";
endif


help:
	

# @if [ ${DC_COMMAND} != "" ]; then\
# 	echo "DC_COMMAND is already define ${DC_COMMAND}";\
# elif command -v docker-compose &> /dev/null; then\
# 	echo "DC_COMMAND=docker-compose" >> .env ;\
# elif command -v docker compose &> /dev/null; then\
# 	echo "DC_COMMAND=docker compose" >> .env ;\
# else\
# 	echo "Docker compose is missing";\
# fi