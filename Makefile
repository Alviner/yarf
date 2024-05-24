PROJECT_PATH := yarf

VERSION = $(shell poetry version -s)

all:
	@echo "make develop   - Prepare the project development env"
	@echo "make lint      - Syntax check python with ruff and mypy"
	@echo "make format 		- Format project with ruff"
	@echo "make pytest 		- Run project's tests"
	@echo "make clean 		- Remove files which creates by distutils"
	@exit 0

clean:
	rm -rf dist

lint:
	poetry run mypy
	poetry run ruff check

format:
	poetry run ruff format

pytest:
	poetry run pytest

develop: clean
	poetry -V
	poetry install
	poetry run pre-commit install

