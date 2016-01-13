.PHONY: all generate-source generate-completions
all:

name=
generate-source:
	test -n '$(name)'
	scripts/parse_usage '$(name)' > 'sources/$(name).yaml'

name=
generate-completions:
	test -n '$(name)'
	test -f 'sources/$(name).yaml'
	acgen -t bash 'sources/$(name).yaml' > 'completions/bash/$(name).bash'
	acgen -t zsh  'sources/$(name).yaml' > 'completions/zsh/_$(name)'
	acgen -t fish 'sources/$(name).yaml' > 'completions/fish/$(name).fish'
	acgen -t yash 'sources/$(name).yaml' > 'completions/yash/$(name)'
