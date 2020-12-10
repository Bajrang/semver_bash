#!/usr/bin/env bash
set -e

# increment version
function inc() {
  local RE='[^0-9]*\([0-9]*\)[.]\([0-9]*\)[.]\([0-9]*\)\([0-9A-Za-z-]*\)'
  local MAJOR=`echo $1 | sed -e "s#$RE#\1#"`
  local MINOR=`echo $1 | sed -e "s#$RE#\2#"`
  local PATCH=`echo $1 | sed -e "s#$RE#\3#"`
  local SPECIAL=`echo $1 | sed -e "s#$RE#\4#"`

  case $2 in
    "major")    ((MAJOR++)); SPECIAL="";;
    "minor")    ((MINOR++)); SPECIAL="";;
    "patch")    ((PATCH++)); SPECIAL="";;
    "special")               SPECIAL=$3;;
  esac

  echo $MAJOR.$MINOR.$PATCH$SPECIAL
}

NEWVERSION=`inc $OLDVERSION $INCREMENT $2`
printf "Current version is $OLDVERSION \n"
printf "Press [enter] to publish $NEWVERSION"
read -s
echo
