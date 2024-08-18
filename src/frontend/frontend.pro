TEMPLATE = lib

QT += qml quick networkmanager bluetooth
CONFIG += c++11 staticlib warn_on exceptions_off rtti_off qtquickcompiler
DEFINES *= $${COMMON_DEFINES}

RESOURCES += \
    ./frontend.qrc \
    ../qmlutils/qmlutils.qrc \
    ../themes/themes.qrc
