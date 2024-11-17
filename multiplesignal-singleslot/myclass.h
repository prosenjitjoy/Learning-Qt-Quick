#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>

class MyClass : public QObject {
    Q_OBJECT

  public:
    explicit MyClass(QObject *parent = nullptr);
    ~MyClass();
    void callSignal();

  signals:
    void signalA(QString);
    void signalB(QString);
    void signalC(QString);

  public slots:
    void slotX(QString);
};

#endif  // MYCLASS_H
