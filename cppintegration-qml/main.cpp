#include <QGuiApplication>
#include <QQmlApplicationEngine>
// #include <QQmlContext>

// #include "cppbackend.h"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    // CPPBackend cppBackend;
    // qmlRegisterSingletonInstance("CPPBackend", 1, 0, "CPPBackend",
    //                              &cppBackend);

    // QQmlContext *context = engine.rootContext();
    // context->setContextProperty("cppBackend", &cppBackend);

    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreationFailed, &app,
        []() { QCoreApplication::exit(-1); }, Qt::QueuedConnection);
    engine.loadFromModule("cppintegration-qml", "Main");

    return app.exec();
}
