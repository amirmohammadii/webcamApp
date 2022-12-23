import QtQuick 2.14
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.2
import QtQuick.Controls.Material 2.1
import QtMultimedia 5.12
import QtQuick.Templates 2.3 as T
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.2


Item {
    property int  font_size: 18
    property int  soft_margin: 2
    property string  font_name: "Ubuntu"
    property string text_color: "#1F1F1F"
    property string bg_color: "lightgray"
    property string txt_whiteBalanceMode: "Camera.WhiteBalanceTungsten"
    property string txt_color_filter: "CameraImageProcessing.ColorFilterNone"
    property string path : bridge.imagesPath
    width: 1360
    height: 700
    RowLayout
    {
        id: main_row_layout
        anchors.fill: parent
        Rectangle{
            id: rec_setting
            width: 350
            Layout.fillHeight: true
            color: bg_color
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.margins: soft_margin

            Text {
                id: lbl_setting
                text: qsTr("<b>SETTINGS<b>")
                font.family: font_name
                font.pixelSize: font_size
                color: text_color
                anchors.horizontalCenter: parent.horizontalCenter
                padding: 10
            }

            ColumnLayout
            {
                id: col_settings
                width: parent.width
                anchors.top: lbl_setting.bottom

                RowLayout{
                    id: row_brightness
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    Layout.topMargin: 20

                    Text {
                        id: lbl_brightness
                        Layout.fillWidth: true
                        text: qsTr("Brightness")
                        color: text_color
                    }
                    Slider {
                        id: sld_brightness
                        Layout.fillWidth: true
                        from: -1.0
                        value: -0.4
                        to: 1.0
                        snapMode: Slider.SnapAlways
                        stepSize: 0.1
                    }
                    Text {
                        id: lbl_brightenss_value
                        text: sld_brightness.value.toFixed(1)
                        Layout.alignment: Qt.AlignRight
                    }
                }
                RowLayout{
                    id: row_contrast
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    Layout.topMargin: 20

                    Text {
                        id: lbl_contrast
                        Layout.fillWidth: true
                        text: qsTr("Contrast")
                        color: text_color
                    }
                    Slider {
                        id: sld_contrast
                        Layout.fillWidth: true
                        from: -1.0
                        value: 0.3
                        to: 1.0
                        snapMode: Slider.SnapAlways
                        stepSize: 0.1
                    }
                    Text {
                        id: lbl_contrast_value
                        text: sld_contrast.value.toFixed(1) //qsTr("1.8")
                        Layout.alignment: Qt.AlignRight
                    }
                }

                RowLayout{
                    id: row_saturation
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    Layout.topMargin: 20

                    Text {
                        id: lbl_saturation
                        Layout.fillWidth: true
                        text: qsTr("Saturation")
                        color: text_color
                    }
                    Slider {
                        id: sld_saturation
                        Layout.fillWidth: true
                        from: -1.0
                        value: 0.6
                        to:1.0
                        snapMode: Slider.SnapAlways
                        stepSize: 0.1
                    }
                    Text {
                        id: lbl_saturation_value
                        text: sld_saturation.value.toFixed(1)//qsTr("-0.3")
                        Layout.alignment: Qt.AlignRight
                    }
                }

                RowLayout{
                    id: row_denoising
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    Layout.topMargin: 20

                    Text {
                        id: lbl_denoising
                        Layout.fillWidth: true
                        text: qsTr("Denoising")
                        color: text_color
                    }
                    Slider {
                        id: sld_denoising
                        Layout.fillWidth: true
                        from: -1.0
                        value: 0
                        to: +1.0
                        snapMode: Slider.SnapAlways
                        stepSize: 0.1
                    }
                    Text {
                        id: lbl_denoising_value
                        text: sld_denoising.value.toFixed(1) //qsTr("-0.3")
                        Layout.alignment: Qt.AlignRight
                    }
                }
                RowLayout{
                    id: row_sharp
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    Layout.topMargin: 20

                    Text {
                        id: lbl_sharp
                        Layout.fillWidth: true
                        text: qsTr("Sharpness")
                        color: text_color
                    }
                    Slider {
                        id: sld_sharp
                        Layout.fillWidth: true
                        from: -1.0
                        value: 0
                        to: 1.0
                        snapMode: Slider.SnapAlways
                        stepSize: 0.1
                    }
                    Text {
                        id: lbl_sharp_value
                        text: sld_sharp.value.toFixed(1)
                        Layout.alignment: Qt.AlignRight
                    }
                }
                RowLayout{
                    width: rec_setting.width
                    Layout.margins: 30


                    ButtonGroup { id: whiteBalance }
                    Column {
                        Layout.alignment: Qt.AlignLeft
                        Layout.fillWidth: true
                        Label {
                            text: qsTr("White Balance Mode:")
                        }

                        RadioButton {
                            id: rbtn_auto
                            checked: true
                            text: qsTr("Auto")
                            enabled: true
                            ButtonGroup.group: whiteBalance
                            onClicked: {
                                txt_whiteBalanceMode = "Camera.WhiteBalanceAuto"
                                console.log(txt_whiteBalanceMode)
                            }
                        }

                        RadioButton {
                            id: rbtn_sunlight
                            text: qsTr("Sunlight")
                            ButtonGroup.group: whiteBalance
                            onClicked: {
                                txt_whiteBalanceMode = "Camera.WhiteBalanceSunlight"
                                console.log(txt_whiteBalanceMode)
                            }
                        }

                        RadioButton {
                            id: rbtn_cloudy
                            text: qsTr("Cloudy")
                            ButtonGroup.group: whiteBalance
                            onClicked: {
                                txt_whiteBalanceMode = "Camera.WhiteBalanceCloudy"
                                console.log(txt_whiteBalanceMode)
                            }
                        }
                        RadioButton {
                            id: rbtn_shade
                            text: qsTr("Shade")
                            ButtonGroup.group: whiteBalance
                            onClicked:  {
                                txt_whiteBalanceMode = "Camera.WhiteBalanceShade"
                                console.log(txt_whiteBalanceMode)
                            }
                        }
                        RadioButton {
                            id: rbtn_sunset
                            text: qsTr("Sunset")
                            ButtonGroup.group: whiteBalance
                            onClicked: {
                                txt_whiteBalanceMode = "Camera.WhiteBalanceSunset"
                                console.log(txt_whiteBalanceMode)
                            }
                        }
                        RadioButton {
                            id: rbtn_fluorescent
                            text: qsTr("Fluorescent")
                            ButtonGroup.group: whiteBalance
                            onClicked: {
                                txt_whiteBalanceMode = "Camera.WhiteBalanceFluorescent"
                                console.log(txt_whiteBalanceMode)
                            }
                        }
                    }
                    ButtonGroup { id: colorFilter }
                    Column {
                        Layout.alignment: Qt.AlignRight
                        Label {
                            text: qsTr("Color Filter:")
                        }

                        RadioButton {
                            id: rbtn_none
                            checked: true
                            text: qsTr("None")
                            enabled: true
                            ButtonGroup.group: colorFilter
                            onClicked: {
                                txt_color_filter = "CameraImageProcessing.ColorFilterNone"
                                console.log(txt_color_filter)
                            }
                        }

                        RadioButton {
                            id: rbtn_grayscale
                            text: qsTr("Grayscale")
                            ButtonGroup.group: colorFilter
                            onClicked: {
                                txt_color_filter = "CameraImageProcessing.ColorFilterGrayscale"
                                console.log(txt_color_filter)
                            }
                        }

                        RadioButton {
                            id: rbtn_negative
                            text: qsTr("Negative")
                            ButtonGroup.group: colorFilter
                            onClicked: {
                                txt_color_filter = "CameraImageProcessing.ColorFilterNegative"
                                console.log(txt_color_filter)
                            }
                        }
                        RadioButton {
                            id: rbtn_solarize
                            text: qsTr("Solarize")
                            ButtonGroup.group: colorFilter
                            onClicked: {
                                txt_color_filter = "CameraImageProcessing.ColorFilterSolarize"
                                console.log(txt_color_filter)
                            }
                        }
                        RadioButton {
                            id: rbtn_sepia
                            text: qsTr("Sepia")
                            ButtonGroup.group: colorFilter
                            onClicked: {
                                txt_color_filter = "CameraImageProcessing.ColorFilterSepia"
                                console.log(txt_color_filter)
                            }
                        }
                        RadioButton {
                            id: rbtn_posterize
                            text: qsTr("Posterize")
                            ButtonGroup.group: colorFilter
                            onClicked: {
                                txt_color_filter = "CameraImageProcessing.ColorFilterPosterize"
                                console.log(txt_color_filter)
                            }
                        }
                    }
                }
            }
        }

        Rectangle
        {
            id: rec_main_view
            Layout.fillHeight: true
            Layout.fillWidth: true
            //            color: "red"
            Layout.margins: 5

            ColumnLayout
            {
                id: clm_main_view
                anchors.fill: parent

                TabBar{
                    id: tabBar
                    width:850 // parent.width
                    Layout.fillWidth: true
                    Layout.margins:  soft_margin
                    Layout.topMargin: 10
                    Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
                    background: Rectangle{
                        color: "white"
                    }

                    TabButton{
                        text: qsTr("Take Photo")
                        background: Rectangle {
                            color: tabBar.currentIndex == 0 ? "darkgray" : "lightgray"
                            radius: 10
                        }

                    }
                    TabButton{
                        text: qsTr("Galley")
                        background: Rectangle {
                            color: tabBar.currentIndex == 1 ? "darkgray" : "lightgray"
                            radius: 10
                        }
                    }
                    TabButton{
                        text: qsTr("Send Data")
                        background: Rectangle {
                            color: tabBar.currentIndex == 2 ? "darkgray" : "lightgray"
                            radius: 10
                        }
                    }
                }
                //                Rectangle{
                //                    id: rec_tabView
                //                    Layout.fillWidth: true
                //                    Layout.fillHeight: true
                //                    color: "red"//bg_color
                //                    Layout.alignment: Qt.AlignRight
                //                    Layout.margins: soft_margin

                StackLayout{
                    id: stacklayout
                    Layout.alignment:  Qt.AlignTop
                    width: parent.width
                    //                        height: parent.height
                    currentIndex: tabBar.currentIndex

                    Rectangle{
                        id: rec_webcam_view
                        Layout.alignment: Qt.AlignTop | Qt.AlignCenter
                        //                            Layout.fillWidth: true
                        height: 350
                        width: 550
                        Rectangle{
                            id: rec_btn
                            width: parent.width
                            height: 40
                            //                                color: bg_color
                            RowLayout
                            {

                                id: row_btn
                                width: parent.width
                                height: parent.height
                                Text {
                                    id: photoCounter
                                    text: "#Photos:"+bridge.photoCounter
                                    font.family: font_name
                                    font.pixelSize: font_size
                                    color: "red"
                                    Layout.alignment: Qt.AlignLeft
                                }
                                Button{
                                    id: btn_takePhoto
                                    text: "Take Photo"
                                    Layout.alignment: Qt.AlignLeft
                                    background: Rectangle {
                                        color: btn_takePhoto.down? "gray" :"darkgray"
                                        border.color: "black"
                                        radius: 6
                                    }
                                    onClicked: {
                                        //  camera.imageCapture.captureToLocation("/home/amir/WebcamImages")
                                        camera.imageCapture.captureToLocation(path)
                                        bridge.btnCaptureClicked()
                                        repeater.model = bridge.imagesList
                                    }


                                }
                            }

                        }
                        Camera {
                            id: camera
                            imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

                            exposure {
                                exposureCompensation: -1.0
                                exposureMode: Camera.ExposurePortrait
                            }


                            flash.mode: Camera.FlashRedEyeReduction

                            //                                                        imageCapture {
                            //                                                            onImageCaptured: {
                            //                                                                photoPreview.source = preview  // Show the preview in an Image
                            //                                                            }

                            //                                                        }
                            imageProcessing {
                                whiteBalanceMode: txt_whiteBalanceMode //Camera.WhiteBalanceTungsten
                                //                                {
                                //                                    rbtn_auto.checked ?Camera.WhiteBalanceAuto :
                                //                                                        rbtn_cloudy.checked ? Camera.WhiteBalanceCloudy :
                                //                                                                              rbtn_shade.checked ? Camera.WhiteBalanceShade : Camera.WhiteBalanceTungsten
                                //                                }

                                contrast: sld_contrast.value
                                saturation: sld_saturation.value
                                brightness: sld_brightness.value
                                denoisingLevel: sld_denoising.value
                                sharpeningLevel: sld_sharp.value

                                //colorFilter: txt_color_filter //CameraImageProcessing.ColorFilterBlackboard

                            }
                        }
                        VideoOutput {
                            source: camera
                            anchors.fill: parent
                            focus : visible // to receive focus and capture key events when visible
                        }

                        Image {
                            id: photoPreview
                            width: rec_webcam_view.width
                            height: rec_webcam_view.height
                        }

                    }
                    Rectangle{
                        id: galley_tab

                        Rectangle{
                            anchors.fill: parent
                            ScrollView
                            {
                                id: scroll_view
                                clip: true
                                anchors.fill: parent
                                anchors.bottomMargin: 50

                                GridLayout{
                                    id: grid_layout
                                    anchors.fill: parent
                                    anchors.margins: 10
                                    columns: 3
                                    rowSpacing: 4
                                    columnSpacing: 5
                                    Repeater{
                                        id: repeater
                                        model:  bridge.imagesList
                                        Image {
                                            source: "file://"+ path + "/"  +modelData
                                            sourceSize.width:  320
                                            sourceSize.height: 300
                                            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Rectangle{
                        id: send_data_tab
                        ColumnLayout
                        {
                            id: clmn_layout
                            anchors.margins: 50
                            anchors.fill: parent
                            Image {
                                id: img_selected
                                source: file_dialog.fileUrl
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                Layout.alignment: Qt.AlignCenter
                                sourceSize.width: 520
                                sourceSize.height: 480
                            }
                            RowLayout{
                                id: row_layout
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                Button{
                                    id: btn_choose_img
                                    text: "Choose"
                                    Layout.margins: 10
                                    background: Rectangle {
                                        width: 70
                                        color: btn_choose_img.down? "gray" :"darkgray"
                                        border.color: "black"
                                        radius: 6
                                    }
                                    FileDialog{
                                        id: file_dialog
                                        title: " Please choose an image:"
                                        nameFilters: [ "Image files (*.jpg *.png)" ]
                                        selectExisting: true
                                        selectFolder: false
                                        selectMultiple: false
                                        folder: shortcuts.home
                                        onFileUrlChanged:  {
//                                            selected_image_path = file_dialog.fileUrl
                                            bridge.selectedImagePath = file_dialog.fileUrl
                                        }

                                    }

                                    onClicked: {
                                        file_dialog.open()
//                                        bridge.selectedImagePath = selected_image_path //file_dialog.fileUrl
//                                        console.log("3"+selected_image_path)
                                    }


                                }
                                Button{
                                    id: btn_send_img
                                    text: "Send"
                                    Layout.margins: 10
                                    background: Rectangle {
                                        color: btn_send_img.down? "gray" :"darkgray"
                                        border.color: "black"
                                        radius: 6
                                    }
                                    onClicked: {
                                        bridge.btnSendClicked()
                                    }
                                }
                            }
                        }
                    }
                }

                //                }

            } //clm_main_view

        } // rec_main_view



    } // main_row_layout
}
