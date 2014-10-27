#!/bin/bash

. ./ves-kiwi-variables.sh

# Create the project folder and copy in the source
mkdir -p "${KIWI_BUILD_DIR}/jni/ves-android"
cd "${KIWI_BUILD_DIR}"
cp -R ${VES_ANDROID_SOURCE_DIR}/Kiwi/ .

# Patch AndroidManifest.xml
patch -p0 AndroidManifest.xml < ${SCRIPT_DIR}/AndroidManifest.patch

# Copy eigen into the jni folder
cp -R "${VES_INSTALL_DIR}/eigen" "${KIWI_JNI_DIR}/"

# Copy vtk-android into the jni folder
cp -R "${LIBVTK_DIR}" "${KIWI_JNI_DIR}/"

# Copy ves, kiwi out of source
cp -R "${VES_SOURCE_DIR}"/src/{kiwi,ves} "${KIWI_JNI_DIR}/ves-android/"
cp "${VES_BUILD_BUILD_DIR}/ves-android/src/kiwi/vesKiwiOptions.h" "${KIWI_JNI_DIR}/ves-android/kiwi/"

# Copy shaders out of the build directory.
cp -R "${VES_BUILD_BUILD_DIR}/ves-android/src/shaders" "${KIWI_JNI_DIR}/ves-android/"

# Copy jni files out of the source directory
cp -R "${KIWI_SOURCE_DIR}/jni/" "${KIWI_JNI_DIR}/"

# Clean out the cruft
find ${KIWI_BUILD_DIR} -type f -name "*.cmake" -exec rm {} \;
find ${KIWI_BUILD_DIR} -type f -name "CMakeLists.txt" -exec rm {} \;

cp "${SCRIPT_DIR}"/{Android,Application}.mk "${KIWI_JNI_DIR}"

cd "${KIWI_JNI_DIR}"
ndk-build clean all
