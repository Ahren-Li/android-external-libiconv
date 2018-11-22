LOCAL_PATH:= $(call my-dir)

prefix := /usr/local
local_prefix := /usr/local
exec_prefix := ${prefix}
libdir := ${exec_prefix}/lib

include $(CLEAR_VARS)
LOCAL_MODULE := libiconv_static

LOCAL_CFLAGS := \
  -Wno-multichar \
  -DANDROID \
  -DLIBDIR=\"$(libdir)\" \
  -DBUILDING_LIBICONV \
  -DIN_LIBRARY

LOCAL_SRC_FILES := \
  libcharset/lib/localcharset.c \
  lib/iconv.c \
  lib/relocatable.c 

LOCAL_C_INCLUDES += \
  $(LOCAL_PATH)/include \
  $(LOCAL_PATH)/libcharset \
  $(LOCAL_PATH)/lib \
  $(LOCAL_PATH)/libcharset/include \
  $(LOCAL_PATH)/srclib

LOCAL_SHARED_LIBRARIES := liblog

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libiconv
LOCAL_WHOLE_STATIC_LIBRARIES := libiconv_static liblog
LOCAL_CLANG := true
LOCAL_SANITIZE := integer
include $(BUILD_SHARED_LIBRARY)
