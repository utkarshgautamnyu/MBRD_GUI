#ifndef SHAREDMEMORYRECEIVER_H
#define SHAREDMEMORYRECEIVER_H

#include <qsharedmemory.h>

class SharedMemoryReceiver
{
public:
    SharedMemoryReceiver();

public slots:
  void loadFromSharedMemory();
  void triggerLoad();

private:
  QSharedMemory sharedMemory;

};

#endif // SHAREDMEMORYRECEIVER_H
