import QtQuick 1.1
import com.nokia.symbian 1.1

Page{
    Rectangle {
        id: background
        x: 0
        y: 0
        width: 640
        height: 640
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#002928"
            }
            GradientStop {
                position: 0.25
                color: "#003e3d"
            }
            GradientStop {
                position: 0.37
                color: "#004d4c"
            }
            GradientStop {
                position: 0.50
                color: "#005e5d"
            }
            GradientStop {
                position: 0.62
                color: "#006f6e"
            }
            GradientStop {
                position: 0.75
                color: "#008381"
            }
            GradientStop {
                position: 0.87
                color: "#009291"
            }
            GradientStop {
                position: 1
                color: "#00a2a0"
            }
        }
    }
    anchors.fill: parent;
    signal about;
    signal updatePage;
    signal back;


    Connections{
        target:application
        onAppWorkChanged:{work.checked=newstate;}
        onAutostartChanged:{autostart.checked=newstate;}
        onPictureChanged:{pic.subTitle=newpic;}
        onZoomChanged:{zooms.selectedIndex=newstate;zoom.subTitle=zooms.model[newstate];}
        onOrientationChanged:{orients.selectedIndex=newstate;orient.subTitle=orients.model[newstate];}
        onUseWallpaperChanged:{usewallpaper.checked=newstate;}
        //onUseSystemFontChanged:{systemfont.checked=newstate;}
        onVibrationChanged:{vibration.checked=newstate;}
        onHidePlayerChanged:{hideplayerafterclosing.checked=newstate;} //В блокировщике обрабатывается как settings[11] (зтеменение обоев)
        //onHideClockBgChanged:{hideclockbg.checked=newstate;} //В блокировщике обрабатывается как settings[13] (подложка часов)
        //onHideDateBgChanged:{hidedatebg.checked=newstate;} //В блокировщике обрабатывается как settings[14] (подложка плеера)
        //onColorFontChanged:{colorfont.checked=newstate;} //В блокировщике обрабатывается как settings[17] (цвет шрифта часов)
        onWhiteThemeChanged:{
            toolBar.platformInverted=newstate;
            menu.platformInverted=newstate;}
        }
    QueryDialog{
        id:killdialog;
        message:strings[24]
        titleText: strings[25]
        acceptButtonText: "OK"
        rejectButtonText: strings[45];
        onAccepted:{
            application.KillAnotherLockScreens();
        }
        Component.onCompleted: {
            console.log(lockscreens);
            if (lockscreens>0) killdialog.open();
        }
    }

    // define a tab bar with three buttons and link them to the content
         TabBar {
             id: tabBar
             platformInverted: toolBar.platformInverted
             anchors { left: parent.left; right: parent.right; top: parent.top }
             TabButton { tab: tab1content; text: strings[166]; platformInverted: toolBar.platformInverted}
             TabButton { tab: tab2content; text: strings[167]; platformInverted: toolBar.platformInverted}
             //TabButton { tab: tab3content; text: strings[168] }
         }

         // define a blank tab group so we can add the pages of content later
         TabGroup {
             id: tabGroup
             anchors { left: parent.left; right: parent.right; top: tabBar.bottom; bottom: parent.bottom }

             // define the content for tab 1
             Page {
                 id: tab1content
                 Flickable {
                     id: flickArea
                     anchors.fill: parent
                     anchors.top: statusBar.bottom;
                     anchors.bottom: toolBar.top;
                     anchors.left: parent.left;
                     anchors.right: parent.right
                     contentWidth: parent.width; contentHeight: c.height
                     flickableDirection: Flickable.VerticalFlick
                     clip: true
                 Column{
                     spacing: 3;
                     id:c;
                     anchors.right: parent.right
                     anchors.left: parent.left
                     Image {
                         anchors.horizontalCenter: parent.horizontalCenter
                         id: logo1
                         source: "image/SetingsPage.png"
                     }
                         Row{
                             id:r1;
                             anchors.left: parent.left
                             anchors.right: parent.right
                             anchors.leftMargin: 25;
                             anchors.rightMargin: 22;
                             Text{
                                 text: strings[20]
                                 color:"white"
                                 font.pixelSize: 20
                                 anchors.verticalCenter: work.verticalCenter
                             }
                             Switch{
                                 id: work;
                                 onCheckedChanged:{application.ChangeSetting("appwork",checked);}
                                 anchors.right: parent.right
                             }
                         }
                         Row{
                             id:r2;
                             anchors.left: parent.left
                             anchors.right: parent.right
                             anchors.leftMargin: 25;
                             anchors.rightMargin: 22;

                             Text{
                                 text: strings[21]
                                 color:"white"
                                 anchors.verticalCenter: autostart.verticalCenter
                                 font.pixelSize: 20
                             }
                             Switch{
                                 id: autostart;
                                 onCheckedChanged:{application.ChangeSetting("autostart",checked);}
                                 //height:key.height-10;
                                 anchors.right: parent.right
                             }
                         }
                         /*Row{
                             id:r7;
                             anchors.left: parent.left
                             anchors.right: parent.right
                             anchors.leftMargin: 25;
                             anchors.rightMargin: 22;
                             Text{
                                 text: strings[37]
                                 color:"white"
                                 font.pixelSize: 20
                                 wrapMode: Text.WordWrap
                                 anchors.left: parent.left
                                 anchors.right: systemfont.left
                                 anchors.verticalCenter: systemfont.verticalCenter
                             }
                             Switch{
                                 id:systemfont;
                                 onCheckedChanged:{application.ChangeSetting("zusesystemfont",checked);}
                                 anchors.right: parent.right
                             }
                         }*/

                         Row{
                             id:r6;
                             anchors.left: parent.left
                             anchors.right: parent.right
                             anchors.leftMargin: 25;
                             anchors.rightMargin: 22;
                             Text{
                                 text: strings[35]
                                 color:"white"
                                 font.pixelSize: 20
                                 wrapMode: Text.WordWrap
                                 anchors.left: parent.left
                                 anchors.right: usewallpaper.left
                                 anchors.verticalCenter: usewallpaper.verticalCenter
                             }
                             Switch{
                                 id: usewallpaper;
                                 onCheckedChanged:{application.ChangeSetting("zusewallpaper",checked);}
                                 anchors.right: parent.right
                             }
                      }
                         //Вот переключатель Затемнения, прописан он как zzzhideplayer (это в конфиге)
                         //В блокировщике прописывай как settings[11]==0
                         Row{
                             id:r8;
                             anchors.left: parent.left
                             anchors.right: parent.right
                             anchors.leftMargin: 25;
                             anchors.rightMargin: 22;
                             Text{
                                 text: strings[169]
                                 color:"white"
                                 font.pixelSize: 20
                                 anchors.left: parent.left
                                 anchors.verticalCenter: hideplayerafterclosing.verticalCenter
                             }
                             Switch{
                                 id: hideplayerafterclosing;
                                 onCheckedChanged:{application.ChangeSetting("zzzhideplayer",checked);}
                                 anchors.right: parent.right
                             }
                      }
                         Row{
                             id:r3;
                             anchors.left: parent.left
                             anchors.right: parent.right
                             anchors.leftMargin: 25;
                             anchors.rightMargin: 22;
                             Text{
                                 text: strings[226]
                                 color:"white"
                                 font.pixelSize: 20
                                 anchors.left: parent.left
                                 anchors.verticalCenter: vibration.verticalCenter
                             }
                             Switch{
                                 id: vibration;
                                 onCheckedChanged:{application.ChangeSetting("zzzzzzzzzzzzvibratio",checked);}
                                 anchors.right: parent.right
                             }
                      }
                }
           }
        }

             // define the content for tab 2
             Page {
                 id: tab2content
                 Flickable {
                     id: flickArea1
                     anchors.fill: parent
                     anchors.top: statusBar.bottom;
                     anchors.bottom: toolBar.top;
                     anchors.left: parent.left;
                     anchors.right: parent.right
                     contentWidth: parent.width; contentHeight: c1.height
                     flickableDirection: Flickable.VerticalFlick
                     clip: true
                 Column {
                     spacing: 3;
                     id:c1;
                     anchors.right: parent.right
                     anchors.left: parent.left
                     Image {
                         anchors.horizontalCenter: parent.horizontalCenter
                         id: logo2
                         source: "image/SetingsPage.png"
                     }
                 SelectionListItem {
                     id: pic
                     platformInverted: toolBar.platformInverted
                     anchors.left: parent.left
                     anchors.right: parent.right
                     anchors.leftMargin: 15;
                     anchors.rightMargin: 5;
                     title: strings[22]

                     onClicked: {application.EditPic();}
                     height:usewallpaper.checked?0:zoom.height;
                     visible:!usewallpaper.checked
                 }
                 SelectionListItem {
                     id: zoom
                     platformInverted: toolBar.platformInverted
                     anchors.left: parent.left
                     anchors.right: parent.right
                     anchors.leftMargin: 15;
                     anchors.rightMargin: 5;
                     title: strings[31]
                     subTitle: zooms.model[zooms.selectedIndex]
                     onClicked: {zooms.open();}
                     SelectionDialog {
                         id: zooms
                         platformInverted: toolBar.platformInverted
                         titleText: strings[31]
                         model: zoomlist
                         selectedIndex:0
                         onSelectedIndexChanged: {zoom.subTitle=zooms.model[zooms.selectedIndex];application.ChangeSetting("zoom",selectedIndex);}
                     }

                 }
                 /*SelectionListItem {
                     id: orient
                     anchors.left: parent.left
                     anchors.right: parent.right
                     anchors.leftMargin: 15;
                     anchors.rightMargin: 5;
                     title: strings[58]
                     subTitle: orients.model[orients.selectedIndex]
                     onClicked: {orients.open();}
                     SelectionDialog {
                         id: orients
                         titleText: strings[58]
                         model: orientlist
                         selectedIndex:0
                         onSelectedIndexChanged: {orient.subTitle=orients.model[orients.selectedIndex];application.ChangeSetting("zzorientation",selectedIndex);}
                     }

                 }*/
                     SelectionListItem {
                         id: key
                         platformInverted: toolBar.platformInverted
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[26]
                         //subTitle: keys.model[keys.selectedIndex]
                         onClicked: {keys.open();}
                         Component.onCompleted: getSubTitle();
                         function getSubTitle(index){
                             var len=application.keysLen();
                             if (len==0) key.subTitle=strings[27];
                             else key.subTitle=len+strings[28];
                             console.log("len:"+keyslist.length);
                         }
                         Component {
                             id: del
                             MyItem{
                                 text: modelData
                                 selected: application.isKeyChecked(index)
                                 onClicked: {
                                     selected=!selected;
                                     application.checkKey(index,selected);
                                     key.getSubTitle();
                                 }
                             }
                         }
                         SelectionDialog {
                             //height: (privateStyle.menuItemHeight)*keyslist.length;
                             Component.onCompleted: {content[0].height=privateStyle.menuItemHeight*4.6;}
                             id: keys
                             platformInverted: toolBar.platformInverted
                             delegate: del
                             titleText: strings[26]
                             selectedIndex: 0
                             model: keyslist
                             onRejected:application.ChangeSetting("","");
                             onClickedOutside:application.ChangeSetting("","");
                             }

                         }
                       }
                     }
                 }


    }
         QueryDialog{
             id: informationDialog

             platformInverted: toolBar.platformInverted

             titleText: "Справка по туглу СтатусБар"
             icon: "image/note_info.svg"
             message: strings[170]

             acceptButtonText: "Ok"
         }

    Menu {
        id: menu

        platformInverted: menu.platformInverted

        MenuLayout {

            MenuItem {
                platformInverted: menu.platformInverted
                text: strings[171]
                onClicked: {back();}
            }

            MenuItem {
                platformInverted: menu.platformInverted
                text: strings[172]
                onClicked: {Qt.quit();}
            }

        }
   }
    Image {
        id: statusBar
        opacity: 0
    }
    ToolBar {
        id: toolBar
        anchors.bottom: parent.bottom
        tools: ToolBarLayout {
            id: toolBarLayout
            ToolButton {

                flat: true
                id:backbtn;
                platformInverted: toolBar.platformInverted
                iconSource: "toolbar-back.png"
                onClicked: {back();}
            }
            ToolButton {
                flat: true
                iconSource: "image/ovi.png"
                onClicked: {Qt.openUrlExternally("http://store.ovi.com/publisher/Alexander+Fokin/");}
            }
            ToolButton {
                flat: true
                iconSource: "image/VK1.png"
                onClicked: {Qt.openUrlExternally("http://vk.com/symbian_zone/");}
        }
            ToolButton {
                flat: true
                id:aboutbtn;
                iconSource: "toolbar-menu.png"
                platformInverted: toolBar.platformInverted
                onClicked: menu.open()
            }
                        }
    }
    Component.onCompleted: application.HideSplash();
}
