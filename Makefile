.PHONY: all generate-source generate-completions
all:

name=
generate-source:
	test -n '$(name)'
	scripts/parse_usage '$(name)' > 'src/$(name).yaml'

name=
generate-completions:
	test -n '$(name)'
	test -f 'src/$(name).yaml'
	acgen -t bash 'src/$(name).yaml' > 'bash/$(name).bash'
	acgen -t zsh  'src/$(name).yaml' > 'zsh/_$(name)'
	acgen -t fish 'src/$(name).yaml' > 'fish/$(name).fish'
	acgen -t yash 'src/$(name).yaml' > 'yash/$(name)'
