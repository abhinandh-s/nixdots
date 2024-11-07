{
  default = "DuckDuckGo";
  privateDefault = "DuckDuckGo";
  engines = {
    "Nix Packages" = {
      urls = [{
        template = "https://search.nixos.org/packages";
        params = [
          { name = "query"; value = "{searchTerms}"; }
        ];
      }];
      definedAliases = [ "@np" ];
    };
    "Nix Options" = {
      definedAliases = [ "@no" ];
      urls = [{
        template = "https://search.nixos.org/options";
        params = [
          { name = "query"; value = "{searchTerms}"; }
        ];
      }];
    };
  };
}
