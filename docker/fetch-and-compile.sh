#!/bin/bash

SERVER_NUMBER=$((1 + RANDOM % 9))
SOURCE_URL=http://download5.onehouronelife.com/downloads/OneLife_Live5_UnixSource.tar.gz

rm -fR /opt/src/OneLife

echo Source: $SOURCE_URL

mkdir -p /opt/game
cd /opt/game

curl -o source.tar.gz $SOURCE_URL

tar xvzf source.tar.gz

./OneLife_Live5_UnixSource/pullAndBuildLatest

cd OneLife/server

./configure 1
make
ln -s ../../OneLifeData7/objects .
ln -s ../../OneLifeData7/transitions .
ln -s ../../OneLifeData7/categories .
ln -s ../../dataVersionNumber.txt .

mkdir db

ln -s db/biome.db .
ln -s db/eve.db .
ln -s db/floor.db .
ln -s db/floorTime.db .
ln -s db/map.db .
ln -s db/mapTime.db .
ln -s db/playerStats.db .
ln -s db/recentPlacements.txt .
ln -s db/settings/nextPlayerID.ini .
ln -s db/settings/sequenceNumber.ini .

cp -r settings default-settings
