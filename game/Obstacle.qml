import QtQuick 2.0


Item {
    id: obstacle
    property bool boom: false
    property int playerX: 0
    property int playerY: 0
    property int playerW: 0
    property int playerH: 0
    property string source: ""



    signal boomSignal()
    signal restartobstacle ()
    onRestartobstacle: {
        obstacle.restart()
        console.log ("123")
    }

    //
    onXChanged: {
        if (obstacle.visible && obstacle.x + rocket.width >= playerX && obstacle.x <= playerX && obstacle.y + rocket.height >= playerY && obstacle.y <= playerY) {
            boomSignal()
            obstacle.visible = false
            //console.log("collisions:"+coll)

        }
    }
    Image {
        id: rocket
        width: 100;   height: 80; rotation: -90
        source: obstacle.source
    }

    Text {
        text: obstacle.x + " : " + obstacle.y
        font.pixelSize: 40
    }

    //    Timer{
    //        running: true
    //        repeat: true
    //        id: rocketT
    //        interval: 500

    //        onTriggered: {
    //            parent.x -= 300
    //        }
    //    }

    //    Behavior on x{
    //        NumberAnimation{duration: 1000}
    //    }
    function restart() {
        obstacle.visible = true

    }
}
