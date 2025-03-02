#include "DefaultPackageInterface.h"

DefaultPackageInterface::DefaultPackageInterface(PipedStream & plainStream)
    : PackageInterface(plainStream, plainStream)
{
}

void DefaultPackageInterface::loop()
{
    // No operation
}