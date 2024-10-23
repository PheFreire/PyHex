# Instala a dependencia principal do container
FROM python:latest

# Define o usuario do container
USER root

# Copia o ambiente para o container
WORKDIR /app
ADD . .

# Define variáveis de ambiente
ENV ENV_PATH="/app/env.toml"
ENV ROOT_PATH="/app"
ENV API_HOST="0.0.0.0"
ENV API_PORT="8000"
ENV PATH="/root/.local/bin:ATH"

# Criação do diretórios /app/utils
RUN mkdir -p /app/utils

# Exponha a porta 8000
EXPOSE 8000

# Instala dependências de sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    libpq-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    curl \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instalação do Poetry
RUN curl -sSL https://install.python-poetry.org | python3 - && \
  poetry env use python3 && \
  poetry install

# Define o entrypoint
ENTRYPOINT ["/bin/bash", "/app/src/entrypoint.sh"]
