__lclip_lables()
{
  local labels="$(lclip --labels)"
  COMPREPLY=( $(compgen -W "$labels" -- "$cur") )
}

_lclip()
{
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local operation="${COMP_WORDS[1]}"
  local operations="
    --help
    --version
    --labels
    --get
    --set
    --delete
  "
  case "$COMP_CWORD" in
    1)
      COMPREPLY=( $(compgen -W "$operations" -- "$cur") )
      ;;
    *)
      case "$operation" in
        -g|-get|--get)
          __lclip_lables
          ;;
        -s|-set|--set)
          case "$COMP_CWORD" in
            2)
              __lclip_lables
              ;;
            *)
              _filedir
              ;;
          esac
          ;;
        -d|-delete|--delete)
          __lclip_lables
          ;;
        *)
          _filedir
          ;;
      esac
      ;;
  esac
  [[ ${COMPREPLY[0]} == *= ]] && compopt -o nospace
}
complete -F _lclip lclip
