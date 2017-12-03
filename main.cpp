#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtQml>
#include "mysqlhandler.h"
#include "serialhandler.h"
#include "sockethandler.h"

#include <QQuickStyle>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQuickStyle::setStyle("Material");

    qmlRegisterType<Mysqlhandler>("com.mysqlhandler", 1, 0, "Mysqlhandler");
    qmlRegisterType<SerialHandler>("com.serialhandler", 1, 0, "SerialHandler");
    qmlRegisterType<SocketHandler>("com.sockethandler", 1, 0, "SocketHandler");
    QQmlApplicationEngine engine;

    Mysqlhandler mysqlHandler;
    SerialHandler serialHandler;
    SocketHandler socketHandler;
    engine.rootContext()->setContextProperty("mysqlHandler", &mysqlHandler);
    engine.rootContext()->setContextProperty("serialHandler", &serialHandler);
    engine.rootContext()->setContextProperty("socketHandler", &socketHandler);

    QPM_INIT(engine);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
