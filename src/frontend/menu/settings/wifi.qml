import QtQuick 2.15
import QtQuick.Controls 2.15
import com.example.networkmanager 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Network Manager"

    NetworkManager {
        id: networkManager
        onNetworksAvailable: {
            networkListView.model = networks
        }
    }

    ListView {
        id: networkListView
        width: parent.width
        height: parent.height - connectButton.height - 10
        model: ListModel {}
        delegate: Item {
            width: parent.width
            height: 50

            Rectangle {
                width: parent.width
                height: 50
                color: "lightgray"
                border.color: "black"

                Text {
                    anchors.centerIn: parent
                    text: model.networkName
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        networkManager.connectToNetwork(model.networkName)
                    }
                }
            }
        }
    }

    Button {
        id: connectButton
        text: "Scan for Networks"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            networkManager.scanNetworks()
        }
    }
}
