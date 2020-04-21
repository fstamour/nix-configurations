{ pkgs ? import <nixpkgs> {} }:
 
let 
  jdk = pkgs.jdk8;
  androidsdk = pkgs.androidenv.androidsdk_6_0_extras;
  fhs = pkgs.buildFHSUserEnv {
    name = "android-env";
    targetPkgs = pkgs: with pkgs; [ 
      androidsdk
      bash
      jdk
      
      # "Personnal" editor, you may not want this
      idea.idea-community
    ];
    runScript = "bash";
    profile = ''
      export ANDROID_HOME="${androidsdk}/libexec"
    '';
  };
in 
pkgs.stdenv.mkDerivation {
  name = "android-sdk-fhs-shell";
  nativeBuildInputs = [ fhs ];
  shellHook = "exec android-env";
}
