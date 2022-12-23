#include "WebcamUi.h"
#include <QtDebug>
WebcamUi::WebcamUi(QObject *parent ):
    QObject(parent),
    _photoCounter{0}
{
}

QStringList WebcamUi::imagesList()
{
    return _imagesList;
}

void WebcamUi::setImagesList(QStringList value)
{
        _imagesList = value;
        emit imagesListChanged();
}

void WebcamUi::setPhotoCounter(int value)
{
    if (_photoCounter != value)
        _photoCounter = value;
    emit photoCounterChanged();
}

QString WebcamUi::imagesPath()
{
    return this->_path;
}

void WebcamUi::setImagesPath(QString value)
{
    this->_path = value;
    emit imagesPathChanged();
}

QString WebcamUi::selectedImagePath()
{
    return this->_selectedImagePath;
}

void WebcamUi::setSelectedImagePath(QString value)
{
    _selectedImagePath = value;
    emit selectedImagePathChanged();
}
