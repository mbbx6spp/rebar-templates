ERL					?= erl
ERLC				= erlc
EBIN_DIRS		:= $(wildcard deps/*/ebin)
APPS				:= $(shell dir apps)
NODE				= {{name}}
REL					= {{name}}

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

start: rel
	@./rel/$(NODE)/bin/$(REL) start

stop:
	@./rel/$(NODE)/bin/$(REL) stop

ping:
	@./rel/$(NODE)/bin/$(REL) ping

attach:
	@./rel/$(NODE)/bin/$(REL) attach

doc:
	rebar skip_deps=true doc
	for app in $(APPS); do \
		cp -R apps/$${app}/doc doc/$${app}; \
	done;

console:
	@erl -pa ebin include deps/*/ebin deps/*/include ebin include -boot start_sasl

analyze: checkplt
	@rebar skip_deps=true dialyze

buildplt:
	@rebar skip_deps=true build-plt

checkplt: buildplt
	@rebar skip_deps=true check-plt
