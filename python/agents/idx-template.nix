{ pkgs, template, ... }:
let
  repoRoot = template.git.root;
in
pkgs.stdenv.mkDerivation {
  name = "llm-auditor-template-bootstrap";
  buildCommand = ''
    # Copy only the contents of the 'llm-auditor' agent into the $out directory (the new workspace root)
    cp -R ${repoRoot}/python/agents/llm-auditor/. $out/

    # Ensure the .idx directory is created for the dev.nix file
    mkdir -p $out/.idx

    # Copy the workspace configuration file
    cp ${repoRoot}/.idx/dev.nix $out/.idx/
  '';
}