.PHONY: all generate-source
all:

NAME=
generate-source:
	test -n '$(NAME)'
	scripts/parse_usage '$(NAME)' > 'src/$(NAME).yaml'
