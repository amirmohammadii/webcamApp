#ifndef WEBCAMUI_H
#define WEBCAMUI_H

#include <QObject>

class WebcamUi: public QObject
{
    Q_OBJECT

public:
    WebcamUi(QObject *parent = nullptr);

//    Q_PROPERTY(float brightness READ brightness WRITE setBrightness NOTIFY brightnessChanged)
//    float brightness();
//    void setBrightness(float value);
//    Q_SIGNAL void brighnessChanged();

//    Q_PROPERTY(float contrast READ contrast WRITE setContrast NOTIFY contrastChanged)


private:
    float _brightness;
    float _contrast;
    float _saturation;
    float _sharpness;
    float _denoising;

};

#endif // WEBCAMUI_H
