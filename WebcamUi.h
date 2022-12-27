#ifndef WEBCAMUI_H
#define WEBCAMUI_H

#include <QObject>
#include <QDir>
class WebcamUi: public QObject
{
    Q_OBJECT

public:
    WebcamUi(QObject *parent = nullptr);


    Q_PROPERTY(QStringList imagesList READ imagesList WRITE setImagesList NOTIFY imagesListChanged)
    QStringList imagesList();
    void setImagesList(QStringList value);
    Q_SIGNAL void imagesListChanged();

    Q_PROPERTY(int photoCounter READ photoCounter WRITE setPhotoCounter NOTIFY photoCounterChanged)

    int photoCounter() {return _photoCounter;}
    void setPhotoCounter(int value);
    Q_SIGNAL void photoCounterChanged();

    Q_PROPERTY(QString imagesPath READ imagesPath WRITE setImagesPath NOTIFY imagesPathChanged)
    QString imagesPath();
    void setImagesPath(QString value);
    Q_SIGNAL void imagesPathChanged();

    Q_PROPERTY(QString selectedImagePath READ selectedImagePath WRITE setSelectedImagePath NOTIFY selectedImagePathChanged)
    QString selectedImagePath();
    void setSelectedImagePath(QString value);
    Q_SIGNAL void selectedImagePathChanged();

    // these signals trigger from QML part
signals:
    void btnCaptureClicked();
    void btnSendClicked();
    void radioBtnGalleryClicked();


private:
    QStringList _imagesList;
    int _photoCounter;
    QString _path;
    QString _selectedImagePath;


};

#endif // WEBCAMUI_H
