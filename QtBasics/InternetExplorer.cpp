#include "InternetExplorer.h"

InternetExplorer::InternetExplorer(QObject *parent)
    : QObject{parent}
{
    m_timer.setInterval(10000);
    m_timer.setSingleShot(true);
}

void InternetExplorer::browse()
{

}
