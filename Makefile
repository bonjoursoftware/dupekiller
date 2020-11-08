PYTHON_VERSION = 3.8.6
DOCKER_TEST_TAG = bonjoursoftware/dupekiller:test
DOCKER_BUILD_TAG = bonjoursoftware/dupekiller:latest

.PHONY: build-test
build-test:
	@docker build \
		--file ./tests/Dockerfile . \
		--build-arg PYTHON_VERSION=$(PYTHON_VERSION) \
		--tag $(DOCKER_TEST_TAG) \
		> /dev/null

.PHONY: test
test: build-test
	@docker run \
		--rm \
		$(DOCKER_TEST_TAG)

.PHONY: build
build: test
	@docker build \
		--build-arg PYTHON_VERSION=$(PYTHON_VERSION) \
		--tag $(DOCKER_BUILD_TAG) . \
		> /dev/null

.PHONY: run
run: build
	@docker run \
		--rm \
		$(DOCKER_BUILD_TAG)
