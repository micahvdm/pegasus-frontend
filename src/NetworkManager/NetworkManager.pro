QT += qml quick core

TARGET = NetworkManager
TEMPLATE = lib
CONFIG += plugin

SOURCES += NetworkManagerPlugin.cpp \
           NetworkManager.cpp

HEADERS += NetworkManagerPlugin.h \
           NetworkManager.h