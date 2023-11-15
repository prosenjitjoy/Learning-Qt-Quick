#ifndef USERINTERACTOR_H
#define USERINTERACTOR_H

#include <QObject>

class UserInteractor : public QObject
{
    Q_OBJECT
public:
    explicit UserInteractor(QObject *parent = nullptr);
    void getInput();

    QString phrase() const;
    void setPhrase(const QString &newPhrase);

signals:
    void phraseTyped(const QString &phrase);
private:
    QString m_phrase;
};

#endif // USERINTERACTOR_H
