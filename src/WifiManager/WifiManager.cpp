#include "WifiManager.h"
#include <QProcess>
#include <QDebug>

WifiManager::WifiManager(QObject *parent) : QObject(parent) {
    // Initialization
}

void WifiManager::scanNetworks() {
    parseAvailableNetworks();
    emit networksAvailable(availableNetworks);
}

void WifiManager::connectToNetwork(const QString &networkName, const QString &password) {
    // Build nmcli command
    QString command = QString("sudo nmcli dev wifi connect '%1' password '%2'").arg(networkName, password);

    // Execute command
    QProcess process;
    process.start("sh", QStringList() << "-c" << command);
    process.waitForFinished();
    QByteArray result = process.readAllStandardOutput();
    qDebug() << "nmcli output:" << result;
}

void WifiManager::parseAvailableNetworks() {
    QStringList output;
    runCommand("sudo nmcli -f SSID dev wifi", output);

    availableNetworks.clear();
    for (const QString &line : output) {
        if (!line.trimmed().isEmpty() && line != "SSID") {
            availableNetworks << line.trimmed();
        }
    }
}

void WifiManager::runCommand(const QString &command, QStringList &output) {
    QProcess process;
    process.start("sh", QStringList() << "-c" << command);
    process.waitForFinished();
    QByteArray result = process.readAllStandardOutput();
    output = QString(result).split('\n', QString::SkipEmptyParts);
}
