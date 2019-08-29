#!/bin/bash
apt update
apt -y install git wget build-essential libevent-dev libsqlite3-dev mono-complete

git clone https://github.com/moecube/srvpro /mnt/server
cd /mnt/server
npm ci
mkdir config plugins decks replays
cp data/default_config.json config/config.json

git clone https://github.com/moecube/ygopro --branch=server --recursive
cd ygopro/
git submodule foreach git checkout master
wget -O - https://github.com/premake/premake-core/releases/download/v5.0.0-alpha13/premake-5.0.0-alpha13-linux.tar.gz | tar zfx -
./premake5 gmake
cd build/
make config=release
cd ..
ln -s bin/release/ygopro ./
strip ygopro
mkdir replay
cd ..

git clone https://github.com/moecube/windbot
cd windbot
xbuild /property:Configuration=Release /property:TargetFrameworkVersion=v4.5
ln -s bin/Release/WindBot.exe .
ln -s ../ygopro/cards.cdb .
