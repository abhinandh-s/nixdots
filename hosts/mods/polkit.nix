{ config, pkgs, ... }:
{
	security.polkit.enable = true;

# grant the permissions reboot and poweroff a machine to users in the users group.

	security.polkit.extraConfig = ''
		polkit.addRule(function(action, subject) {
				if (
						subject.isInGroup("users")
						&& (
							action.id == "org.freedesktop.login1.reboot" ||
							action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
							action.id == "org.freedesktop.login1.power-off" ||
							action.id == "org.freedesktop.login1.power-off-multiple-sessions"
							)
					 )
				{
				return polkit.Result.YES;
				}
				})
	'';

# setting gnome-polkit

	systemd = {
		user.services.polkit-gnome-authentication-agent-1 = {
			description = "polkit-gnome-authentication-agent-1";
			wantedBy = [ "graphical-session.target" ];
			wants = [ "graphical-session.target" ];
			after = [ "graphical-session.target" ];
			serviceConfig = {
				Type = "simple";
				ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
				Restart = "on-failure";
				RestartSec = 1;
				TimeoutStopSec = 10;
			};
		};
	};
}
