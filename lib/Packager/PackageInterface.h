#ifndef PACKAGE_INTERFACE_H
#define PACKAGE_INTERFACE_H

#include "PipedStream.h"
#include <stdint.h>

class PackageInterface
{
public:
    PackageInterface(PipedStream & plainStream, PipedStream & packagedStream);

    PipedStream & getPackagedStream();

    void clear();

    virtual void loop() = 0;

protected:
    PipedStream *p_plainStream;
    PipedStream *p_packagedStream;
};

#endif // PACKAGE_INTERFACE_H