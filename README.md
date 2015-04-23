# Spacemacs configuration 

This is my set of customisations for [Spacemacs](https://github.com/syl20bnr/spacemacs)

To make these active, first install spacemacs as per the instructions in the Spacemacs [README](https://github.com/syl20bnr/spacemacs/blob/master/README.md)
then clone this repo to somewhere on your hd (not in the `~/.emacs.d` directory though...):

    cd /path/to/somewhere
    git clone git@github.com:magnetised/magnetised-spacemacs.git

Then symlink the config file and the custom layer into the `.emacs.d` directory

    ln -s /path/to/somewhere/magnetised-spacemacs/spacemacs ~/.spacemacs
    ln -s /path/to/somewhere/magnetised-spacemacs/layers/magnetised ~/.emacs.d/private

Then start (or restart) Emacs.
    