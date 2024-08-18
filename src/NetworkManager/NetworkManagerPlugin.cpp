#include "NetworkManagerPlugin.h"
#include "NetworkManager.h"

void NetworkManagerPlugin::registerTypes(const char *uri) {
    qmlRegisterType<NetworkManager>(uri, 1, 0, "NetworkManager");
}