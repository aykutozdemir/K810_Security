#include "PackageInterface.h"

PackageInterface::PackageInterface(PipedStream & plainStream, PipedStream & packagedStream)
    : p_plainStream(&plainStream), p_packagedStream(&packagedStream) {}

PipedStream & PackageInterface::getPackagedStream()
{
    return *p_packagedStream;
}

void PackageInterface::clear()
{
    if (p_plainStream)
    {
        p_plainStream->clear();
    }

    if (p_packagedStream)
    {
        p_packagedStream->clear();
    }
}

