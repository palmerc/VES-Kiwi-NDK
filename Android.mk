LOCAL_PATH := $(call my-dir)

$(call import-add-path,$(LOCAL_PATH))

### Link in libvtk-android
include $(CLEAR_VARS)
LOCAL_MODULE := vtk-android
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/libvtk-android/include
LOCAL_SRC_FILES := $(LOCAL_PATH)/libvtk-android/lib/libvtk-android.a
include $(PREBUILT_STATIC_LIBRARY)

### Build ves-android
include $(CLEAR_VARS)
LOCAL_MODULE := ves-android
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
LOCAL_LDLIBS += -llog

include $(BUILD_SHARED_LIBRARY)
