ERL					?= erl
ERLC				= erlc
EBIN_DIRS		:= $(wildcard deps/*/ebin)
APPS				:= $(shell dir apps)

.PHONY: rel deps

all: deps compile

compile: deps
	@rebar compile

deps:
	@rebar get-deps
	@rebar check-deps

clean:
	@rebar clean

realclean: clean
	@rebar delete-deps

test:
	@rebar skip_deps=true ct

rel: deps
	@rebar compile generate

doc:
	rebar skip_deps=true doc
	for app in $(APPS); do \
		cp -R apps/$${app}/doc doc/$${app}; \
	done;

console:
	@erl -pa deps/*/ebin deps/*/include ebin include -boot start_sasl

analyze: checkplt
	@rebar skip_deps=true dialyze

buildplt:
	@rebar skip_deps=true build-plt

checkplt: buildplt
	@rebar skip_deps=true check-plt
