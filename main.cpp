#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtQml>
#include "mysqlhandler.h"
#include "serialhandler.h"
#include <QQuickStyle>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);


    qmlRegisterType<Mysqlhandler>("com.mysqlhandler", 1, 0, "Mysqlhandler");
    qmlRegisterType<SerialHandler>("com.serialhandler", 1, 0, "SerialHandler");
    QQmlApplicationEngine engine;

    QQuickStyle::setStyle("Material");
    Mysqlhandler mysqlHandler;
    SerialHandler serialHandler;
    engine.rootContext()->setContextProperty("mysqlHandler", &mysqlHandler);
    engine.rootContext()->setContextProperty("serialHandler", &serialHandler);

    QPM_INIT(engine);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
