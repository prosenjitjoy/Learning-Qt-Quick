import QtQuick
import QtQuick.Window
import QtQuick.Controls
// import CPPBackend

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("C++ QML Signals & Slots Demo")

    // CPPBackend {
    //     id: cppBackend
    // }

    property int count: CPPBackend.counter

    onCountChanged: {
        console.log("Property is notified. Updated value is:", count)
        labelCount.text = "Fetched value is " + count
    }

    // Connections {
    //     target: cppBackend
    //     function onSendToQml(count) {
    //         labelCount.text = "Fetched value is " + count
    //     }
    // }

    Row {
        anchors.centerIn: parent
        spacing: 20
        Text {
            id: labelCount
            text: "Fetched value is " + count
        }

        Button {
            text: qsTr("Fetch")
            width: 100
            height: 20
            onClicked: {
                CPPBackend.receiveFromQml()
            }
        }
    }
}
