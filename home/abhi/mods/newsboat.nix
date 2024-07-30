{ config, pkgs, ... }:
{
  programs.newsboat = {
    enable = true;
    autoReload = true;
    reloadTime = 60;
    urls = [

      {
        tags = [
          "nix"
          "nixos"
        ];
        url = "https://nixos.org/blog/feed.xml";
      }

      { tags = [ "articles" ]; url = "https://jamesclear.com/feed";}
      { tags = [ "articles" ]; url = "https://feeds.feedburner.com/collabfund";}
      { tags = [ "articles" ]; url = "https://www.ynharari.com/category/articles/feed/";}
      { tags = [ "articles" ]; url = "http://calnewport.com/feed/";}
      { tags = [ "articles" ]; url = "https://tim.blog/feed/";}

      { tags = [ "youtube" ]; url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJdmdUp5BrsWsYVQUylCMLg";}



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

      {
        tags = [
          "articles"
          "blogs"
        ];
        url = "https://feeds.feedburner.com/collabfund";
      }
    ];


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
