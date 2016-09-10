{ config, pkgs, ... }:
{
	imports = [ <nixpkgs/nixos/modules/virtualisation/virtualbox-image.nix> ];

	time.timeZone = "America/Montreal";

	environment.systemPackages = with pkgs; [
		git
		screen
		tree
		vim
		zsh
	]
	++ 
	[];

	users.extraUsers.mpsyco = {
		createHome = true;
		home = "/home/mpsyco";
		extraGroups = [ "wheel" ];
		isNormalUser = true;
		shell = "${pkgs.zsh}/bin/zsh";
	};

	networking.networkmanager.enable = true;

	services.xserver = {
		enable = true;
		layout = "us";
		desktopManager.gnome3.enable = true;
	};

	# Show the manual on virtual console 8
	services.nixosManual.showManual = true;

}
