Config
=====

This holds all my general configurations for the programs I use on most *nix systems.

Useful info for Raspberry Pi:

To add public key for repo, do this:
wget http://archive.raspbian.org/raspbian.public.key -O - | sudo apt-key add -

To change locale
sudo dpkg-reconfigure locales

To get latest armhf version of node
wget http://node-arm.herokuapp.com/node_latest_armhf.deb
sudo dpkg -i node_latest_armhf.deb

