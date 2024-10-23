.DEFAULT_GOAL := help
.SILENT:
.PHONY: help

help:  ## Display this help
	awk 'BEGIN {FS = ":.*## "; printf "Usage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Project Setup

set-env: ## Generate .envrc file template
	@if [ ! -f ./.envrc ]; then \
		current=$$(pwd); \
		echo 'export INJECTIONS_PATH="'"$$current"'/injections.toml"' > ./.envrc; \
		echo 'export ROOT_PATH="'"$$current"'"' >> ./.envrc; \
		echo 'export API_HOST="127.0.0.1"' >> ./.envrc; \
		echo 'export API_PORT="8000"' >> ./.envrc; \
	fi

set-injections: ## Generate dependency injections setup .toml file
	@if [ ! -f ./injections.toml ]; then \
		current=$$(pwd); \
		echo '[injections]' > ./injections.toml; \
		echo 'interface_name = "adapter_name"\n' >> ./injections.toml; \
	fi

set-dev-tools: ## Generate setup.cfg file
	@if [ ! -f ./setup.cfg ]; then \
		echo '[tool:pytest]' > ./setup.cfg; \
		echo 'pythonpath = src' >> ./setup.cfg; \
		echo 'log_cli = true\n' >> ./setup.cfg; \
		echo '[flake8]' >> ./setup.cfg; \
		echo 'per-file-ignores = __init__.py:F401' >> ./setup.cfg; \
		echo 'max-line-length = 79\n' >> ./setup.cfg; \
		echo '[isort]' >> ./setup.cfg; \
		echo 'profile = black\n' >> ./setup.cfg; \
		echo '[black]' >> ./setup.cfg; \
		echo 'line-length = 79\n' >> ./setup.cfg; \
		echo '[mypy]' >> ./setup.cfg; \
		echo 'mypy_path = src' >> ./setup.cfg; \
		echo 'exclude = tests' >> ./setup.cfg; \
		echo 'explicit_package_bases = true\n' >> ./setup.cfg; \
		echo '[bandit]' >> ./setup.cfg; \
		echo 'skips = B101\n' >> ./setup.cfg; \
		echo '[autopep8]' >> ./setup.cfg; \
		echo 'ignore = E501' >> ./setup.cfg; \
	fi

set-src: ## Generates the 'src' of the project structured in domain architecture
	mkdir -p ./src/domain/controllers
	mkdir -p ./src/domain/dtos
	mkdir -p ./src/domain/usecases
	mkdir -p ./src/domain/interfaces/bridges
	mkdir -p ./src/domain/interfaces/factories
	mkdir -p ./src/domain/interfaces/providers
	mkdir -p ./src/domain/interfaces/repositories

	mkdir -p ./src/entrypoints/request_dtos
	mkdir -p ./src/entrypoints/routes

	mkdir -p ./src/infrastructure/adapters/bridges
	mkdir -p ./src/infrastructure/adapters/factories
	mkdir -p ./src/infrastructure/adapters/providers
	mkdir -p ./src/infrastructure/adapters/repositories


	[ -e ./src/main.py ] || touch ./src/main.py

	[ -e ./src/__init__.py ] || touch ./src/domain/controllers/__init__.py
	[ -e ./src/__init__.py ] || touch ./src/domain/dtos/__init__.py
	[ -e ./src/__init__.py ] || touch ./src/domain/usecases/__init__.py
	[ -e ./src/__init__.py ] || touch ./src/domain/interfaces/bridges/__init__.py
	[ -e ./src/__init__.py ] || touch ./src/domain/interfaces/factories/__init__.py
	[ -e ./src/__init__.py ] || touch ./src/domain/interfaces/providers/__init__.py
	[ -e ./src/__init__.py ] || touch ./src/domain/interfaces/repositories/__init__.py

	[ -e ./src/__init__.py ] || touch ./src/entrypoints/request_dtos/__init__.py
	[ -e ./src/__init__.py ] || touch ./src/entrypoints/routes/__init__.py

	[ -e ./src/__init__.py ] || touch ./src/infrastructure/adapters/bridges/__init__.py
	[ -e ./src/__init__.py ] || touch ./src/infrastructure/adapters/factories/__init__.py
	[ -e ./src/__init__.py ] || touch ./src/infrastructure/adapters/providers/__init__.py
	[ -e ./src/__init__.py ] || touch ./src/infrastructure/adapters/repositories/__init__.py

