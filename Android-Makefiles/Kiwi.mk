INNER_SAVED_LOCAL_PATH := $(LOCAL_PATH)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := kiwi
LOCAL_SRC_FILES := \
   cJSON.c \
   vesKiwiAnimationRepresentation.cpp \
   vesKiwiBaseApp.cpp \
   vesKiwiBaselineImageTester.cpp \
   vesKiwiBrainAtlasRepresentation.cpp \
   vesKiwiCameraSpinner.cpp \
   vesKiwiCameraInteractor.cpp \
   vesKiwiCameraTransition.cpp \
   vesKiwiColorMapCollection.cpp \
   vesKiwiDataConversionTools.cpp \
   vesKiwiDataLoader.cpp \
   vesKiwiDataRepresentation.cpp \
   vesKiwiImagePlaneDataRepresentation.cpp \
   vesKiwiImageWidgetRepresentation.cpp \
   vesKiwiPlaneWidget.cpp \
   vesKiwiPolyDataRepresentation.cpp \
   vesKiwiSceneRepresentation.cpp \
   vesKiwiStreamingDataRepresentation.cpp \
   vesKiwiText2DRepresentation.cpp \
   vesKiwiTransition.cpp \
   vesKiwiViewerApp.cpp \
   vesKiwiWidgetInteractionDelegate.cpp \
   vesKiwiWidgetRepresentation.cpp
LOCAL_STATIC_LIBRARIES := vtk ves shaders
EXPORT_LOCAL_C_INCLUES += $(LOCAL_PATH)
LOCAL_C_INCLUDES := \
   $(LOCAL_PATH)/../../eigen \
   $(LOCAL_PATH)/../shaders \
   $(LOCAL_PATH)/../ves \
   $(LOCAL_PATH)/../kiwi
include $(BUILD_STATIC_LIBRARY)

LOCAL_PATH := $(INNER_SAVED_LOCAL_PATH)
