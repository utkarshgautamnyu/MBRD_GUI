#include "communication.h"
#include "simulation.h"

communication::communication(QQuickView* view) {
    // set new simulation object with QQuickView object
    sim = new simulation(view);
}

// slot called from QML
void communication::generateEvent(int eventCode, int mouseX, int mouseY, int wheelAngle) {

    // Trigger event simulation and Post to target QML
    sim->simulateAndPostEvent(eventCode, mouseX, mouseY, wheelAngle);
}
