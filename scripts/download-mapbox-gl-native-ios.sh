#!/bin/sh

cd ios/

VERSION=$1
if type /usr/libexec/PlistBuddy &> /dev/null; then
  CURRENT_VERSION=$(/usr/libexec/PlistBuddy -c "Print :MGLSemanticVersionString" Mapbox.framework/Info.plist)
else
  CURRENT_VERSION=$(cat .framework_version)
fi

if [ "$VERSION" == "$CURRENT_VERSION" ]; then
  echo "The newest version is already installed. Exiting."
  exit 0
fi

echo "Downloading Mapbox GL iOS $VERSION, this may take a minute."

if ! [ -d ./Mapbox.framework ]; then
  echo "Mapbox.framework not found. Please reinstall react-native-mapbox-gl"; exit 1;
fi;

echo "$VERSION" > .framework_version
