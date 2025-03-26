{
  description = "Dev Shell for .NET Development";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux"; # or "aarch64-linux" for ARM
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        pkgs.dotnet-sdk_8
        pkgs.dotnet-ef
        #pkgs.jetbrains.rider # Optional
      ];

      shellHook = ''
        echo "✅ .NET Dev Shell Activated!"
        export DOTNET_CLI_TELEMETRY_OPTOUT=1
      '';
    };
  };
}
