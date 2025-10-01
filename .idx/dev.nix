{ pkgs, ... }: {
  channel = "stable-23.11";
  packages = [ pkgs.hello ];
  startup = {
    foreground = ''
      echo "Root template test successful!"
    '';
  };
}
