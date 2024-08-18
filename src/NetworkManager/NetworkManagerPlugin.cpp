#include "NetworkManagerPlugin.h"
#include "NetworkManager.h"
#include <QtQml>

int NetworkManagerPlugin::unused_val = qmlRegisterType<NetworkManager>("NetworkManager", 1, 0, "NetworkManager");
// void NetworkManagerPlugin::registerTypes(const char *uri) {
//     qmlRegisterType<NetworkManager>(uri, 1, 0, "NetworkManager");
// }