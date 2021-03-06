# Hey Emacs, this is a -*- makefile -*-

#
# NPS HITL Simulator
#
# HITL specific makefile
#

nps.srcs += $(NPSDIR)/nps_main_hitl.c

# TODO: have this in ins_vectornav.xml
# will hopefully work better once nps and HITL are separate targets
nps.srcs += $(NPSDIR)/nps_ins_vectornav.c

# glib is still needed for some components (such as radio input)
nps.CFLAGS  += $(shell pkg-config glib-2.0 --cflags)
nps.LDFLAGS += $(shell pkg-config glib-2.0 --libs)

INS_DEV ?= \"/dev/ttyUSB1\"
INS_BAUD ?= B921600

AP_DEV ?= \"/dev/ttyUSB2\"
AP_BAUD ?= B921600

nps.CFLAGS += -DAP_DEV=\"$(AP_DEV)\"
nps.CFLAGS += -DAP_BAUD=$(AP_BAUD)
nps.CFLAGS += -DINS_DEV=\"$(INS_DEV)\"
nps.CFLAGS += -DINS_BAUD=$(INS_BAUD)
