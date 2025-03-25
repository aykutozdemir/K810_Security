# ArduinoMap Library

A lightweight, templated map implementation for Arduino and AVR microcontrollers. This library provides a dynamic key-value store that can work with any data type.

## Features

- Template-based implementation for type safety
- Dynamic memory allocation
- Iterator support for range-based for loops
- Copy constructor and assignment operator
- Memory efficient linked list implementation
- Thread-safe for single-threaded operations

## Installation

### Using Arduino Library Manager
1. Open Arduino IDE
2. Go to Sketch > Include Library > Manage Libraries
3. Search for "ArduinoMap"
4. Click Install

### Manual Installation
1. Download this repository as a ZIP file
2. Open Arduino IDE
3. Go to Sketch > Include Library > Add .ZIP Library
4. Select the downloaded ZIP file

## Usage

### Basic Usage

```cpp
#include <ArduinoMap.h>

// Create a map with String keys and int values
ArduinoMap<String, int> map;

// Insert values
map.insert("hello", 42);
map.insert("world", 123);

// Get values
int* value = map.get("hello");
if (value) {
    Serial.println(*value);  // Prints: 42
}

// Remove values
map.remove("hello");

// Check size
Serial.println(map.size());

// Check if empty
if (map.empty()) {
    Serial.println("Map is empty");
}
```

### Using Iterators

```cpp
// Iterate through all key-value pairs
for (const auto& pair : map) {
    Serial.print(pair.first);   // key
    Serial.print(": ");
    Serial.println(pair.second); // value
}
```

### Different Data Types

The map can work with any data type that supports:
- Copy construction
- Assignment operator
- Equality comparison (==)

Example with different types:
```cpp
// String to int
ArduinoMap<String, int> stringMap;

// int to String
ArduinoMap<int, String> intMap;

// char to float
ArduinoMap<char, float> charMap;
```

## Memory Considerations

- Each key-value pair requires memory for the node structure and the stored data
- Memory is allocated dynamically as needed
- Memory is freed when items are removed or the map is cleared
- The map uses a linked list implementation, so memory fragmentation is minimal

## Limitations

- No automatic reordering or balancing (uses simple linked list)
- Linear search time (O(n))
- Memory overhead per entry (pointer + node structure)

## Example

See the examples folder for complete examples showing various use cases.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This library is open source and available under the MIT License.

## Support

If you find any bugs or have feature requests, please open an issue on GitHub. 