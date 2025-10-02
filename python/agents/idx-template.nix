{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11";

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.python310
    pkgs.poetry
    pkgs.google-cloud-sdk
  ];

  # The IDX workspace configuration
  workspace = {
    # A list of extension IDs that are recommended for the workspace.
    # See https://open-vsx.org/ for a list of available extensions.
    extensions = [
      "ms-python.python"
      "ms-python.vscode-pylance"
    ];

    # Scripts to run on workspace startup
    startup = {
      # This script runs in the background
      background = ''
        echo "Starting background processes..."
      '';
      # This script runs in the foreground
      foreground = ''
        echo "Setting up the environment..."
        poetry config virtualenvs.in-project true
        poetry install
      '';
    };
  };

  # The IDX editor configuration
  idx = {};
}
