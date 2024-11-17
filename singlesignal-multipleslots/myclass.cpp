#include "myclass.h"

#include <QDebug>
#include <QObject>

MyClass::MyClass(QObject *parent) : QObject{parent} {
    QObject::connect(this, &MyClass::signalX, this, &MyClass::slotA);
    QObject::connect(this, &MyClass::signalX, this, &MyClass::slotC);
    QObject::connect(this, &MyClass::signalX, this, &MyClass::slotB);
}

void MyClass::callSignal() {
    emit signalX();
}

void MyClass::slotA() {
    qDebug() << "Slot A called";
}

void MyClass::slotB() {
    qDebug() << "Slot B called";
}

void MyClass::slotC() {
    qDebug() << "Slot C called";
}
