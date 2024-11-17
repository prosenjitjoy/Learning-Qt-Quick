#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "someclass.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    SomeClass testClass;

    QQmlApplicationEngine engine;
    QQmlContext *rootContext = engine.rootContext();
    rootContext->setContextProperty("radius", 50);
    rootContext->setContextProperty("classA", &testClass);

    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreationFailed, &app,
        []() { QCoreApplication::exit(-1); }, Qt::QueuedConnection);
    engine.loadFromModule("Cppintegration", "Main");

    return app.exec();
}
