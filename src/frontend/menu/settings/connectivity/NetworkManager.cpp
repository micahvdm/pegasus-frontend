#include "NetworkManager.h"
#include <QProcess>
#include <QDebug>

NetworkManager::NetworkManager(QObject *parent) : QObject(parent) {
    // Initialization
}

void NetworkManager::scanNetworks() {
    parseAvailableNetworks();
    emit networksAvailable(availableNetworks);
}

void NetworkManager::connectToNetwork(const QString &networkName, const QString &password) {
    // Build nmcli command
    QString command = QString("nmcli dev wifi connect '%1' password '%2'").arg(networkName, password);

    // Execute command
    QProcess process;
    process.start(command);
    process.waitForFinished();
    QByteArray result = process.readAllStandardOutput();
    qDebug() << "nmcli output:" << result;
}

void NetworkManager::parseAvailableNetworks() {
    QStringList output;
    runCommand("sudo nmcli -f SSID dev wifi", output);

    availableNetworks.clear();
    for (const QString &line : output) {
        if (!line.trimmed().isEmpty() && line != "SSID") {
            availableNetworks << line.trimmed();
        }
    }
}

void NetworkManager::runCommand(const QString &command, QStringList &output) {
    QProcess process;
    process.start(command);
    process.waitForFinished();
    QByteArray result = process.readAllStandardOutput();
    output = QString(result).split('\n', QString::SkipEmptyParts);
}
