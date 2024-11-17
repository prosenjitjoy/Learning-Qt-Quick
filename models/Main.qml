import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ListView {
        anchors.fill: parent
        model: 10
        delegate: itemDelegate
    }

    Component {
        id: itemDelegate
        Text {
            text: " Item: " + index
        }
    }
}
