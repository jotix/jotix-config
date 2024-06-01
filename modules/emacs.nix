/*
This is a nix expression to build Emacs and some Emacs packages I like
from source on any distribution where Nix is installed. This will install
all the dependencies from the nixpkgs repository and build the binary files
without interfering with the host distribution.

To build the project, type the following from the current directory:

$ nix-build emacs.nix

To run the newly compiled executable:

$ ./result/bin/emacs
*/

# The first non-comment line in this file indicates that
# the whole file represents a function.
{ pkgs ? import <nixpkgs> {} }:

let
  # The let expression below defines a myEmacs binding pointing to the
  # current stable version of Emacs. This binding is here to separate
  # the choice of the Emacs binary from the specification of the
  # required packages.
  myEmacs = pkgs.emacs;
  # This generates an emacsWithPackages function. It takes a single
  # argument: a function from a package set to a list of packages
  # (the packages that will be available in Emacs).
  emacsWithPackages = (pkgs.emacsPackagesFor myEmacs).emacsWithPackages;
in
# The rest of the file specifies the list of packages to install
emacsWithPackages (epkgs: (with epkgs; [
  vertico
  marginalia
  consult
  orderless
  multiple-cursors
  dashboard
  nerd-icons
  all-the-icons
  all-the-icons-dired
  spacemacs-theme
  spaceline
  vterm
  rainbow-delimiters
  which-key
  beacon
  hungry-delete
  sudo-edit
  nix-mode
  undo-tree
  org-auto-tangle
  org-bullets
  toc-org
  magit
  eshell-git-prompt
  company
  treemacs
  org-present
  visual-fill-column
  geiser
  geiser-guile
  dmenu
  eshell-info-banner
  ace-window
  markdown-mode
]))
