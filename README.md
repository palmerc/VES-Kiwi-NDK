## Setting up VES-Kiwi for ndk-build

The issue with the cmake VES Superbuild is that it is designed to download any explicitly defined external dependencies and generate a Makefile to build up the base requirements. This is not compatible with the workflow of using the Eclipse IDE and ndk-build. I define that workflow as edit, compile, debug, repeat.

The idea here is to keep the VES and Kiwi code in the `VES/src` directory as source code that the IDE and ndk-build can manage. The VTK stuff will be treated as a black box that the VES/Kiwi code can reference.

Update `ves-kiwi-variables.sh` values to suit your environment. Then run the following commands:

1. `./ves-base-android-prepare.sh`
2. `./ves-base-android-compile.sh`
3. `./vtk-android-create.sh`
4. `./kiwi-android-project-setup.sh`

At this point, we get to the ndk-build stage and start trying to compile. You'll find the results in the `Kiwi-build/` directory.

You can import the `Kiwi-build/` existing project into Eclipse and it should even be importable into Android studio and gradle. I won't get this into gradle until Android Studio can support debugging the NDK though.
