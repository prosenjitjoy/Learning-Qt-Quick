import QtQuick
import QtQuick.Window

Window {
  id: root

  width: 640
  height: 480
  visible: true
  color: "green";
  title: qsTr("Hello World")

  Rectangle {
    id: rectangle

    property bool iAmPretty: true
    signal mySignal()

    anchors.centerIn: parent

    width: 250
    height: 150
    color: mouseArea.containsPress ? "red" : "blue"
    rotation: 50
    radius: 20

    MouseArea {
      id: mouseArea

      anchors.fill: parent

      onClicked: {
        // do the stuff
        root.test()
      }
    }
  }

  function test() {
    // do the stuff
  }
}
