/**
 * @file BitBool.h
 * @brief Bit-level boolean manipulation library.
 *
 * This library provides utilities for manipulating individual bits within data types,
 * allowing efficient bit-level operations with a clean interface.
 *
 * @author Christopher Andrews
 * @author Modified by Aykut ÖZDEMİR
 * @date 2025
 * @license MIT
 * @see http://arduino.land/Code/BitBool/
 */

/*
    The MIT License (MIT)

    Copyright (c) 2012-2015 Christopher Andrews
    http://arduino.land/Code/BitBool/

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
*/

#ifndef HEADER_BITBOOL
#define HEADER_BITBOOL

#include <stdint.h> //uintX_t types
#include <stddef.h> //size_t

/**
 * @brief Defines options for bit and byte order reversing.
 */
enum REVERSE_OPTIONS
{
    REVERSE_NONE,                  ///< This will read data as big endian
    REVERSE_BITS,                  ///< Bit index zero references MSB, instead of LSB
    REVERSE_BYTES,                 ///< Byte index zero references sizeof(T) - 1
    REVERSE_BOTH,                  ///< This will read data as little endian
    REVERSE_DEFAULT = REVERSE_NONE ///< Default is no reversing
};

#define REVERSE_BITS_MASK 0x01
#define REVERSE_BYTES_MASK 0x02

/**
 * @brief Class that provides a reference to a specific bit within a byte.
 *
 * This class allows accessing and manipulating individual bits as if they were
 * boolean values, providing a more intuitive interface for bit operations.
 *
 * @tparam reverse Bit/byte order options.
 */
template <uint8_t reverse = REVERSE_DEFAULT>
struct BitRef
{
    /**
     * @brief Construct a BitRef using dynamically calculated offsets.
     *
     * @param dataRef Reference to the byte containing the bit
     * @param idx Index of the bit to access
     */
    BitRef(uint8_t &dataRef, const uint8_t idx) : data(dataRef),
                                                  index((reverse & REVERSE_BITS_MASK) ? (0x80 >> idx) : (0x1 << idx))
    {
        return;
    }

    /**
     * @brief Construct a BitRef using a lookup table for bit masks.
     *
     * @param dataRef Reference to the byte containing the bit
     * @param idx Index of the bit to access
     * @param lookupTable If true, use a lookup table for the bit masks
     */
    BitRef(uint8_t &dataRef, const uint8_t idx, bool lookupTable) : data(dataRef),
                                                                    index(shift[idx])
    {
        return;
    }

    /**
     * @brief Implicit conversion to boolean value.
     *
     * @return true if the bit is set, false otherwise
     */
    operator bool() const { return data & index; }

    /**
     * @brief Assignment operator for BitRef values.
     *
     * @param copy The BitRef to copy the value from
     * @return The boolean value that was set
     */
    bool operator=(const BitRef &copy) const { return *this = (const bool)copy; }

    /**
     * @brief Assignment operator for boolean values.
     *
     * @param copy The boolean value to set
     * @return The boolean value that was set
     */
    bool operator=(const bool &copy) const
    {
        if (copy)
            data |= index;
        else
            data &= ~index;
        return copy;
    }

    /**
     * @brief Unconditionally inverts the referenced bit.
     */
    void invert() const { data ^= index; }

    uint8_t &data;                 ///< Reference to byte being accessed.
    uint8_t const index;           ///< Bit mask for the bit to access.
    static const uint8_t shift[8]; ///< Lookup table for bit shifts.
};

/**
 * @brief Helper class for wrapping numeric constants.
 */
struct NumType
{
    /**
     * @brief Constructs a NumType with a numeric value.
     *
     * @param num The numeric value
     */
    constexpr explicit NumType(size_t num) : value(num) {}

    /**
     * @brief Conversion operator to size_t.
     *
     * @return The stored value
     */
    constexpr operator size_t() { return value; }

    size_t value; ///< The stored numeric value
};

/**
 * @brief Class providing bit-level access to arrays of data.
 *
 * This template class allows treating arrays of data as arrays of bits,
 * providing random access to individual bits regardless of byte boundaries.
 *
 * @tparam count Number of bits required in the array
 * @tparam reverse See REVERSE_OPTIONS, default is no reverse
 * @tparam lookUp If true, a lookup table is utilized
 */
template <size_t count, uint8_t reverse = REVERSE_DEFAULT, bool lookUp = false>
struct BitBool
{
    /**
     * @brief Data size constants.
     */
    enum
    {
        bitCount = count,                                             ///< Total number of bits
        byteCount = (bitCount / 0x8) + ((bitCount % 0x8) ? 0x1 : 0x0) ///< Number of bytes needed
    };

    /**
     * @brief Iterator for looping through bits.
     */
    struct bIterator
    {
        /**
         * @brief Constructs an iterator with owner and index.
         *
         * @param o The BitBool object to iterate over
         * @param i The starting index
         */
        bIterator(BitBool &o, uint16_t i) : owner(o), idx(i) {}

        BitBool &owner; ///< Reference to the BitBool being iterated
        uint16_t idx;   ///< Current index in the iteration

        /**
         * @brief Inequality comparison operator.
         *
         * @param b The iterator to compare with
         * @return true if iterators are not equal
         */
        bool operator!=(const bIterator &b) { return b.idx != idx; }

        /**
         * @brief Pre-increment operator.
         *
         * @return Reference to this iterator after incrementing
         */
        bIterator &operator++() { return ++idx, *this; }

        /**
         * @brief Dereference operator.
         *
         * @return BitRef to the current bit
         */
        BitRef<reverse> operator*() { return owner[idx]; }
    };

