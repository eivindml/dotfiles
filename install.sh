#!/bin/bash

function sub_install {
  cd $1
  bash _install.sh
  cd ../
}

sub_install apps/
sub_install home/
sub_install macos/
sub_install config/
