import QtQuick 2.0

Image {
    id: ground
    source: "assets/background/ground.png"
    width: 288
    height: 112
    y: root.height - height
    fillMode: Image.TileHorizontally

    Connections {
        target: root

        onBirdPositionChanged: {
            if (root.bird.y + root.bird.height >= ground.y) {
                if (root.initialized) root.terminateGame()
                gravity.stop()
                gameOverAnim.start();
            }
        }
    }

    Timer {
        id: groundAnim
        interval: 12
        repeat: true
        running: true

        onTriggered: {
            ground.x -= 1
            ground.width += 1
        }
    }
}
