#include "sharedmemoryreceiver.h"

#include <QBuffer>
#include <QDataStream>

SharedMemoryReceiver::SharedMemoryReceiver() : sharedMemory("MBRD")
{

}

void SharedMemoryReceiver::triggerLoad() {
    this->loadFromSharedMemory();
}
void SharedMemoryReceiver::loadFromSharedMemory() {
    if (!sharedMemory.attach()) {
        qDebug("Unable to attach to shared memory segment");
    }

    QBuffer buffer;
    QDataStream in(&buffer);
    //QVector<int> sharedMemoryPackage;
    QString sharedMemoryPackage;

    //sharedMemory.lock();
    buffer.setData((char*)sharedMemory.constData(), sharedMemory.size());
    buffer.open(QBuffer::ReadOnly);
    in >> sharedMemoryPackage;
    if (sharedMemoryPackage.size()>0)
        qDebug("Received");
    //qDebug(sharedMemoryPackage);
    sharedMemory.unlock();

    sharedMemory.detach();


}


