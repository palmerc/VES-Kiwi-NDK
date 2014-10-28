INNER_SAVED_LOCAL_PATH := $(LOCAL_PATH)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := ves
EXPORT_LOCAL_C_INCLUDES += $(LOCAL_PATH)
LOCAL_SRC_FILES := \
   vesActor.cpp \
   vesBackground.cpp \
   vesBlend.cpp \
   vesBlendFunction.cpp \
   vesBoundingObject.cpp \
   vesCamera.cpp \
   vesCullVisitor.cpp \
   vesDepth.cpp \
   vesFBO.cpp \
   vesFBORenderTarget.cpp \
   vesEigen.cpp \
   vesGeometryData.cpp \
   vesGroupNode.cpp \
   vesMapper.cpp \
   vesMaterial.cpp \
   vesNode.cpp \
   vesOpenGLSupport.cpp \
   vesRenderer.cpp \
   vesRenderStage.cpp \
   vesRenderToTexture.cpp \
   vesShader.cpp \
   vesTexture.cpp \
   vesTransformNode.cpp \
   vesShaderProgram.cpp \
   vesUniform.cpp \
   vesViewport.cpp \
   vesVisitor.cpp
LOCAL_C_INCLUDES := \
   $(LOCAL_PATH)/../../eigen
include $(BUILD_STATIC_LIBRARY)

LOCAL_PATH := $(INNER_SAVED_LOCAL_PATH)
