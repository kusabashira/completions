_gttrans()
{
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local operations="
    --help
    --get
    --set
  "
  COMPREPLY=( $(compgen -W "$operations" -- "$cur") )
}
complete -F _gttrans gttrans
