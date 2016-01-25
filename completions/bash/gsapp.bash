_gsapp()
{
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local operation="${COMP_WORDS[1]}"
  local operations='
    add
    delete
    list
    help
  '
  case "$COMP_CWORD" in
    1)
      COMPREPLY=( $(compgen -W "$operations" -- "$cur") )
      ;;
    *)
      case "$operation" in
        delete)
          local applications="$(gsapp list 2> /dev/null)"
          COMPREPLY=( $(compgen -W "$applications" -- "$cur") )
          ;;
        *)
          _filedir
          ;;
      esac
      ;;
  esac
}
complete -F _gsapp gsapp
