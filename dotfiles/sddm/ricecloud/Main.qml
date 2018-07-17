/***********************************************************************/


import QtQuick 2.0

import SddmComponents 2.0


Rectangle {
    width: 640
    height: 480

    TextConstants { id: textConstants }

    Connections {
        target: sddm

        onLoginSucceeded: {
            errorMessage.color = "c2cc68"
            errorMessage.text = "Success!"
        }

        onLoginFailed: {
            errorMessage.color = "db6f6f"
            errorMessage.text = "Failed to login. Invalid username or password."
        }
    }

    Repeater {
        model: screenModel
        Background {
            x: geometry.x; y: geometry.y; width: geometry.width; height:geometry.height
            source: config.background
            fillMode: Image.Stretch
            onStatusChanged: {
                if (status == Image.Error && source != config.defaultBackground) {
                    source = config.defaultBackground
                }
            }
        }
    }

    Rectangle {
        property variant geometry: screenModel.geometry(screenModel.primary)
        x: geometry.x; y: geometry.y; width: geometry.width; height: geometry.height
        color: "transparent"
        transformOrigin: Item.Top

        Image {
            id: ricecloudlogo
            width: height * 3
            height: parent.height / 6
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -1 * height / 2
            anchors.horizontalCenterOffset: 0
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            source: "ricecloud.png"
        }

        Rectangle {
            id: ricecloudloginborder
            anchors.centerIn: parent
            height: (parent.height / 10 * 3) + 10
            width: (parent.height / 10 * 3) * 1.8 + 10
            anchors.verticalCenterOffset: (parent.height / 10 * 3) * 2 / 3
            color: "#40464f"
        }

        Rectangle {
            id: ricecloudlogin
            anchors.centerIn: parent
            height: parent.height / 10 * 3
            width: height * 1.8
            anchors.verticalCenterOffset: height * 2 / 3
            color: "#282a2e"

            Column {
                id: mainColumn
                anchors.centerIn: parent
                width: parent.width * 0.9
                spacing: ricecloudlogin.height / 22.5

                Row {
                    width: parent.width
                    spacing: Math.round(ricecloudlogin.height / 70)
                    Text {
                        id: lblName
                        width: parent.width * 0.20; height: ricecloudlogin.height / 9
                        color: "#ccced1"
                        text: textConstants.userName
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Source Sans Pro"
                        font.bold: true
                        font.pixelSize: ricecloudlogin.height / 20
                    }

                    TextBox {
                        id: name
                        width: parent.width * 0.8; height: ricecloudlogin.height / 9
                        color: "#ccced1"
                        textColor: "#1a1c1e"
                        text: userModel.lastUser
                        font.family: "Source Sans Pro"
                        font.pixelSize: ricecloudlogin.height / 20

                        KeyNavigation.backtab: rebootButton; KeyNavigation.tab: password

                        Keys.onPressed: {
                            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                                sddm.login(name.text, password.text, session.index)
                                event.accepted = true
                            }
                        }
                    }
                }

                Row {
                    width: parent.width
                    spacing : Math.round(ricecloudlogin.height / 70)
                    Text {
                        id: lblPassword
                        width: parent.width * 0.2; height: ricecloudlogin.height / 9
                        color: "#ccced1"
                        text: textConstants.password
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Source Sans Pro"
                        font.bold: true
                        font.pixelSize: ricecloudlogin.height / 20
                    }

                    PasswordBox {
                        id: password
                        width: parent.width * 0.8; height: ricecloudlogin.height / 9
                        color: "#ccced1"
                        textColor: "#1a1c1e"
                        font.family: "Source Sans Pro"
                        font.pixelSize: ricecloudlogin.height / 20
                        tooltipBG: "lightgrey"
                        focus: true
                        Timer {
                            interval: 200
                            running: true
                            onTriggered: password.forceActiveFocus()
                        }

                        KeyNavigation.backtab: name; KeyNavigation.tab: session

                        Keys.onPressed: {
                            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                                sddm.login(name.text, password.text, session.index)
                                event.accepted = true
                            }
                        }
                    }
                }

                Row {
                    spacing: Math.round(ricecloudlogin.height / 70)
                    width: parent.width / 2
                    z: 100

                    Row {
                        z: 100
                        width: parent.width * 1.2
                        spacing : Math.round(ricecloudlogin.height / 70)
                        anchors.bottom: parent.bottom

                        Text {
                            id: lblSession
                            width: parent.width / 3; height: ricecloudlogin.height / 9
                            text: textConstants.session
                            verticalAlignment: Text.AlignVCenter
                            color: "#ccced1"
                            wrapMode: TextEdit.WordWrap
                            font.family: "Source Sans Pro"
                            font.bold: true
                            font.pixelSize: ricecloudlogin.height / 20
                        }

                        ComboBox {
                            id: session
                            width: parent.width * 2 / 3; height: ricecloudlogin.height / 9
                            color: "#ccced1"
                            textColor: "#1a1c1e"
                            font.family: "Source Sans Pro"
                            font.pixelSize: ricecloudlogin.height / 20

                            arrowIcon: "angle-down.png"

                            model: sessionModel
                            index: sessionModel.lastIndex

                            KeyNavigation.backtab: password; KeyNavigation.tab: layoutBox
                        }
                    }
                    Row {
                        z: 101
                        width: parent.width * 0.8
                        spacing : ricecloudlogin.height / 27
                        anchors.bottom: parent.bottom

                        Text {
                            id: lblLayout
                            width: parent.width / 3; height: ricecloudlogin.height / 9
                            text: textConstants.layout
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            color: "#ccced1"
                            wrapMode: TextEdit.WordWrap
                            font.family: "Source Sans Pro"
                            font.bold: true
                            font.pixelSize: ricecloudlogin.height / 20
                        }

                        LayoutBox {
                            id: layoutBox
                            width: (parent.width * 2 / 3) -10; height: ricecloudlogin.height / 9
                            color: "#ccced1"
                            textColor: "#1a1c1e"
                            font.family: "Source Sans Pro"
                            font.pixelSize: ricecloudlogin.height / 20

                            arrowIcon: "angle-down.png"

                            KeyNavigation.backtab: session; KeyNavigation.tab: loginButton
                        }
                    }
                }

                Column {
                    width: parent.width
                    Text {
                        id: errorMessage
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: ""
                        color: "#ccced1"
                        font.family: "Source Sans Pro"
                        font.pixelSize: ricecloudlogin.height / 20
                    }
                }

                Row {
                    spacing: Math.round(ricecloudlogin.height / 70)
                    anchors.horizontalCenter: parent.horizontalCenter
                    property int btnWidth: Math.max(loginButton.implicitWidth,
                                                    shutdownButton.implicitWidth,
                                                    rebootButton.implicitWidth, ricecloudlogin.height / 3) + 8
                    Button {
                        id: loginButton
                        text: textConstants.login
                        width: parent.btnWidth
                        height: ricecloudlogin.height / 9
                        font.family: "Source Sans Pro"
                        font.pixelSize: ricecloudlogin.height / 20
                        color: "#8cafcc"
                        textColor: "#1a1c1e"

                        onClicked: sddm.login(name.text, password.text, session.index)

                        KeyNavigation.backtab: layoutBox; KeyNavigation.tab: shutdownButton
                    }

                    Button {
                        id: shutdownButton
                        text: textConstants.shutdown
                        width: parent.btnWidth
                        height: ricecloudlogin.height / 9
                        font.family: "Source Sans Pro"
                        font.pixelSize: ricecloudlogin.height / 20
                        color: "#8cafcc"
                        textColor: "#1a1c1e"

                        onClicked: sddm.powerOff()

                        KeyNavigation.backtab: loginButton; KeyNavigation.tab: rebootButton
                    }

                    Button {
                        id: rebootButton
                        text: textConstants.reboot
                        width: parent.btnWidth
                        height: ricecloudlogin.height / 9
                        font.family: "Source Sans Pro"
                        font.pixelSize: ricecloudlogin.height / 20
                        color: "#8cafcc"
                        textColor: "#1a1c1e"

                        onClicked: sddm.reboot()

                        KeyNavigation.backtab: shutdownButton; KeyNavigation.tab: name
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        if (name.text == "")
            name.focus = true
        else
            password.focus = true
    }
}
