TARGET := iphone:clang:18.4:15.0
INSTALL_TARGET_PROCESSES =  SpringBoard cameracaptured dtremotedisplayd
THEOS_PACKAGE_SCHEME := rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = UnrestrictMirroring

UnrestrictMirroring_FILES = DeviceHubRemote.x iPhoneMirroring.x
UnrestrictMirroring_CFLAGS = -fobjc-arc
UnrestrictMirroring_FRAMEWORKS = IOKit
UnrestrictMirroring_LIBRARIES = MobileGestalt
UnrestrictMirroring_CODESIGN_FLAGS = -Cadhoc -S

include $(THEOS_MAKE_PATH)/tweak.mk
