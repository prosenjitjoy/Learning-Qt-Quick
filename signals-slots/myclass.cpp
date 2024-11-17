#include "myclass.h"

#include <QDebug>

int numOfTimes = 0;

MyClass::MyClass(QObject *parent) : QObject{parent} {
  QObject::connect(this, &MyClass::signalName, this,
                   &MyClass::slotName);
  emit signalName();
}

void MyClass::callSignal() {
  qDebug() << "Calling signal!";
  emit signalName();
}

void MyClass::slotName() {
  qDebug() << "Slot called" << ++numOfTimes;
}
