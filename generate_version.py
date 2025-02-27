import os
from SCons.Script import Import

# Import PlatformIO's build environment
Import("env")

VERSION_FILE = "version.txt"

def get_version():
    version = 0  # Default version if the file doesn't exist

    if os.path.exists(VERSION_FILE):
        try:
            with open(VERSION_FILE, "r") as f:
                version = int(f.read().strip())
        except (ValueError, IOError) as e:
            print(f"Warning: Could not read version file ({e}). Using default version 0.")

    # Increment version
    version += 1
    
    # Save new version
    try:
        with open(VERSION_FILE, "w") as f:
            f.write(str(version))
    except IOError as e:
        print(f"Error: Could not write to version file ({e}).")

    return version

# Generate build version
build_version = get_version()
print(f"Current build version: {build_version}")

# Append the build flag
env.Append(CPPDEFINES=[("BUILD_VERSION", str(build_version))])
