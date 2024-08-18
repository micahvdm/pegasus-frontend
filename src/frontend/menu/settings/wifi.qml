import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Network Manager"

    property string selectedSSID: nmBackend.selectedSSID
    property string password: nmBackend.password

    Column {
        spacing: 10
        width: parent.width
        height: parent.height

        Button {
            text: "List Available Networks"
            onClicked: nmBackend.listAccessPoints()
        }

        ListView {
            width: parent.width
            height: parent.height - 100
            model: ListModel {
                id: accessPointModel
                Component.onCompleted: nmBackend.listAccessPoints()
            }
            delegate: Item {
                width: parent.width
                height: 40

                Rectangle {
                    width: parent.width
                    height: 40
                    color: "lightgray"
                    border.color: "black"

                    Text {
                        anchors.centerIn: parent
                        text: model.display
                        font.pixelSize: 20
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            selectedSSID = model.display
                            nmBackend.setSelectedSSID(selectedSSID)
                        }
                    }
                }
            }
        }

        TextField {
            id: passwordField
            width: parent.width
            placeholderText: "Enter password"
            text: password
            onTextChanged: nmBackend.setPassword(text)
        }

        Button {
            text: "Connect to Network"
            onClicked: nmBackend.connectToNetwork()
        }

        Text {
            text: "Connected to: " + selectedSSID
            color: "green"
            visible: nmBackend.accessPoints.length > 0 && selectedSSID !== ""
        }

        Text {
            id: statusText
            color: "red"
            visible: nmBackend.connectionFailed
            text: "Failed to connect to network!"
        }
    }

    Connections {
        target: nmBackend
        onAccessPointsUpdated: {
            accessPointModel.clear()
            for (var i = 0; i < nmBackend.accessPoints.length; i++) {
                accessPointModel.append({ display: nmBackend.accessPoints[i] })
            }
        }
        onConnected: {
            statusText.visible = false
        }
        onConnectionFailed: {
            statusText.visible = true
        }
    }
}