set-dockerfile: ## Generate Dockerfile
	@if [ ! -f ./Dockerfile ]; then \
		echo '# Instala a dependencia principal do container' > ./Dockerfile; \
		echo 'FROM python:latest' >> ./Dockerfile; \
		echo '' >> ./Dockerfile; \
		echo '# Define o usuario do container' >> ./Dockerfile; \
		echo 'USER root' >> ./Dockerfile; \
		echo '' >> ./Dockerfile; \
		echo '# Copia o ambiente para o container' >> ./Dockerfile; \
		echo 'WORKDIR /app' >> ./Dockerfile; \
		echo 'ADD . .' >> ./Dockerfile; \
		echo '' >> ./Dockerfile; \
		echo '# Define variáveis de ambiente' >> ./Dockerfile; \
		echo 'ENV ENV_PATH="/app/env.toml"' >> ./Dockerfile; \
		echo 'ENV ROOT_PATH="/app"' >> ./Dockerfile; \
		echo 'ENV API_HOST="0.0.0.0"' >> ./Dockerfile; \
		echo 'ENV API_PORT="8000"' >> ./Dockerfile; \
		echo 'ENV PATH="/root/.local/bin:$PATH"' >> ./Dockerfile; \
		echo '' >> ./Dockerfile; \
		echo '# Criação do diretórios /app/utils' >> ./Dockerfile; \
		echo 'RUN mkdir -p /app/utils' >> ./Dockerfile; \
		echo '' >> ./Dockerfile; \
		echo '# Exponha a porta 8000' >> ./Dockerfile; \
		echo 'EXPOSE 8000' >> ./Dockerfile; \
		echo '' >> ./Dockerfile; \
		echo '# Instala dependências de sistema' >> ./Dockerfile; \
		echo 'RUN apt-get update && apt-get install -y --no-install-recommends \' >> ./Dockerfile; \
		echo '    build-essential \' >> ./Dockerfile; \
		echo '    libssl-dev \' >> ./Dockerfile; \
		echo '    libffi-dev \' >> ./Dockerfile; \
		echo '    python3-dev \' >> ./Dockerfile; \
		echo '    libpq-dev \' >> ./Dockerfile; \
		echo '    libjpeg-dev \' >> ./Dockerfile; \
		echo '    libpng-dev \' >> ./Dockerfile; \
		echo '    libfreetype6-dev \' >> ./Dockerfile; \
		echo '    curl \' >> ./Dockerfile; \
		echo '    git \' >> ./Dockerfile; \
		echo '    && apt-get clean \' >> ./Dockerfile; \
		echo '    && rm -rf /var/lib/apt/lists/*' >> ./Dockerfile; \
		echo '' >> ./Dockerfile; \
		echo '# Instalação do Poetry' >> ./Dockerfile; \
		echo 'RUN curl -sSL https://install.python-poetry.org | python3 - && \' >> ./Dockerfile; \
		echo '  poetry env use python3 && \' >> ./Dockerfile; \
		echo '  poetry install' >> ./Dockerfile; \
		echo '' >> ./Dockerfile; \
		echo '# Define o entrypoint' >> ./Dockerfile; \
		echo 'ENTRYPOINT ["/bin/bash", "/app/src/entrypoint.sh"]' >> ./Dockerfile; \
	fi

set-entrypoint: ## Generate entrypoint.sh file
	@if [ ! -f ./src/entrypoint.sh]; then \
		echo '#!/bin/bash\n' > ./src/entrypoint.sh; \
		echo 'echo "Executing the system!"' >> ./src/entrypoint.sh; \
		echo 'make run-prod' >> ./src/entrypoint.sh; \
	fi

set-libs: ## Installs all the Poetry dev dependencies
	poetry add fastapi uvicorn
	poetry add --dev bandit toml isort black flake8 mypy autopep8

setup: set-env set-injections set-dev-tools set-src set-dockerfile set-entrypoint set-libs ## Run all setups

##@ Format

format-black: ## run black (code formatter)
	poetry run black .

format-isort: ## run isort (imports formatter)
	poetry run isort .

format: format-black ## By default run black formatter

##@ Check

check-bandit: ## run bandit (check for common security issues)
	poetry run bandit -r ./src --skip B605

check-black: ## run black in check mode
	poetry run black . --check

check-isort: ## run isort in check mode
	poetry run isort . --check

check-flake8: ## run flake8 (pep8 linter)
	poetry run flake8 ./src --ignore=E501,W503

check-mypy: ## run mypy (static-type checker)
	poetry run mypy ./src

check-mypy-report: ## run mypy & create report
	poetry run mypy ./src

check: check-bandit check-black check-flake8 check-mypy ## run all checks

##@ Test

test: ## run tests
	poetry run pytest

##@ Run Code

run: ## run FastApi using $API_HOST and $API_PORT envs
	cd ./src && poetry run uvicorn main:app --reload --host=${API_HOST} --port=${API_PORT}

run-prod: ## run FastAPI without dev flags  
	cd ./src && poetry run uvicorn main:app --host=${API_HOST} --port=${API_PORT}

##@ Build Container

dev-build: ## Run Docker Container
	sudo docker build -t duck-container .
	
dev-run: ## Run Builded Docker Container
	sudo docker run -p 0.0.0.0:8000:8000 -it duck-container

##@ Git

count-changes: ## Count the changes between local branch and the HEAD
	git diff --shortstat HEAD
