import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    // // Manually positioned at 50,50
    // Rectangle {
    //     x: 50; y: 50
    //     width: 100
    //     height: 80
    //     color: "blue"
    // }

    // // Positioning with anchors
    // Rectangle {
    //     id: blueRect
    //     anchors {
    //         left: parent.left; leftMargin: 10
    //         right: parent.right; rightMargin: 40
    //         top: parent.top; topMargin: 50
    //         bottom: parent.bottom; bottomMargin: 100
    //     }
    //     color: "blue"

    //     Rectangle {
    //         id: redRect
    //         anchors.centerIn: blueRect
    //         color: "red"
    //         width: 150; height: 100
    //     }
    // }

    // // Positioners
    // Row {
    //     id: row
    //     x: 50; y: 50
    //     Rectangle {
    //         id: yellowRect
    //         width: 150; height: 100
    //         color: "yellow"
    //         border.color: "black"
    //     }
    //     Rectangle {
    //         id: redRect
    //         width: 150; height: 100
    //         color: "red"
    //         border.color: "black"
    //     }
    //     Rectangle {
    //         id: greenRect
    //         width: 150; height: 100
    //         color: "green"
    //         border.color: "black"
    //     }
    // }

    // Repeater
    Grid {
        id: grid
        anchors.centerIn: parent
        columns: 3
        spacing: 10
        Repeater {
            model: 8
            Rectangle {
                width: 60; height: 40
                border { width: 1; color: "black" }
                color: "green"
            }
        }
    }
}
