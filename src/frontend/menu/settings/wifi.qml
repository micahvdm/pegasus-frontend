import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3
import org.kde.networkmanager 1.0 as NM
import QtQuick.VirtualKeyboard 2.15 // Import the Virtual Keyboard module
import "qrc:/qmlutils" as PegasusUtils
import "common"

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Settings / WiFi Settings"

    property var selectedNetwork: null
    property string password: ""

    // Enable the on-screen keyboard
    InputPanel {
        id: inputPanel
        z: 99
        visible: VirtualKeyboardSettings.active // Show the keyboard when active
        anchors.bottom: parent.bottom
    }

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

    // Device Selector ComboBox (if there are multiple wireless devices)
    ComboBox {
        id: deviceSelector
        model: NM.NetworkManager.wirelessDevices
        textRole: "interfaceName"
        currentIndex: 0
        width: parent.width * 0.8
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        visible: NM.NetworkManager.wirelessDevices.length > 1
    }

    // List available WiFi networks
    ListView {
        anchors {
            top: deviceSelector.visible ? deviceSelector.bottom : parent.top
            topMargin: deviceSelector.visible ? 20 : 0
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        model: NM.WirelessNetworkModel {
            device: deviceSelector.model[deviceSelector.currentIndex]
        }
        delegate: Item {
            width: parent.width
            height: 50

            RowLayout {
                anchors.fill: parent
                spacing: 10

                Text {
                    text: modelData.ssid
                    Layout.fillWidth: true
                }

                Button {
                    text: "Connect"
                    onClicked: {
                        selectedNetwork = modelData
                        passwordDialog.open()
                    }
                }
            }
        }
    }

    // Password Input Dialog
    Dialog {
        id: passwordDialog
        title: "Enter WiFi Password"
        modal: true
        standardButtons: Dialog.Ok | Dialog.Cancel
        visible: false
        onAccepted: {
            connectToNetwork(selectedNetwork.ssid, password)
            root.close();
        }

        ColumnLayout {
            Text {
                text: "SSID: " + selectedNetwork.ssid
                Layout.fillWidth: true
            }

            TextField {
                id: passwordField
                placeholderText: "Enter password"
                echoMode: TextInput.Password
                Layout.fillWidth: true
                onTextChanged: password = text
                focus: true // Ensure the text field gains focus when the dialog opens
            }
        }

        onOpened: {
            inputPanel.show() // Show the on-screen keyboard when the dialog opens
        }

        onClosed: {
            inputPanel.hide() // Hide the on-screen keyboard when the dialog closes
        }
    }

    // Error Message Dialog
    MessageDialog {
        id: errorDialog
        title: "Connection Error"
        text: ""
        icon: StandardIcon.Critical
        standardButtons: Dialog.Ok
    }

    // Function to connect to a selected WiFi network
    function connectToNetwork(ssid, password) {
        if (!ssid || !password) {
            errorDialog.text = "SSID or password is missing."
            errorDialog.open()
            return
        }

        var connection = NM.SettingsConnection; {
            id: ssid
            uuid: Qt.createUuid()
            type: "802-11-wireless"
            settings: {
                "802-11-wireless": {
                    "ssid": ssid,
                    "mode": "infrastructure",
                    "security": "802-11-wireless-security"
                }
                "802-11-wireless-security": {
                    "key-mgmt": "wpa-psk",
                    "psk": password
                }
            }
        }

        var activeConnection = connection.save()
        if (activeConnection) {
            activeConnection.activate()
            activeConnection.onActivationStateChanged.connect(function(state) {
                if (state == NM.ActiveConnectionState.Activated) {
                    console.log("Connected to " + ssid)
                } else if (state == NM.ActiveConnectionState.Deactivated) {
                    errorDialog.text = "Failed to connect to " + ssid
                    errorDialog.open()
                }
            })
        } else {
            errorDialog.text = "Failed to save connection for " + ssid
            errorDialog.open()
        }
    }
}
