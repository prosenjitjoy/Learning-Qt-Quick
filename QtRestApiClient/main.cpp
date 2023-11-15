#include <QGuiApplication>
#include <QIcon>
#include <QQmlApplicationEngine>
#include "PlayerController.h"
#include "AudioSearchModel.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setWindowIcon(QIcon(":/QtRestApiClient/assets/icons/music.svg"));

    QQmlApplicationEngine engine;

    PlayerController *playerController = new PlayerController(&app);
    qmlRegisterSingletonInstance("PlayerController", 1, 0, "PlayerController", playerController);

    AudioSearchModel *audioSearchModel = new AudioSearchModel(&app);
    qmlRegisterSingletonInstance("AudioSearchModel", 1, 0, "AudioSearchModel", audioSearchModel);

    const QUrl url(u"qrc:/QtRestApiClient/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
