#!/usr/bin/env bash

#To Run the script from project folder in Terminal:
#./build.sh

FRAMEWORK_NAME=AuxiliarySwiftExtensions

SCHEME=$FRAMEWORK_NAME
OUTPUT_FRAMEWORK="$FRAMEWORK_NAME.xcframework"
PATH_OF_BUILDS='./build'

#REMOVE ALL FILES IN BUILD FOLDER
rm -rf "$PATH_OF_BUILDS"
mkdir "$PATH_OF_BUILDS"

#Build Archive for iOS Simulator
SIMULATOR_ARCHIVE_PATH="$PATH_OF_BUILDS/$FRAMEWORK_NAME.framework-iphonesimulator.xcarchive"

xcodebuild archive \
-scheme $SCHEME \
-configuration Release \
-destination 'generic/platform=iOS Simulator' \
-archivePath $SIMULATOR_ARCHIVE_PATH \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES


#Build Archive for iOS
iOS_ARCHIVE_PATH="$PATH_OF_BUILDS/$FRAMEWORK_NAME.framework-iphoneos.xcarchive"

xcodebuild archive \
-scheme $SCHEME \
-configuration Release \
-destination 'generic/platform=iOS' \
-archivePath $iOS_ARCHIVE_PATH \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES


#Build Archive for macOS
MACOS_ARCHIVE_PATH="$PATH_OF_BUILDS/$FRAMEWORK_NAME.framework-catalyst.xcarchive"

xcodebuild archive \
-scheme $SCHEME \
-configuration Release \
-destination 'platform=macOS,arch=x86_64,variant=Mac Catalyst' \
-archivePath $MACOS_ARCHIVE_PATH \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES


#Build XCFramework
xcodebuild -create-xcframework \
-framework "$SIMULATOR_ARCHIVE_PATH/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
-framework "$iOS_ARCHIVE_PATH/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
-framework "$MACOS_ARCHIVE_PATH/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
-output "$PATH_OF_BUILDS/$OUTPUT_FRAMEWORK"


#Open in Finder
open $PATH_OF_BUILDS
