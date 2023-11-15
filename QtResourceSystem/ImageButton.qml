import QtQuick

Image {
  id: root

  signal clicked()

  opacity: buttonMouseArea.containsMouse ? 0.70 : 1

  MouseArea {
    id: buttonMouseArea

    anchors.fill: parent
    hoverEnabled: true

    onClicked: {
      root.clicked()
    }
  }
}
