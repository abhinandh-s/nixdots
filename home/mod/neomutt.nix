# Ref: https://github.com/Misterio77/nix-config/blob/76e2a0590f34538cda1fbf518bf01612a549477d/home/gabriel/features/productivity/neomutt.nix#L30

{ pkgs, ... }:
let
  neomuttConfig = /*neomuttrc*/ ''
  # ================  IMPORTS ====================

  source ~/.config/neomutt/password
  source ~/.config/neomutt/colors
  # source ~/.config/neomutt/keymaps

  # ================  IMAP ====================

  set imap_user = abinand516@gmail.com
  set spoolfile = imaps://imap.gmail.com/INBOX
  set folder = imaps://imap.gmail.com/
  set record="imaps://imap.gmail.com/[Gmail]/Sent Mail"
  set postponed="imaps://imap.gmail.com/[Gmail]/Drafts"
  set mbox="imaps://imap.gmail.com/[Gmail]/All Mail"
  set header_cache = "~/.mutt/cache/headers"
  set message_cachedir = "~/.mutt/cache/bodies"
  set certificate_file = "~/.mutt/certificates"

  # ================  SMTP  ====================

  set smtp_url = "smtp://abinand516@smtp.gmail.com:587/"
  set smtp_pass = $imap_pass
  set ssl_force_tls = yes 

  # Require encrypted connection

  # ================  Composition  ====================

  set editor = "nvim"
  set edit_headers = yes  
  # See the headers when editing
  set charset = UTF-8
  unset use_domain  
  # because abhi@localhost is just embarrassing
  set realname = "Abhinandh S"
  set from = "abinand516@gmail.com"
  set use_from = yes

  '';

  colorsheme = /*neomuttrc*/ ''

  # vim: filetype=muttrc

  # From: https://github.com/altercation/mutt-colors-solarized/blob/master/mutt-colors-solarized-dark-16.muttrc

  # basic colors ---------------------------------------------------------
  color normal        red             default
  color error         red             default
  color tilde         black           default
  color message       cyan            default
  color markers       red             white
  color attachment    white           default
  color search        brightmagenta   default
  color status        brightblack       red      # top and bottom status bars
  color indicator     brightblack     white      # selection
  color tree          cyan            default    # arrow in threads

  # basic monocolor screen ------------------------------------------------

  mono  bold          bold
  mono  underline     underline
  mono  indicator     reverse
  mono  error         bold

  # index ----------------------------------------------------------------

  color index    red             default         "~A"            # all messages
  color index    blue            default         "~N"            # new messages
  color index    brightred       default         "~E"            # expired messages
  color index    blue            default         "~N"            # new messages
  color index    blue            default         "~O"            # old messages
  color index    brightmagenta   default         "~Q"            # messages that have been replied to
  color index    brightgreen     default         "~R"            # read messages
  color index    blue            default         "~U"            # unread messages
  color index    blue            default         "~U~$"          # unread, unreferenced messages
  color index    cyan            default         "~v"            # messages part of a collapsed thread
  color index    magenta         default         "~P"            # messages from me
  color index    cyan            default         "~p!~F"         # messages to me
  color index    cyan            default         "~N~p!~F"       # new messages to me
  color index    cyan            default         "~U~p!~F"       # unread messages to me
  color index    brightwhite     default         "~R~p!~F"       # messages to me [X]
  color index    red             default         "~F"            # flagged messages
  color index    red             default         "~F~p"          # flagged messages to me
  color index    red             default         "~N~F"          # new flagged messages
  color index    red             default         "~N~F~p"        # new flagged messages to me
  color index    red             default         "~U~F~p"        # new flagged messages to me
  color index    brightcyan      default         "~v~(!~N)"      # collapsed thread with no unread
  color index    red             default         "~v~(~N)"       # collapsed thread with some unread
  color index    green           default         "~N~v~(~N)"     # collapsed thread with unread parent
  color index    red             black           "~v~(~F)!~N"    # collapsed thread with flagged, no unread
  color index    yellow          black           "~v~(~F~N)"     # collapsed thread with some unread & flagged
  color index    green           black           "~N~v~(~F~N)"   # collapsed thread with unread parent & flagged
  color index    green           black           "~N~v~(~F)"     # collapsed thread with unread parent, no unread inside, but some flagged
  color index    cyan            black           "~v~(~p)"       # collapsed thread with unread parent, no unread inside, some to me directly
  color index    red             red             "~v~(~D)"       # thread with deleted (doesn't differentiate between all or partial)
  color index    red             default         "~(~N)"         # messages in threads with some unread
  color index    green           default         "~S"            # superseded messages
  color index    black           red             "~D"            # deleted messages
  color index    black           red             "~N~D"          # deleted messages
  color index    red             default         "~T"            # tagged messages

  # message headers ------------------------------------------------------ [X]

  color hdrdefault    blue           default
  color header        blue           default         "^(From)"
  color header        brightgreen    default         "^(Subject)"

  # body -----------------------------------------------------------------

  color quoted        blue            default
  color quoted1       cyan            default
  color quoted2       yellow          default
  color quoted3       red             default
  color quoted4       brightred       default

  color signature     brightgreen     default
  color bold          black           default
  color underline     black           default
  color normal        default         default
  color body          brightcyan      default         "[;:][-o][)/(|]"    # emoticons
  color body          brightcyan      default         "[;:][)(|]"         # emoticons
  color body          brightcyan      default         "[*]?((N)?ACK|CU|LOL|SCNR|BRB|BTW|CWYL|\
  |FWIW|vbg|GD&R|HTH|HTHBE|IMHO|IMNSHO|\
  |IRL|RTFM|ROTFL|ROFL|YMMV)[*]?"
  color body          brightcyan      default         "[ ][*][^*]*[*][ ]?" # more emoticon?
  color body          brightcyan      default         "[ ]?[*][^*]*[*][ ]" # more emoticon?

  # pgp -----------------------------------------------------------------

  color body          red             default         "(BAD signature)"
  color body          cyan            default         "(Good signature)"
  color body          brightblack     default         "^gpg: Good signature .*"
  color body          brightyellow    default         "^gpg: "
  color body          brightyellow    red             "^gpg: BAD signature from.*"
  mono  body          bold                            "^gpg: Good signature"
  mono  body          bold                            "^gpg: BAD signature from.*"

  # yes, an insance URL regex -----------------------------------------------------------------
  color body          red             default         "([a-z][a-z0-9+-]*://(((([a-z0-9_.!~*'();:&=+$,-]|%[0-9a-f][0-9a-f])*@)?((([a-z0-9]([a-z0-9-]*[a-z0-9])?)\\.)*([a-z]([a-z0-9-]*[a-z0-9])?)\\.?|[0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+)(:[0-9]+)?)|([a-z0-9_.!~*'()$,;:@&=+-]|%[0-9a-f][0-9a-f])+)(/([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*(;([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*)*(/([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*(;([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*)*)*)?(\\?([a-z0-9_.!~*'();/?:@&=+$,-]|%[0-9a-f][0-9a-f])*)?(#([a-z0-9_.!~*'();/?:@&=+$,-]|%[0-9a-f][0-9a-f])*)?|(www|ftp)\\.(([a-z0-9]([a-z0-9-]*[a-z0-9])?)\\.)*([a-z]([a-z0-9-]*[a-z0-9])?)\\.?(:[0-9]+)?(/([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*(;([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*)*(/([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*(;([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*)*)*)?(\\?([-a-z0-9_.!~*'();/?:@&=+$,]|%[0-9a-f][0-9a-f])*)?(#([-a-z0-9_.!~*'();/?:@&=+$,]|%[0-9a-f][0-9a-f])*)?)[^].,:;!)? \t\r\n<>\"]"
  # and a heavy handed email regex -----------------------------------------------------------------
  color body          magenta        default         "((@(([0-9a-z-]+\\.)*[0-9a-z-]+\\.?|#[0-9]+|\\[[0-9]?[0-9]?[0-9]\\.[0-9]?[0-9]?[0-9]\\.[0-9]?[0-9]?[0-9]\\.[0-9]?[0-9]?[0-9]\\]),)*@(([0-9a-z-]+\\.)*[0-9a-z-]+\\.?|#[0-9]+|\\[[0-9]?[0-9]?[0-9]\\.[0-9]?[0-9]?[0-9]\\.[0-9]?[0-9]?[0-9]\\.[0-9]?[0-9]?[0-9]\\]):)?[0-9a-z_.+%$-]+@(([0-9a-z-]+\\.)*[0-9a-z-]+\\.?|#[0-9]+|\\[[0-2]?[0-9]?[0-9]\\.[0-2]?[0-9]?[0-9]\\.[0-2]?[0-9]?[0-9]\\.[0-2]?[0-9]?[0-9]\\])"

  # Various smilies and the like -----------------------------------------------------------------
  color body          brightwhite     default         "<[Gg]>"                            # <g>
  color body          brightwhite     default         "<[Bb][Gg]>"                        # <bg>
  color body          yellow          default         " [;:]-*[})>{(<|]"                  # :-) etc...
  # *bold* -----------------------------------------------------------------
  color body          blue            default         "(^|[[:space:][:punct:]])\\*[^*]+\\*([[:space:][:punct:]]|$)"
  mono  body          bold                            "(^|[[:space:][:punct:]])\\*[^*]+\\*([[:space:][:punct:]]|$)"
  # _underline_ -----------------------------------------------------------------
  color body          blue            default         "(^|[[:space:][:punct:]])_[^_]+_([[:space:][:punct:]]|$)"
  mono  body          underline                       "(^|[[:space:][:punct:]])_[^_]+_([[:space:][:punct:]]|$)"
  # /italic/  (Sometimes gets directory names) -----------------------------------------------------------------
  color body         blue            default         "(^|[[:space:][:punct:]])/[^/]+/([[:space:][:punct:]]|$)"
  mono body          underline                       "(^|[[:space:][:punct:]])/[^/]+/([[:space:][:punct:]]|$)"

  # Border lines. -----------------------------------------------------------------
  color body          blue            default         "( *[-+=#*~_]){6,}"

  # From https://github.com/jessfraz/dockerfiles/blob/master/mutt/.mutt/mutt-patch-highlighting.muttrc -----------------------------------------------------------------
  color   body    cyan            default         ^(Signed-off-by).*
  color   body    cyan            default         ^(Docker-DCO-1.1-Signed-off-by).*
  color   body    brightwhite     default         ^(Cc)
  color   body    yellow          default         "^diff \-.*"
  color   body    brightwhite     default         "^index [a-f0-9].*"
  color   body    brightblue      default         "^---$"
  color   body    white           default         "^\-\-\- .*"
  color   body    white           default         "^[\+]{3} .*"
  color   body    green           default         "^[\+][^\+]+.*"
  color   body    red             default         "^\-[^\-]+.*"
  color   body    brightblue      default         "^@@ .*"
  color   body    green           default         "LGTM"
  color   body    brightmagenta   default         "-- Commit Summary --"
  color   body    brightmagenta   default         "-- File Changes --"
  color   body    brightmagenta   default         "-- Patch Links --"
  '';
in
  {
  programs.neomutt = {
    enable = true;
    checkStatsInterval = 60;
    editor = "nvim";
    package = pkgs.neomutt;
    vimKeys = true;
    sort = "date-received";
    settings = {
      mark_old = "no";
      text_flowed = "yes";
      reverse_name = "yes";
    }; 
  };
  home.file.".config/neomutt/neomuttrc".text = neomuttConfig;
  home.file.".config/neomutt/colors".text = colorsheme;
  xdg = {
    desktopEntries = {
      neomutt = {
        name = "Neomutt";
        genericName = "Email Client";
        comment = "Read and send emails";
        exec = "neomutt %U";
        icon = "mutt";
        terminal = true;
        categories = [
          "Network"
          "Email"
          "ConsoleOnly"
        ];
        type = "Application";
        mimeType = ["x-scheme-handler/mailto"];
      };
    };
    mimeApps.defaultApplications = {
      "x-scheme-handler/mailto" = "neomutt.desktop";
    };
  };
}
