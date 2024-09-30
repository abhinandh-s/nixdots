{ pkgs, ... }:
{

  # accounts.email.accounts = {
  #   abhi.userName
  #     };
 programs.neomutt = {
    enable = true;
    checkStatsInterval = 60;
    package = pkgs.neomutt;
    vimKeys = true;
    # one of "date", "date-received", "from", "mailbox-order", "score", "size", "spam", "subject", "threads", "to", "reverse-date", "reverse-date-received", "reverse-from", "reverse-mailbox-order", "reverse-score", "reverse-size", "reverse-spam", "reverse-subject", "reverse-threads", "reverse-to"
    sort = "date-received";
    binds = []; # List of keybindings. # Type: list of (submodule)
    editor = "$EDITOR"; # Default: "$EDITOR"
    macros = [ ]; # List of macros. # Type: list of (submodule)
    sidebar = {
      enable = true;
      width = 22;
      format = "%D%?F? [%F]?%* %?N?%N/?%S";
      # By default sidebar shows the full path of the mailbox, but with this enabled only the relative name is shown.
      shortPath = true;
    }; # Options related to the sidebar. # Type: submodule
    settings = { }; # Extra configuration appended to the end. # Type: attribute set of string

  };
}
