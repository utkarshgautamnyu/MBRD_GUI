#include "simulation.h"

#include <QtCore>
#include <QGuiApplication>
#include <QApplication>
#include <QtQuick/QQuickView>
#include <QGestureEvent>
#include <QPinchGesture>
#include <QtDebug>


simulation::simulation(QQuickView *viewer)
    : QObject(),
      m_viewer(viewer)
{}

void simulation::simulateAndPostEvent(int eventCode, int mouseX, int mouseY, int wheelAngle) {
    if(eventCode == 1) {
        QMouseEvent *dblTapEvent = new QMouseEvent(QEvent::MouseButtonDblClick, QPoint(mouseX, mouseY),
                                                  Qt::LeftButton, Qt::LeftButton, Qt::NoModifier
                                                  );
        QGuiApplication::postEvent(m_viewer, dblTapEvent);
        initialX = mouseX;
        initialY = mouseY;
    } else if(eventCode == 2) {
        QWheelEvent *zoomEvent = new QWheelEvent(QPoint(mouseX, mouseY),wheelAngle,Qt::LeftButton,
                                                 Qt::NoModifier);
        QGuiApplication::postEvent(m_viewer, zoomEvent);
    } else if(eventCode == 3) {
        QWheelEvent* tiltEvent = new QWheelEvent(QPoint(mouseX, mouseY),wheelAngle,Qt::LeftButton,Qt::ControlModifier);
        QGuiApplication::postEvent(m_viewer, tiltEvent);
    } else if(eventCode == 4) {
        QWheelEvent* rotateEvent = new QWheelEvent(QPoint(mouseX, mouseY),wheelAngle,Qt::LeftButton,Qt::ShiftModifier);
        QGuiApplication::postEvent(m_viewer, rotateEvent);
    } else if(eventCode == 5) {
        QMouseEvent *pressEvent = new QMouseEvent(QEvent::MouseButtonPress, QPoint(mouseX, mouseY),
                                                  Qt::LeftButton, Qt::LeftButton, Qt::NoModifier
                                                  );
        QGuiApplication::postEvent(m_viewer, pressEvent);
        initialX = mouseX;
        initialY = mouseY;
    } else {
        QMouseEvent *releaseEvent = new QMouseEvent(QEvent::MouseButtonRelease, QPoint(initialX, initialY),
                                                  Qt::LeftButton, Qt::LeftButton, Qt::NoModifier
                                                  );
        QGuiApplication::sendEvent(m_viewer, releaseEvent);
    }
}
