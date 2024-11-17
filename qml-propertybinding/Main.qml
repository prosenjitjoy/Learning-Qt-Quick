import QtQuick
import QtQuick.Controls

Window {
    id: main
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property var count: 0

    property string version: "v1.0"

    Text {
        id: textElement
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        width: 100
        height: 50
        horizontalAlignment: Text.AlignHCenter
        text: main.version
    }

    Button {
        id: btn
        anchors.centerIn: parent
        width: 100
        height: 50
        text: "bump"
        onClicked: {
            count++
            main.version = "v1." + count
        }
    }

    onVersionChanged: {
        console.log("Version Changed!")
    }
}
