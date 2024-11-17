import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        anchors.centerIn: parent
        width: 100
        height: 200
        color: "green"

        RotationAnimator on rotation {
            from: 0
            to: 360
            duration: 1000
            running: true
            loops: Animation.Infinite
        }
    }
}
