{
	test = {pkgs, config, ...}:
	{
		services.openssh.enable = true;
		nixpkgs.system = "x86_64-linux";
	};
}

