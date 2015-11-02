_vub()
{
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local opts="
    --filetype=
    --list
    --remove
    --update
    --help
    --version
  "
  case "$cur" in
    -*)
      COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
      ;;
  esac
  [[ ${COMPREPLY[0]} == *= ]] && compopt -o nospace
}
complete -F _vub vub
