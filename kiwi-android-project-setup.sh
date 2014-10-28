#!/bin/bash

. ./ves-kiwi-variables.sh

# Create the project folder and copy in the source
mkdir -p "${KIWI_BUILD_DIR}/jni/ves-android"
mkdir -p "${KIWI_BUILD_DIR}/assets"
cp -R "${VES_IOS_SOURCE_DIR}/Kiwi/Kiwi/Data/" "${KIWI_BUILD_DIR}/assets"
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

# Copy in all the Android.mk files
ANDROID_MAKEFILES_DIR=${SCRIPT_DIR}/Android-Makefiles
cp "${ANDROID_MAKEFILES_DIR}"/{Android,Application}.mk "${KIWI_JNI_DIR}"
cp "${ANDROID_MAKEFILES_DIR}/Eigen.mk" "${KIWI_JNI_DIR}/eigen/Android.mk"
cp "${ANDROID_MAKEFILES_DIR}/VTK.mk" "${KIWI_JNI_DIR}/vtk-android/Android.mk"
cp "${ANDROID_MAKEFILES_DIR}/Shaders.mk" "${KIWI_JNI_DIR}/ves-android/shaders/Android.mk"
cp "${ANDROID_MAKEFILES_DIR}/VES.mk" "${KIWI_JNI_DIR}/ves-android/ves/Android.mk"
cp "${ANDROID_MAKEFILES_DIR}/Kiwi.mk" "${KIWI_JNI_DIR}/ves-android/kiwi/Android.mk"

# Clean out the cruft
cd "${KIWI_BUILD_DIR}"
find . -type d -name 'CMakeFiles' -print0 | xargs -0 rm -r --
find . -type f -name '*.cmake' -exec rm {} \;
find . -type f -name 'CMakeLists.txt' -exec rm {} \;
find . -type f -name 'Makefile' -exec rm {} \;

cd "${KIWI_JNI_DIR}"
#ndk-build clean all
