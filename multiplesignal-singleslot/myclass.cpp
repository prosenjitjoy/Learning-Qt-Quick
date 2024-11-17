#include "myclass.h"

#include <QDebug>
#include <QObject>

MyClass::MyClass(QObject *parent) : QObject{parent} {
    QObject::connect(this, &MyClass::signalA, this, &MyClass::slotX);
    QObject::connect(this, &MyClass::signalB, this, &MyClass::slotX);
    QObject::connect(this, &MyClass::signalC, this, &MyClass::slotX);
    emit signalA("Constructor");
}

MyClass::~MyClass() {
    emit signalC("Destructor");
}

void MyClass::callSignal() {
    // emit signalA();
    emit signalB("Explicit call");
    // emit signalC();
}

void MyClass::slotX(QString str) {
    qDebug() << "Slot X called by:" << str;
}
