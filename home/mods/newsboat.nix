{ config, pkgs, ... }:
{
  programs.newsboat = {
    enable = true;
    browser = "mpv";
    autoReload = false;
    reloadTime = 60;
    reloadThreads = 10;
    urls = [
      { tags = [ "nixos" ]; url = "https://nixos.org/blog/feed.xml";}

      { tags = [ "articles" ]; url = "https://jamesclear.com/feed";}
      { tags = [ "articles" ]; url = "https://feeds.feedburner.com/collabfund";}
      { tags = [ "articles" ]; url = "https://www.ynharari.com/category/articles/feed/";}
      { tags = [ "articles" ]; url = "http://calnewport.com/feed/";}
      { tags = [ "articles" ]; url = "https://tim.blog/feed/";}

      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJdmdUp5BrsWsYVQUylCMLg";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUMwY9iS8oMyWDYIe6_RmoA";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2D2CMWXMOVWx7giW1n3LIg";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCVls1GmFKf6WlTraIb_IaJg";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCBJycsmduvYEL83R_U4JriQ";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCYJLdSmyKoXCbnd-pklMn5Q";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCNT0OiqlYNbTMJSzztcmHfQ";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC4SVo0Ue36XCfOyb5Lh1viQ";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8butISFwT-Wl7EV0hUK0BQ";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0TnW9acNxqeojxXDMbohcA";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7YOGHUfC1Tb6E4pudI9STA";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCP7WmQ_U4GB3K51Od9QvM0w";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCMiyV_Ib77XLpzHPQH_q0qQ";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCld68syR8Wi-GY_n4CaoJGA";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCAiiOTio8Yu69c3XnR7nQBQ";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCCneap9DE1plCWwcObu-20Q";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9x0AN7BWHpCDHSm9NiJFJQ";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC_NZ6qLS9oJgsMKQhqAkg-w";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC1szFCBUWXY3ESff8dJjjzw";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCngn7SVujlvskHRvRKc1cTw";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCWFKCr40YwOZQx8FHU_ZqqQ";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0ArlFuFYMpEewyRBzdLHiw";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCh_dVD10YuSghle8g6yjePg";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9HOZ53gnHP3f_b-wixS74g";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCev-WO-s0bnCA8bMvIDDZ0Q";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCqjwF8rxRsotnojGl4gM0Zw";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCVeW9qkBjo3zosnqUbG7CFw";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3092WScot6QwvJFJix_4kA";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCCezIgC97PvUuR4_gbFUs5g";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCiT_r1GD7JSftnbViKHcOtQ";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCd3dNckv1Za2coSaHGHl5aA";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC5KDiSAFxrDWhmysBcNqtMA";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCeZyoDTk0J-UPhd7MUktexw";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCpeX4D-ArTrsqvhLapAHprQ";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC6biysICWOJ-C3P4Tyeggzg";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUMwY9iS8oMyWDYIe6_RmoA";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCcJQ96WlEhJ0Ve0SLmU310Q";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCOk-gHyjcWZNj3Br4oxwh0A";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCi8C7TNs2ohrc6hnRQ5Sn2w";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCPa7bvOg_r54NaQb7GJA9Eg";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLEVrhumRsK67JkP3G4w5cQ";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCj1WyLpmoOg5jLIpy84Hh3Q";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCIhJnsJ0IHlVNnYfp-gw_5Q";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCBMMB7Yi0eyFuY95Qn2o0Yg";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2WHjPDvbE6O328n17ZGcfg";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8ENHE5xdFSwx71u3fDH5Xw";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUyeluBRhGPCW4rPe_UvBZQ";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCrqM0Ym_NbK1fqeQG2VIohg";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UClcE-kVhqyiHCcjYwcpfj9w";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCY38RvRIxYODO4penyxUwTg";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0ZTPkdxlAKf-V33tqXwi3Q";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCwRXb5dUK4cvsHbx-rGzSgw";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCVk4b-svNJoeytrrlOixebQ";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0uTPqBCFIpZxlz_Lv1tk_g";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJASBOyF4Fkd26SIwRhLuZw";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7hMWK8rS1WGHpPGfjJfLog";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCoswbczvKx6KsEzHCJAI-jw";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCwgKmJM4ZJQRJ-U5NjvR2dg";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCcabW7890RKJzL968QWEykA";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSp-OaMpsO8K0KkOqyBl7_w";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCKNTZMRHPLXfqlbdOI7mCkg";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCRiJko2k-0EpPpFGgk3XJMg";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCQ-W1KE9EYfdxhL6S4twUNw";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsWaVYzOFvEWDsEuvuZJ-8A";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCs4fQRyl1TJvoeOdekW6lYA";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCMqXCTXulFWHrmd2588IqJw";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2D2CMWXMOVWx7giW1n3LIg";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2TDepkwM-AV5NbED6-jhdg";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCz4tgANd4yy8Oe0iXCdSWfA";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCm30SEaX9iNQZMhjEIXkfEg";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0yCXVwW6FdDQGYA-3OWXxw";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCcaTUtGzOiS4cqrgtcsHYWg";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxjjVZaykWsAjAAwlHfry8Q";}
      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC_iD0xppBwwsrM9DegC5cQQ";}



      { tags = [ "twitter" ]; url = "https://nitter.privacydev.net/MikaPikaZo/rss";}
      { tags = [ "twitter" ]; url = "https://nitter.privacydev.net/arcolinux/rss";}
      { tags = [ "twitter" ]; url = "https://nitter.privacydev.net/networkchuck/rss";}
      { tags = [ "twitter" ]; url = "https://nitter.privacydev.net/osendeavour/rss";}
      { tags = [ "twitter" ]; url = "https://nitter.privacydev.net/blackarchlinux/rss";}
      { tags = [ "twitter" ]; url = "https://nitter.privacydev.net/grapheneos/rss";}
      { tags = [ "twitter" ]; url = "https://nitter.privacydev.net/nothing/rss";}
      { tags = [ "twitter" ]; url = "https://nitter.privacydev.net/elonmusk/rss";}
      { tags = [ "twitter" ]; url = "https://nitter.privacydev.net/realtryhackme/rss";}
      { tags = [ "twitter" ]; url = "https://nitter.privacydev.net/nixcraft/rss";}
      { tags = [ "twitter" ]; url = "https://nitter.poast.org/naval/rss";}
      { tags = [ "twitter" ]; url = "https://nitter.poast.org/_JohnHammond/rss";}
      { tags = [ "twitter" ]; url = "https://nitter.poast.org/LiveOverflow/rss";}
      { tags = [ "twitter" ]; url = "https://nitter.poast.org/metasploit/rss";}

      { tags = [ "blogs" ]; url = "https://feeds.feedburner.com/collabfund";}
    ];


    # macro v set browser "setsid -f mpv" ; open-in-browser ; set browser firefox
    extraConfig = ''
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
