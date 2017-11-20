#!/bin/sh

if [ ! -d /data ]; then
    mkdir /data
fi

if [ ! -d /data/node-pool ]; then
    mkdir /data/node-pool
fi

if [ ! -d /data/node-bob ]; then
    mkdir /data/node-bob
fi

if [ ! -d /data/node-alice ]; then
    mkdir /data/node-alice
fi
