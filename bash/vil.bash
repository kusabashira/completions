_vil()
{
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local opts="
    --quiet
    --silent
    --expression=
    --file=
    --help
    --version
  "
  case "$cur" in
    -*)
      COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
      ;;
    *)
      _filedir
      ;;
  esac
  [[ ${COMPREPLY[0]} == *= ]] && compopt -o nospace
}
complete -F _vil vil
