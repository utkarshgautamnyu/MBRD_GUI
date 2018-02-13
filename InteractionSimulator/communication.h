#ifndef COMMUNICATION_H
#define COMMUNICATION_H

#include <QObject>
#include "simulation.h"

class communication : public QObject
{
    Q_OBJECT
public:
    communication(QQuickView*);
    simulation* sim;
public slots:
    // Slot called from QML
    void generateEvent(int eventCode, int mouseX, int mouseY, int wheelAngle);  
};

#endif // COMMUNICATION_H
