#ifndef CUSTOMOBJECT_H
#define CUSTOMOBJECT_H

#include <QObject>

class BackendLogic : public QObject {
  Q_OBJECT

 public:
  explicit BackendLogic(QObject *parent = nullptr) {
    Q_UNUSED(parent);
  }
  Q_INVOKABLE int getData() {
    return mValue;
  }

 private:
  int mValue = 77;
};

#endif // CUSTOMOBJECT_H
