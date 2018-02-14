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
    int initialDiffX = 0;
    int initialDiffY = 0;
    int initialAngle = 0;
    int tapCount = 0;
    int initialX;
    int initialY;
public slots:
    // Slot called from QML
    void generateEvent(int eventCode, int mouseX, int mouseY, int wheelAngle);
    void generateTouchEvent(int t1X, int t1Y, int t2X, int t2Y);
    void detectDoubleTap (int x, int y);
};

#endif // COMMUNICATION_H
