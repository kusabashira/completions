_gsapp()
{
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local operation="${COMP_WORDS[1]}"
  local operations='
    add
    delete
    list
    help
    version
  '
  case "$COMP_CWORD" in
    1)
      COMPREPLY=( $(compgen -W "$operations" -- "$cur") )
      ;;
    *)
      case "$operation" in
        add)
          case "$COMP_CWORD" in
            2) _filedir ;;
            *) _command_offset 3 ;;
          esac
          ;;
        delete)
          local applications="$(gsapp list 2> /dev/null)"
          COMPREPLY=( $(compgen -W "$applications" -- "$cur") )
          ;;
        list|help|version)
          COMPREPLY=()
          ;;
        *)
          _filedir
          ;;
      esac
      ;;
  esac
}
complete -F _gsapp gsapp
