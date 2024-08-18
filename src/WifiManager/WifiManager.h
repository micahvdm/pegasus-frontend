#include <QObject>
#include <QStringList>

class WifiManager : public QObject {
    Q_OBJECT
public:
    explicit WifiManager(QObject *parent = nullptr);

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

