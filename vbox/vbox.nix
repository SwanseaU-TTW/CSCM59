{ pkgs ? import <nixpkgs> {}}:

let
  # this creates a helper function that abstracts a bit of the boilerplate away
  # `mkVM` takes one argument, a list of `modules` to include in the image.
  mkVM = mods: (import <nixpkgs/nixos/lib/eval-config.nix> {
    modules = [
      # include the standard virtualbox demo install that probably includes things like KDE or whatever
      <nixpkgs/nixos/modules/installer/virtualbox-demo.nix>

    ] ++ mods;
  }).config.system.build.virtualBoxOVA;
  vscode-with-extensions = pkgs.vscode-with-extensions.override {
    vscodeExtensions = with pkgs.vscode-extensions; [
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # MySQL client extension
      {
        name = "vscode-mysql-client2";
        publisher = "cweijan";
        version = "2.5.5";
        sha256 = "03miglkd45v39mqkcjv5rpsm3klkx2nkbq731ip1flrwzhys6i95";
      }
      # For live coding/debugging
      {
        name = "vsliveshare-pack";
        publisher = "MS-vsliveshare";
        version = "0.4.0";
        sha256 = "09h2yxpmbvxa3mz5wdnpb35h437f0z6j0n3blsb0d93jlwx5ydy5";
      }
    ];
  };
in
# here starts the actual declaration of "target" included in this file.
{
  # delcares the target of an example image with vim and tmux
  # build with: nix-build . -A withTmuxAndVIM
  withTmuxAndVIM = mkVM [
      # add some custom pkgs like vim and tmux, could be our internal packages
      ({pkgs, ...}: {
        imports = [
          <home-manager/nixos>
        ];

        environment.systemPackages = with pkgs; [ 
          vim 
          tmux 
          git
          vscode-with-extensions
        ];

        services.mysql = {
          enable = true;
          package = pkgs.mariadb;
        };

        home-manager.users.demo = { pkgs, ... }: {
          home.packages = [ 
          ];
          programs.bash.enable = true;
        };
      })
  ];
}
