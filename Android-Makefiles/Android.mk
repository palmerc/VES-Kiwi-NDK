LOCAL_PATH := $(call my-dir)

include $(LOCAL_PATH)/vtk-android/Android.mk
include $(LOCAL_PATH)/eigen/Android.mk
include $(LOCAL_PATH)/ves-android/shaders/Android.mk
include $(LOCAL_PATH)/ves-android/ves/Android.mk
include $(LOCAL_PATH)/ves-android/kiwi/Android.mk
include $(CLEAR_VARS)

LOCAL_MODULE := KiwiNative
LOCAL_SRC_FILES := KiwiNative.cpp
LOCAL_C_INCLUDES := \
   $(LOCAL_PATH)/eigen \
   $(LOCAL_PATH)/ves-android/shaders \
   $(LOCAL_PATH)/ves-android/ves \
   $(LOCAL_PATH)/ves-android/kiwi
LOCAL_STATIC_LIBRARIES := \
   vtk \
   shaders \
   ves \
   kiwi
LOCAL_LDLIBS += -llog -lGLESv2

include $(BUILD_SHARED_LIBRARY)
