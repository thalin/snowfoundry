{ pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    fonts = {
      monospace = {
        package = pkgs.nerdfonts;
        name = "MesloLGS NF Regular";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };
    polarity = "dark";
  };
}
