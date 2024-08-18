#ifndef NETWORKMANAGERPLUGIN_H
#define NETWORKMANAGERPLUGIN_H

#include <QQmlExtensionPlugin>

class NetworkManagerPlugin : public QQmlExtensionPlugin {
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri) override;
};

#endif // NETWORKMANAGERPLUGIN_H