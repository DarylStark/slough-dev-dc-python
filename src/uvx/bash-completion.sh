_uvx() {
    # Requires uv completion to be loaded
    __load_completion uv

    # Complete as if we are uv tool run
    COMP_WORDS=(uv tool run "${COMP_WORDS[@]:1}");
    COMP_CWORD=$((COMP_CWORD + 2));

    _uv "uv";
}

complete -F _uvx -o nosort -o bashdefault -o default uvx
# to make production ready maybe copy the exact complete -F logic from the _uv script, for older bash versions