import QtQuick 2.0


Item {
    id: obstacle
   property int collision: 0

    property int playerX: 0
    property int playerY: 0
    property int playerW: 0
    property int playerH: 0

    onXChanged: {

        if (obstacle.x + rocket.width >= playerX && obstacle.x <= playerX
         && obstacle.y + rocket.height >= playerY && obstacle.y <= playerY){
                //console.log("Boom")
                collision += 1

      }


    }

    Image {
        id: rocket
        width: 100;   height: 80; rotation: -90
        source: "assets/Obstacles/rocket.png"
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
}
