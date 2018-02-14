#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtQuick/QQuickView>
#include "simulation.h"
#include "communication.h"

int main(int argc, char *argv[])
{

#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QApplication app(argc, argv);
    QQuickView view;
    //simulation* sim = new simulation(&view);
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl("../MBRD/main.qml"));
    view.show();

    QQuickView view1;
    view1.setResizeMode(QQuickView::SizeRootObjectToView);
    view1.setSource(QUrl("qrc:/main.qml"));
    communication comm(&view);
    view1.rootContext()->setContextProperty("communication", &comm);
    view1.show();

    return app.exec();
}
