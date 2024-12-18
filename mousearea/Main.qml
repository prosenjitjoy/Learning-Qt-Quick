import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    MouseArea {
        anchors.fill: parent
        onClicked: {
            box.color = "green"
        }
    }

    Rectangle {
        id: box
        anchors.centerIn: parent
        width: 100; height: 100
        color: "green"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                parent.color = "red"
            }
        }
    }
}
