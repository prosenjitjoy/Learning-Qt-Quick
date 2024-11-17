import QtQuick
import QtQuick.Window
import Backend


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    BackendLogic {
        id: logic
    }

    Text {
        anchors.centerIn: parent
        text: "From Backend Logic : " + logic.getData()
    }
}
