#include "communication.h"
#include "simulation.h"
#include <QtGlobal>

communication::communication(QQuickView* view) {
    // set new simulation object with QQuickView object
    sim = new simulation(view);
}

// slot called from QML
void communication::generateEvent(int eventCode, int mouseX, int mouseY, int wheelAngle) {

    // Trigger event simulation and Post to target QML
    sim->simulateAndPostEvent(eventCode, mouseX, mouseY, wheelAngle);
}

void communication::generateTouchEvent(int t1X, int t1Y, int t2X, int t2Y) {
   int diffX = qAbs(t1X-t2X);
   int diffY = qAbs(t1Y-t2Y);

   if (diffX > initialDiffX || diffY > initialDiffY) {
       sim->simulateAndPostEvent(2, diffX/2,diffY/2, qMax(diffX,diffY));
   } else {
       sim->simulateAndPostEvent(2, diffX/2,diffY/2, -1 * qMax(diffX,diffY));
   }

   initialDiffX = diffX;
   initialDiffY = diffY;

   int denominator = (diffX == 0) ? 1 : diffX;

   int angle = diffY/denominator;

   if (qAbs(angle-initialAngle) > qAbs(diffX)) {
       if (angle > initialAngle) {
           sim->simulateAndPostEvent(4, diffX/2,diffY/2, angle*5);
       } else {
            sim->simulateAndPostEvent(4, diffX/2,diffY/2, -1 * angle*5);
       }
   }
   initialAngle = angle;

}

void communication::detectDoubleTap(int x, int y) {
    if (tapCount ==2) {
        if (qAbs(x-initialX) < 5 || qAbs(y-initialY)) {
            sim->simulateAndPostEvent(1,x,y,0);
        }
        tapCount = 0;
    } else {
        tapCount++;
        initialX = x;
        initialY = y;
    }
}
