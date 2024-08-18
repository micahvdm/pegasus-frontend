TEMPLATE = lib
QT += qml quick core
TARGET = WifiManager
CONFIG += plugin c++11 staticlib warn_on exceptions_off rtti_off qtquickcompiler
DEFINES *= $${COMMON_DEFINES}

SOURCES += \
           WifiManager.cpp

HEADERS += \
           WifiManager.h
