.PHONY: db.ps db.up db.deploy \
db.down db.down.v db.ping db.dbs db.ps \
db.orders db.client.list


DB_DIR := $(CURDIR)/docker/database
DB_ENV_FILE := $(DB_DIR)/.db.env
DB_REQUESTS_DIR := $(DB_DIR)/requests
DB_REQUESTS_MOUNT := /requests
CONTAINER_SERVICE := lab-sqlserver
DB_PASSWORD := $(shell cat $(DB_ENV_FILE) | grep "PASS" | cut -d= -f2 | tr -d " ")
SQLCMD_BIN := /opt/mssql-tools18/bin/sqlcmd -S localhost,1433 -U sa -P '$(DB_PASSWORD)' -C
SQLCMD := docker exec -i $(CONTAINER_SERVICE) $(SQLCMD_BIN)
SQLCMD_W := docker exec -i -w $(DB_REQUESTS_MOUNT) $(CONTAINER_SERVICE) $(SQLCMD_BIN)
SQLCMD_DB := docker exec -it lab-sqlserver /opt/mssql-tools18/bin/sqlcmd \
-S localhost -U sa -P '$(DB_PASSWORD)' -C -d Boutique



db.up: ## runs db container
	@cd $(DB_DIR) && docker compose up -d
db.deploy: ## deploys the sql schema
	@$(SQLCMD_W) -i deploy.sql
db.down: ## deletes db container
	@cd $(DB_DIR) && docker compose down
db.down.v: ## deletes db container and volumes
	@cd $(DB_DIR) && docker compose down -v
db.ping:
	@$(SQLCMD) -Q "SELECT @@VERSION;"
db.dbs:
	@$(SQLCMD) -Q "SELECT name, database_id FROM sys.databases;"
db.ps:
	@echo -e "\n$(INFO_COLOR)------------------------------------------$(NO_COLOR)\n"
	result=$$(docker ps --filter "name=lab-sqlserver")
	if ! echo "$$result" | grep "lab"; then
		echo -e "$(ERROR_COLOR) No container lab-sqlserver running $(NO_COLOR)"
	else
		echo "$$result"
	fi
	@echo -e "\n$(INFO_COLOR)------------------------------------------$(NO_COLOR)\n"

db.client.list:
	@$(SQLCMD_DB) -Q "SELECT ClientScopes FROM dbo.Client;"
