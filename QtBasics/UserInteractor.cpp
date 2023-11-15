#include "UserInteractor.h"
#include <QTextStream>
#include <QDebug>

UserInteractor::UserInteractor(QObject *parent) : QObject(parent) {}

void UserInteractor::getInput() {
    qDebug() << "\nType in your search phrase:\n";

    QTextStream s(stdin);
    const QString &phrase = s.readLine();

    if (!phrase.isEmpty()) {
        emit phraseTyped(phrase);
    }
}
