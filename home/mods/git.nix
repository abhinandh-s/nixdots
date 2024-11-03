{ config, ... }:
{
  programs.git = {
    enable = true;
    userName = "Abhinandh S";
    userEmail = "ugabhi@proton.me";
    signing = {
      signByDefault = true;
      key = "DB0C262FD077239B2047E7E1DB9F128969F8F68F";
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      # url = {
      #   "https://github.com/" = {
      #     insteadOf = [
      #       "gh:"
      #       "github:"
      #     ];
      #   };
      # };
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
