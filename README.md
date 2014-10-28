## Setting up VES-Kiwi for ndk-build

The issue with the cmake VES Superbuild is that it is designed to download any explicitly defined external dependencies and generate a Makefile to build up the base requirements. This is not compatible with the workflow of using the Eclipse IDE and ndk-build. I define that workflow as edit, compile, debug, repeat.

The idea here is to keep the VES and Kiwi code in the `VES/src` directory as source code that the IDE and ndk-build can manage. The VTK stuff will be treated as a black box that the VES/Kiwi code can reference.

The bash scripts serve to document the construction of an NDK compatible project using the VES-Kiwi source code on a Mac targeting Android.

   * Built on Yosemite
   * Cmake 3.0.2 (Installed via Brew)
   * Android NDK r9d (Installed via Brew)
   * Ant 1.9.4 (Installed via Brew)
   * Python 2.7.8 (Installed via Brew)

Build process:

1. Update `ves-kiwi-variables.sh`
1. `./ves-base-android-prepare.sh`
2. `./ves-base-android-compile.sh`
3. `./vtk-android-create.sh`
4. `./kiwi-android-project-setup.sh`

At this point, we get to the ndk-build stage and start trying to compile. You'll find the results in the `Kiwi-build/` directory.

You can import the `Kiwi-build/` existing project into Eclipse and it should even be importable into Android studio and gradle. I won't get this into gradle until Android Studio can support debugging the NDK though. Within Eclipse `ndk-build` will NOT automatically be called unless you have installed the Android Native Development Tools plugin and configured it.

### Eclipse Requirements

    * Android Native Development Tools plugin
    * NDK path specified
    * Add NDK support to the project by right-clicking the project
    * Setup Debug Configuration based upon Android Native Application template