    /**
     * @brief Proxy for arbitrary range iterations.
     */
    struct anyIterator
    {
        /**
         * @brief Constructs a range iterator.
         *
         * @param o The BitBool object
         * @param s Start index
         * @param f Finish index
         */
        anyIterator(BitBool &o, uint16_t s, uint16_t f) : owner(o), start(s), finish(f) {}

        /**
         * @brief Gets the beginning iterator.
         *
         * @return Iterator to the start of the range
         */
        bIterator begin() { return bIterator(owner, start); }

        /**
         * @brief Gets the ending iterator.
         *
         * @return Iterator to the end of the range
         */
        bIterator end() { return bIterator(owner, finish); }

        BitBool &owner;  ///< Reference to the BitBool
        uint16_t start;  ///< Start index
        uint16_t finish; ///< Finish index
    };

    /**
     * @brief Gets an iterator to the beginning of the BitBool.
     *
     * @return Iterator to the first bit
     */
    bIterator begin() { return bIterator(*this, 0); }

    /**
     * @brief Gets an iterator to the end of the BitBool.
     *
     * @return Iterator past the last bit
     */
    bIterator end() { return bIterator(*this, count); }

    /**
     * @brief Creates an iterator for the full range.
     *
     * @return Iterator for the full range
     */
    anyIterator iterate() { return anyIterator(*this, 0, count); }

    /**
     * @brief Creates an iterator starting at a specific index.
     *
     * @param start The start index
     * @return Iterator from start to the end
     */
    anyIterator iterate(uint16_t start) { return anyIterator(*this, start, count); }

    /**
     * @brief Creates an iterator for a specific range.
     *
     * @param start The start index
     * @param length The number of bits to iterate
     * @return Iterator for the specified range
     */
    anyIterator iterate(uint16_t start, uint16_t length) { return anyIterator(*this, start, start + length); }

    /**
     * @brief Access operator to get a reference to a specific bit.
     *
     * @param index The bit index to access
     * @return Reference to the specified bit
     */
    BitRef<reverse> operator[](const uint16_t index)
    {
        const uint16_t offset = (reverse & REVERSE_BYTES_MASK) ? (byteCount - 1) - (index >> 0x3) : (index >> 0x3);
        if (lookUp)
            return BitRef<reverse>(data[offset], index & 0x7, true);
        else
            return BitRef<reverse>(data[offset], index & 0x7);
    }

    /**
     * @brief Gets the value of a bit.
     *
     * @param index The bit index to read
     * @return true if the bit is set, false otherwise
     */
    bool get(uint16_t index) { return (*this)[index]; }

    /**
     * @brief Sets the value of a bit.
     *
     * @param index The bit index to write
     * @param value The value to set
     */
    void set(uint16_t index, bool value) { return (*this)[index] = value; }

    uint8_t data[byteCount]; ///< The underlying byte array
};

#define TBITS (sizeof(T) * 8)

/**
 * @brief Converts any object to a BitBool reference.
 *
 * @tparam reverse Reverse option for bit/byte order
 * @tparam lookUp Whether to use lookup table
 * @tparam T Type of the object
 * @param t The object to convert
 * @return BitBool reference to the object's memory
 */
template <uint8_t reverse, bool lookUp, typename T>
inline BitBool<TBITS, reverse, lookUp> &toBitBool(T &t)
{
    union
    {
        T *_t;
        BitBool<TBITS, reverse, lookUp> *_u;
    } _t = {&t};
    return *_t._u;
}

/**
 * @brief Converts any object to a BitBool reference without lookup table.
 *
 * @tparam reverse Reverse option for bit/byte order
 * @tparam T Type of the object
 * @param t The object to convert
 * @return BitBool reference to the object's memory
 */
template <uint8_t reverse, typename T>
inline BitBool<TBITS, reverse, false> &toBitBool(T &t)
{
    return toBitBool<reverse, false, T>(t);
}

/**
 * @brief Converts any object to a BitBool reference with default options.
 *
 * @tparam T Type of the object
 * @param t The object to convert
 * @return BitBool reference to the object's memory
 */
template <typename T>
inline BitBool<TBITS, false, false> &toBitBool(T &t)
{
    return toBitBool<REVERSE_DEFAULT, false, T>(t);
}

/**
 * @brief References a single bit inside an object.
 *
 * @tparam reverse Reverse option for bit/byte order
 * @tparam lookUp Whether to use lookup table
 * @tparam T Type of the object
 * @param t The object containing the bit
 * @param bit The bit index to reference
 * @return BitRef to the specified bit
 */
template <uint8_t reverse, bool lookUp, typename T>
inline BitRef<reverse> toBitRef(T &t, uint16_t bit)
{
    return toBitBool<reverse, lookUp>(t)[bit];
}

/**
 * @brief References a single bit inside an object without lookup table.
 *
 * @tparam reverse Reverse option for bit/byte order
 * @tparam T Type of the object
 * @param t The object containing the bit
 * @param bit The bit index to reference
 * @return BitRef to the specified bit
 */
template <uint8_t reverse, typename T>
inline BitRef<reverse> toBitRef(T &t, uint16_t bit)
{
    return toBitRef<reverse, false>(t, bit);
}

/**
 * @brief References a single bit inside an object with default options.
 *
 * @tparam T Type of the object
 * @param t The object containing the bit
 * @param bit The bit index to reference
 * @return BitRef to the specified bit
 */
template <typename T>
inline BitRef<REVERSE_DEFAULT> toBitRef(T &t, uint16_t bit)
{
    return toBitRef<REVERSE_DEFAULT, false>(t, bit);
}

#undef TBITS
#undef REVERSE_BITS_MASK
#undef REVERSE_BYTES_MASK
#endif