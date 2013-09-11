configfiles
===========

My configuration files.  One branch for desktop eta, one for laptop.  The config files have grown like any amoeba over the past 8 years; they originated on a linux laptop and have migrated to mac.  Eventually I should make a platform-independent version as https://github.com/jonathansick/dotfiles did, but that's not happening for a while.  That bootstrapping technique sounds interesting too.

For now, my recommended workflow is:

    git clone git@github.com:keflavich/configfiles.git configfiles
    ln -s configfiles/* ~/

to symlink all the config files to `~/`.  It might be a good idea to back them up first.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/keflavich/configfiles/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

