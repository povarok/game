import QtQuick 2.0

Image {
    id: background
    source: "assets/background/scrollingBackground.png"
    width: 1600
    height: 600
    fillMode: Image.TileHorizontally

    function stop() {
       backgroundAnim.stop()
       player.state = "Death"

    }
    function restart() {
       background.width = 1600
       background.x = 0
       backgroundAnim.start()
       player.state = "Alive"

    }

    Timer {
        id: backgroundAnim
        interval: 1000/60
        repeat: true
        running: true

        onTriggered: {
            background.x -= 5
            background.width += 5
        }
    }
}




