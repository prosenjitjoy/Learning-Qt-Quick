#include "someclass.h"

#include <QDebug>

SomeClass::SomeClass(QObject *parent) : QObject{parent} {
}

void SomeClass::printline() {
  qDebug() << "I'm exposed by Q_INVOCABLE\n";
}

void SomeClass::callMe() {
  qDebug() << "I'm beign called\n";
}
