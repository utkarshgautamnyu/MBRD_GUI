#ifndef COMMUNICATION_H
#define COMMUNICATION_H

#include <QObject>
#include <QMouseEvent>

class communication : public QObject
{
    Q_OBJECT

public:
    communication();
signals:
    void sig();

public slots:
    void callMeFromQML();
};

#endif // COMMUNICATION_H
