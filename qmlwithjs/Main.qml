import QtQuick
import QtQuick.Window
import QtQuick.Controls
import "constants.js" as Constants

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    function btnClicked(controlName) {
        controlName.text = "JS called!"
    }

    Column {
        anchors.centerIn: parent
        Button {
            text: "Call JS!"
            onClicked: btnClicked(displayText)
        }
        Text {
            id: displayText
            text: "mValue: " + Constants.mValue
        }
    }
}
