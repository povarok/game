import QtQuick 2.5
import QtQuick.Window 2.2

Window {

    id: game
    visible: true
    width: 1600
    height: 600
    title: qsTr("SokolovDS")
    property bool initialized: false

    Background{}

    Player{
    x:game.width/10
    y: game.height - game.height/10
    width: 60
    height: 50
    maxY: game.height - height
    }


}
