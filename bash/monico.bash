_monico()
{
  local cur prev words cword
  _init_completion -n = || return

  local opts="
    --no-clear
    --directory
    --help
    --version
  "

  local i
  local target=self
  for ((i=1; i < $cword; i++)); do
    case "${words[i]}" in
      -C|--no-clear|-d*|--directory=*)
        ;;
      -C*)
        words[i]="-${words[i]#-C}"
        ((i--))
        ;;
      -d|--directory)
        ((i++))
        ;;
      --help|--version)
        return
        ;;
      --)
        target=cmd
        ((i++))
        break
        ;;
      -*)
        ;;
      *)
        target=cmd
        break
        ;;
    esac
  done

  case "$target" in
    self)
      case "$prev" in
        -*d|--directory)
          _filedir -d
          return
          ;;
      esac
      case "$cur" in
        --directory=*)
          cur="${cur#--directory=}"
          _filedir -d
          ;;
        -*)
          COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
          [[ ${COMPREPLY[0]} == *= ]] && compopt -o nospace
          ;;
        *)
          _command_offset "$i"
          ;;
      esac
      ;;
    cmd)
      _command_offset "$i"
      ;;
  esac
}
complete -F _monico monico
