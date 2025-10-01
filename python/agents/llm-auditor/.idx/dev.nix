{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # Or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.python310
    pkgs.poetry
    pkgs.google-cloud-sdk
  ];
  # Sets environment variables in the workspace
  env = {};
  # Scripts to run on workspace startup
  startup = {
    # This script runs in the background
    background = ''
      echo "Starting background processes..."
      # Example:
      # npm run dev &
    '';
    # This script runs in the foreground
    foreground = ''
      echo "Setting up the environment..."
      poetry config virtualenvs.in-project true
      poetry install
    '';
  };
  # VS Code extensions to install
  extensions = [
    "ms-python.python"
    "ms-python.vscode-pylance"
  ];
}
