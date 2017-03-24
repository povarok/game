import QtQuick 2.5
import QtQuick.Window 2.2

Window {

    id: game
    visible: true
    width: 1600
    height: 600
    title: qsTr("Run2.0")
    property bool initialized: false

    Background{}

    Player{
    x:game.width/2
    y: game.height/2
    width: 50
    height: 50
    maxY: game.height - height
    }


}
