TARGET := iphone:clang:latest:15.0
INSTALL_TARGET_PROCESSES = CoreAuthUI
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LiteFace
LiteFace_FILES = Tweak.x
LiteFace_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
