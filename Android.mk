LOCAL_PATH := $(call my-dir)

$(call import-add-path,$(LOCAL_PATH))

### Link in eigen
include $(CLEAR_VARS)
LOCAL_MODULE := eigen
LOCAL_EXPORT_C_INCLUDES += $(LOCAL_PATH)/eigen
include $(BUILD_STATIC_LIBRARY)

### Link in libvtk-android
include $(CLEAR_VARS)
LOCAL_MODULE := vtk
LOCAL_EXPORT_C_INCLUDES += $(LOCAL_PATH)/vtk-android/include
LOCAL_SRC_FILES := $(LOCAL_PATH)/vtk-android/lib/libvtk-android.a
include $(PREBUILT_STATIC_LIBRARY)

### Build shaders
include $(CLEAR_VARS)
LOCAL_MODULE := shaders
LOCAL_EXPORT_C_INCLUDES += $(LOCAL_PATH)/ves-android/shaders
LOCAL_SRC_FILES := \
   $(LOCAL_PATH)/ves-android/shaders/vesBackgroundTexture_frag.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesBackgroundTexture_vert.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesBlinnPhong_frag.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesBlinnPhong_vert.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesBuiltinShaders.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesCap_frag.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesCap_vert.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesClipPlane_frag.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesClipPlane_vert.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesGouraudTexture_frag.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesGouraudTexture_vert.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesShader_frag.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesShader_vert.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesTestTexture_frag.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesTestTexture_vert.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesToonShader_frag.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesToonShader_vert.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesWireframeShader_frag.cpp \
   $(LOCAL_PATH)/ves-android/shaders/vesWireframeShader_vert.cpp
include $(BUILD_STATIC_LIBRARY)

### Build ves-android
include $(CLEAR_VARS)
LOCAL_MODULE := ves
EXPORT_LOCAL_C_INCLUDES += $(LOCAL_PATH)/ves-android/ves
LOCAL_SRC_FILES := \
   $(LOCAL_PATH)/ves-android/ves/vesActor.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesBackground.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesBlend.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesBlendFunction.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesBoundingObject.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesCamera.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesCullVisitor.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesDepth.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesFBO.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesFBORenderTarget.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesEigen.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesGeometryData.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesGroupNode.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesMapper.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesMaterial.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesNode.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesOpenGLSupport.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesRenderer.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesRenderStage.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesRenderToTexture.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesShader.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesTexture.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesTransformNode.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesShaderProgram.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesUniform.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesViewport.cpp \
   $(LOCAL_PATH)/ves-android/ves/vesVisitor.cpp
LOCAL_C_INCLUDES := \
   $(LOCAL_PATH)/eigen \
   $(LOCAL_PATH)/ves-android/ves
include $(BUILD_STATIC_LIBRARY)

### Build kiwi-android
## All of the $(LOCAL_PATH)/ves-android/kiwi/ prefixes are redundant.
## When this works I will move the file into the right directory to
## eliminate it
include $(CLEAR_VARS)
LOCAL_MODULE := kiwi
LOCAL_SRC_FILES := \
   $(LOCAL_PATH)/ves-android/kiwi/cJSON.c \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiAnimationRepresentation.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiBaseApp.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiBaselineImageTester.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiBrainAtlasRepresentation.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiCameraSpinner.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiCameraInteractor.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiCameraTransition.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiColorMapCollection.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiDataConversionTools.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiDataLoader.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiDataRepresentation.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiImagePlaneDataRepresentation.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiImageWidgetRepresentation.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiPlaneWidget.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiPolyDataRepresentation.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiSceneRepresentation.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiStreamingDataRepresentation.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiText2DRepresentation.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiTransition.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiViewerApp.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiWidgetInteractionDelegate.cpp \
   $(LOCAL_PATH)/ves-android/kiwi/vesKiwiWidgetRepresentation.cpp
LOCAL_STATIC_LIBRARIES := vtk ves shaders
EXPORT_LOCAL_C_INCLUES += $(LOCAL_PATH)/ves-android/kiwi
LOCAL_C_INCLUDES := \
   $(LOCAL_PATH)/eigen \
   $(LOCAL_PATH)/ves-android/ves \
   $(LOCAL_PATH)/ves-android/shaders \
   $(LOCAL_PATH)/ves-android/kiwi
include $(BUILD_STATIC_LIBRARY)

### Build libKiwiNative.so
include $(CLEAR_VARS)
LOCAL_MODULE := KiwiNative
LOCAL_SRC_FILES := KiwiNative.cpp
LOCAL_C_INCLUDES := \
   $(LOCAL_PATH)/eigen \
   $(LOCAL_PATH)/ves-android/ves \
   $(LOCAL_PATH)/ves-android/kiwi
LOCAL_STATIC_LIBRARIES := \
   vtk \
   shaders \
   ves \
   kiwi
LOCAL_LDLIBS += -llog -lGLESv2

include $(BUILD_SHARED_LIBRARY)
