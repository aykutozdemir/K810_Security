#include <ArduinoMap.h>

void setup()
{
    Serial.begin(9600);
    while (!Serial)
    {
        ; // Wait for serial port to connect
    }

    Serial.println(F("ArduinoMap Library Example"));
    Serial.println(F("========================"));

    // Example 1: String to int map
    Serial.println(F("\n1. String to int map:"));
    ArduinoMap<String, int> stringMap;

    // Insert some values
    stringMap.insert("one", 1);
    stringMap.insert("two", 2);
    stringMap.insert("three", 3);

    // Get values
    int *value = stringMap.get("two");
    if (value)
    {
        Serial.print(F("Value for 'two': "));
        Serial.println(*value);
    }

    // Example 2: int to String map
    Serial.println(F("\n2. int to String map:"));
    ArduinoMap<int, String> intMap;

    // Insert values
    intMap.insert(1, "First");
    intMap.insert(2, "Second");
    intMap.insert(3, "Third");

    // Iterate through the map
    Serial.println(F("Iterating through intMap:"));
    for (const auto &pair : intMap)
    {
        Serial.print(F("Key: "));
        Serial.print(pair.first);
        Serial.print(F(", Value: "));
        Serial.println(pair.second);
    }

    // Example 3: char to float map
    Serial.println(F("\n3. char to float map:"));
    ArduinoMap<char, float> charMap;

    // Insert values
    charMap.insert('A', 1.23f);
    charMap.insert('B', 4.56f);
    charMap.insert('C', 7.89f);

    // Remove a value
    charMap.remove('B');

    // Check size
    Serial.print(F("Size of charMap: "));
    Serial.println(charMap.size());

    // Check if empty
    Serial.print(F("Is charMap empty? "));
    Serial.println(charMap.empty() ? F("Yes") : F("No"));

    Serial.println(F("\nExample complete!"));
}

void loop()
{
    // Nothing to do in the loop
    delay(1000);
}