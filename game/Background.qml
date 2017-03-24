import QtQuick 2.0

Rectangle {
    anchors.fill: parent
    Image {
        id: background
        source: "assets/background/scrollingBackground.png"
        fillMode: Image.TileHorizontally

        Timer {
            id: backgroundAnim
            interval: 100
            repeat: true
            running: true

            onTriggered: {
                background.x -= 5
                background.width += 5
            }
        }
    }
        NumberAnimation on x {
            to: -background.width
        }
        }



