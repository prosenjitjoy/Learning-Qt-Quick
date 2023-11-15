#include <QGuiApplication>
#include <QIcon>
#include <QQmlApplicationEngine>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setWindowIcon(QIcon(":/QtResourceSystem/assets/icons/music.svg"));

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/QtResourceSystem/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
