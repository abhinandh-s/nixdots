{ ... }:
let
  instagramFeeds = users: map ( userNames: {
    tags = [ "instagram" ];
    url = "https://rsshub.app/picuki/profile/${userNames}";
  }) users;
  twitterFeeds = users: map ( userNames: {
    tags = [ "twitter" ];
    url = "https://nitter.privacydev.net/${userNames}/rss";
  }) users;
  redditFeeds = users: map ( userNames: {
    tags = [ "reddit" ];
    url = "https://www.reddit.com/r/${userNames}.rss";
  }) users;
  youTubeFeeds = users: map ( userNames: {
    tags = [ "youtube" ];
    url = "https://rsshub.app/youtube/user/@${userNames}";
  }) users;
  Youtube = userName: tags: {
    tags = tags;
    url = "https://rsshub.app/youtube/user/@${userName}";
  };
  YoutubeId = channel_id: tags: {
    tags = tags;
    url = "https://www.youtube.com/feeds/videos.xml?channel_id=${channel_id}";
  };
  # https://charts.youtube.com/charts/TopSongs/in/weekly
  # category = TopArtists	TopSongs	TopVideos	TrendingVideos
  # countryCode = 
  YtMusicChart = category: countryCode: tags: {
    tags = tags;
    url = "https://rsshub.app/youtube/charts/${category}/${countryCode}/RightNow";
  };
  Spotify = category: name: id: {
    tags = [ "music" ];
    url = "https://rsshub.app/spotify/${category}/${id}";
  };
in 
  {
  programs.newsboat = {
    enable = true;
    browser = "linkhandler";
    autoReload = false;
    reloadTime = 60;
    reloadThreads = 10;
    urls = [
      {tags = [ "articles" ]; url = "https://fortelabs.com/feed/";}
      {tags = [ "articles" ]; url = "https://feeds.feedburner.com/collabfund";}
      {tags = [ "articles" ]; url = "https://markmanson.net/feed";}
      {tags = [ "articles" ]; url = "https://jamesclear.com/feed";}
      {tags = [ "articles" ]; url = "http://calnewport.com/feed/";}
      {tags = [ "articles" ]; url = "https://proton.me/blog/feed";}
      {url = "--------------------------------------------------";}

      (Youtube "JFlaMusic" [ "youtube" "music" ])
      (Youtube "cmanishanthreghunath" [ "academics" ])
      (Youtube "AccountingStuff" [ "academics" ])
      (Youtube "CinemaStellar" [ "youtube" "movies" ])
      (Youtube "DanMurrellMovies" [ "youtube" "movies" ])

      (YoutubeId "UC7YOGHUfC1Tb6E4pudI9STA" [])
      (YoutubeId "UCP7WmQ_U4GB3K51Od9QvM0w" [])

      (YtMusicChart "TopSongs" "in" [ "YtMusic" ])

      (Spotify "playlist" "Top Songs - Global" "37i9dQZEVXbNG2KDcFcKOF")
      (Spotify "playlist" "Top Songs - India" "37i9dQZEVXbMWDif5SCBJq")

      (Spotify "artist" "Halsey"            "26VFTg2z8YR0cCuwLzESi2")
      (Spotify "artist" "Zayn"              "5ZsFI1h6hIdQRw2ti0hz81")
      (Spotify "artist" "Harry Styles"      "6KImCVD70vtIoJWnq6nGn3")
      (Spotify "artist" "Ed Sheeran"        "6eUKZXaKkcviH0Ku9w2n3V")
      (Spotify "artist" "The Chainsmokers"  "69GGBxA162lTqCwzJG5jLp")
    ]
      ++ youTubeFeeds [
        "jonhoo"
        "lundeveloper"
        "LukeSmithxyz"
        "NoBoilerplate"
        "letsgetrusty"
        "TechnoTim"
        "programmersarealsohuman5909"
        "ThePrimeagen"
        "ThePrimeTimeagen"
        "TheVimeagen"
        "fknight"
        "TsodingDaily"
        "hubermanlab"
        "MentalOutlaw"
        "technicalsagarindia"
        "NetworkChuck"
        "mkbhd"
        "bugswriter_"
        "DistroTube"
        "LoiLiangYang"
        "JerryRigEverything"
        "EricMurphyxyz"
        "librephoenix"
        "LowLevel-TV"
        "shal.e8033"
        "Emergent_Mind"
      ]
      ++ twitterFeeds [
        "jonhoo"
        "MikaPikaZo"
        "elonmusk"
        "LiveOverflow"
        "_JohnHammond"
        "naval"
        "networkchuck"
        "grapheneos"
      ]
      ++ redditFeeds [
        "rust"
        "nixos"
        "firefoxcss"
        "latex"
        "unixporn"
      ]
      ++ instagramFeeds [
        "kartikaaryan"
        "__.yshnav._"
        "jishnu_jishnu_"
        "alisha_c_jojan"
        "krithi.shetty_official"
        "shraddhakapoor"
        "samyukthaviswanathan"
      ];


    # macro v set browser "setsid -f mpv" ; open-in-browser ; set browser firefox
    extraConfig = ''
      # browser "wget %u -P /home/abhi/pics/pictures/newsboat"
      external-url-viewer "urlscan -dc -r 'linkhandler {}'"
      macro , open-in-browser
      macro t set browser "qndl" ; open-in-browser ; set browser linkhandler
      macro a set browser "tsp yt-dlp --embed-metadata -xic -f bestaudio/best --restrict-filenames" ; open-in-browser ; set browser linkhandler
      macro v set browser "setsid -f mpv" ; open-in-browser ; set browser linkhandler
      macro w set browser "lynx" ; open-in-browser ; set browser linkhandler
      macro d set browser "dmenuhandler" ; open-in-browser ; set browser linkhandler
      macro c set browser "echo %u | xclip -r -sel c" ; open-in-browser ; set browser linkhandler
      macro C set browser "youtube-viewer --comments=%u" ; open-in-browser ; set browser linkhandler
      macro p set browser "peertubetorrent %u 480" ; open-in-browser ; set browser linkhandler
      macro P set browser "peertubetorrent %u 1080" ; open-in-browser ; set browser linkhandler
      
      bind-key j down
      bind-key k up
      bind-key j next articlelist
      bind-key k prev articlelist
      bind-key J next-feed articlelist
      bind-key K prev-feed articlelist
      bind-key G end
      bind-key g home
      bind-key d pagedown
      bind-key u pageup
      bind-key l open
      bind-key h quit
      bind-key a toggle-article-read
      bind-key n next-unread
      bind-key N prev-unread
      bind-key D pb-download
      bind-key U show-urls
      bind-key x pb-delete
      color listnormal color244 default
      color listfocus black yellow standout bold
      color listnormal_unread blue default
      color listfocus_unread yellow default bold
      color info red black bold
      color article white default bold
      highlight all "---.*---" color47 
      highlight feedlist ".*(0/0))" black
      highlight article "(^Feed:.*|^Title:.*|^Author:.*)" cyan default bold
      highlight article "(^Link:.*|^Date:.*)" default default
      highlight article "https?://[^ ]+" green default
      highlight article "^(Title):.*$" blue default
      highlight article "\\[[0-9][0-9]*\\]" magenta default bold
      highlight article "\\[image\\ [0-9]+\\]" green default bold
      highlight article "\\[embedded flash: [0-9][0-9]*\\]" green default bold
      highlight article ":.*\\(link\\)$" cyan default
      highlight article ":.*\\(image\\)$" blue default
      highlight article ":.*\\(embedded flash\\)$" magenta default
    '';
  };
}
