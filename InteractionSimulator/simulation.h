#ifndef SIMULATION_H
#define SIMULATION_H

#include <QtCore>

class QQuickView;
class simulation : public QObject
{
    Q_OBJECT

public:
    explicit simulation(QQuickView* viewer = 0);

public slots:
    void simulateAndPostEvent(int eventCode, int mouseX, int mouseY, int wheelAngle);

protected:
    void postEvent(int x, int y, int gesture_code, int wheelAngle);

    QQuickView* m_viewer;
    int initialX;
    int initialY;
};

#endif // SIMULATION_H
