#ifndef SOMECLASS_H
#define SOMECLASS_H

#include <QObject>

class SomeClass : public QObject {
  Q_OBJECT
 public:
  explicit SomeClass(QObject *parent = nullptr);
  Q_INVOKABLE void printline();

 signals:
 public slots:
  void callMe();
};

#endif  // SOMECLASS_H
