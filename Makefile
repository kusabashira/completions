.PHONY: all generate-source generate-completions
all:

NAME=
generate-source:
	test -n '$(NAME)'
	scripts/parse_usage '$(NAME)' > 'src/$(NAME).yaml'

NAME=
generate-completions:
	test -n '$(NAME)'
	test -f 'src/$(NAME).yaml'
	acgen -t bash 'src/$(NAME).yaml' > 'bash/$(NAME).bash'
	acgen -t zsh  'src/$(NAME).yaml' > 'zsh/_$(NAME)'
	acgen -t fish 'src/$(NAME).yaml' > 'fish/$(NAME).fish'
	acgen -t yash 'src/$(NAME).yaml' > 'yash/$(NAME)'
