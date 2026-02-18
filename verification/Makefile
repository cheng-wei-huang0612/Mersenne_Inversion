.PHONY: help docker-ls docker-cv-help docker-run docker-sh cv docker-cec-equivalent

IMAGE ?= cesare_cryptoline:latest
DOCKER ?= docker

# Repo root is the parent of this directory.
REPO_ROOT := $(abspath $(CURDIR)/..)
WORKDIR_IN_CONTAINER ?= /work

help:
	@echo "Targets:"
	@echo "  docker-ls                 Run 'ls' inside $(IMAGE)"
	@echo "  docker-cv-help            Run 'cv --help' inside $(IMAGE) (via bash -ic)"
	@echo "  docker-sh                 Interactive shell in $(IMAGE)"
	@echo "  docker-run CMD='...'      Run any command inside $(IMAGE) (via bash -ic)"
	@echo "  cv FILE=... [ARGS='...']  Run cv on a file (via bash -ic)"
	@echo "  docker-cec-equivalent     Run cv_cec equivalence check in verification/equivalent"
	@echo ""
	@echo "Examples:"
	@echo "  make docker-run CMD='cv --help'"
	@echo "  make docker-run CMD='python3 script.py'"
	@echo "  make cv FILE=inverse.cl ARGS='-v -jobs 8'"
	@echo "  make docker-cec-equivalent"

# Common mount/run flags
DOCKER_RUN = $(DOCKER) run --rm -t \
	-v "$(REPO_ROOT):$(WORKDIR_IN_CONTAINER)" \
	-w "$(WORKDIR_IN_CONTAINER)" \
	"$(IMAGE)"

docker-ls:
	$(DOCKER) run --rm \
		-v "$(REPO_ROOT):$(WORKDIR_IN_CONTAINER)" \
		-w "$(WORKDIR_IN_CONTAINER)" \
		"$(IMAGE)" \
		ls

docker-cv-help:
	$(DOCKER_RUN) bash -ic "cv --help"

# ✅ New: interactive shell (good for debugging environment)
docker-sh:
	$(DOCKER) run --rm -it \
		-v "$(REPO_ROOT):$(WORKDIR_IN_CONTAINER)" \
		-w "$(WORKDIR_IN_CONTAINER)" \
		"$(IMAGE)" \
		bash

# ✅ New: general command runner (Codex-friendly)
docker-run:
	@test -n "$(CMD)" || (echo "Usage: make docker-run CMD='cv --help'"; exit 2)
	$(DOCKER_RUN) bash -ic "$(CMD)"

# ✅ New: cv runner with args + file
cv:
	@test -n "$(FILE)" || (echo "Usage: make cv FILE=your.cl [ARGS='-v -jobs 8']"; exit 2)
	$(DOCKER_RUN) bash -ic "cv $(ARGS) $(FILE)"

CEC_EQUIV_DIR ?= verification/equivalent
CEC_OV ?= x11,x12,x13,x14,x3,x4,x5,x21,x22,VEC_v3_0,VEC_v3_1,VEC_v4_0,VEC_v4_1,VEC_v5_0,VEC_v5_1,VEC_v6_0,VEC_v6_1,VEC_v7_0,VEC_v7_1,VEC_v8_0,VEC_v8_1,VEC_v9_0,VEC_v9_1,VEC_v10_0,VEC_v10_1,VEC_v11_0,VEC_v11_1,VEC_v12_0,VEC_v12_1
CEC_REF ?= reference.cl
CEC_TGT ?= target.cl

docker-cec-equivalent:
	$(DOCKER_RUN) bash -ic "cd $(CEC_EQUIV_DIR) && cv_cec -ov $(CEC_OV) $(CEC_REF) $(CEC_TGT)"
