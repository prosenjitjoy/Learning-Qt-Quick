import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: led
        anchors.centerIn: parent
        width: 100
        height: 100
        radius: 50
        color: "green"
        state: "OFF"

        MouseArea {
            anchors.fill: parent
            onPressed: led.state = "ON"
            onReleased: led.state = "OFF"
        }

        states: [
            State {
                name: "ON"
                PropertyChanges {
                    led.color: "red"
                }
            },
            State {
                name: "OFF"
                PropertyChanges {
                    led.color: "green"
                }
            }
        ]

        transitions: [
            Transition {
                from: "ON"
                to: "OFF"
                ColorAnimation {
                    target: led
                    duration: 100
                }
            },
            Transition {
                from: "OFF"
                to: "ON"
                ColorAnimation {
                    target: led
                    duration: 100
                }
            }

        ]
    }
}
