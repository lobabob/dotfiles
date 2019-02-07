# Custom Config

Contains common custom configurations to use when setting up a new *nix system.

## Where to Clone

```bash
mkdir ~/.config
cd ~/.config
git clone https://github.com/lobabob/custom-configs
```

## How to Setup

```bash
~/.config/custom-configs/setup
```

## If running on Raspberry PI

To add public key for repo, do this:
```bash
wget http://archive.raspbian.org/raspbian.public.key -O - | sudo apt-key add -
```

To change locale
```bash
sudo dpkg-reconfigure locales
```

To get latest armhf version of node
```bash
wget http://node-arm.herokuapp.com/node_latest_armhf.deb
sudo dpkg -i node_latest_armhf.deb
```

