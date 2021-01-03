#!/bin/bash
mkdir $HOME/bin
docker pull gcr.io/cloud-marketplace-tools/k8s/dev
BIN_FILE="$HOME/bin/mpdev"
export BIN_FILE="$HOME/bin/mpdev"
docker run   gcr.io/cloud-marketplace-tools/k8s/dev cat /scripts/dev > "$BIN_FILE"
source ~/.bash_profile
chmod +x "$BIN_FILE"
mpdev

