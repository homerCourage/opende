#########################################################################
#                                                                       #
# Open Dynamics Engine, Copyright (C) 2001,2002 Russell L. Smith.       #
#   Email: russ@q12.org   Web: www.q12.org                              #
#                                                                       #
# This library is free software; you can redistribute it and/or         #
# modify it under the terms of the GNU Lesser General Public            #
# License as published by the Free Software Foundation; either          #
# version 2.1 of the License, or (at your option) any later version.    #
#                                                                       #
# This library is distributed in the hope that it will be useful,       #
# but WITHOUT ANY WARRANTY; without even the implied warranty of        #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU      #
# Lesser General Public License for more details.                       #
#                                                                       #
# You should have received a copy of the GNU Lesser General Public      #
# License along with this library (see the file LICENSE.TXT); if not,   #
# write to the Free Software Foundation, Inc., 59 Temple Place,         #
# Suite 330, Boston, MA 02111-1307 USA.                                 #
#                                                                       #
#########################################################################

USER_SETTINGS=config/user-settings
include $(USER_SETTINGS)
PLATFORM_MAKEFILE=config/makefile.$(PLATFORM)
include $(PLATFORM_MAKEFILE)

##############################################################################
# check some variables that were supposed to be defined

ifneq ($(BUILD),debug)
ifneq ($(BUILD),release)
$(error the BUILD variable is not set properly)
endif
endif

ifneq ($(PRECISION),SINGLE)
ifneq ($(PRECISION),DOUBLE)
$(error the PRECISION variable is not set properly)
endif
endif

##############################################################################
# package settings

ODE_SRC = \
	ode/src/array.cpp \
	ode/src/error.cpp \
	ode/src/memory.cpp \
	ode/src/obstack.cpp \
	ode/src/odemath.cpp \
	ode/src/matrix.cpp \
	ode/src/misc.cpp \
	ode/src/rotation.cpp \
	ode/src/mass.cpp \
	ode/src/ode.cpp \
	ode/src/step.cpp \
	ode/src/lcp.cpp \
	ode/src/joint.cpp \
	ode/src/space.cpp \
	ode/src/geom.cpp \
	ode/src/timer.cpp \
	ode/src/mat.cpp \
	ode/src/testing.cpp
ODE_PREGEN_SRC = \
	ode/src/fastldlt.c \
	ode/src/fastlsolve.c \
	ode/src/fastltsolve.c \
	ode/src/fastdot.c

ifeq ($(WINDOWS),1)
DRAWSTUFF_SRC = drawstuff/src/drawstuff.cpp drawstuff/src/windows.cpp
RESOURCE_FILE=lib/resources.RES
else
DRAWSTUFF_SRC = drawstuff/src/drawstuff.cpp drawstuff/src/x11.cpp
endif

ODE_LIB_NAME=ode
DRAWSTUFF_LIB_NAME=drawstuff

INCPATH=include
LIBPATH=lib

ODE_TEST_SRC_CPP = \
	ode/test/test_ode.cpp \
	ode/test/test_chain2.cpp \
	ode/test/test_hinge.cpp \
	ode/test/test_slider.cpp \
	ode/test/test_collision.cpp \
	ode/test/test_boxstack.cpp \
	ode/test/test_buggy.cpp \
	ode/test/test_joints.cpp \
	ode/test/test_space.cpp \
	ode/test/test_I.cpp \
	ode/test/test_step.cpp \
	ode/test/test_friction.cpp
ODE_TEST_SRC_C = \
	ode/test/test_chain1.c
DRAWSTUFF_TEST_SRC_CPP = \
	drawstuff/dstest/dstest.cpp

CONFIGURATOR_SRC=configurator.c
CONFIG_H=include/ode/config.h

##############################################################################
# derived things

DEFINES=

# add some defines depending on the build mode
ifeq ($(BUILD),release)
DEFINES+=$(C_DEF)dNODEBUG
endif
ifeq ($(BUILD),debug)
DEFINES+=$(C_DEF)dDEBUG_ALLOC
endif

# object file names
ODE_PREGEN_OBJECTS=$(ODE_PREGEN_SRC:%.c=%$(OBJ))
ODE_OBJECTS=$(ODE_SRC:%.cpp=%$(OBJ)) $(ODE_PREGEN_OBJECTS)
DRAWSTUFF_OBJECTS=$(DRAWSTUFF_SRC:%.cpp=%$(OBJ)) $(RESOURCE_FILE)

