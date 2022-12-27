import QtQuick 2.14
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.1
import QtMultimedia 5.12
//import QtQuick.Templates 2.3 as T
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.2


Item {

    // ######################## Properties ########################

    property string   font_name           : "Ubuntu"
    property string   text_color          : "#3D5656"//"#1F1F1F"
    property string   bg_color            : "#04293A" // second_color
    property string   border_color        : "#064663"// "black"
    property string   main_color          : "#D5CEA3" // "white"
    property string   first_color         : "#FED049"
    property string   second_color        :"#68B984"
    property string   button_color1       : "#AD8E70"
    property string   button_color2       : "#FFDB89"
    property int      font_size           : 18
    property int      soft_margin         : 2
    property int      padding_value       : 8
    property int      border_width        : 1
    property double   slider_min_value    : -1.0
    property double   slider_max_value    : +1.0
    property double   slider_step_value   : 0.1
    property var      txt_whiteBalanceMode: Camera.WhiteBalanceTungsten
    property var      txt_color_filter    : CameraImageProcessing.ColorFilterNone
    property string   path                : bridge.imagesPath

    // #######################################################

    width : 1360
    height: 700
    Rectangle{
        anchors.fill: parent
        color       : main_color

        RowLayout
        {
            id: main_row_layout
            anchors.fill: parent
            // ####################### Setting part #######################
            Rectangle{
                id               : rec_setting
                width            : 360
                Layout.fillHeight: true
                color            : main_color
                Layout.alignment : Qt.AlignLeft | Qt.AlignTop
                Layout.margins   : soft_margin
                border.color     : border_color
                border.width     :border_width


                Text {
                    id                      : lbl_setting
                    text                    :  qsTr("<b>SETTINGS<b>")
                    font.family             : font_name
                    font.pixelSize          : font_size
                    color                   : text_color
                    anchors.horizontalCenter: parent.horizontalCenter
                    padding                 : 10
                }

                ColumnLayout
                {
                    id         : col_settings
                    width      : parent.width
                    anchors.top: lbl_setting.bottom

                    //  #################### Brightness ####################
                    RowLayout{
                        id              : row_brightness
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                        Layout.topMargin: 20

                        Text {
                            id              : lbl_brightness
                            Layout.fillWidth: true
                            text            : qsTr("Brightness")
                            color           : text_color
                            leftPadding     : padding_value

                        }
                        Slider {
                            id              : sld_brightness
                            Layout.fillWidth: true
                            from            : slider_min_value
                            to              :slider_max_value
                            stepSize        : slider_step_value
                            value           : -0.4
                            snapMode        : Slider.SnapAlways

                        }
                        Text {
                            id              : lbl_brightenss_value
                            text            : sld_brightness.value.toFixed(1)
                            Layout.alignment: Qt.AlignRight
                            rightPadding    : padding_value
                            color           : text_color
                        }
                    }
                    //  #################### Contrast ####################
                    RowLayout{
                        id               : row_contrast
                        Layout.fillWidth : true
                        Layout.alignment : Qt.AlignTop | Qt.AlignLeft
                        Layout.topMargin : 20

                        Text {
                            id              : lbl_contrast
                            Layout.fillWidth: true
                            text            : qsTr("Contrast")
                            color           : text_color
                            leftPadding     : padding_value
                        }
                        Slider {
                            id              : sld_contrast
                            Layout.fillWidth: true
                            from            : slider_min_value
                            stepSize        : slider_step_value
                            to              : slider_max_value
                            value           : 0.3
                            snapMode        : Slider.SnapAlways

                        }
                        Text {
                            id              : lbl_contrast_value
                            text            : sld_contrast.value.toFixed(1)
                            Layout.alignment: Qt.AlignRight
                            rightPadding    : padding_value
                            color           : text_color
                        }
                    }
                    //  #################### Saturation ####################
                    RowLayout{
                        id              : row_saturation
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                        Layout.topMargin: 20

                        Text {
                            id              : lbl_saturation
                            Layout.fillWidth: true
                            text            : qsTr("Saturation")
                            color           : text_color
                            leftPadding     : padding_value
                        }
                        Slider {
                            id              : sld_saturation
                            Layout.fillWidth: true
                            from            : slider_min_value
                            to              :slider_max_value
                            stepSize        :slider_step_value
                            value           : 0.6
                            snapMode        : Slider.SnapAlways

                        }
                        Text {
                            id              : lbl_saturation_value
                            text            : sld_saturation.value.toFixed(1)
                            Layout.alignment: Qt.AlignRight
                            rightPadding    : padding_value
                            color           : text_color
                        }
                    }
                    //  #################### Denoising ####################
                    RowLayout{
                        id              : row_denoising
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                        Layout.topMargin: 20

                        Text {
                            id              : lbl_denoising
                            Layout.fillWidth: true
                            text            : qsTr("Denoising")
                            color           : text_color
                            leftPadding     : padding_value
                        }
                        Slider {
                            id              : sld_denoising
                            Layout.fillWidth: true
                            from            : slider_min_value
                            to              : slider_max_value
                            stepSize        : slider_step_value
                            value           : 0
                            snapMode        : Slider.SnapAlways

                        }
                        Text {
                            id              : lbl_denoising_value
                            text            : sld_denoising.value.toFixed(1)
                            Layout.alignment: Qt.AlignRight
                            rightPadding    : padding_value
                            color           : text_color
                        }
                    }
                    //  #################### Sharpness ####################
                    RowLayout{
                        id              : row_sharp
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                        Layout.topMargin: 20

                        Text {
                            id              : lbl_sharp
                            Layout.fillWidth: true
                            text            : qsTr("Sharpness")
                            color           : text_color
                            leftPadding     : padding_value
                        }
                        Slider {
                            id               : sld_sharp
                            Layout.fillWidth : true
                            from             : slider_min_value
                            to               : slider_max_value
                            stepSize         : slider_step_value
                            value            : 0
                            snapMode         : Slider.SnapAlways

                        }
                        Text {
                            id              : lbl_sharp_value
                            text            : sld_sharp.value.toFixed(1)
                            Layout.alignment: Qt.AlignRight
                            rightPadding    : padding_value
                            color           : text_color
                        }
                    }
                    RowLayout{
                        width         : rec_setting.width
                        Layout.margins: 30
                        //  #################### White Balance####################
                        ButtonGroup { id: whiteBalance }
                        Column {
                            Layout.alignment: Qt.AlignLeft
                            Layout.fillWidth: true
                            Label {
                                text: qsTr("White Balance Mode:")
                            }

                            RadioButton {
                                id               : rbtn_auto
                                checked          : true
                                text             : qsTr("Auto")
                                enabled          : true
                                ButtonGroup.group: whiteBalance
                                onClicked: {
                                    txt_whiteBalanceMode = Camera.WhiteBalanceAuto
                                }
                                contentItem: Text {
                                    text             : rbtn_auto.text
                                    color            : text_color
                                    leftPadding      : rbtn_auto.indicator.width + rbtn_auto.spacing
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }

                            RadioButton {
                                id               : rbtn_sunlight
                                text             : qsTr("Sunlight")
                                ButtonGroup.group: whiteBalance
                                onClicked: {
                                    txt_whiteBalanceMode = Camera.WhiteBalanceSunlight
                                }
                                contentItem: Text {
                                    text             : rbtn_sunlight.text
                                    color            : text_color
                                    leftPadding      : rbtn_sunlight.indicator.width + rbtn_sunlight.spacing
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }

                            RadioButton {
                                id               : rbtn_cloudy
                                text             : qsTr("Cloudy")
                                ButtonGroup.group: whiteBalance
                                onClicked: {
                                    txt_whiteBalanceMode = Camera.WhiteBalanceCloudy
                                }
                                contentItem: Text {
                                    text             : rbtn_cloudy.text
                                    color            : text_color
                                    leftPadding      : rbtn_cloudy.indicator.width + rbtn_cloudy.spacing
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                            RadioButton {
                                id                           : rbtn_shade
                                text                        : qsTr("Shade")
                                ButtonGroup.group: whiteBalance
                                onClicked:  {
                                    txt_whiteBalanceMode = Camera.WhiteBalanceShade
                                }
                                contentItem: Text {
                                    text             : rbtn_shade.text
                                    color            : text_color
                                    leftPadding      : rbtn_shade.indicator.width + rbtn_shade.spacing
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                            RadioButton {
                                id               : rbtn_sunset
                                text             : qsTr("Sunset")
                                ButtonGroup.group: whiteBalance
                                onClicked: {
                                }
                                contentItem: Text {
                                    text             : rbtn_sunset.text
                                    color            : text_color
                                    leftPadding      : rbtn_sunset.indicator.width + rbtn_sunset.spacing
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                            RadioButton {
                                id               : rbtn_fluorescent
                                text             : qsTr("Fluorescent")
                                ButtonGroup.group: whiteBalance
                                onClicked: {
                                    txt_whiteBalanceMode = Camera.WhiteBalanceFluorescent
                                }
                                contentItem: Text {
                                    text             : rbtn_fluorescent.text
                                    color            : text_color
                                    leftPadding      : rbtn_fluorescent.indicator.width + rbtn_fluorescent.spacing
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                        }
                        //  #################### Color Filter ####################

                        ButtonGroup { id: colorFilter }
                        Column {
                            Layout.alignment: Qt.AlignRight
                            Label {
                                text: qsTr("Color Filter:")
                            }

                            RadioButton {
                                id               : rbtn_none
                                checked          : true
                                text             : qsTr("None")
                                enabled          : true
                                ButtonGroup.group: colorFilter
                                onClicked: {
                                    txt_color_filter = CameraImageProcessing.ColorFilterNone
                                }
                                contentItem: Text {
                                    text             : rbtn_none.text
                                    color            : text_color
                                    leftPadding      : rbtn_none.indicator.width + rbtn_none.spacing
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }


                            RadioButton {
                                id               : rbtn_grayscale
                                text             : qsTr("Grayscale")
                                ButtonGroup.group: colorFilter
                                onClicked: {
                                }
                                contentItem: Text {
                                    text             : rbtn_grayscale.text
                                    color            : text_color
                                    leftPadding      : rbtn_grayscale.indicator.width + rbtn_grayscale.spacing
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }

                            RadioButton {
                                id                : rbtn_negative
                                text              : qsTr("Negative")
                                ButtonGroup.group : colorFilter
                                onClicked: {
                                    txt_color_filter = CameraImageProcessing.ColorFilterNegative
                                }
                                contentItem: Text {
                                    text             : rbtn_negative.text
                                    color            : text_color
                                    leftPadding      : rbtn_negative.indicator.width + rbtn_negative.spacing
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                            RadioButton {
                                id               : rbtn_solarize
                                text             : qsTr("Solarize")
                                ButtonGroup.group: colorFilter
                                onClicked: {
                                    txt_color_filter = CameraImageProcessing.ColorFilterSolarize
                                }
                                contentItem: Text {
                                    text             : rbtn_solarize.text
                                    color            : text_color
                                    leftPadding      : rbtn_solarize.indicator.width + rbtn_solarize.spacing
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                            RadioButton {
                                id               : rbtn_sepia
                                text             : qsTr("Sepia")
                                ButtonGroup.group: colorFilter
                                onClicked: {
                                    txt_color_filter = CameraImageProcessing.ColorFilterSepia
                                }
                                contentItem: Text {
                                    text             : rbtn_sepia.text
                                    color            : text_color
                                    leftPadding      : rbtn_sepia.indicator.width + rbtn_sepia.spacing
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                            RadioButton {
                                id               : rbtn_posterize
                                text             : qsTr("Posterize")
                                ButtonGroup.group: colorFilter
                                onClicked: {
                                    txt_color_filter = CameraImageProcessing.ColorFilterPosterize
                                }
                                contentItem: Text {
                                    text             : rbtn_posterize.text
                                    color            : text_color
                                    leftPadding      : rbtn_posterize.indicator.width + rbtn_posterize.spacing
                                    verticalAlignment: Text.AlignVCenter
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
                Layout.fillWidth : true
                Layout.margins   : 5
                color            : main_color

                ColumnLayout
                {
                    id: clm_main_view
                    anchors.fill: parent
                    //  ####################### Tab Bar #######################
                    TabBar{
                        id                           : tabBar
                        Layout.fillWidth  : true
                        Layout.leftMargin : 100
                        Layout.rightMargin: 100
                        Layout.topMargin  : 10
                        Layout.alignment  : Qt.AlignTop | Qt.AlignHCenter
                        background:
                            Rectangle{
                            color: main_color
                        }

                        TabButton{
                            text      : qsTr("<b>Take Photo</b>")
                            background:
                                Rectangle {
                                color: tabBar.currentIndex == 0 ? first_color : second_color
                                radius: 10
                            }

                        }
                        TabButton{
                            text      : qsTr("<b>Galley</b>")
                            background:
                                Rectangle {
                                color: tabBar.currentIndex == 1 ? first_color : second_color
                                radius: 10
                            }
                            onClicked: {
                                console.log("GALLERY CLICKED")
                                bridge.radioBtnGalleryClicked()
                                repeater.model = bridge.imagesList
                                repeater.update()
                            }
                        }
                        TabButton{
                            text      : qsTr("<b>Send Data</b>")
                            background: Rectangle {
                                color : tabBar.currentIndex == 2 ? first_color : second_color
                                radius: 10
                            }
                        }
                    }

                    StackLayout{
                        id              : stacklayout
                        Layout.alignment:  Qt.AlignTop
                        width           : parent.width
                        currentIndex    : tabBar.currentIndex

                        Rectangle{
                            id              : rec_webcam_view
                            Layout.alignment: Qt.AlignTop | Qt.AlignCenter
                            height          : 350
                            width           : 550
                            color           : main_color
                            Rectangle{
                                id    : rec_btn
                                width : parent.width
                                height: 40
                                color : main_color
                                RowLayout
                                {
                                    id    : row_btn
                                    width : parent.width
                                    height: parent.height

                                    Button{
                                        id              :btn_takePhoto
                                        text            : "<b>Take Photo</b>  ( " +bridge.photoCounter +" )"
                                        Layout.alignment: Qt.AlignCenter
                                        contentItem: Item{
                                            Text{
                                                anchors.verticalCenter  : parent.verticalCenter
                                                anchors.horizontalCenter: parent.horizontalCenter
                                                anchors.margins         : soft_margin
                                                text                    : btn_takePhoto.text
                                                font.pixelSize          : font_size
                                                font.family             : font_name
                                                color                   : text_color
                                            }
                                        }
                                        background:
                                            Rectangle {
                                            implicitHeight: 40
                                            implicitWidth : 300
                                            color         : btn_takePhoto.down? button_color2 :button_color1
                                            border.color  : btn_takePhoto.activeFocus ? "green" : "black"
                                            border.width  : border_width
                                            radius            : 6
                                        }
                                        onClicked: {
                                            camera.imageCapture.captureToLocation(path)
                                            bridge.btnCaptureClicked()
                                        }
                                    }
                                }
                            }
                            //  ####################### Capure Tab#######################
                            Camera {
                                id: camera
                                imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

                                exposure {
                                    exposureCompensation: -1.0
                                    exposureMode        : Camera.ExposurePortrait
                                }


                                flash.mode: Camera.FlashRedEyeReduction

                                //                                                        imageCapture {
                                //                                                            onImageCaptured: {
                                //                                                                photoPreview.source = preview
                                //                                                            }

                                //                                                        }
                                imageProcessing {
                                    contrast        : sld_contrast.value
                                    saturation      : sld_saturation.value
                                    brightness      : sld_brightness.value
                                    denoisingLevel  : sld_denoising.value
                                    sharpeningLevel : sld_sharp.value
                                    colorFilter     : txt_color_filter
                                    whiteBalanceMode: txt_whiteBalanceMode
                                }
                            }
                            VideoOutput {
                                source      : camera
                                anchors.fill: parent
                                focus       :visible
                            }

                            Image {
                                id    : photoPreview
                                width : rec_webcam_view.width
                                height: rec_webcam_view.height
                            }
                        }
                        //  ####################### Galley Tab#######################
                        Rectangle{
                            id: galley_tab
                            Rectangle{
                                anchors.fill: parent
                                color      : main_color
                                ScrollView
                                {
                                    id                  : scroll_view
                                    clip                : true
                                    anchors.fill        : parent
                                    anchors.bottomMargin: 50

                                    GridLayout{
                                        id             : grid_layout
                                        anchors.fill   : parent
                                        anchors.margins: 10
                                        columns        : 3
                                        rowSpacing     : 4
                                        columnSpacing  : 5
                                        Repeater{
                                            id: repeater
                                            model:  bridge.imagesList
                                            Image {
                                                source           : "file://"+ path + "/"  +modelData
                                                sourceSize.width :  320
                                                sourceSize.height: 300
                                                Layout.alignment : Qt.AlignTop | Qt.AlignLeft
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        //  ####################### Galley Tab#######################
                        Rectangle{
                            id   : send_data_tab
                            color:main_color
                            ColumnLayout
                            {
                                id             : clmn_layout
                                anchors.margins: 50
                                anchors.fill   : parent
                                Image {
                                    id                 : img_selected
                                    source             : file_dialog.fileUrl
                                    Layout.fillHeight  : true
                                    Layout.fillWidth   : true
                                    Layout.alignment   : Qt.AlignCenter
                                    sourceSize.width   : 520
                                    sourceSize.height  : 480
                                }
                                RowLayout{
                                    id: row_layout
                                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                                    Button{
                                        id                    : btn_choose_img
                                        text                  : "<b>Choose</b>"
                                        Layout.margins: 10
                                        contentItem: Item {
                                            Text {
                                                anchors.verticalCenter  : parent.verticalCenter
                                                anchors.horizontalCenter: parent.horizontalCenter
                                                anchors.margins         : soft_margin
                                                text                    : btn_choose_img.text
                                                font.pixelSize          : font_size -2
                                                color                   : text_color
                                            }
                                        }
                                        background:
                                            Rectangle {
                                            implicitHeight: 40
                                            implicitWidth : 150
                                            color         : btn_choose_img.down? button_color2 :button_color1
                                            border.color  : btn_choose_img.activeFocus ? "green" : "black"
                                            border.width  : border_width
                                            radius        : 6
                                        }
                                        FileDialog{
                                            id            : file_dialog
                                            title         : " Please choose an image:"
                                            nameFilters   : [ "Image files (*.jpg *.png)" ]
                                            selectExisting: true
                                            selectFolder  : false
                                            selectMultiple: false
                                            folder        : shortcuts.home
                                            onFileUrlChanged:  {
                                                bridge.selectedImagePath = file_dialog.fileUrl
                                            }
                                        }
                                        onClicked: {
                                            file_dialog.open()
                                        }
                                    }
                                    Button{
                                        id            : btn_send_img
                                        text          : "<b>Send</b>"
                                        Layout.margins: 10
                                        contentItem: Item{
                                            Text {
                                                anchors.verticalCenter  : parent.verticalCenter
                                                anchors.horizontalCenter: parent.horizontalCenter
                                                anchors.margins         : soft_margin
                                                text                    : btn_send_img.text
                                                font.pixelSize          : font_size -2
                                                color                   : text_color
                                            }
                                        }

                                        background:
                                            Rectangle {
                                            implicitHeight: 40
                                            implicitWidth : 150
                                            color         : btn_send_img.down? button_color2 :button_color1
                                            border.color  : btn_send_img.activeFocus ? "green" : "black"
                                            border.width  : border_width
                                            radius        : 6
                                        }
                                        onClicked: {
                                            bridge.btnSendClicked()
                                        }
                                    }
                                }
                            }
                        }
                    }
                } //clm_main_view
            } // rec_main_view
        } // main_row_layout
    }
}
