#!/bin/rc
NIX_LINK=$HOME^'/.nix-profile'
NIX_PATH=$NIX_PATH^':'^$NIX_PATH^':'^$HOME^'/.nix-defexpr/channels'
NIX_PROFILES='/nix/var/nix/profiles/default '^$HOME^'/.nix-profile'
NIX_SSL_CERT_FILE=/etc/ssl/cert.pem
if(!~ $#MANPATH 0) {
    MANPATH=$NIX_LINK^'/share/man:'^$MANPATH
}
PATH=$NIX_LINK^'/bin:'^$PATH
