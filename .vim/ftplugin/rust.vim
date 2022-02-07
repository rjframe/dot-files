let b:ale_linters = ['analyzer', 'cargo']
let g:ale_fixers = ['analyzer', 'cargo']

let b:ale_rust_analyzer_executable = expand('$HOME/bin/rust-analyzer-wrapper.sh')

let b:ale_rust_analyzer_config = {
\   'diagnostics': { 'disabled': ['inactive-code', 'unresolved-proc-macro'] }
\}
