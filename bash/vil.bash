_vil()
{
  local cur prev words cword
  _init_completion -n = || return

  local opts="
    --quiet
    --silent
    --expression=
    --file=
    --help
    --version
  "
  case "$cur" in
    --expression=*)
      ;;
    --file=*)
      cur="${cur#--file=}"
      _filedir
      ;;
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
