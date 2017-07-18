#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtQml>
#include "mysqlhandler.h"
#include <QQuickStyle>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);


    qmlRegisterType<Mysqlhandler>("com.mysqlhandler", 1, 0, "Mysqlhandler");
    QQmlApplicationEngine engine;

    QQuickStyle::setStyle("Material");
    Mysqlhandler mysqlHandler;
    engine.rootContext()->setContextProperty("mysqlHandler", &mysqlHandler);

    QPM_INIT(engine);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
