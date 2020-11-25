
include ../vsn.mk

APPNAME=erl_tidy
EMULATOR=beam
EBIN=../ebin
INCLUDE=../include

APP_TARGET=$(EBIN)/$(APPNAME).app

ERL_COMPILE_FLAGS += -I$(INCLUDE) +warn_unused_vars +nowarn_shadow_vars +warn_unused_import +warn_missing_spec +warn_untyped_record

SOURCES= \
	erl_tidy.erl

OBJECTS=$(SOURCES:%.erl=$(EBIN)/%.$(EMULATOR)) $(APP_TARGET)

all: $(OBJECTS)

clean:
	-rm -f $(OBJECTS)

$(EBIN)/%.$(EMULATOR):%.erl
	erlc -pa $(EBIN) -W $(ERL_COMPILE_FLAGS) -o$(EBIN) $<

$(APP_TARGET): $(APPNAME).app.src ../vsn.mk
	sed -e 's;%VSN%;$(ERL_TIDY_VSN);' $< > $@
