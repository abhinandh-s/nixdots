{ config, ... }:{
	sops = {
		defaultSopsFile = ./../../secrets/secrets.yaml;
		age.keyFile = "/home/abhi/.config/sops/age/keys.txt";
		secrets = {
			y-key = {
				owner = config.users.users.abhi.name;
				group = config.users.users.abhi.group;
				path = "/home/abhi/.local/share/age/key.txt";
				mode = "0600";
			};
			github_ssh_key = {
				owner = config.users.users.abhi.name;
				group = config.users.users.abhi.group;
				path = "/home/abhi/.ssh/id_ed25519";
				mode = "0600"; # owner = rw- , group = ---, others = --- 
			};
			mobile_ssh_key = {
				owner = config.users.users.abhi.name;
				group = config.users.users.abhi.group;
				path = "/home/abhi/.ssh/id_rsa";
				mode = "0644"; # owner = rw- , group = r--, others = r--
			};
			"kde_connect/trusted_device_keys" = {
				owner = config.users.users.abhi.name;
				group = config.users.users.abhi.group;
				path = "/home/abhi/.config/kdeconnect/trusted_devices";
				mode = "0644";
			};
			"kde_connect/certificate_pem" = {
				owner = config.users.users.abhi.name;
				group = config.users.users.abhi.group;
				path = "/home/abhi/.config/kdeconnect/certificate.pem";
				mode = "0644";
			};
			"kde_connect/privateKey_pem" = {
				owner = config.users.users.abhi.name;
				group = config.users.users.abhi.group;
				path = "/home/abhi/.config/kdeconnect/privateKey.pem";
				mode = "0644";
			};
		};
	};
}
