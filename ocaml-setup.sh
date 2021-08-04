#! /bin/sh -x

set -e
set -u
set -o pipefail

opam_exe_dir="$HOME/.local/bin"

opam_packages=(
    dune
    ppx_import
    ppx_deriving
    ppx_expect
    #ppx_deriving_cmdliner
    #camomile
    menhir
    ocaml-print-intf
    ocaml-lsp-server
    utop
    # llvm
)

# echo "$opam_exe_dir" |
#     sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)

which opam
# opam init --bare --yes
# opam switch create 4.11.2
opam init --yes
eval $(opam env)
opam install "${opam_packages[@]}" --yes
