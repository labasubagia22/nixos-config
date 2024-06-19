{ pkgs, stdenv, lib, ... }:

{
  home.packages = with pkgs; [
    devbox
    direnv

    # nix
    nil # nix language server
    nixpkgs-fmt

    # git hooks
    pre-commit

    # build
    gcc
    gnumake

    go

    rustup

    # node
    nodejs
    nodePackages.pnpm

    # python
    (python3.withPackages (ps: with ps; [
      pip
      virtualenv
      numpy
      pandas
      black

      ansible-core
      paramiko

    ]))
    ruff

    # iac
    terraform
    tflint
    terragrunt
    checkov

    pulumi

    # cloud
    (google-cloud-sdk.withExtraComponents [
      google-cloud-sdk.components.gke-gcloud-auth-plugin
    ])

    arcanist
    teleport
  ];

  programs.direnv = {
    enable = true;
  };


  # disable for now
  # try learn to use nix package instead
  programs.mise = {
    enable = false;
    globalConfig = {
      tools = {
        bun = "latest";
      };
    };
  };
}
