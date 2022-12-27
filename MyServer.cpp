#include "MyServer.h"

MyServer::MyServer(QObject* parent):
    QObject(parent)
{
_server = new QTcpServer(this);
_socket = new QTcpSocket(this);
//connect(server, &QTcpServer::newConnection, this, &MyServer::newConnection);
connect(_server, SIGNAL(newConnection()), this, SLOT(newConnection()));

if(!_server->listen(QHostAddress::Any, 1234))
{
    qDebug() << "Server could not start!";
}
else
{
    qDebug() << "Server started!";
}
}

MyServer::~MyServer()
{
    delete _server;
    delete _socket;
}

void MyServer::newConnection()
{
    _socket = _server->nextPendingConnection();

    _socket->write("hello\r\n");
    _socket->flush();
    _socket->waitForBytesWritten(3000);
    _socket->close();
}
