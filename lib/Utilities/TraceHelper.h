// ------------------------
// Logging Macros
// ------------------------

/**
 * @brief Lightweight logging macros for optimized log control.
 *
 * These macros resolve at compile time and eliminate overhead
 * when logging levels are below the threshold.
 */

// Dynamic (instance-based) logging
#undef TRACE_ERROR
#if (CLASS_TRACE_LEVEL >= TRACE_LEVEL_ERROR)
#define TRACE_ERROR() printError(__LINE__)
#else
#define TRACE_ERROR() dummyPrinter
#endif

#undef TRACE_WARN
#if (CLASS_TRACE_LEVEL >= TRACE_LEVEL_WARN)
#define TRACE_WARN() printWarn(__LINE__)
#else
#define TRACE_WARN() dummyPrinter
#endif

#undef TRACE_INFO
#if (CLASS_TRACE_LEVEL >= TRACE_LEVEL_INFO)
#define TRACE_INFO() printInfo(__LINE__)
#else
#define TRACE_INFO() dummyPrinter
#endif

#undef TRACE_DEBUG
#if (CLASS_TRACE_LEVEL >= TRACE_LEVEL_DEBUG)
#define TRACE_DEBUG() printDebug(__LINE__)
#else
#define TRACE_DEBUG() dummyPrinter
#endif

#undef TRACE_TRACE
#if (CLASS_TRACE_LEVEL >= TRACE_LEVEL_TRACE)
#define TRACE_TRACE() printTrace(__LINE__)
#else
#define TRACE_TRACE() dummyPrinter
#endif

// Static (per-function) logging with compile-time optimization
#undef TRACE_ERROR_STATIC
#if (CLASS_TRACE_LEVEL >= TRACE_LEVEL_ERROR)
#define TRACE_ERROR_STATIC(functionName) Traceable(functionName, static_cast<Level>(CLASS_TRACE_LEVEL)).printError(__LINE__)
#else
#define TRACE_ERROR_STATIC(functionName) dummyPrinter
#endif

#undef TRACE_WARN_STATIC
#if (CLASS_TRACE_LEVEL >= TRACE_LEVEL_WARN)
#define TRACE_WARN_STATIC(functionName) Traceable(functionName, static_cast<Level>(CLASS_TRACE_LEVEL)).printWarn(__LINE__)
#else
#define TRACE_WARN_STATIC(functionName) dummyPrinter
#endif

#undef TRACE_INFO_STATIC
#if (CLASS_TRACE_LEVEL >= TRACE_LEVEL_INFO)
#define TRACE_INFO_STATIC(functionName) Traceable(functionName, static_cast<Level>(CLASS_TRACE_LEVEL)).printInfo(__LINE__)
#else
#define TRACE_INFO_STATIC(functionName) dummyPrinter
#endif

#undef TRACE_DEBUG_STATIC
#if (CLASS_TRACE_LEVEL >= TRACE_LEVEL_DEBUG)
#define TRACE_DEBUG_STATIC(functionName) Traceable(functionName, static_cast<Level>(CLASS_TRACE_LEVEL)).printDebug(__LINE__)
#else
#define TRACE_DEBUG_STATIC(functionName) dummyPrinter
#endif

#undef TRACE_TRACE_STATIC
#if (CLASS_TRACE_LEVEL >= TRACE_LEVEL_TRACE)
#define TRACE_TRACE_STATIC(functionName) Traceable(functionName, static_cast<Level>(CLASS_TRACE_LEVEL)).printTrace(__LINE__)
#else
#define TRACE_TRACE_STATIC(functionName) dummyPrinter
#endif