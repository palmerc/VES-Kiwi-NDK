## Setting up VES-Kiwi for ndk-build

The idea here is to keep the VES and Kiwi code in the `VES/src` directory as source code that the IDE and ndk-build can manage. The VTK stuff will be treated as a black box that the VES/Kiwi code can reference.

Update `ves-kiwi-variables.sh` values to suit your environment. Then run the following commands:

1. ./ves-base-android-prepare.sh
2. ./ves-base-android-compile.sh
3. ./libvtk-android-create.sh

If all goes well you should have a `libvtk-android/{lib,include}` directory suitable for acting as your VTK black box.
