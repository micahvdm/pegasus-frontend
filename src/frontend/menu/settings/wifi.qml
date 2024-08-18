import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.2
import "common"
import "qrc:/qmlutils" as PegasusUtils
import WifiManager 1.0

FocusScope {
    id: root

    signal close

    anchors.fill: parent
    enabled: focus
    visible: 0 < (x + width) && x < Window.window.width

    Keys.onPressed: {
        if (api.keys.isCancel(event) && !event.isAutoRepeat) {
            event.accepted = true;
            root.close();
        }
    }


    PegasusUtils.HorizontalSwipeArea {
        anchors.fill: parent
        onSwipeRight: root.close()
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.RightButton
        onClicked: root.close()
    }

    ScreenHeader {
        id: header
        text: qsTr("Settings > WiFi Settings") + api.tr
        z: 2
    }

    WifiManager {
        id: wifiManager
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
            wifiManager.scanNetworks()
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
            wifiManager.connectToNetwork(networkName, password)
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
