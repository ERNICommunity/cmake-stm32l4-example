# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#!/bin/bash

# Use paths relative to this script's location
SCRIPT=$(readlink -f "$0")
SCRIPTDIR=$(dirname "$SCRIPT")
BASEDIR=$(dirname "$SCRIPTDIR")

# If you want to build into a different directory, change this variable
SOURCEDIR="$BASEDIR/app"
BUILDDIR="$BASEDIR/build/app"

# Generate the build system using Ninja
cmake -B"$BUILDDIR" -GNinja -DCMAKE_TOOLCHAIN_FILE=$BASEDIR/cmake/arm-gcc-cortex-m4.cmake -S"$SOURCEDIR"

# And then do the build
cmake --build $BUILDDIR -j 4 -- -v