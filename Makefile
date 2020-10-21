# 注意先USB 连接: iproxy 2222 22
THEOS_DEVICE_IP = localhost
THEOS_DEVICE_PORT = 2222

THOES = /opt/theos

include ${THOES}/makefiles/common.mk

TWEAK_NAME = FLEXLoader
FLEXLoader_FILES = Tweak.xm

include ${THOES}/makefiles/tweak.mk

before-package::
	@echo "Run FLEX dylib build script..."
	./build_dylib.sh

after-install::
	install.exec "killall -9 SpringBoard"
