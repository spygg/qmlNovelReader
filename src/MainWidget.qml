import QtQuick 2.6
import FileIO 1.0


Item {
    id: mainWRoot;

    anchors.left: parent.left
    anchors.leftMargin: 5
    anchors.right: parent.right
    anchors.rightMargin: 5

    Rectangle{
        id:mainWidget
        width: parent.width
        height: parent.height

        FileIO {
            id: myFile
            source: "./novels/0.txt"
            onError: console.log(msg)
        }

        Component.onCompleted: {
            //console.log( "WRITE"+ myFile.write("TEST TEST file is OK"));
            content.text =  myFile.readPage(1);
            console.log("mainHeight:" + mainWidget.height)

        }

        Column{
            id: novel
            spacing: 5
            anchors.top: parent.top
            anchors.bottom:parent.bottom
            anchors.left: parent.left
//            anchors.verticalCenter: parent.verticalCenter;
            anchors.right: parent.right;
            anchors.rightMargin: 5;


            Text{
                id: tile
                width: parent.width
                height: 20
                font.pointSize : 12
                text: "小说标题---第一章 风流人物"

            }

            //分割线
            Rectangle{
                width: parent.width
                color: "#999"
                height: 1

            }


            Rectangle{
                width: parent.width
                height: parent.height


                Text{
                    id:content
                    width: parent.width
                    height: parent.height
                    font.pointSize : 16
                    minimumPointSize: 5
                    maximumLineCount : 17
                    text: "一二三四五六七八九十"


                    bottomPadding:5
                    wrapMode: Text.WordWrap
                    onContentSizeChanged: {
                        console.log("lineCount:" + content.lineCount)
                        console.log("truncated:" + content.truncated)
                        console.log("height:" + content.height)
                        console.log("fontInfo.pointSize:" + content.fontInfo.pointSize)
                        console.log("contentWidth:" + content.contentWidth)

                        console.log("contentHeight:" + content.contentHeight + "\n")


                    }

                }



            }
        }

        Rectangle{
            id:setting
            visible: false
            z: 1

            width: parent.width
            height: parent.height * 0.3
            border.color: "green"
            color: "#EEE"

            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

            property color textColor: "#000"

            Column{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                spacing: 10


                Row{
                    spacing: 10
                    anchors.horizontalCenter: parent.horizontalCenter

                    Rectangle{
                        width: 40
                        height: 40
                        radius: 20

                        Text{
                            text: "A-"
                            font.pixelSize: 28
                            color: "green"

                            MouseArea{
                                anchors.fill: parent

                                onClicked:{
                                    content.font.pointSize -= 1
                                    console.log("red")
                                }
                            }
                        }
                    }


                    Rectangle{
                        width: 40
                        height: 40
                        radius: 20

                        Text{
                            text: "A+"
                            font.pixelSize: 28
                            color: "green"

                            MouseArea{
                                anchors.fill: parent

                                onClicked:{
                                    content.font.pointSize += 1
                                    console.log("red")
                                }
                            }
                        }
                    }

                }

                Row{
                    spacing: 10

                    anchors.horizontalCenter: parent.horizontalCenter

                    Rectangle{
                        width: 40
                        height: 40
                        radius: 20
                        color:"red"

                        MouseArea{
                            anchors.fill: parent

                            onClicked:{
                                content.color = parent.color
                                console.log("red")
                            }
                        }
                    }

                    Rectangle{
                        width: 40
                        height: 40
                        radius: 20
                        color:"green"

                        MouseArea{
                            anchors.fill: parent

                            onClicked:{
                                content.color = parent.color
                                console.log("green")
                            }
                        }
                    }

                    Rectangle{
                        width: 40
                        height: 40
                        radius: 20
                        border.color: Qt.lighter("blue")
                        color:"blue"

                        //active:	setting.textColor	==	color
                        MouseArea{
                            anchors.fill: parent

                            onClicked:{
                                content.color = parent.color
                                console.log("blue")
                            }
                        }
                    }

                    Rectangle{
                        width: 40
                        height: 40
                        radius: 20
                        border.color: Qt.lighter("black")
                        color:"black"

                        //active:	setting.textColor	==	color
                        MouseArea{
                            anchors.fill: parent

                            onClicked:{
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
            onClicked: {

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
