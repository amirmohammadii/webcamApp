#include "WebCamHandler.h"

WebCamHandler::WebCamHandler(QSharedPointer<WebcamUi> _ui, QObject* parent):
    QObject(parent)
{
    _webcamui = _ui.data();
    _client = new MyClient(_ui);
    
    // ### connect signals and slots ### //
    connect(_webcamui , &WebcamUi::btnCaptureClicked, this , &WebCamHandler::onBtnCaptureClicked);
    connect(_webcamui , &WebcamUi::btnSendClicked, this , &WebCamHandler::onBtnSendClicked);

    QDir path = createPath();
    _webcamui->setImagesPath(path.absolutePath());
    QStringList  images =  readImages(path);
    _webcamui->setImagesList(images);
}

QStringList WebCamHandler::readImages(QDir dir)
{
    QStringList images = dir.entryList(QStringList() << "*.jpg" << "*.JPG", QDir::Files);
    return  images;
}

QDir WebCamHandler::createPath()
{
    QString path = "/home/amir/WebcamImages";
    QDir dir(path);
    if (!dir.exists())
    {
        dir.mkdir(".");
        dir.mkpath(path);
    }
    return dir;
}

void WebCamHandler::onBtnCaptureClicked()
{
    _webcamui->setPhotoCounter(_webcamui->photoCounter()+1);
    QStringList images = readImages(createPath());
    _webcamui->setImagesList(images);

}

void WebCamHandler::onBtnSendClicked()
{
    _client->sendData(_webcamui->selectedImagePath());
}
