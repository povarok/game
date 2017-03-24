import QtQuick 2.0
Item {
    focus: true
    property int maxY: game.height - person.height - 10
    onYChanged: {
        if (y > maxY)
            y=maxY
    }

    Image {
        id: person
        source: "assets/Person/bird.png"
        anchors.fill: parent
    }

    Timer {
        id: gravity
        repeat: true
        interval: 1000/60
        running: true

        onTriggered: {
            parent.y += 5
        }
    }
    Keys.onSpacePressed: y-=30


}
