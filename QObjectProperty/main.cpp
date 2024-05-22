#include <QCoreApplication>
#include "userinteractor.h"
#include "firefox.h"
#include "internetexplorer.h"
#include <QVariant>
#include <QDebug>


int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    UserInteractor interactor;
    Firefox firefox;
    InternetExplorer internetExplorer;

    firefox.setProperty("version", "1.2.3");

    QObject::connect(&interactor, &UserInteractor::phraseTyped, &a, [&]() {
        QObject *obj = &interactor;
        qDebug() << obj->property("phrase");
        qDebug() << firefox.property("version");
    });

    interactor.getInput();

    return a.exec();
}
