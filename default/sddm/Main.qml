import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import org.kde.plasma.core 2.0 as PlasmaCore

Rectangle {
    id: root
    width: Screen.width
    height: Screen.height

    // Background image
    Image {
        id: background
        anchors.fill: parent
        source: "/usr/share/sddm/themes/aura/background.png"
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
        cache: true
    }

    // Gradient overlay for better text readability
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "transparent" }
            GradientStop { position: 1.0; color: "#40000000" }
        }
    }

    // Center container for login form
    Item {
        id: loginForm
        anchors.centerIn: parent
        width: 400
        height: 300

        // Semi-transparent background for login form
        Rectangle {
            anchors.fill: parent
            color: "#DD1a1b26"
            radius: 12
        }

        Column {
            anchors.centerIn: parent
            spacing: 20
            width: parent.width - 60

            // Username field
            TextField {
                id: usernameField
                width: parent.width
                placeholderText: "Username"
                font.pointSize: 12
                selectByMouse: true
                background: Rectangle {
                    color: "#2a2b36"
                    radius: 6
                }
                color: "#ffffff"
                placeholderTextColor: "#888888"

                Keys.onPressed: {
                    if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                        passwordField.forceActiveFocus()
                    }
                }
            }

            // Password field
            TextField {
                id: passwordField
                width: parent.width
                placeholderText: "Password"
                font.pointSize: 12
                echoMode: TextInput.Password
                selectByMouse: true
                background: Rectangle {
                    color: "#2a2b36"
                    radius: 6
                }
                color: "#ffffff"
                placeholderTextColor: "#888888"

                Keys.onPressed: {
                    if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                        loginButton.clicked()
                    }
                }
            }

            // Login button
            Button {
                id: loginButton
                width: parent.width
                height: 40
                text: "Login"
                font.pointSize: 12

                background: Rectangle {
                    color: loginButton.pressed ? "#5a7a9a" : "#7a9aba"
                    radius: 6
                }

                contentItem: Text {
                    text: loginButton.text
                    font: loginButton.font
                    color: "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                onClicked: {
                    sddm.login(usernameField.text, passwordField.text, sessionCombo.currentIndex)
                }
            }

            // Session selector
            ComboBox {
                id: sessionCombo
                width: parent.width
                model: sessionModel
                currentIndex: sessionModel.lastIndex
                textRole: "name"

                background: Rectangle {
                    color: "#2a2b36"
                    radius: 6
                }

                contentItem: Text {
                    text: sessionCombo.displayText
                    font: sessionCombo.font
                    color: "#ffffff"
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 10
                }
            }
        }
    }

    // Power controls in bottom right
    Row {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 20
        spacing: 15

        Button {
            text: "Suspend"
            onClicked: sddm.suspend()
            background: Rectangle {
                color: "#AA1a1b26"
                radius: 6
            }
            contentItem: Text {
                text: "Suspend"
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Button {
            text: "Reboot"
            onClicked: sddm.reboot()
            background: Rectangle {
                color: "#AA1a1b26"
                radius: 6
            }
            contentItem: Text {
                text: "Reboot"
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Button {
            text: "Shutdown"
            onClicked: sddm.powerOff()
            background: Rectangle {
                color: "#AA1a1b26"
                radius: 6
            }
            contentItem: Text {
                text: "Shutdown"
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    Component.onCompleted: {
        usernameField.forceActiveFocus()
    }
}