# library file names
ODE_LIB=$(LIBPATH)/$(LIB_PREFIX)$(ODE_LIB_NAME)$(LIB_SUFFIX)
DRAWSTUFF_LIB=$(LIBPATH)/$(LIB_PREFIX)$(DRAWSTUFF_LIB_NAME)$(LIB_SUFFIX)

# executable file names
ODE_TEST_EXE=$(ODE_TEST_SRC_CPP:%.cpp=%.exe) $(ODE_TEST_SRC_C:%.c=%.exe)
DRAWSTUFF_TEST_EXE=$(DRAWSTUFF_TEST_SRC_CPP:%.cpp=%.exe)
CONFIGURATOR_EXE=$(CONFIGURATOR_SRC:%.c=%.exe)

##############################################################################
# rules
#
# NOTE: the '.c' files are pregenerated sources, and must be compiled with
# -O1 optimization. that is why the rule for .c files is a bit different.
# why should it be compiled with O1? it is numerical code that is generated
# by fbuild. O1 optimization is used to preserve the operation orders that
# were discovered by fbuild to be the fastest on that platform. believe it or
# not, O2 makes this code run much slower for most compilers.

all: ode-lib drawstuff-lib ode-test drawstuff-test
	@echo SUCCESS

ode-lib: configure $(ODE_LIB)
drawstuff-lib: configure $(DRAWSTUFF_LIB)
ode-test: ode-lib drawstuff-lib $(ODE_TEST_EXE)
drawstuff-test: drawstuff-lib $(DRAWSTUFF_TEST_EXE)

$(ODE_LIB): $(ODE_OBJECTS)
	$(AR)$@ $(ODE_OBJECTS)

$(DRAWSTUFF_LIB): $(DRAWSTUFF_OBJECTS)
	$(AR)$@ $(DRAWSTUFF_OBJECTS)
ifdef RANLIB
	$(RANLIB) $@
endif

clean:
	-$(DEL_CMD) $(ODE_OBJECTS) $(ODE_TEST_EXE) $(ODE_LIB) $(DRAWSTUFF_OBJECTS) $(DRAWSTUFF_TEST_EXE) $(DRAWSTUFF_LIB) ode/test/*$(OBJ) drawstuff/dstest/*$(OBJ) $(CONFIGURATOR_EXE) $(CONFIG_H)

%$(OBJ): %.c
	$(CC) $(C_FLAGS) $(C_INC)$(INCPATH) $(DEFINES) $(C_OPT)1 $(C_OUT)$@ $<

%$(OBJ): %.cpp
	$(CC) $(C_FLAGS) $(C_INC)$(INCPATH) $(DEFINES) $(C_OPT)$(OPT) $(C_OUT)$@ $<

%.exe: %$(OBJ)
	$(CC) $(C_EXEOUT)$@ $< $(ODE_LIB) $(DRAWSTUFF_LIB) $(RESOURCE_FILE) $(LINK_OPENGL) $(LINK_MATH)


# windows specific rules

lib/resources.RES: drawstuff/src/resources.rc
	$(RC_RULE)


# configurator rules

configure: $(CONFIG_H)

$(CONFIG_H): $(CONFIGURATOR_EXE) $(USER_SETTINGS) $(PLATFORM_MAKEFILE)
	$(THIS_DIR)$(CONFIGURATOR_EXE) $(CONFIG_H) "$(CC) $(DEFINES) $(C_EXEOUT)" "$(DEL_CMD)" $(THIS_DIR)

$(CONFIGURATOR_EXE): $(CONFIGURATOR_SRC) $(USER_SETTINGS) $(PLATFORM_MAKEFILE)
	$(CC) $(C_DEF)d$(PRECISION) $(DEFINES) $(C_EXEOUT)$@ $<


# unix-gcc specific dependency making

DEP_RULE=gcc -M $(C_INC)$(INCPATH) $(DEFINES)
depend: $(ODE_SRC) $(ODE_PREGEN_SRC) $(DRAWSTUFF_SRC) $(ODE_TEST_SRC_CPP) $(ODE_TEST_SRC_C) $(DRAWSTUFF_TEST_SRC_CPP)
	$(DEP_RULE) $(ODE_SRC) $(ODE_PREGEN_SRC) | tools/process_deps ode/src/ > Makefile.deps
	$(DEP_RULE) $(DRAWSTUFF_SRC) | tools/process_deps drawstuff/src/ >> Makefile.deps
	$(DEP_RULE) $(ODE_TEST_SRC_CPP) | tools/process_deps ode/test/ >> Makefile.deps
	$(DEP_RULE) $(DRAWSTUFF_TEST_SRC_CPP) | tools/process_deps drawstuff/dstest/ >> Makefile.deps

include Makefile.deps