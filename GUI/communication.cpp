#include "communication.h"

communication::communication()
{

}

void communication::callMeFromQML() {
    qDebug("Hello");
    //QMouseEvent* event;

    //QMouseEvent* event(QEvent::MouseButtonPress, pos, 0, 0, 0);
    //QApplication::sendEvent(mainWindow, &event);


    emit(sig());

}
