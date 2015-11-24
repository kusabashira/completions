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
  esac
  [[ ${COMPREPLY[0]} == *= ]] && compopt -o nospace
}
complete -F _vub vub
