import QtQuick
import QtQuick.Window
import QtQuick.Controls
import PlayerController
import AudioSearchModel

Window {
  id: root

  width: 480
  height: 640
  visible: true
  title: qsTr("Song Player")

  Rectangle {
    id: topBar

    anchors {
      top: parent.top
      left: parent.left
      right: parent.right
    }

    height: 50
    color: "#5f8575"

    SearchField {
      anchors {
        left: parent.left
        right: closeSearchButton.left
        verticalCenter: parent.verticalCenter
        margins: 10
      }


      height: 30
      visible: !searchPanel.hidden
      enabled: !AudioSearchModel.isSearching

      onAccepted: value => {
                    AudioSearchModel.searchSong(value)
                    topBar.forceActiveFocus()
                  }
    }

    ImageButton {
      id: playListIcon

      anchors {
        right: parent.right
        verticalCenter: parent.verticalCenter
        rightMargin: 20
      }

      width: 32
      height: 32
      source: "assets/icons/menu.svg"

      visible: searchPanel.hidden

      onClicked: {
        playlistPanel.hidden = !playlistPanel.hidden
      }
    }

    ImageButton {
      id: closeSearchButton

      anchors {
        right: parent.right
        verticalCenter: parent.verticalCenter
        rightMargin: 20
      }

      height: 32
      width: 32

      source: "assets/icons/close.svg"
      visible: !searchPanel.hidden

      onClicked: {
        searchPanel.hidden = true
      }
    }
  }

  Rectangle {
    id: mainSection

    anchors {
      top: topBar.bottom
      left: parent.left
      right: parent.right
      bottom: bottomBar.top;
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
    id: bottomBar

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

        anchors {
          verticalCenter: parent.verticalCenter
        }

        width: 40
        height: 40

        source: "assets/icons/previous.svg"

        onClicked: {
          PlayerController.switchToPreviousSong()
        }
      }

      ImageButton {
        id: playPauseButton

        width: 60
        height: 60

        source: PlayerController.playing ? "assets/icons/pause.svg" : "assets/icons/play.svg"

        onClicked: {
          PlayerController.playPause()
        }
      }

      ImageButton {
        id: nextButton

        anchors {
          verticalCenter: parent.verticalCenter
        }

        width: 40
        height: 40

        source: "assets/icons/next.svg"

        onClicked: {
          PlayerController.switchToNextSong()
        }
      }
    }
  }

  PlaylistPanel {
    id: playlistPanel

    anchors {
      top: topBar.bottom
    }

    x: hidden ? parent.width : parent.width - width

    onSearchRequested: {
      searchPanel.hidden = false
    }
  }

  SearchPanel {
    id: searchPanel

    anchors {
      left: parent.left
      right: parent.right
    }

    height: mainSection.height + bottomBar.height

    y: hidden ? parent.height : topBar.height
  }
}
