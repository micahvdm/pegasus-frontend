TEMPLATE = lib

QT += qml quick core
CONFIG += c++11 staticlib warn_on exceptions_off rtti_off qtquickcompiler
DEFINES *= $${COMMON_DEFINES}
QML_IMPORT_PATH += $$PWD/plugins

RESOURCES += \
    ./frontend.qrc \
    ../qmlutils/qmlutils.qrc \
    ../themes/themes.qrc
