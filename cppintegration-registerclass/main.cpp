#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "customobject.h"

int main(int argc, char *argv[]) {
  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;

  qmlRegisterType<BackendLogic>("Backend", 1, 0, "BackendLogic");

  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreationFailed, &app,
      []() { QCoreApplication::exit(-1); }, Qt::QueuedConnection);
  engine.loadFromModule("cppintegration-registerclass", "Main");

  return app.exec();
}
