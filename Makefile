.PHONY: build
build:
	@docker build \
		-t bonjoursoftware/dupekiller:latest . \
		> /dev/null

.PHONY: run
run: build
	@docker run \
		--rm \
		bonjoursoftware/dupekiller:latest
