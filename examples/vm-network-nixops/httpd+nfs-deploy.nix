{
  webserver = {
    deployment = {
      targetEnv = "virtualbox";
      virtualbox.memorySize = 1024; # megabytes
    };
  };
  fileserver = {
    deployment = {
      targetEnv = "virtualbox";
      virtualbox.memorySize = 1024; # megabytes
    };
  };
}

