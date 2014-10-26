#!/bin/bash

. ./ves-kiwi-variables.sh

# Create the project folder and copy in the source
mkdir -p "${KIWI_BUILD_DIR}"
cd "${KIWI_BUILD_DIR}"
cp -R ${VES_ANDROID_SOURCE_DIR}/Kiwi/ .

# Patch AndroidManifest.xml
patch -p0 AndroidManifest.xml < ${SCRIPT_DIR}/AndroidManifest.patch

# Copy eigen into the jni folder
cp -R "${VES_INSTALL_DIR}/eigen" "${KIWI_JNI_DIR}/"

# Clean out the cruft
find ${KIWI_BUILD_DIR} -type f -name "*.cmake" -exec rm {} \;
find ${KIWI_BUILD_DIR} -type f -name "CMakeLists.txt" -exec rm {} \;

cp "${SCRIPT_DIR}"/{Android,Application}.mk "${KIWI_JNI_DIR}"

ndk-build clean all
