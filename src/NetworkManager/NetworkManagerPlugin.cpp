#include "NetworkManagerPlugin.h"
#include "NetworkManager.h"

void NetworkManagerPlugin::registerTypes(const char *uri) {
    qmlRegisterType<MyClass>(uri, 1, 0, "NetworkManager");
}