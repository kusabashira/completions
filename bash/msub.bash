_msub()
{
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local opts="
    --boundary
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
}
complete -F _msub msub
