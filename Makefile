PYTHON_VERSION = 3.8.6

DOCKER_PIPENV_TAG = bonjoursoftware/dupekiller:pipenv
DOCKER_PIPENV_RUN = docker run --rm $(DOCKER_PIPENV_TAG)

DOCKER_TAG = bonjoursoftware/dupekiller:latest
DOCKER_RUN = docker run --rm $(DOCKER_TAG)

.PHONY: pipenv-build
pipenv-build:
	@docker build \
		--file ./Dockerfile . \
		--build-arg PYTHON_VERSION=$(PYTHON_VERSION) \
		--tag $(DOCKER_PIPENV_TAG) \
		> /dev/null

.PHONY: pipenv-test
pipenv-test: pipenv-build
	@$(DOCKER_PIPENV_RUN) pytest

.PHONY: pipenv-fmt
pipenv-fmt: pipenv-build
	@$(DOCKER_PIPENV_RUN) black .

.PHONY: build
build: pipenv-test
	@docker build \
		--file ./dupekiller/Dockerfile . \
		--build-arg PYTHON_VERSION=$(PYTHON_VERSION) \
		--tag $(DOCKER_TAG) \
		> /dev/null

.PHONY: run
run: build
	@$(DOCKER_RUN)
