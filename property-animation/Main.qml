import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: rect
        width: 100
        height: 100
        color: "green"

        PropertyAnimation on x {
            to: 200
        }

        PropertyAnimation on y {
            to: 200
        }
    }
}
