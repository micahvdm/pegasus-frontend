import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3
import "connectivity"

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
        height: parent.height - connectButton.height - 50
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
                        selectedNetwork = model.networkName
                        passwordDialog.open()
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

    // Password input dialog
    Dialog {
        id: passwordDialog
        title: "Enter Password"
        standardButtons: DialogOk | DialogCancel

        property string networkName: ""
        property string password: ""

        onAccepted: {
            networkManager.connectToNetwork(networkName, password)
            root.close()
        }

        ColumnLayout {
            spacing: 10

            Label {
                text: "Enter password for " + networkName
            }

            TextField {
                id: passwordField
                placeholderText: "Password"
                echoMode: TextInput.Password
                Layout.fillWidth: true
                text: password
                onTextChanged: password = text
            }
        }
    }

    // Variable to store selected network
    property string selectedNetwork: ""
}
