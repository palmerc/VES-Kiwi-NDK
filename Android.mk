LOCAL_PATH := $(call my-dir)

$(call import-add-path,$(LOCAL_PATH))

### Link in eigen
include $(CLEAR_VARS)
LOCAL_MODULE := eigen
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/eigen
include $(BUILD_STATIC_LIBRARY)

### Link in libvtk-android
include $(CLEAR_VARS)
LOCAL_MODULE := vtk-android
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/vtk-android/include
LOCAL_SRC_FILES := $(LOCAL_PATH)/vtk-android/lib/libvtk-android.a
include $(PREBUILT_STATIC_LIBRARY)

### Build ves-android
include $(CLEAR_VARS)
LOCAL_MODULE := ves-android

CPP_FILE_LIST := $(wildcard $(LOCAL_PATH)/ves-android/ves/*.cpp)
CPP_FILE_LIST += $(wildcard $(LOCAL_PATH)/ves-android/ves/**/*.cpp)
CPP_FILE_LIST += $(wildcard $(LOCAL_PATH)/ves-android/ves/**/**/*.cpp)
LOCAL_SRC_FILES := $(CPP_FILE_LIST:$(LOCAL_PATH)/%=%)
LOCAL_C_INCLUDES := \
   $(LOCAL_PATH)/eigen \
   $(LOCAL_PATH)/ves-android/ves

include $(BUILD_STATIC_LIBRARY)

### Build kiwi-android
include $(CLEAR_VARS)
LOCAL_MODULE := kiwi-android
include $(BUILD_STATIC_LIBRARY)

### Build libKiwiNative.so
include $(CLEAR_VARS)
LOCAL_MODULE := KiwiNative

LOCAL_STATIC_LIBRARIES := \
   vtk-android \
   ves-android \
   kiwi-android
LOCAL_LDLIBS += -llog -lGLESv2

include $(BUILD_SHARED_LIBRARY)
