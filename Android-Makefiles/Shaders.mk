INNER_SAVED_LOCAL_PATH := $(LOCAL_PATH)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := shaders
LOCAL_EXPORT_C_INCLUDES += $(LOCAL_PATH)
LOCAL_SRC_FILES := \
   vesBackgroundTexture_frag.cpp \
   vesBackgroundTexture_vert.cpp \
   vesBlinnPhong_frag.cpp \
   vesBlinnPhong_vert.cpp \
   vesBuiltinShaders.cpp \
   vesCap_frag.cpp \
   vesCap_vert.cpp \
   vesClipPlane_frag.cpp \
   vesClipPlane_vert.cpp \
   vesGouraudTexture_frag.cpp \
   vesGouraudTexture_vert.cpp \
   vesShader_frag.cpp \
   vesShader_vert.cpp \
   vesTestTexture_frag.cpp \
   vesTestTexture_vert.cpp \
   vesToonShader_frag.cpp \
   vesToonShader_vert.cpp \
   vesWireframeShader_frag.cpp \
   vesWireframeShader_vert.cpp
include $(BUILD_STATIC_LIBRARY)

LOCAL_PATH := $(INNER_SAVED_LOCAL_PATH)
