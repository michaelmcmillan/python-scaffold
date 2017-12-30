# Directories
ROOT_DIR=./
SRC_DIR=./src
LIB_DIR=./lib
TEST_DIR=./test
VENV_DIR=$(LIB_DIR)/venv

# Binaries
PIP=$(VENV_DIR)/bin/pip
PYTHON=$(VENV_DIR)/bin/python
SYSTEM_PYTHON=$(shell which python3.6)

# Environment
export PYTHONDONTWRITEBYTECODE=true
export PYTHONPATH=$(SRC_DIR):$(TEST_DIR):$(ROOT_DIR)

install:
	@test $(SYSTEM_PYTHON)
	@rm -rf $(VENV_DIR)
	$(SYSTEM_PYTHON) -m pip install virtualenv
	$(SYSTEM_PYTHON) -m virtualenv --no-site-packages $(VENV_DIR)
	@$(PIP) install -r $(LIB_DIR)/requirements.txt

test:
	@$(PYTHON) -m unittest discover -s $(TEST_DIR) -p test_*.py

.PHONY: install test
