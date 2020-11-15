include $(LN_ROOT)/config.mk
include $(LN_BUILDTOOLS_DIR)/common.mk

BUILDTOOLS_DIR := $(LN_ROOT)/tools/buildtools
BUILD_DIR := ../$(PLUGIN_BUILD_DIR)
TARGET := bigger_plugin
SRC := plugin_op.c lrelu_cuda.c

.PHONY: all lib

all: lib

lib: $(OBJDIR)/$(TARGET).so

$(OBJDIR)/$(TARGET).so: $(OBJS)
	$(call ld-so)

include $(BUILDTOOLS_DIR)/common_recipe.mk
