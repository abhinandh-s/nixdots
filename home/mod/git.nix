{pkgs,userSettings, ... }:{  

programs.git = {
    enable = true;
    userName = userSettings.name;
    userEmail = userSettings.email;
  #  signing = {
  #    signByDefault = true;
  #    key = "55BBE35CA185AD09";
      #  };
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
