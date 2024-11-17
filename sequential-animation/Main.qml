import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        anchors.centerIn: parent
        width: 100
        height: 100
        radius: 50

        SequentialAnimation on color {
            ColorAnimation {
                to: "red"
                duration: 1000
            }
            ColorAnimation {
                to: "yellow"
                duration: 1000
            }
            ColorAnimation {
                to: "green"
                duration: 1000
            }
            running: true
            loops: Animation.Infinite
        }
    }
}
