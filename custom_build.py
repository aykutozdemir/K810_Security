Import("env")

# Append the '-Wno-unused-parameter' flag to the build environment for AVR core
env.Append(CXXFLAGS=["-Wno-unused-parameter"] if "arduino" in env.get("PIOFRAMEWORK", []) else [])

# Append C++ specific flags
cpp_flags = ["-fno-rtti", "-fno-threadsafe-statics"]
env.Append(CXXFLAGS=cpp_flags) 