APP_MODULES := KiwiNative
APP_PLATFORM := android-14
APP_OPTIM := debug
APP_ABI := armeabi-v7a
APP_STL := gnustl_static

APP_CFLAGS += -Wno-error=format-security
APP_CPPFLAGS += -frtti 
APP_CPPFLAGS += -fexceptions
