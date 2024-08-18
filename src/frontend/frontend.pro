TEMPLATE = lib

QT += qml quick
LIBS += -lKF5NetworkManagerQt
CONFIG += c++11 staticlib warn_on exceptions_off rtti_off qtquickcompiler
DEFINES *= $${COMMON_DEFINES}

RESOURCES += \
    ./frontend.qrc \
    ../qmlutils/qmlutils.qrc \
    ../themes/themes.qrc
