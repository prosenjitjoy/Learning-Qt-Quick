#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "myclass.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    MyClass myClass;
    myClass.callSignal();

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("singlesignal-multipleslots", "Main");

    return app.exec();
}
