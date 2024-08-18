#ifndef NETWORKMANAGERBACKEND_H
#define NETWORKMANAGERBACKEND_H

#include <QObject>
#include <QStringList>
#include <NetworkManagerQt/Manager>
#include <NetworkManagerQt/AccessPoint>
#include <NetworkManagerQt/Settings>
#include <NetworkManagerQt/Device>

class NetworkManagerBackend : public QObject {
    Q_OBJECT
    Q_PROPERTY(QStringList accessPoints READ accessPoints NOTIFY accessPointsUpdated)
    Q_PROPERTY(QString selectedSSID READ selectedSSID WRITE setSelectedSSID NOTIFY selectedSSIDChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)

public:
    explicit NetworkManagerBackend(QObject *parent = nullptr);

    QStringList accessPoints() const;
    QString selectedSSID() const;
    void setSelectedSSID(const QString &ssid);
    QString password() const;
    void setPassword(const QString &password);

public slots:
    void listAccessPoints();
    void connectToNetwork();

signals:
    void accessPointsUpdated();
    void selectedSSIDChanged();
    void passwordChanged();
    void connected();
    void connectionFailed();

private:
    QStringList m_accessPoints;
    QString m_selectedSSID;
    QString m_password;
};

#endif // NETWORKMANAGERBACKEND_H
