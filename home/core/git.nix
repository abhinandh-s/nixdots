{ ... }:
{
  programs.git = {
    enable = true;
    userName = "abhi";
    userEmail = "ugabhi@proton.me";
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
