#!/usr/bin/env bash

_() {
  [ -e "$1" ] && . "$1"
}

data_dir=./data

# Hierarchy.
_ $data_dir/common.sh
