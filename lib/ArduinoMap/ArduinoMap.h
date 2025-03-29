#ifndef ARDUINO_MAP_H
#define ARDUINO_MAP_H

#include <Arduino.h>
#include "Pair.h"

template <typename KeyType, typename ValueType>
class ArduinoMap
{
private:
    // Node structure for the map
    struct Node
    {
        KeyType key;
        ValueType value;
        Node *next;

        Node(const KeyType &k, const ValueType &v) : key(k), value(v), next(nullptr) {}
    };

    Node *head;
    size_t mapSize;

public:
    // Constructor
    ArduinoMap() : head(nullptr), mapSize(0) {}

    // Destructor
    ~ArduinoMap()
    {
        clear();
    }

    // Copy constructor
    ArduinoMap(const ArduinoMap &other) : head(nullptr), mapSize(0)
    {
        Node *current = other.head;
        while (current)
        {
            insert(current->key, current->value);
            current = current->next;
        }
    }

    // Assignment operator
    ArduinoMap &operator=(const ArduinoMap &other)
    {
        if (this != &other)
        {
            clear();
            Node *current = other.head;
            while (current)
            {
                insert(current->key, current->value);
                current = current->next;
            }
        }
        return *this;
    }

    // Insert a key-value pair into the map
    bool insert(const KeyType &key, const ValueType &value)
    {
        // Check if key already exists
        Node *current = head;
        while (current)
        {
            if (current->key == key)
            {
                // Update existing value
                current->value = value;
                return true;
            }
            current = current->next;
        }

        // Create new node
        Node *new_node = new Node(key, value);
        if (!new_node)
            return false;

        // Insert at the beginning
        new_node->next = head;
        head = new_node;
        mapSize++;

        return true;
    }

    // Get value by key
    ValueType *get(const KeyType &key)
    {
        Node *current = head;
        while (current)
        {
            if (current->key == key)
            {
                return &(current->value);
            }
            current = current->next;
        }
        return nullptr;
    }

    // Remove a key-value pair from the map
    bool remove(const KeyType &key)
    {
        Node *current = head;
        Node *prev = nullptr;

        while (current)
        {
            if (current->key == key)
            {
                if (prev)
                {
                    prev->next = current->next;
                }
                else
                {
                    head = current->next;
                }

                delete current;
                mapSize--;
                return true;
            }

            prev = current;
            current = current->next;
        }

        return false;
    }

    // Clear all entries from the map
    void clear()
    {
        Node *current = head;
        while (current)
        {
            Node *next = current->next;
            delete current;
            current = next;
        }
        head = nullptr;
        mapSize = 0;
    }

    // Get the size of the map
    size_t size() const
    {
        return mapSize;
    }

    // Check if map is empty
    bool empty() const
    {
        return mapSize == 0;
    }

    // Iterator support
    class Iterator
    {
    private:
        Node *current;

    public:
        explicit Iterator(Node *node) : current(node) {}

        Iterator &operator++()
        {
            if (current)
                current = current->next;
            return *this;
        }

        bool operator!=(const Iterator &other) const
        {
            return current != other.current;
        }

        Pair<KeyType, ValueType> operator*()
        {
            return Pair<KeyType, ValueType>(current->key, current->value);
        }
    };

    Iterator begin() { return Iterator(head); }
    Iterator end() { return Iterator(nullptr); }

    // ConstIterator support
    class ConstIterator
    {
    private:
        const Node *current;

    public:
        explicit ConstIterator(const Node *node) : current(node) {}

        ConstIterator &operator++()
        {
            if (current)
                current = current->next;
            return *this;
        }

        bool operator!=(const ConstIterator &other) const
        {
            return current != other.current;
        }

        Pair<KeyType, ValueType> operator*() const
        {
            return Pair<KeyType, ValueType>(current->key, current->value);
        }
    };

    ConstIterator cbegin() const { return ConstIterator(head); }
    ConstIterator cend() const { return ConstIterator(nullptr); }
};

#endif // ARDUINO_MAP_H