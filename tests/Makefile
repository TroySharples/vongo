SIM           ?= ghdl
TOPLEVEL_LANG ?= vhdl

VHDL_SOURCES += ../parent.vhd
VHDL_SOURCES += ../child.vhd

EXTRA_ARGS += --std=08

ifneq ($(WAVE),)
SIM_ARGS += --wave=$(WAVE)
endif

TOPLEVEL = parent
MODULE   = parent_tb

include $(shell cocotb-config --makefiles)/Makefile.sim