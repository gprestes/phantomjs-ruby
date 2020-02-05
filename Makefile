SHELL := /bin/bash -eu

HADOLINT_VERSION      := 1.17.4
HARDWARE_NAME         := $(shell uname -m)
SYSTEM_NAME           := $(shell uname -s | tr A-Z a-z)

tools/hadolint/$(HADOLINT_VERSION)/hadolint:
	mkdir -p tools/hadolint/$(HADOLINT_VERSION)/
	curl -sSLf -o tools/hadolint/$(HADOLINT_VERSION)/hadolint https://github.com/hadolint/hadolint/releases/download/v$(HADOLINT_VERSION)/hadolint-$(SYSTEM_NAME)-$(HARDWARE_NAME)
	chmod +x tools/hadolint/$(HADOLINT_VERSION)/hadolint

.PHONY: lint
lint: tools/hadolint/$(HADOLINT_VERSION)/hadolint
	find . | grep -i dockerfile | xargs ./tools/hadolint/$(HADOLINT_VERSION)/hadolint
