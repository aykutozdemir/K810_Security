#ifndef DEFAULT_PACKAGE_INTERFACE_H
#define DEFAULT_PACKAGE_INTERFACE_H

#include "PackageInterface.h"

class DefaultPackageInterface : public PackageInterface
{
public:
    DefaultPackageInterface(PipedStream & plainStream);
    virtual void loop() override;
};

#endif // DEFAULT_PACKAGE_INTERFACE_H