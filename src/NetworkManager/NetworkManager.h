#ifndef NETWORKMANAGER_H
#define NETWORKMANAGER_H

#include <QObject>
#include <QStringList>

class NetworkManager : public QObject {
    Q_OBJECT
public:
    explicit NetworkManager(QObject *parent = nullptr);

    Q_INVOKABLE void scanNetworks();
    Q_INVOKABLE void connectToNetwork(const QString &networkName, const QString &password);

signals:
    void networksAvailable(const QStringList &networks);

private:
    void parseAvailableNetworks();
    void runCommand(const QString &command, QStringList &output);
    QStringList availableNetworks;
    static int unused_val;
};

#endif // NETWORKMANAGER_H
