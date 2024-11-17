#ifndef CPPBACKEND_H
#define CPPBACKEND_H

#include <qqmlintegration.h>

#include <QMouseEvent>
#include <QObject>

class CPPBackend : public QObject {
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
    Q_PROPERTY(int counter READ counter WRITE setCounter NOTIFY
                   counterChanged FINAL)

  public:
    explicit CPPBackend(QObject *parent = nullptr);
    // Q_INVOKABLE void receiveFromQml();

    int counter() const;
    void setCounter(int counter);

  signals:
    // void sendToQml(int);
    void counterChanged(int counter);

  private:
    int m_counter = 0;

  public slots:
    void receiveFromQml();
};

#endif // CPPBACKEND_H
