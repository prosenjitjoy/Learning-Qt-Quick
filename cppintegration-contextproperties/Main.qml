import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Text {
        anchors.centerIn: parent
        text: "C++ Context Property Value: " + radius

        Button {
            id: myButton
            x: 50; y: 50
            text: "Click Me"
            onClicked: {
                classA.callMe()
                classA.printline()
            }
        }
    }
}
