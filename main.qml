import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.3
import QtMultimedia 5.12
import QtQuick.Templates 2.3 as T
import QtGraphicalEffects 1.0

Window {
    property int  font_size: 18
    property int  soft_margin: 2
    property string  font_name: "Ubuntu"
    property string text_color: "#1F1F1F"
    property string bg_color: "lightgray"
    property string txt_whiteBalanceMode: "Camera.WhiteBalanceTungsten"
    property string txt_color_filter: "CameraImageProcessing.ColorFilterNone"

    visible: true
    width: 1200
    height: 1000
    //    minimumWidth: 1300
    //    maximumWidth: 1500
    //    minimumHeight: 900
    //    maximumHeight: 1100

    RowLayout
    {
        id: row_layout
        anchors.fill: parent
        spacing: 6


        Rectangle{
            id: rec_setting
            Layout.fillWidth: true
            Layout.minimumWidth: 100
            Layout.preferredWidth: 300
            Layout.maximumWidth: 400
            Layout.minimumHeight: parent.height
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
//                Layout.margins: 30
                padding: 10
                //                Layout.alignment: Qt.AlignTop | Qt.AlignCenter
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
                        text: sld_brightness.value.toFixed(1)  //qsTr("0.5")
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
                        onToggled: {
                            txt_whiteBalanceMode = "Camera.WhiteBalanceAuto"
                            console.log(txt_whiteBalanceMode)
                        }
                    }

                    RadioButton {
                        id: rbtn_sunlight
                        text: qsTr("Sunlight")
                        ButtonGroup.group: whiteBalance
                        onToggled: {
                            txt_whiteBalanceMode = "Camera.WhiteBalanceSunlight"
                            console.log(txt_whiteBalanceMode)
                        }
                    }

                    RadioButton {
                        id: rbtn_cloudy
                        text: qsTr("Cloudy")
                        ButtonGroup.group: whiteBalance
                        onToggled: {
                            txt_whiteBalanceMode = "Camera.WhiteBalanceCloudy"
                            console.log(txt_whiteBalanceMode)
                        }
                    }
                    RadioButton {
                        id: rbtn_shade
                        text: qsTr("Shade")
                        ButtonGroup.group: whiteBalance
                        onToggled: {
                            txt_whiteBalanceMode = "Camera.WhiteBalanceShade"
                            console.log(txt_whiteBalanceMode)
                        }
                    }
                    RadioButton {
                        id: rbtn_sunset
                        text: qsTr("Sunset")
                        ButtonGroup.group: whiteBalance
                        onToggled: {
                            txt_whiteBalanceMode = "Camera.WhiteBalanceSunset"
                            console.log(txt_whiteBalanceMode)
                        }
                    }
                    RadioButton {
                        id: rbtn_fluorescent
                        text: qsTr("Fluorescent")
                        ButtonGroup.group: whiteBalance
                        onToggled: {
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
                        onToggled: {
                            txt_color_filter = "CameraImageProcessing.ColorFilterNone"
                            console.log(txt_color_filter)
                        }
                    }

                    RadioButton {
                        id: rbtn_grayscale
                        text: qsTr("Grayscale")
                        ButtonGroup.group: colorFilter
                        onToggled: {
                            txt_color_filter = "CameraImageProcessing.ColorFilterGrayscale"
                            console.log(txt_color_filter)
                        }
                    }

                    RadioButton {
                        id: rbtn_negative
                        text: qsTr("Negative")
                        ButtonGroup.group: colorFilter
                        onToggled: {
                            txt_color_filter = "CameraImageProcessing.ColorFilterNegative"
                            console.log(txt_color_filter)
                        }
                    }
                    RadioButton {
                        id: rbtn_solarize
                        text: qsTr("Solarize")
                        ButtonGroup.group: colorFilter
                        onToggled: {
                            txt_color_filter = "CameraImageProcessing.ColorFilterSolarize"
                            console.log(txt_color_filter)
                        }
                    }
                    RadioButton {
                        id: rbtn_sepia
                        text: qsTr("Sepia")
                        ButtonGroup.group: colorFilter
                        onToggled: {
                            txt_color_filter = "CameraImageProcessing.ColorFilterSepia"
                            console.log(txt_color_filter)
                        }
                    }
                    RadioButton {
                        id: rbtn_posterize
                        text: qsTr("Posterize")
                        ButtonGroup.group: colorFilter
                        onToggled: {
                            txt_color_filter = "CameraImageProcessing.ColorFilterPosterize"
                            console.log(txt_color_filter)
                        }
                    }
                }
            }
            }
        }
        ColumnLayout{
            id: col_layout_tabview
            Layout.fillWidth: true
            anchors.centerIn: col_layout_tabview.Center

            TabBar{
                id: tabBar
                //width: parent.width
                Layout.fillWidth: true
                Layout.margins:  soft_margin
                Layout.topMargin: 10
                Layout.alignment: Qt.AlignTop
                background: Rectangle{
                    color: "white"
                }

                TabButton{
                    text: qsTr("Take Photo")
                    background: Rectangle {
                        color: tabBar.currentIndex == 0 ? "steelblue" : "lightgray"
                        radius: 10
                    }

                }
                TabButton{
                    text: qsTr("Galley")
                    background: Rectangle {
                        color: tabBar.currentIndex == 1 ? "steelblue" : "lightgray"
                        radius: 10
                    }
                }
                TabButton{
                    text: qsTr("Send Data")
                    background: Rectangle {
                        color: tabBar.currentIndex == 2 ? "steelblue" : "lightgray"
                        radius: 10
                    }
                }
            }

            Rectangle{
                id: rec_tabView
                Layout.fillWidth: true
                Layout.fillHeight: true
                //            Layout.minimumWidth: 800
                //            Layout.preferredWidth: 1000
                //            Layout.maximumWidth: 1200
                //            Layout.minimumHeight: parent.height
                color: bg_color
                Layout.alignment: Qt.AlignRight
                Layout.margins: soft_margin

                StackLayout{
                    id: stacklayout

                    width: parent.width
                    height: parent.height
                    //anchors.centerIn: parent
                    currentIndex: tabBar.currentIndex

                    Rectangle{
                        id: take_photo_tab
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        //        Text {
                        //            text: qsTr("TAKE PHOTO")
                        //            anchors.centerIn: parent
                        //        }

                        Camera {
                            id: camera
                            imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

                            exposure {
                                exposureCompensation: -1.0
                                exposureMode: Camera.ExposurePortrait
                            }

                            flash.mode: Camera.FlashRedEyeReduction

                            imageCapture {
                                onImageCaptured: {
                                    photoPreview.source = preview  // Show the preview in an Image
                                }
                            }
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
                        }
                        RowLayout
                        {
                            id: row_btn
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: 40
                            Rectangle{
                                id: rec_btn
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                color: bg_color
                                Button{
                                    id: btn_takePhoto
                                    text: "Take Photo"
                                    anchors.centerIn: parent
                                    onClicked: {
                                        camera.imageCapture
                                    }


                                }
                            }
                        }
                    }
                    Rectangle{
                        id: galley_tab
                        Text {
                            text: qsTr("GALLERY")
                            anchors.centerIn: parent
                        }
                    }
                    Rectangle{
                        id: send_data_tab
                        color: "red"
                        Text {
                            text: qsTr("SEND DATA")
                            anchors.centerIn: parent
                        }
                    }
                }


                //                        TabView{
                //                            id: tabview
                //                            height: parent.height
                //                            width: parent.width
                //                            Layout.margins: soft_margin
                //                            //        Layout.right: parent.right
                //                            Layout.alignment: Qt.AlignLeft
                //                            Tab{
                //                                title: "Take Photo"
                //                                Rectangle{
                //                                    color: "black"
                //                                    Camera {
                //                                        id: camera

                //                                        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

                //                                        exposure {
                //                                            exposureCompensation: -1.0
                //                                            exposureMode: Camera.ExposurePortrait
                //                                        }

                //                                        flash.mode: Camera.FlashRedEyeReduction

                //                                        imageCapture {
                //                                            onImageCaptured: {
                //                                                photoPreview.source = preview  // Show the preview in an Image
                //                                            }
                //                                        }
                //                                        imageProcessing {
                //                                            whiteBalanceMode: Camera.WhiteBalanceTungsten
                //                                            contrast: -20.66
                //                                            saturation: -5.5
                //                                            brightness: 10
                //                                            denoisingLevel: 80
                //                                            manualWhiteBalance: 20
                //                                            sharpeningLevel: 30

                //                                        }
                //                                    }
                //                                    VideoOutput {
                //                                        source: camera
                //                                        anchors.fill: parent
                //                                        focus : visible // to receive focus and capture key events when visible
                //                                    }

                //                                    Image {
                //                                        id: photoPreview
                //                                    }
                //                                    RowLayout
                //                                    {
                //                                        id: row_btn
                //                                        anchors.bottom: parent.bottom
                //                                        width: parent.width
                //                                        height: 40
                //                                        Rectangle{
                //                                            id: rec_btn
                //                                            Layout.fillHeight: true
                //                                            Layout.fillWidth: true
                //                                            color: bg_color
                //                                            Button{
                //                                                id: btn_takePhoto
                //                                                text: "Take Photo"
                //                                                anchors.centerIn: parent

                //                                            }
                //                                        }
                //                                    }
                //                                }
                //                            }
                //                            Tab{
                //                                title: "Gallery"
                //                                Rectangle{
                //                                    color: "steelblue"
                //                                }
                //                            }
                //                            Tab{
                //                                title: "Send"
                //                                Rectangle{
                //                                    color: "orange"
                //                                }
                //                            }
                //                        }
            }
        }
    } // col_layout
} // window


