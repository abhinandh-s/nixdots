{ ... }
:
{
  programs.eza = {
    enable = true;
    icons = "auto";
    enableNushellIntegration = true;
    # enableZshIntegration = true; # will create aliase for ls command and replace it with eza
  };
}
