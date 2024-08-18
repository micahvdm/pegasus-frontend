#include "networkmanagerbackend.h"
#include <QDebug>
#include <NetworkManagerQt/AccessPoint>
#include <NetworkManagerQt/Settings>
#include <NetworkManagerQt/Manager>

NetworkManagerBackend::NetworkManagerBackend(QObject *parent) : QObject(parent) {
    connect(NetworkManager::notifier(), &NetworkManager::Notifier::accessPointAdded, this, &NetworkManagerBackend::listAccessPoints);
    listAccessPoints();
}

QStringList NetworkManagerBackend::accessPoints() const {
    return m_accessPoints;
}

QString NetworkManagerBackend::selectedSSID() const {
    return m_selectedSSID;
}

void NetworkManagerBackend::setSelectedSSID(const QString &ssid) {
    if (m_selectedSSID != ssid) {
        m_selectedSSID = ssid;
        emit selectedSSIDChanged();
    }
}

QString NetworkManagerBackend::password() const {
    return m_password;
}

void NetworkManagerBackend::setPassword(const QString &password) {
    if (m_password != password) {
        m_password = password;
        emit passwordChanged();
    }
}

void NetworkManagerBackend::listAccessPoints() {
    m_accessPoints.clear();
    QList<NetworkManager::AccessPoint::Ptr> accessPoints = NetworkManager::accessPoints();
    for (const auto &ap : accessPoints) {
        m_accessPoints.append(QString(ap->ssid()));
    }
    emit accessPointsUpdated();
}

void NetworkManagerBackend::connectToNetwork() {
    QList<NetworkManager::AccessPoint::Ptr> accessPoints = NetworkManager::accessPoints();
    for (const auto &ap : accessPoints) {
        if (ap->ssid() == m_selectedSSID) {
            auto wirelessSettings = NetworkManager::Settings::Wireless::create();
            wirelessSettings->setSsid(m_selectedSSID.toUtf8());
            wirelessSettings->setKey(m_password.toUtf8());

            auto connectionSettings = NetworkManager::Settings::Connection::create();
            connectionSettings->setType(NetworkManager::Settings::Connection::Wifi);
            connectionSettings->setWirelessSettings(wirelessSettings);

            auto result = NetworkManager::Manager::instance()->addConnection(connectionSettings);
            if (result) {
                NetworkManager::Manager::instance()->connectToNetwork(connectionSettings);
                emit connected();
            } else {
                emit connectionFailed();
            }
            return;
        }
    }
    qDebug() << "SSID not found!";
    emit connectionFailed();
}
