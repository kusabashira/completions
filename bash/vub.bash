_vub()
{
  local cur prev words cword
  _init_completion -n = || return

  local opts="
    --filetype=
    --list
    --remove
    --update
    --help
    --version
  "

  declare -A modes
  modes=(
    [-l]=list   [--list]=list
    [-r]=remove [--remove]=remove
    [-u]=update [--update]=update
  )

  local mode=install
  local filetype=
  local i
  for ((i=1; i <= ${#words[@]}; i++)); do
    case "${words[i]}" in
      -l|--list|-r|--remove|-u|--update)
        mode="${modes[${words[i]}]}"
        ;;
      -l*|-r*|-u*)
        mode="${modes[${words[i]:0:2}]}"
        words[i]="-${words[i]#"${words[i]:0:2}"}"
        ((i--))
        ;;
      -f|--filetype)
        filetype="${words[i+1]}"
        ((i++))
        ;;
      -f=*|--filetype=*)
        filetype="${words[i]#*=}"
        ;;
      --help|--version)
        return
        ;;
      --)
        break
        ;;
    esac
  done

  case "$prev" in
    -*f|--filetype)
      local filetypes="$(ls "$HOME/.vim/ftbundle" 2> /dev/null)"
      COMPREPLY=( $(compgen -W "$filetypes" -- "$cur") )
      return
      ;;
  esac

  case "$cur" in
    -*f=*|--filetype=*)
      local filetypes="$(ls "$HOME/.vim/ftbundle" 2> /dev/null)"
      cur="${cur#*=}"
      COMPREPLY=( $(compgen -W "$filetypes" -- "$cur") )
      ;;
    -*)
      COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
      ;;
    *)
      if [[ $mode == remove || $mode == update ]]; then
        local root
        if [[ -z $filetype ]]; then
          root="$HOME/.vim/bundle"
        else
          root="$HOME/.vim/ftbundle/$filetype"
        fi
        local plugins="$(ls "$root" 2> /dev/null)"
        COMPREPLY=( $(compgen -W "$plugins" -- "$cur") )
      fi
      ;;
  esac
  [[ ${COMPREPLY[0]} == *= ]] && compopt -o nospace
}
complete -F _vub vub
