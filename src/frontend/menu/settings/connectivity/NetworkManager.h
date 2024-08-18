#ifndef NETWORKMANAGER_H
#define NETWORKMANAGER_H

#include <QObject>

class NetworkManager : public QObject {
    Q_OBJECT
public:
    explicit NetworkManager(QObject *parent = nullptr);

    Q_INVOKABLE void scanNetworks();
    Q_INVOKABLE void connectToNetwork(const QString &networkName);

signals:
    void networksAvailable(const QStringList &networks);

private:
    QStringList availableNetworks;
};

#endif // NETWORKMANAGER_H
