# The help target prints out all targets with their descriptions organized
# beneath their categories. The categories are represented by '##@' and the
# target descriptions by '##'. The awk commands is responsible for reading the
# entire set of makefiles included in this invocation, looking for lines of the
# file as xyz: ## something, and then pretty-format the target and help. Then,
# if there's a line with ##@ something, that gets pretty-printed as a category.
# More info on the usage of ANSI catalog characters for terminal formatting:
# https://en.wikipedia.org/wiki/ANSI_escape_code#SGR_parameters
# More info on the awk command:
# http://linuxcommand.org/lc3_adv_awk.php

## HELP
help: ## Display this concise help, ie only the porcelain target.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-25s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

help-all: ## Display all help items, ie including plumbing targets.
	@awk 'BEGIN {FS = ":.*#"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?#/ { printf "  \033[36m%-25s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)


## DOCKER COMPOSE
COMPOSE_COMMAND ?= docker compose
export COMPOSE_COMMAND

##@ Docker
docker-check:                                # Check docker command works
	@echo "================================================================================"
	@echo "Checking compose command: $$COMPOSE_COMMAND"
	@if eval $$COMPOSE_COMMAND ps >/dev/null 2>&1 || podman-info >/dev/null 2>&1; then \
		true; \
	else \
		echo '================================================================================'; \
		echo 'Compose should be running and the compose command set up, eg:\n\n\texport COMPOSE_COMMAND="docker compose"\n\t# Using podman\n\texport COMPOSE_COMMAND="podman-compose"\n'; \
		echo '================================================================================'; \
		exit 1; \
	fi
	@echo "...done."

build: docker-check ## Bring up common services and agents only
	$(COMPOSE_COMMAND) build

up: docker-check ## Bring up environment
	$(COMPOSE_COMMAND) up -d

down: docker-check ## Bring down environment
	$(COMPOSE_COMMAND) down

restart: docker-check ## Bring up common services only
	$(COMPOSE_COMMAND) restart

destroy: docker-check ## Tear down environment and destroy data
	$(COMPOSE_COMMAND) down -v

##@ Misc
load-catalogs: ## Load in the catalogs for the demo
	@echo "Loading catalogs..."
	@./scripts/load-catalogs.sh
	@echo "... done"

load-system-security-plans: ## Load in the system security plans for the demo
	@echo "Loading system security plans..."
	@./scripts/load-system-security-plans.sh
	@echo "... done"
