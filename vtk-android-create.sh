#!/bin/bash

. ./ves-kiwi-variables.sh

VTK_LIB_DIR=${VES_INSTALL_DIR}/vtk-android/lib
VTK_INCLUDE_DIR=${VES_INSTALL_DIR}/vtk-android/include/vtk-6.0

mkdir -p "${LIBVTK_DIR}"/{include,lib}
cd ${VTK_LIB_DIR}
"${GNU_AR_EXECUTABLE}" -M < ${SCRIPT_DIR}/vtk-android-script
mv "${VTK_LIB_DIR}/${LIBVTK_FILE}" "${LIBVTK_DIR}/lib"
cp -R "${VTK_INCLUDE_DIR}/" "${LIBVTK_DIR}/include"
