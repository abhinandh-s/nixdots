{ ... }:{
	sops = {
		defaultSopsFile = ./../../secrets/secrets.yaml;
		age.keyFile = "/home/abhi/.config/sops/age/keys.txt";
		# This is the actual specification of the secrets.
		secrets = {
			y-key = {
				owner = "abhi";
				path = "/home/abhi/.local/share/age/key.txt";
				mode = "0600";
			};
			srht_access_token = {
				owner = "abhi";
				path = "/home/abhi/.config/hut/config";
				mode = "0600";
			};
			neomutt-pass = {
				owner = "abhi";
				path = "/home/abhi/.config/neomutt/password";
				mode = "4440"; # file permision
			};
			github_ssh_key = {
				owner = "abhi";
				path = "/home/abhi/.ssh/id_ed25519";
				mode = "0600"; # owner = rw- , group = ---, others = --- 
			};
			mobile_ssh_key = {
				owner = "abhi";
				path = "/home/abhi/.ssh/id_rsa";
				mode = "0644"; # owner = rw- , group = r--, others = r--
			};
			"kde_connect/trusted_device_keys" = {
				owner = "abhi";
				path = "/home/abhi/.config/kdeconnect/trusted_devices";
				mode = "0644";
			};
			"kde_connect/certificate_pem" = {
				owner = "abhi";
				path = "/home/abhi/.config/kdeconnect/certificate.pem";
				mode = "0644";
			};
			"kde_connect/privateKey_pem" = {
				owner = "abhi";
				path = "/home/abhi/.config/kdeconnect/privateKey.pem";
				mode = "0644";
			};
		};
	};
}
