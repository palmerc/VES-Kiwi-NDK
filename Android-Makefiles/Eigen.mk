INNER_SAVED_LOCAL_PATH := $(LOCAL_PATH)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := eigen
LOCAL_EXPORT_C_INCLUDES += $(LOCAL_PATH)/eigen
include $(BUILD_STATIC_LIBRARY)

LOCAL_PATH := $(INNER_SAVED_LOCAL_PATH)
