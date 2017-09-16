import QtQuick 2.6
import FileIO 1.0


Item {
    id: mainWRoot;

    Rectangle
    {
        id:mainWidget
        width: parent.width
        height: parent.height
        //        anchors.left: parent.left
        //        anchors.leftMargin: 50
        //        anchors.right: parent.right
        //        anchors.rightMargin: 50
        //        anchors.top: parent.top
        //        anchors.topMargin: 5
        //        anchors.bottom: parent.bottom
        //        anchors.bottomMargin: 5
        //var novelText = "";
        property string novelText: "QML 小说阅读器\n\n作者:spygg\n\ngithub:www.github.com/spygg/\n\n"
        FileIO
        {
            id: myFile
            fileName: "/home/spygg/code/qmlTutorial/qmlNovelReader/src/novel/novel.txt"
            onError: console.log(msg)
        }

        Component.onCompleted:
        {
//            while(1)
//            {
//                novelText += myFile.readAWord();

//                if(content.height < content.contentHeight - 200)
//                    break;

//                if(content.truncated)
//                    break;
//                content.text = novelText
//                console.log(content.height , content.contentHeight)
//            }

            //novelText =  myFile.readPage(1);
            //novelText =  myFile.readAll();
            myFile.readAll();
            console.log("mainHeight:" + mainWidget.height)
            console.log(novelText)


        }

        Column
        {
            id: novel
            spacing: 5
            anchors.top: parent.top
            anchors.bottom:parent.bottom
            //anchors.bottomMargin: 50
            anchors.left: parent.left
            anchors.right: parent.right;


            //Title
            Rectangle
            {
                width: parent.width
                height: 16
                Text
                {
                    id: tile
                    font.pointSize: 12
                    text: "小说标题---第一章 风流人物"

                }
            }

            //分割线
            Rectangle
            {
                width: parent.width
                color: "#999"
                height: 1

            }

            //正文
            Rectangle
            {
                width: parent.width
                height: parent.height

                Text
                {
                    id:content
                    width: parent.width
                    height: parent.height
                    //padding: 10
                    font.pointSize: 12

                    minimumPointSize: 5
                    maximumLineCount : (height) / (content.fontInfo.pointSize * 2)
                    text: mainWidget.novelText

                    wrapMode: Text.WordWrap
                    onContentSizeChanged:
                    {
                        console.log("lineCount:" + content.lineCount)
                        console.log("truncated:" + content.truncated)
                        console.log("height:" + content.height)
                        console.log("fontInfo.pointSize:" + content.fontInfo.pointSize + "," + Math.ceil(content.fontInfo.pointSize) )
                        console.log("maximumLineCount:" + maximumLineCount)
                        console.log("contentWidth:" + content.contentWidth)

                        console.log("contentHeight:" + content.contentHeight + "\n")
                        //console.log(text)

                    }


                }

                Rectangle
                {
                    id: bottomRectangle
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    width: parent.width
                    height: 5
                    color: "#333"
                }
            }
        }

        Rectangle
        {
            id:setting
            visible: false
            z: 1

            width: parent.width
            height: parent.height * 0.3
            border.color: "green"
            color: "#EEE"

            anchors.bottom: parent.bottom
            property color textColor: "#000"

            Column
            {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                spacing: 10

                Row
                {
                    spacing: 10
                    anchors.horizontalCenter: parent.horizontalCenter

                    Rectangle
                    {
                        width: 40
                        height: 40
                        radius: 20

                        Text
                        {
                            text: "A-"
                            font.pixelSize: 28
                            color: "green"
                            MouseArea
                            {
                                anchors.fill: parent
                                onClicked:
                                {
                                    content.font.pointSize-= 2
                                    content.text = mainWidget.novelText;
                                    console.log("red")
                                }
                            }
                        }
                    }


                    Rectangle
                    {
                        width: 40
                        height: 40
                        radius: 20

                        Text
                        {
                            text: "A+"
                            font.pixelSize: 28
                            color: "green"
                            MouseArea
                            {
                                anchors.fill: parent

                                onClicked:
                                {
                                    content.font.pointSize+= 2
                                    content.text = mainWidget.novelText;
                                    console.log("red")
                                }
                            }
                        }
                    }

                }

                Row
                {
                    spacing: 10
                    anchors.horizontalCenter: parent.horizontalCenter

                    Rectangle
                    {
                        width: 40
                        height: 40
                        radius: 20
                        color:"red"

                        MouseArea
                        {
                            anchors.fill: parent

                            onClicked:
                            {
                                content.color = parent.color
                                console.log("red")
                            }
                        }
                    }

                    Rectangle
                    {
                        width: 40
                        height: 40
                        radius: 20
                        color:"green"

                        MouseArea
                        {
                            anchors.fill: parent

                            onClicked:
                            {
                                content.color = parent.color
                                console.log("green")
                            }
                        }
                    }

                    Rectangle
                    {
                        width: 40
                        height: 40
                        radius: 20
                        border.color: Qt.lighter("blue")
                        color:"blue"

                        MouseArea
                        {
                            anchors.fill: parent

                            onClicked:
                            {
                                content.color = parent.color
                                console.log("blue")
                            }
                        }
                    }

                    Rectangle
                    {
                        width: 40
                        height: 40
                        radius: 20
                        border.color: Qt.lighter("black")
                        color:"black"

                        MouseArea
                        {
                            anchors.fill: parent

                            onClicked:
                            {
                                content.color = parent.color
                                console.log("blue")
                            }
                        }
                    }

                }
            }
        }


        MouseArea{
            anchors.fill: parent
            onClicked:
            {
                //设置对话框
                if(mouseX > parent.width * 0.2 &&
                        mouseX < parent.width * 0.8)
                {
                    if(mouseY > parent.height * 0.2 &&
                            mouseY < parent.height * 0.8)
                    {
                        setting.visible = !setting.visible
                    }
                }
                else
                {
                    if(setting.visible)
                    {
                        setting.visible = false
                    }
                    else
                    {
                        if(mouseX < parent.width * 0.2)
                        {
                            console.log("prev page")
                        }

                        if(mouseX > parent.width * 0.8)
                        {
                            console.log("next page")
                        }
                    }
                }
            }
        }
    }
}
