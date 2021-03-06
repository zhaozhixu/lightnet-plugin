# prefix exported variables to avoid collision with LightNet
export LN_ROOT ?= /home/zhixu/workspace/projects/LightNet
export LN_BUILDTOOLS_DIR := $(LN_ROOT)/tools/buildtools
export PLUGIN_BUILD_DIR := build
export PLUGIN_TARGET := bigger-plugin
SRC_DIR := src
TEST_DIR := test

ifndef VERBOSE
AT = @
endif

define make-build-dir
$(AT)find $(SRC_DIR) -type d -print0 | xargs -0 -I{} mkdir -p $(PLUGIN_BUILD_DIR)/{}
$(AT)find $(TEST_DIR) -type d -print0 | xargs -0 -I{} mkdir -p $(PLUGIN_BUILD_DIR)/{}
endef

.PHONY: all plugin test cmd clean info help

all: plugin

plugin:
	$(call make-build-dir)
	$(AT)$(MAKE) -C $(LN_ROOT) P=$(CURDIR)/$(SRC_DIR) plugin

test: plugin
	$(AT)$(MAKE) -C $(LN_ROOT) P=$(CURDIR)/$(TEST_DIR) plugin-test

cmd:
	$(call make-build-dir)
	$(AT)$(MAKE) -C $(LN_ROOT) P=$(CURDIR)/$(SRC_DIR) plugin-cmd
	$(AT)$(MAKE) -C $(LN_ROOT) P=$(CURDIR)/$(TEST_DIR) plugin-cmd

clean:
	$(AT)$(MAKE) -C $(SRC_DIR) clean
	$(AT)$(MAKE) -C $(TEST_DIR) clean

info:
	@echo "Available make targets:"
	@echo "  all: make plugin"
	@echo "  plugin: make plugin"
	@echo "  test: make and run tests"
	@echo "  cmd: make compile_commpands.json"
	@echo "  clean: remove all the files generated by the build"
	@echo "  info/help: show this infomation"

help: info
