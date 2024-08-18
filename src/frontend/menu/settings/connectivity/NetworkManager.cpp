#include "NetworkManager.h"

NetworkManager::NetworkManager(QObject *parent) : QObject(parent) {
    // Simulate some networks for demo purposes
    availableNetworks << "Network1" << "Network2" << "Network3";
}

void NetworkManager::scanNetworks() {
    // Emit the available networks
    emit networksAvailable(availableNetworks);
}

void NetworkManager::connectToNetwork(const QString &networkName) {
    // Simulate connecting to a network
    //qDebug() << "Connecting to network:" << networkName;
}
