import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtCharts 2.15
import QtQuick.Layouts 1.0
//import '../highlightcolor.js' as Logic
//import '..highlight.js/lib/core' as Logic
//import ArcGIS.AppFramework.Scripting 1.0
//import Qt5Compat.GraphicalEffects

ApplicationWindow {
    id:root
    width: 1100
    height: 700
    visible: true
    color: "#1F1F20"
    title: qsTr("Kivymd-STudio")

    QtObject{
        objectName: 'backend'
    }

    Connections{
        enabled: true
        ignoreUnknownSignals: false
        target: backend

        function onColorhighlight(value){
            return value
        }

    }

    // Component.onCompleted: {
    //     root.showFullScreen();
    // }

    function verify(lst,word ){
        var found=false
        for (let w of lst){
            if (w==word){
                console.log(w)
                found=true
                break
            }
            else{
                found=false
            }
        }
        console.log(found)
        return found
    }

    function colorify(text) {
        //import hljs from 'highlight.js/lib/core';
        //import python from 'highlight.js/lib/languages/python';
        try {
            Logic.hljs.registerLanguage('python', python);
            return Logic.hljs.highlight(text, { language: "python" });

        } catch (error) {
            console.log(error)
        }
    }
    function high_l(value){
        return value.toHtmlObject
    }

    property color appcolor:"#1F1F20"
    property color barclaire:'#292828'
    property color barfonce:'#18191A'
    property color moyen:'#2E2F30'
    property color bordercolor:'#535353'
    property color hovercolor:'#609EAD96'
    property string emustate:'off'

    Shortcut {
        sequence: "Ctrl+T"
        onActivated: terminal.visible=true
    }
    Shortcut {
        sequence: "Alt+Ctrl+T"
        onActivated: terminal.visible=false
    }
    Shortcut {
        sequence: "Ctrl+N"
        onActivated: {
            console.log('new file')
            fileop.visible=true
        }
    }
    Shortcut {
        sequence: "Alt+O"
        onActivated: console.log('open file')
    }
    Shortcut {
        sequence: "Alt+K"
        onActivated: console.log(' folder new')
    }
    Shortcut {
        sequence: "Alt+K+O"
        onActivated: console.log('open folder')
    }
    Shortcut {
        sequence: "Alt+S"
        onActivated: console.log('save file')
    }
    Shortcut {
        sequence: "Alt+Shift+S"
        onActivated: console.log('save file as')
    }
    
    Rectangle{
        id:leftbar
        width:60
        height:parent.height
        color:'#292828'
        anchors.left: parent.left

        Rectangle{
            width:50
            height:50
            radius:12
            y:30
            color:parent.color
            anchors.horizontalCenter: parent.horizontalCenter

            Image{
                width:25
                height:25
                source:'../assets/icons/loupe.png'
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled:true
                onEntered:{
                    parent.color=hovercolor
                }
                onExited:{
                    parent.color=barclaire
                }
                onClicked:{

                }
            }
        }
        Rectangle{
            width:50
            height:50
            radius:12
            y:90
            color:parent.color
            anchors.horizontalCenter: parent.horizontalCenter

            Image{
                width:25
                height:25
                source:'../assets/icons/fichier.png'
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled:true
                onEntered:{
                    parent.color=hovercolor
                }
                onExited:{
                    parent.color=barclaire
                }
                onClicked:{

                }
            }
            
        }
        Rectangle{
            width:50
            height:50
            radius:12
            y:150
            color:parent.color
            anchors.horizontalCenter: parent.horizontalCenter

            Image{
                width:25
                height:25
                source:'../assets/icons/menu(1).png'
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled:true
                onEntered:{
                    parent.color=hovercolor
                }
                onExited:{
                    parent.color=barclaire
                }
                onClicked:{

                }
            }
            
        }
        Rectangle{
            width:50
            height:50
            radius:12
            y:210
            color:parent.color
            anchors.horizontalCenter: parent.horizontalCenter

            Image{
                width:25
                height:25
                source:'../assets/icons/github(1).png'
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled:true
                onEntered:{
                    parent.color=hovercolor
                }
                onExited:{
                    parent.color=barclaire
                }
                onClicked:{

                }
            }
            
        }
        Rectangle{
            width:50
            height:50
            radius:12
            y:parent.height-110
            color:parent.color
            anchors.horizontalCenter: parent.horizontalCenter

            Image{
                width:35
                height:35
                source:'../assets/icons/coffee4.png'
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled:true
                onEntered:{
                    parent.color=hovercolor
                }
                onExited:{
                    parent.color=barclaire
                }
                onClicked:{

                }
            }
            
        }
        Rectangle{
            width:50
            height:50
            radius:12
            y:parent.height-60
            color:parent.color
            anchors.horizontalCenter: parent.horizontalCenter

            Image{
                width:25
                height:25
                source:'../assets/icons/param.png'
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled:true
                onEntered:{
                    parent.color=hovercolor
                }
                onExited:{
                    parent.color=barclaire
                }
                onClicked:{

                }
            }
            
        }
    }
    Rectangle{
        id:leftbox
        x:leftbar.width
        width:240
        height:parent.height
        color:moyen

        Rectangle{
            width:parent.width
            height:35
            color:moyen
            border.color:bordercolor
            border.width:1
            
            Text{
                y:10
                text:qsTr('Explorer')
                font.pixelSize:12
                color:'white'
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Rectangle{
                id:exphead
                width:20
                height:25
                y:5
                color:parent.color
                radius:10
                anchors.right:parent.right
                anchors.margins: 5
                //anchors.verticalCenter: parent.verticalCenter
                
                Image{
                    width:20
                    height:20
                    source:'../assets/icons/men.png'
                    anchors.centerIn: parent
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled:true
                    onEntered:{
                        exphead.color=hovercolor
                    }
                    onExited:{
                        exphead.color=moyen
                    }
                    onClicked:{
                        opt.visible=true
                    }
                }
            }
        }

        Rectangle{
            id:opt
            x:15
            y:45
            height:45
            color:barfonce
            border.width:1
            border.color:bordercolor
            width:parent.width-15
            Material.elevation:6
            visible:false

            Rectangle{
                width:18
                height:18
                radius:20
                color:barclaire
                anchors.right:parent.right
                anchors.margins:5
                anchors.verticalCenter: parent.verticalCenter

                Text{
                    text:qsTr('×')
                    color:'white'
                    font.pixelSize:12
                    anchors.centerIn: parent
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled:true
                    onEntered:{
                        parent.color=hovercolor
                    }
                    onExited:{
                        parent.color=barfonce
                    }
                    onClicked:{
                        opt.visible=false
                    }
                }
                
            }

            Rectangle{
                width:20
                height:20
                x:10
                radius:8
                color:parent.color
                anchors.verticalCenter: parent.verticalCenter

                Image{
                    width:17
                    height:17
                    source:'../assets/icons/addfile.png'
                    anchors.centerIn: parent
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled:true
                    onEntered:{
                        parent.color=hovercolor
                    }
                    onExited:{
                        parent.color=barfonce
                    }
                    onClicked:{

                    }
                }
            }
            Rectangle{
                width:20
                height:20
                x:40
                radius:8
                color:parent.color
                anchors.verticalCenter: parent.verticalCenter

                Image{
                    width:17
                    height:17
                    source:'../assets/icons/folderadd.png'
                    anchors.centerIn: parent
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled:true
                    onEntered:{
                        parent.color=hovercolor
                    }
                    onExited:{
                        parent.color=barfonce
                    }
                    onClicked:{
                        
                    }
                }
                
            }

            Rectangle{
                width:20
                height:20
                x:70
                radius:8
                color:parent.color
                anchors.verticalCenter: parent.verticalCenter

                Image{
                    width:17
                    height:17
                    source:'../assets/icons/ref.png'
                    anchors.centerIn: parent
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled:true
                    onEntered:{
                        parent.color=hovercolor
                    }
                    onExited:{
                        parent.color=barfonce
                    }
                    onClicked:{
                        
                    }
                }
                
            }
        }
    }
    Rectangle{
        id:top_bar
        x:leftbar.width+leftbox.width
        height:40
        color:barfonce
        width:parent.width-leftbar.width-leftbox.width
        anchors.top:parent.top

        Rectangle{
            width:(parent.width*2/3)-10
            height:parent.height-10
            anchors.left:parent.left
            anchors.margins: 5
            color:parent.color
            anchors.verticalCenter: parent.verticalCenter

            Rectangle{
                anchors.fill: parent
                color:parent.color
                Rectangle{
                    x:10
                    height:parent.height
                    width:70
                    color:parent.color
                    Text{
                        text:'Files'
                        color:'#3B7EAC'
                        font.pixelSize:15
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled:true
                        onClicked:{
                            filesmen.open()
                        }
                        onEntered:{
                            parent.color=hovercolor
                        }
                        onExited:{
                            parent.color=top_bar.color
                        }
                    }
                }
                
                Rectangle{
                    x:90
                    height:parent.height
                    color:parent.color
                    width:70
                    Text{
                        text:'Edition'
                        color:'#3B7EAC'
                        font.pixelSize:15
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled:true
                        onClicked:{
                            editmen.open()
                        }
                        onEntered:{
                            parent.color=hovercolor
                        }
                        onExited:{
                            parent.color=top_bar.color
                        }
                    }
                }

                Rectangle{
                    x:170
                    height:parent.height
                    color:parent.color
                    width:70
                    Text{
                        text:'Terminal'
                        color:'#3B7EAC'
                        font.pixelSize:15
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled:true
                        onClicked:{
                            terminalmen.open()
                        }
                        onEntered:{
                            parent.color=hovercolor
                        }
                        onExited:{
                            parent.color=top_bar.color
                        }
                    }
                }
                Rectangle{
                    x:250
                    height:parent.height
                    color:parent.color
                    width:70
                    Text{
                        text:'Help'
                        color:'#3B7EAC'
                        font.pixelSize:15
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled:true
                        onClicked:{
                            helpmen.open()
                        }
                        onEntered:{
                            parent.color=hovercolor
                        }
                        onExited:{
                            parent.color=top_bar.color
                        }
                    }
                }
            }
        }
        
        Menu{
            id:helpmen
            x:260
            y:top_bar.height
            width:150
            height:100
            background: Rectangle{
                color:barclaire
                border.width:1
                anchors.fill: parent
                border.color:bordercolor
            }
            MenuItem{
                Text{
                    text:'Help'
                    color:'#3B7EAC'
                    font.pixelSize:15
                    x:15
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            MenuItem{
                Text{
                    text:'About'
                    color:'#3B7EAC'
                    font.pixelSize:15
                    x:15
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
        Menu{
            id:terminalmen
            x:180
            y:top_bar.height
            width:250
            height:100
            background: Rectangle{
                color:barclaire
                border.width:1
                anchors.fill: parent
                border.color:bordercolor
            }
            MenuItem{
                Text{
                    text:'New Terminal  Ctrl + t'
                    color:'#3B7EAC'
                    font.pixelSize:15
                    x:15
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            MenuItem{
                Text{
                    text:'Close Terminal  Alt+ Ctrl +t'
                    color:'#3B7EAC'
                    font.pixelSize:15
                    x:15
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
        Menu{
            id:editmen
            x:100
            y:top_bar.height
            width:200
            height:200
            background: Rectangle{
                color:barclaire
                border.width:1
                anchors.fill: parent
                border.color:bordercolor
            }
            MenuItem{
                Text{
                    text:'Copy   Ctrl + C'
                    color:'#3B7EAC'
                    font.pixelSize:15
                    x:15
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            MenuItem{
                Text{
                    text:'Cut    Ctrl + X'
                    color:'#3B7EAC'
                    font.pixelSize:15
                    x:15
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            MenuItem{
                Text{
                    text:'Paste   Ctrl + V'
                    color:'#3B7EAC'
                    font.pixelSize:15
                    x:15
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            MenuItem{
                Text{
                    text:'Redo   Ctrl + R'
                    color:'#3B7EAC'
                    font.pixelSize:15
                    x:15
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            MenuItem{
                Text{
                    text:'Undo   Ctrl + Z'
                    color:'#3B7EAC'
                    font.pixelSize:15
                    x:15
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
        Menu{
            id:filesmen
            x:10
            y:top_bar.height
            // title: string
            // delegate: Component
            // contentModel: model
            width:200
            height:250
            background: Rectangle{
                color:barclaire
                border.width:1
                anchors.fill: parent
                border.color:bordercolor
            }
            MenuItem{
                Text{
                    text:'Open file'
                    color:'#3B7EAC'
                    font.pixelSize:15
                    x:15
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            MenuItem{
                Text{
                    text:'New file'
                    color:'#3B7EAC'
                    font.pixelSize:15
                    x:15
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            MenuItem{
                Text{
                    text:'Open folder'
                    color:'#3B7EAC'
                    font.pixelSize:15
                    x:15
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            MenuItem{
                Text{
                    text:'New folder'
                    color:'#3B7EAC'
                    font.pixelSize:15
                    x:15
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            MenuItem{
                Text{
                    text:'Save file'
                    color:'#3B7EAC'
                    font.pixelSize:15
                    x:15
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            MenuItem{
                Text{
                    text:'Save as'
                    color:'#3B7EAC'
                    font.pixelSize:15
                    x:15
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            
        }

        Rectangle{
            anchors.right:parent.right
            anchors.margins: 15
            height:parent.height-10
            width:parent.width/3
            y:5
            color:parent.color
            Rectangle{
                x:90
                color:parent.color
                height:parent.height
                width:95
                radius:10
                border.color:bordercolor
                border.width:1

                Text{
                    text:'Emulator'
                    color:'#5E6266'
                    font.pixelSize:14
                    x:5
                    anchors.verticalCenter: parent.verticalCenter
                }
                Image{
                    x:68
                    width:22
                    height:22
                    source:'../assets/icons/emu.png'
                    anchors.verticalCenter: parent.verticalCenter
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled:true
                    onEntered:{
                        parent.color=hovercolor
                    }
                    onExited:{
                        parent.color=top_bar.color
                    }
                    onClicked:{
                        if(emmubox.visible==true){
                            emu_off.start()
                            emmubox.visible=false
                            emustate='off'
                        }else{
                            emu_on.start()
                            emmubox.visible=true
                            emustate='on'
                            
                        }
                    }
                }
            }

            Rectangle{
                id:list
                width:30
                height:parent.height-2
                anchors.right:parent.right
                radius:4
                color:parent.color
                border.color:bordercolor
                border.width:1
                anchors.margins: 30
                anchors.verticalCenter: parent.verticalCenter
                Image{
                    source:'../assets/icons/list.png'
                    width:parent.width-5
                    height:parent.height-5
                    anchors.centerIn: parent
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled:true
                    onClicked:{
                        avd.open()
                    }
                    onEntered:{
                        parent.color=hovercolor
                    }
                    onExited:{
                        parent.color=top_bar.color
                    }
                }
                
            }
            Menu{
                id:avd
                y:top_bar.height
                width:200
                height:250
                x:list.x
                //anchors.right:parent.right
                //anchors.margins: 15
                
                background:Rectangle{
                    anchors.fill: parent
                    color:barclaire
                }
                MenuItem{
                    Text{
                        text:'Android 11'
                        color:'#3B7EAC'
                        font.pixelSize:15
                        x:15
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                MenuItem{
                    Text{
                        text:'Android 10  '
                        color:'#3B7EAC'
                        font.pixelSize:15
                        x:15
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                MenuItem{
                    Text{
                        text:'Android 9'
                        color:'#3B7EAC'
                        font.pixelSize:15
                        x:15
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                MenuItem{
                    Text{
                        text:'Iphone 12'
                        color:'#3B7EAC'
                        font.pixelSize:15
                        x:15
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                MenuItem{
                    Text{
                        text:'Iphone 11'
                        color:'#3B7EAC'
                        font.pixelSize:15
                        x:15
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                MenuItem{
                    Text{
                        text:'Iphone 7'
                        color:'#3B7EAC'
                        font.pixelSize:15
                        x:15
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }
    }
    Rectangle{
        id:body
        y:top_bar.height
        color:appcolor
        x:leftbar.width+leftbox.width
        height:parent.height-top_bar.height
        width:parent.width-(leftbar.width+leftbox.width)

        
        TabView{
            id:codetab
            anchors.fill: parent
            style: TabViewStyle {
                frameOverlap: 1
                tab: Rectangle {
                    color: styleData.selected ? barfonce :barclaire
                    border.color:  barclaire
                    implicitWidth: Math.max(text.width + 15, 120)
                    implicitHeight: 20
                    width:120
                    height:40
                    radius: 2
                    

                    Image{
                        id:fileimage
                        height:20
                        width:20
                        x:8
                        y:10
                        source: '' 
                    }

                    Component.onCompleted:{
                        var ext=styleData.title.substr(-3,3)
                        console.log(ext)
                        if (ext=='.kv'){
                            fileimage.source='../assets/images/kivy.png'
                        }
                        else if(ext=='.py'){
                            fileimage.source='../assets/images/py.png'
                        }else if(ext=='ome'){
                            fileimage.source='../assets/images/coding.png'
                        }
                    }

                    Text {
                        id: text
                        anchors.centerIn: parent
                        text: styleData.title
                        font.pixelSize:12
                        color: styleData.selected ? "white" : '#A4A5A7'
                    }

                    Rectangle{
                        anchors.right:parent.right
                        anchors.margins: 8
                        y:10
                        width:15
                        height:15
                        radius:3
                        color:barfonce

                        Text{
                            text:qsTr('×')
                            font.pixelSize:13
                            color:'white'
                            anchors.centerIn: parent
                        }
                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled:true
                            onEntered:{
                                parent.color=hovercolor
                            }
                            onExited:{
                                parent.color=barfonce
                            }
                            onClicked:{
                                codetab.remove(codetab.currentIndex)
                            }
                        }
                    }
                    Rectangle{
                        width:1
                        color:'#0A0A0A'
                        height:parent.height
                        anchors.right:parent.right
                    }
                }
                frame: Rectangle { color: root.color }
                tabsMovable: true
            }
            
            Tab{
                title: 'Wellcome'
                active: true
                //asynchronous: bool
                Rectangle{
                    color:body.color
                    anchors.fill: parent

                    Text{
                        id:weltext
                        text:qsTr('Wellcome To Kivymd Studio')
                        //font.bold:true
                        color:'#C6D6DF'
                        font.pixelSize:48
                        y:parent.height/5
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                    }

                    DeviceBox{
                        id:android
                        src:'../assets/images/android.png'
                        name:'Android'
                        text_color:weltext.color
                        rect_height:linux.rect_height
                        rect_width:linux.rect_width
                        anchors.left:parent.left
                        anchors.margins: 80
                        y:linux.y
                        back:parent.color
                    }
                    
                    DeviceBox{
                        id:ios
                        src:'../assets/images/apple.png'
                        name:'IOs X'
                        text_color:weltext.color
                        rect_height:linux.rect_height
                        rect_width:linux.rect_width
                        anchors.left:parent.left
                        anchors.margins: android.rect_width+120
                        back:parent.color
                        y:linux.y
                    }

                    DeviceBox{
                        id:win10
                        src:'../assets/images/win10.png'
                        name:'Windows'
                        text_color:weltext.color
                        rect_height:linux.rect_height
                        rect_width:linux.rect_width
                        anchors.horizontalCenter: parent.horizontalCenter
                        back:parent.color
                        y:linux.y
                    }

                    DeviceBox{
                        id:macos
                        src:'../assets/images/mac.png'
                        name:'Mac Os'
                        text_color:weltext.color
                        rect_height:linux.rect_height
                        rect_width:linux.rect_width
                        anchors.right:parent.right
                        anchors.margins: linux.rect_width+120
                        back:parent.color
                        y:linux.y
                    }
                    
                    DeviceBox{
                        id:linux
                        src:'../assets/images/linux.png'
                        name:'Linux'
                        text_color:weltext.color
                        rect_height:(parent.height/4)-10
                        rect_width:(parent.width/5)-30
                        anchors.right:parent.right
                        anchors.margins: 80
                        back:parent.color
                        y:weltext.height+weltext.y+10
                        
                    }
                    Rectangle{
                        y:weltext.height+50+170
                        width:parent.width
                        color:parent.color
                        height:(parent.height/3)+50
                        anchors.bottom:parent.bottom
                        anchors.margins: 20
                        

                        Rectangle{
                            id:recents
                            //x:parent.width/5
                            // y:weltext.height+90+170
                            border.width:1
                            border.color:bordercolor
                            width:(parent.width/3)+30
                            height:parent.height-10
                            color:barfonce
                            anchors.left:parent.left
                            anchors.margins: 90
                            anchors.verticalCenter: parent.verticalCenter
                            
                        }

                        Rectangle{
                            id:racourscis
                            //x:(parent.width/5)+recents.width+100
                            //y:recents.y
                            width:(parent.width/3)+30
                            height:parent.height-10
                            color:parent.color
                            anchors.right:parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.margins: 80

                            Rectangle{
                                width:parent.width
                                height:30
                                y:40
                                color:parent.color
                                Text{
                                    x:50
                                    text:qsTr('New file')
                                    color:'#1F4283'
                                    font.pixelSize:15
                                    font.italic:true
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Butts{
                                    x:140
                                    back_color:parent.color
                                    text_color:'#9B9FA5'
                                    butt_text:'crtl'
                                    //anchors.verticalCenter: parent.verticalCenter
                                }
                                Text{
                                    x:190
                                    text:'+'
                                    color:'#9B9FA5'
                                    font.pixelSize:14
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Butts{
                                    x:210
                                    back_color:parent.color
                                    text_color:'#9B9FA5'
                                    butt_text:'N'
                                    //anchors.verticalCenter: parent.verticalCenter
                                }
                            }

                            Rectangle{
                                width:parent.width
                                height:30
                                y:80
                                color:parent.color
                                Text{
                                    x:50
                                    text:qsTr('New folder')
                                    color:'#1F4283'
                                    font.pixelSize:15
                                    font.italic:true
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Butts{
                                    x:140
                                    back_color:parent.color
                                    text_color:'#9B9FA5'
                                    butt_text:'crtl'
                                    //anchors.verticalCenter: parent.verticalCenter
                                }
                                Text{
                                    x:190
                                    text:'+'
                                    color:'#9B9FA5'
                                    font.pixelSize:14
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Butts{
                                    x:210
                                    back_color:parent.color
                                    text_color:'#9B9FA5'
                                    butt_text:'K'
                                    //anchors.verticalCenter: parent.verticalCenter
                                }
                            }

                            Rectangle{
                                width:parent.width
                                height:30
                                y:120
                                color:parent.color
                                Text{
                                    x:50
                                    text:qsTr('Open folder')
                                    color:'#1F4283'
                                    font.pixelSize:15
                                    font.italic:true
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Butts{
                                    x:140
                                    back_color:parent.color
                                    text_color:'#9B9FA5'
                                    butt_text:'crtl'
                                    //anchors.verticalCenter: parent.verticalCenter
                                }
                                Text{
                                    x:190
                                    text:'+'
                                    color:'#9B9FA5'
                                    font.pixelSize:14
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Butts{
                                    x:210
                                    back_color:parent.color
                                    text_color:'#9B9FA5'
                                    butt_text:'N'
                                    //anchors.verticalCenter: parent.verticalCenter
                                }
                                Text{
                                    x:240
                                    text:'+'
                                    color:'#9B9FA5'
                                    font.pixelSize:14
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Butts{
                                    x:255
                                    back_color:parent.color
                                    text_color:'#9B9FA5'
                                    butt_text:'O'
                                    //anchors.verticalCenter: parent.verticalCenter
                                }
                            }

                            Rectangle{
                                width:parent.width
                                height:30
                                y:160
                                color:parent.color
                                Text{
                                    x:50
                                    text:qsTr('Open file')
                                    color:'#1F4283'
                                    font.pixelSize:15
                                    font.italic:true
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Butts{
                                    x:140
                                    back_color:parent.color
                                    text_color:'#9B9FA5'
                                    butt_text:'crtl'
                                    //anchors.verticalCenter: parent.verticalCenter
                                }
                                Text{
                                    x:190
                                    text:'+'
                                    color:'#9B9FA5'
                                    font.pixelSize:14
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Butts{
                                    x:210
                                    back_color:parent.color
                                    text_color:'#9B9FA5'
                                    butt_text:'O'
                                    //anchors.verticalCenter: parent.verticalCenter
                                }
                            }


                        }
                    }

                    Rectangle{
                        width:90
                        height:50
                        anchors.bottom:parent.bottom
                        anchors.right:parent.right
                        color:parent.color
                        anchors.margins: 2
                        
                        Image{
                            anchors.fill: parent
                            source:'../assets/icons/DotPy.png'
                        }
                    }

                    
                }
                
            }
            Tab{
                title: 'main.py'
                active: true
                //asynchronous: bool
                Rectangle{
                    color:body.color
                    anchors.fill: parent

                    Rectangle{
                        color:parent.color
                        width:parent.width
                        height:parent.height
                        //x:60

                        CodeEditor{
                            compcolor:barclaire
                            edit_height:parent.height-20
                            edit_width:parent.width-20
                            anchors.fill: parent
                        }
                    }
                }
            }

            Tab{
                title: 'main.kv'
                active: true
                //asynchronous: bool
                Rectangle{
                    color:body.color
                    anchors.fill: parent
                    
                    CodeEditor{
                        compcolor:barclaire
                        edit_height:parent.height-20
                        edit_width:parent.width-20
                        anchors.fill: parent
                    }
                    
                }
            }
        }
    }
    Rectangle{
        id:terminal
        height:290
        color:barclaire
        x:leftbar.width+leftbox.width
        width:parent.width-(leftbar.width+leftbox.width)
        border.color:bordercolor
        border.width:1
        anchors.bottom:parent.bottom
        visible:false

        Rectangle{
            id:terferm
            width:30
            height:30
            radius:6
            color:parent.color
            anchors.top:parent.top
            anchors.right:parent.right
            anchors.margins: 15
            
            Text{
                anchors.centerIn: parent
                font.pixelSize:16
                color:'white'
                text:qsTr('×')
            }
        }

        Rectangle{
            width:30
            height:30
            //anchors.top:parent.top
            y:terferm.y
            radius:6
            color:parent.color
            anchors.right:parent.right
            anchors.margins: 45
            
            Text{
                anchors.centerIn: parent
                font.pixelSize:16
                color:'white'
                text:qsTr('^')
            }
        }
    }

    NumberAnimation{
        id:emu_off
        from: emmubox.x
        to: root.width
        duration: 200
        property: 'x'
        target:emmubox
       
    }
    NumberAnimation{
        id:emu_on
        from: root.width
        to: emmubox.x
        duration: 200
        property: 'x'
        target:emmubox
       
    }

    Rectangle{
        id:emmubox
        width:350
        z:10
        x:root.width
        y:top_bar.height
        height:parent.height-top_bar.height
        color:barclaire
        border.color:bordercolor
        border.width:1
        anchors.right:parent.right
        visible:false

        Rectangle{
            width:parent.width-40
            anchors.top:parent.top
            height:45
            border.width:1
            border.color:bordercolor
            color:parent.color
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle{
                height:parent.height-10
                width:35
                radius:7
                color:parent.color
                x:20
                anchors.verticalCenter: parent.verticalCenter
                
                Image{
                    height:20
                    width:20
                    anchors.centerIn: parent
                    source:'../assets/icons/run.png'
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled:true
                    onEntered:{
                        parent.color=hovercolor
                    }
                    onExited:{
                        parent.color=barclaire
                    }
                    onClicked:{

                    }
                }
            }
            Rectangle{
                height:parent.height-10
                width:35
                radius:7
                color:parent.color
                x:90
                anchors.verticalCenter: parent.verticalCenter
                
                Image{
                    height:20
                    width:20
                    anchors.centerIn: parent
                    source:'../assets/icons/ref.png'
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled:true
                    onEntered:{
                        parent.color=hovercolor
                    }
                    onExited:{
                        parent.color=barclaire
                    }
                    onClicked:{
                        
                    }
                }
            }
            Rectangle{
                height:parent.height-10
                width:35
                radius:7
                color:parent.color
                x:160
                anchors.verticalCenter: parent.verticalCenter
                
                Image{
                    height:20
                    width:20
                    anchors.centerIn: parent
                    source:'../assets/icons/hide.png'
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled:true
                    onEntered:{
                        parent.color=hovercolor
                    }
                    onExited:{
                        parent.color=barclaire
                    }
                    onClicked:{
                        emmubox.visible=false
                    }
                }
            }
                
            Rectangle{
                height:parent.height-10
                width:35
                radius:7
                color:parent.color
                x:230
                anchors.verticalCenter: parent.verticalCenter
                
                Image{
                    height:20
                    width:20
                    anchors.centerIn: parent
                    source:'../assets/icons/deco.png'
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled:true
                    onEntered:{
                        parent.color=hovercolor
                    }
                    onExited:{
                        parent.color=barclaire
                    }
                    onClicked:{
                        
                    }
                }
            }
        }
        
        Rectangle{
            width:350-20
            height:parent.height-47
            y:46
            color:parent.color
            anchors.horizontalCenter: parent.horizontalCenter

            Image{
                width:parent.width
                height:parent.height
                source:'../assets/images/em.png'
            }
        }
    }

    Component{
        id:codebox
        Rectangle{
            color:root.color
            CodeEditor{
                compcolor:barclaire
                edit_height:parent.height-20
                edit_width:parent.width-20
                anchors.fill: parent
            }
        }
    }

    FileOpenDialog{
        id:fileop
        anchors.centerIn: parent
        visible:false
        theme_color:barclaire
        border_color:bordercolor
        Keys.onReturnPressed:{
            visible=false
            codetab.addTab(fileop.get_filename,codebox)
        }
    }

}