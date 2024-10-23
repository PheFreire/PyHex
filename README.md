# Hexagonal Python Template

## Overview

This project is a **Python development template** designed to implement **hexagonal architecture** principles, also known as the ports and adapters pattern. The goal of this template is to provide a clean, maintainable, and scalable structure for building applications in Python.

This template leverages **Poetry** for dependency management and packaging, ensuring a streamlined development process. It is built on **FastAPI**, enabling high-performance web applications with ease of use. Additionally, the project is configured with a series of formatters and checkers, including **Black**, **Flake8**, and **isort**, to enforce code quality and consistency.

The template includes a foundational infrastructure configuration and provides various custom commands to simplify the developer's workflow, making it easier to manage tasks and enhance productivity.

Furthermore, this project utilizes **pytest** for testing, ensuring that the application is robust and reliable through comprehensive test coverage.

## Features

- **Dependency Management**: Utilizes **Poetry** for streamlined dependency management and packaging.
- **FastAPI Integration**: Built on **FastAPI**, enabling high-performance web applications with ease of use.
- **Code Quality Tools**: Configured with a series of formatters and checkers, including **Black**, **Flake8**, and **isort**, to enforce code quality and consistency.
- **Infrastructure Configuration**: Includes a foundational infrastructure setup to jumpstart development.
- **Custom Commands**: Provides various custom commands to simplify the developer's workflow, enhancing productivity.
- **Testing Framework**: Utilizes **pytest** for thorough testing and validation of application functionality.

## Getting Started

To get started with this template, clone the repository and install the necessary dependencies. Follow the instructions in the [Installation](#installation) section.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/PheFreire/PyHex.git
   cd PyHex


## Commands Guide

### Makefile Commands

This project includes several commands defined in the Makefile to help with setup, formatting, checks, testing, and running the application.

- **`make help`**: Display help information about available commands.
  
### Project Setup

- **`make set-env`**: Generate a `.envrc` file template with environment variables.
- **`make set-injections`**: Generate a dependency injections setup `.toml` file.
- **`make set-dev-tools`**: Generate a `setup.cfg` file for project tools.
- **`make set-src`**: Generate the project structure in the `src` directory.
- **`make set-dockerfile`**: Generate a Dockerfile for the project.
- **`make set-entrypoint`**: Generate an entrypoint script.
- **`make set-libs`**: Install all the Poetry development dependencies.
- **`make setup`**: Run all setup commands in one go.

### Formatting

- **`make format-black`**: Run Black for code formatting.
- **`make format-isort`**: Run isort for sorting imports.
- **`make format`**: Run the Black formatter by default.

### Checks

- **`make check-bandit`**: Run Bandit to check for common security issues.
- **`make check-black`**: Run Black in check mode.
- **`make check-isort`**: Run isort in check mode.
- **`make check-flake8`**: Run Flake8 for PEP 8 compliance.
- **`make check-mypy`**: Run Mypy for static type checking.
- **`make check`**: Run all checks.

### Testing

- **`make test`**: Run tests using pytest.

### Running the Application

- **`make run`**: Run FastAPI with development settings.
- **`make run-prod`**: Run FastAPI in production mode.

### Building and Running Docker Container

- **`make dev-build`**: Build the Docker container.
- **`make dev-run`**: Run the built Docker container.

### Git Commands

- **`make count-changes`**: Count the changes between the local branch and the HEAD.

## Poetry Commands

In addition to the Makefile commands, you can use the following basic Poetry commands:

- **`poetry install`**: Install the project dependencies.
- **`poetry run <command>`**: Run a command within the project's virtual environment.
- **`poetry update`**: Update dependencies to their latest versions according to the version constraints in `pyproject.toml`.
- **`poetry shell`**: Activate the virtual environment for the project.

Feel free to explore these commands to efficiently manage and develop your application.

## Hexagonal Architecture Overview

For a deeper understanding of the Hexagonal Architecture concepts implemented in this project, please visit my GitHub repository:

[Hexagonal Architecture Concepts](https://github.com/PheFreire/Hexagonal-Architecture-Concepts)

This repository provides a comprehensive explanation of the hexagonal architecture, also known as the ports and adapters pattern. It covers the fundamental principles, advantages, and practical implementations of this architectural style, along with examples and best practices for effectively organizing your applications.
