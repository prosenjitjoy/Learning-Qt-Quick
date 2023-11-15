import QtQuick
import QtQuick.Window
import PlayerController

Window {
  id: root

  width: 480
  height: 640
  visible: true
  title: qsTr("Song Player")

  Rectangle {
    id: topbar

    anchors {
      top: parent.top
      left: parent.left
      right: parent.right
    }

    height: 50
    color: "#5f8575"

    ImageButton {
      anchors {
        right: parent.right
        verticalCenter: parent.verticalCenter
        rightMargin: 20
      }

      width: 32
      height: 32
      source: "assets/icons/menu.svg"

      onClicked: {
        playlistPanel.hidden = !playlistPanel.hidden
      }
    }
  }

  Rectangle {
    id: mainsection

    anchors {
      top: topbar.bottom
      left: parent.left
      right: parent.right
      bottom: bottombar.top;
    }

    color: "#1e1e1e"

    AudioInfoBox {
      id: songInfo

      anchors {
        verticalCenter: parent.verticalCenter
        left: parent.left
        right: parent.right
        margins: 20
      }
    }
  }

  Rectangle {
    id: bottombar

    anchors {
      bottom: parent.bottom
      left: parent.left
      right: parent.right
    }

    height: 100
    color: "#333333"

    Row {
      anchors.centerIn: parent
      spacing: 20
      enabled : !!PlayerController.currentSong
      opacity: enabled ? 1 : 0.3

      ImageButton {
        id: previousButton

        width: 64
        height: 64

        source: "assets/icons/previous-outline.svg"

        onClicked: {
          PlayerController.switchToPreviousSong()
        }
      }

      ImageButton {
        id: playPauseButton

        width: 64
        height: 64

        source: PlayerController.playing ? "assets/icons/pause-outline.svg" : "assets/icons/play-outline.svg"

        onClicked: {
          PlayerController.playPause()
        }
      }

      ImageButton {
        id: nextButton

        width: 64
        height: 64

        source: "assets/icons/next-outline.svg"

        onClicked: {
          PlayerController.switchToNextSong()
        }
      }
    }
  }

  PlaylistPanel {
    id: playlistPanel

    anchors {
      top: topbar.bottom
    }

    x: hidden ? parent.width : parent.width - width
  }
}
