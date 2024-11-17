#include "cppbackend.h"

CPPBackend::CPPBackend(QObject *parent) : QObject{parent} {
}

void CPPBackend::receiveFromQml() {
    // we increase the counter and send a signal with new value
    ++m_counter;
    // emit sendToQml(m_counter);
    emit counterChanged(m_counter);
}

int CPPBackend::counter() const {
    return m_counter;
}

void CPPBackend::setCounter(int counter) {
    if (m_counter == counter) {
        return;
    }

    m_counter = counter;
    emit counterChanged(m_counter);
}
