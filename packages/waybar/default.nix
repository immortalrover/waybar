{
  lib,
  pkgs,
  ...
}:

let
  config = ./config.jsonc;
  style = ./style.css;
in
pkgs.waybar.overrideAttrs (oldAttrs: {
  buildInputs = (oldAttrs.buildInputs or [ ]) ++ [ pkgs.makeWrapper ];

  postInstall =
    (oldAttrs.postInstall or "")
    + ''
      mkdir $out/libexec

      mv $out/bin/waybar $out/libexec/waybar-unwrapped

      makeWrapper $out/libexec/waybar-unwrapped $out/bin/waybar \
        --add-flags "-c ${config} -s ${style}"
    '';
})
