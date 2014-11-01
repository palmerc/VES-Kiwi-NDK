#!/bin/bash 

. ./ves-kiwi-variables.sh

VTK_LIB_DIR=${VES_INSTALL_DIR}/vtk-android/lib
VTK_INCLUDE_DIR=${VES_INSTALL_DIR}/vtk-android/include/vtk-6.0

for ((i = 0; i < ${#ANDROID_ABIS[@]}; i++)); do
   export ANDROID_ABI="${ANDROID_ABIS[$i]}"
   echo "Cross-compiling VTK for ${ANDROID_ABI}"
   rm -rf "${VES_BUILD_DIR}"
   mkdir -p "${VES_BUILD_DIR}"
   cd "${VES_BUILD_DIR}"
   cmake \
      -DCMAKE_BUILD_TYPE:STRING=Release \
      -DVES_ANDROID_SUPERBUILD:BOOL=TRUE \
      ${VES_SOURCE_DIR}
   make -j8

   LIBVTK_ABI_DIR="${LIBVTK_DIR}/${ANDROID_ABI}"
   mkdir -p "${LIBVTK_ABI_DIR}"/{include,lib}
   
   cd ${VTK_LIB_DIR}
   "${GNU_AR_EXECUTABLE}" -M < ${SCRIPT_DIR}/vtk-android-script
   mv "${VTK_LIB_DIR}/${LIBVTK_FILE}" "${LIBVTK_ABI_DIR}/lib"

   echo "Copy the VTK includes directory"
   cp -R "${VTK_INCLUDE_DIR}/" "${LIBVTK_ABI_DIR}/include"
done


