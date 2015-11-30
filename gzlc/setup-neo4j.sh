#!/bin/bash

# 每个服务器都要安装的东西
sudo su

cd /tmp/

wget -O - https://debian.neo4j.org/neotechnology.gpg.key| apt-key add - # Import our signing key
echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list # Create an Apt sources.list file
aptitude update -y # Find out about the files in our repository
aptitude install neo4j -y # Install Neo4j, community edition

mkdir /data/neo4j
mkdir /data/neo4j/data