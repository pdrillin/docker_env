ifneq (,$(wildcard ./.env))
    include .env
    export
endif

use-mysql:
	./script/db_manager.sh mysql
use-pgsql:
	./script/db_manager.sh pgsql

docker-build:
			${DC_COMMAND} build

docker-run:
			${DC_COMMAND} up

docker-stop:
			${DC_COMMAND} stop

docker-clean:
			${DC_COMMAND} down -v

