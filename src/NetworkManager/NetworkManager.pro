TEMPLATE = lib
QT += qml quick core
TARGET = NetworkManager
CONFIG += plugin c++11 staticlib warn_on exceptions_off rtti_off qtquickcompiler
DEFINES *= $${COMMON_DEFINES}

SOURCES += NetworkManagerPlugin.cpp \
           NetworkManager.cpp

HEADERS += NetworkManagerPlugin.h \
           NetworkManager.h

DESTDIR = /usr/lib/qt/qml/