{ config, ... }:{
  sops = {
    age.keyFile = "/home/abhi/.config/sops/age/keys.txt";
    defaultSopsFile = ../../secrets/secrets.yaml;
    secrets = {
      neomutt-pass = {
        path = "/home/abhi/.config/neomutt/password";
        mode = "0644"; # file permision
      };
      srht_access_token = {
        #	owner = config.users.users.abhi.name;
        #	group = config.users.users.abhi.group;
				path = "/home/abhi/.config/hut/config";
				mode = "0644";
			};
      cargo-token = {
        path = "/home/abhi/.cargo/credentials.toml";
        mode = "0644";
      };
    };
  };
}
