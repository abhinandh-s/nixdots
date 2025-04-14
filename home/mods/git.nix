{ config, ... }:
{
  programs.git = {
    enable = true;
    userName = "Abhinandh S";
    userEmail = "ugabhi@proton.me";
    # signing = {
      #  signByDefault = true;
      #  key = "F0267B9AC219D809ED315ADCC7BDA2250EB4B330";
    # };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
    aliases = {
      c = "commit -m 'Refactoring'";
      cm = "commit -m";
      ga = "git add";
      gp = "git push";
      gs = "git status";
      gaa = "git add *";
      gcm = "git commit -m";
    };
    ignores = [
      "*~"
      "*.swp"
      "debug/"
      "target/"
      "**/*.rs.bk"
      "*.pdb"
      "*.aux"
      "*.dvi"
      "*.fdb_latexmk"
      "*.fls"
      "*.log"
      "*.synctex"
      "*.lot"
      "*.toc"
      "*.out"
      "*.synctex.gz"
      "#*.org#"
      ".#*"
      "ltximg/"
      "ltximg/*"
    ];
  };
}
