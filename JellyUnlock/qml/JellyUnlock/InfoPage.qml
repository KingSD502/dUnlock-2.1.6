import QtQuick 1.1
import com.nokia.symbian 1.1
Page{
    signal back;
    Rectangle {
        id: background
        x: 0
        y: 0
        width: 640
        height: 640
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#051407"
            }
            GradientStop {
                position: 0.25
                color: "#071b0b"
            }
            GradientStop {
                position: 0.37
                color: "#0a260f"
            }
            GradientStop {
                position: 0.50
                color: "#0e3313"
            }
            GradientStop {
                position: 0.62
                color: "#124219"
            }
            GradientStop {
                position: 0.75
                color: "#154f1e"
            }
            GradientStop {
                position: 0.87
                color: "#185a22"
            }
            GradientStop {
                position: 1
                color: "#1c6827"
            }
        }
    }

    StatusBar {
        id: statusBar
        y:0
        x:0
    }
    ToolBar {
        id: toolBar
        anchors.bottom: parent.bottom
        tools:
            ToolBarLayout {
                property bool itemsEnabled

                ToolButton {
                    platformInverted: window.platformInverted
                    flat: true
                    iconSource: "toolbar-back.png"
                    onClicked: {back();}
                }

                ButtonRow {
                    checkedButton: list1
                    ToolButton {
                        id: list
                        platformInverted: window.platformInverted
                        text: strings[134]
                        enabled: itemsEnabled
                        onClicked: {back();}
                    }
                    ToolButton {
                        id: list1
                        platformInverted: window.platformInverted
                        text: strings[135]
                        enabled: itemsEnabled
                    }
                }

                ToolButton {
                    platformInverted: window.platformInverted
                    iconSource: "toolbar-menu.png"
                     onClicked: menu.open()
                }
            }


    }
    Component.onCompleted: application.HideSplash();
}
