import QtQuick
import QtQuick.Window

Window {
  width: 640
  height: 480
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
      id: firstSong

      anchors {
        verticalCenter: parent.verticalCenter
        left: parent.left
        right: parent.right
        margins: 20
      }

      songIndex: 0
      title: "Eine Kleine Nachtmusik"
      authorName: "Wolfgang Amadeus Mozart"
      imageSource: "assets/images/eine.jpeg"
    }

    AudioInfoBox {
      id: secondSong

      anchors {
        verticalCenter: parent.verticalCenter
        left: parent.left
        right: parent.right
        margins: 20
      }

      songIndex: 1
      title: "Symphony No. 5"
      authorName: "Ludwig Van Beethoven"
      imageSource: "assets/images/symphony.jpeg"
    }

    AudioInfoBox {
      id: thirdSong

      anchors {
        verticalCenter: parent.verticalCenter
        left: parent.left
        right: parent.right
        margins: 20
      }

      songIndex: 2
      title: "Air on the G String"
      authorName: "Johann Sebastian Bach"
      imageSource: "assets/images/air.jpeg"
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

      ImageButton {
        id: previousButton

        width: 64
        height: 64

        source: "assets/icons/previous-outline.svg"

        onClicked: {
          playerController.switchToPreviousSong()
        }
      }

      ImageButton {
        id: playPauseButton

        width: 64
        height: 64

        source: playerController.playing ? "assets/icons/pause-outline.svg" : "assets/icons/play-outline.svg"

        onClicked: {
          playerController.playPause()
        }
      }

      ImageButton {
        id: nextButton

        width: 64
        height: 64

        source: "assets/icons/next-outline.svg"

        onClicked: {
          playerController.switchToNextSong()
        }
      }
    }
  }

  QtObject {
    id: playerController

    property int currentSongIndex: 0
    property int songCount: 3
    property bool playing: false

    function playPause() {
      playing = !playing
    }

    function switchToPreviousSong() {
      if (currentSongIndex < 0) {
        currentSongIndex = songCount -1
      } else {
        currentSongIndex--
      }
    }

    function switchToNextSong() {
      if (currentSongIndex+1 >= songCount) {
        currentSongIndex = 0
      } else {
        currentSongIndex++
      }
    }
  }
}
