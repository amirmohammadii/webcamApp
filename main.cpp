#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include <WebcamUi.h>
#include <WebCamHandler.h>

int main(int argc, char *argv[])
{
//    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QSharedPointer<WebcamUi> _view;
    _view = QSharedPointer<WebcamUi>::create();
    WebCamHandler* _handler;
    _handler = new WebCamHandler(_view);
//    std::shared_ptr<WebCamHandler> _handler;
//    _handler.reset(new WebCamHandler(_view, this));


        QQuickView view;
    //    QQmlContext* rootContext = view.rootContext();
         view.rootContext()->setContextProperty("bridge", _view.data());
         view.setSource(QUrl("qrc:/main.qml"));
         view.show();
//    engine.rootContext()->setContextProperty("bridge" , _view.data());
//    engine.load(QUrl(("qrc:/main.qml")));


    
//    const QUrl url(QStringLiteral("qrc:/main.qml"));
//    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
//                     &app, [url](QObject *obj, const QUrl &objUrl) {
//        if (!obj && url == objUrl)
//            QCoreApplication::exit(-1);
//    }, Qt::QueuedConnection);
//    engine.load(url);


    return app.exec();
}
