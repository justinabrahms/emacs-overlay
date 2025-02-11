self: super:
{
  emacsPackagesFor = emacs: (
    (super.emacsPackagesFor emacs).overrideScope' (
      eself: esuper:
        let
          melpaStablePackages = esuper.melpaStablePackages.override {
            archiveJson = ../repos/melpa/recipes-archive-melpa.json;
          };

          melpaPackages = esuper.melpaPackages.override {
            archiveJson = ../repos/melpa/recipes-archive-melpa.json;
          };

          elpaPackages = esuper.elpaPackages.override {
            generated = ../repos/elpa/elpa-generated.nix;
          };

          nongnuPackages = esuper.nongnuPackages.override {
            generated = ../repos/nongnu/nongnu-generated.nix;
          };

        in
          esuper.override {
            inherit melpaStablePackages melpaPackages elpaPackages
              nongnuPackages;
          }

    )
  );

}
