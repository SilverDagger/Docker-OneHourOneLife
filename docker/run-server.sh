#!/bin/#!/usr/bin/env bash

cd /opt/game/OneLife/server

for f in $(ls default-settings); do
  if [ ! -e "settings/$f" ]; then
   echo "creating default config $f"
   cp "default-settings/$f" "settings/$f"
  fi
done

./OneLifeServer
