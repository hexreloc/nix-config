# Overlays, applied system-wide through the flake's `overlays` output.
{ inputs, ... }:

{
  # Adds the custom packages defined in the `pkgs` directory
  additions = final: _prev: import ../pkgs final.pkgs;

  # Package additions/modifications/overrides
  modifications = _final: _prev: {
    # example = prev.example.overrideAttrs (old: {
    #   ...
    # });
  };
}
