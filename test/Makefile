include $(LN_ROOT)/config.mk
include $(LN_BUILDTOOLS_DIR)/common.mk

BUILDTOOLS_DIR := $(LN_ROOT)/tools/buildtools
BUILD_DIR := ../$(PLUGIN_BUILD_DIR)
TARGET_TEST := $(PLUGIN_TARGET)_test
SRC := test_plugin.c test_plugin_op.c

.PHONY: all bin run

all: run

run: bin
	$(ECHO) Running tests...
	$(AT)$(OBJDIR)/$(TARGET_TEST) -o $(OBJDIR)/test_output.xml $(TEST_ARGS)

bin: $(OBJDIR)/$(TARGET_TEST)

$(OBJDIR)/$(TARGET_TEST): $(OBJS)
	$(call ld-bin)

include $(BUILDTOOLS_DIR)/common_recipe.mk
