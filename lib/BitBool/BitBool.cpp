/**
 * @file BitBool.cpp
 * @brief Implementation of the BitBool library.
 *
 * This file contains the implementation details for the BitBool library,
 * including the lookup tables for bit masks.
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

#include <BitBool.h>

/**
 * @brief Lookup table for BitRef with normal bit order (LSB first).
 *
 * This array contains bit masks for each bit position in a byte (1, 2, 4, 8, etc.).
 */
template <>
const uint8_t BitRef<false>::shift[8] = {1, 2, 4, 8, 16, 32, 64, 128};

/**
 * @brief Lookup table for BitRef with reversed bit order (MSB first).
 *
 * This array contains bit masks for each bit position in a byte in reverse order (128, 64, 32, etc.).
 */
template <>
const uint8_t BitRef<true>::shift[8] = {128, 64, 32, 16, 8, 4, 2, 1};
