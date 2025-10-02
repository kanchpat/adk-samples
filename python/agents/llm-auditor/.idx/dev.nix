{ pkgs, ... }:
(import ../idx-template.nix) {
  inherit pkgs;
  # Add any dev-specific overrides here if needed
}
