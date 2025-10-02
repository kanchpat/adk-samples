{ pkgs, ... }:
{
  # Set up the environment for a Python project
  languages.python.enable = true;
  
  # Specify system packages needed for the ADK agent
  packages = [
    pkgs.python310
    pkgs.pip
    pkgs.venvShellHook
  ];

  # Install Python packages and run the ADK agent on workspace creation
  devShell.config = {
    # This hook runs when the shell loads (i.e., when the workspace is ready)
    pre-commit-hook = ''
      echo "Setting up Python virtual environment..."
      # Create a virtual environment
      python3 -m venv .venv

      # Activate the venv and install dependencies
      source .venv/bin/activate
      pip install -r requirements.txt
      echo "Installation complete. To run the agent, use the command: source .venv/bin/activate && adk run ."
    '';
  };

  # Recommended extensions for Python/ADK development
  idx.extensions = [
    "ms-python.python"
    "esbenp.prettier-vscode"
  ];
}