_rant()
{
  local cur=${COMP_WORDS[COMP_CWORD]}
  local opts='
    --expression=
    --count=
    --separator=
    --help
    --version
  '
  case $cur in
    -*)
      COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
      ;;
    *)
      _filedir
      ;;
  esac
  [[ ${COMPREPLY[0]} == *= ]] && compopt -o nospace
}
complete -F _rant rant
