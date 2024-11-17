#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>

class MyClass : public QObject {
    Q_OBJECT

  public:
    explicit MyClass(QObject *parent = nullptr);
    void callSignal();

  signals:
    void signalX();

  public slots:
    void slotA();
    void slotB();
    void slotC();
};

#endif // MYCLASS_H
