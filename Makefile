
APPNAME=erl_tidy

SUB_DIRECTORIES = src

include vsn.mk

DOC_OPTS={def,{version,\"$(ERL_TIDY_VSN)\"}}

all: subdirs

subdirs:
	@for d in $(SUB_DIRECTORIES); do \
		(cd $$d; $(MAKE)); \
	done

clean:
	@for d in $(SUB_DIRECTORIES); do \
		(cd $$d; $(MAKE) clean); \
	done
	-rm -f doc/*.html doc/stylesheet.css doc/erlang.png doc/edoc-info

docs:
	erl -noshell -eval "edoc:application($(APPNAME), \".\", [$(DOC_OPTS)])" -s init stop
