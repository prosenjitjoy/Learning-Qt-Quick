import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ListView {
        id: listView
        // width: 120
        // height: 200
        anchors.fill: parent
        model: myModel
        delegate: textDelegate
    }

    Component {
        id: textDelegate
        Text {
            text: modelData
        }
    }
}
