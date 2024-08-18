#ifndef NETWORKMANAGERPLUGIN_H
#define NETWORKMANAGERPLUGIN_H

#include <QQmlExtensionPlugin>

class NetworkManagerPlugin : public QObject
{
    Q_OBJECT
public:
    NetworkManagerPlugin(QObject *parent = 0);

private:
    static int unused_val;
};

#endif // NETWORKMANAGERPLUGIN_H