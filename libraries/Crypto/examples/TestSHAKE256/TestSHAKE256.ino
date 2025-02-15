/*
 * Copyright (C) 2016 Southern Storm Software, Pty Ltd.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

/*
This example runs tests on the SHAKE256 implementation to verify
correct behaviour.
*/

#include <Crypto.h>
#include <SHAKE.h>
#include <string.h>
#if defined(__AVR__)
#include <avr/pgmspace.h>
#else
#define PROGMEM
#define memcpy_P(d, s, l) memcpy((d), (s), (l))
#endif

#define MAX_HASH_DATA_SIZE 135
#define MAX_SHAKE_OUTPUT 256

struct TestHashVectorSHAKE
{
    const char *name;
    uint8_t data[MAX_HASH_DATA_SIZE];
    size_t dataLen;
    uint8_t hash[MAX_SHAKE_OUTPUT];
};

// Some test vectors from https://github.com/gvanas/KeccakCodePackage
static TestHashVectorSHAKE const testVectorSHAKE256_1 PROGMEM = {
    "SHAKE256 #1",
    {0},
    0,
    {0x46, 0xB9, 0xDD, 0x2B, 0x0B, 0xA8, 0x8D, 0x13,
     0x23, 0x3B, 0x3F, 0xEB, 0x74, 0x3E, 0xEB, 0x24,
     0x3F, 0xCD, 0x52, 0xEA, 0x62, 0xB8, 0x1B, 0x82,
     0xB5, 0x0C, 0x27, 0x64, 0x6E, 0xD5, 0x76, 0x2F,
     0xD7, 0x5D, 0xC4, 0xDD, 0xD8, 0xC0, 0xF2, 0x00,
     0xCB, 0x05, 0x01, 0x9D, 0x67, 0xB5, 0x92, 0xF6,
     0xFC, 0x82, 0x1C, 0x49, 0x47, 0x9A, 0xB4, 0x86,
     0x40, 0x29, 0x2E, 0xAC, 0xB3, 0xB7, 0xC4, 0xBE,
     0x14, 0x1E, 0x96, 0x61, 0x6F, 0xB1, 0x39, 0x57,
     0x69, 0x2C, 0xC7, 0xED, 0xD0, 0xB4, 0x5A, 0xE3,
     0xDC, 0x07, 0x22, 0x3C, 0x8E, 0x92, 0x93, 0x7B,
     0xEF, 0x84, 0xBC, 0x0E, 0xAB, 0x86, 0x28, 0x53,
     0x34, 0x9E, 0xC7, 0x55, 0x46, 0xF5, 0x8F, 0xB7,
     0xC2, 0x77, 0x5C, 0x38, 0x46, 0x2C, 0x50, 0x10,
     0xD8, 0x46, 0xC1, 0x85, 0xC1, 0x51, 0x11, 0xE5,
     0x95, 0x52, 0x2A, 0x6B, 0xCD, 0x16, 0xCF, 0x86,
     0xF3, 0xD1, 0x22, 0x10, 0x9E, 0x3B, 0x1F, 0xDD,
     0x94, 0x3B, 0x6A, 0xEC, 0x46, 0x8A, 0x2D, 0x62,
     0x1A, 0x7C, 0x06, 0xC6, 0xA9, 0x57, 0xC6, 0x2B,
     0x54, 0xDA, 0xFC, 0x3B, 0xE8, 0x75, 0x67, 0xD6,
     0x77, 0x23, 0x13, 0x95, 0xF6, 0x14, 0x72, 0x93,
     0xB6, 0x8C, 0xEA, 0xB7, 0xA9, 0xE0, 0xC5, 0x8D,
     0x86, 0x4E, 0x8E, 0xFD, 0xE4, 0xE1, 0xB9, 0xA4,
     0x6C, 0xBE, 0x85, 0x47, 0x13, 0x67, 0x2F, 0x5C,
     0xAA, 0xAE, 0x31, 0x4E, 0xD9, 0x08, 0x3D, 0xAB,
     0x4B, 0x09, 0x9F, 0x8E, 0x30, 0x0F, 0x01, 0xB8,
     0x65, 0x0F, 0x1F, 0x4B, 0x1D, 0x8F, 0xCF, 0x3F,
     0x3C, 0xB5, 0x3F, 0xB8, 0xE9, 0xEB, 0x2E, 0xA2,
     0x03, 0xBD, 0xC9, 0x70, 0xF5, 0x0A, 0xE5, 0x54,
     0x28, 0xA9, 0x1F, 0x7F, 0x53, 0xAC, 0x26, 0x6B,
     0x28, 0x41, 0x9C, 0x37, 0x78, 0xA1, 0x5F, 0xD2,
     0x48, 0xD3, 0x39, 0xED, 0xE7, 0x85, 0xFB, 0x7F}};
static TestHashVectorSHAKE const testVectorSHAKE256_2 PROGMEM = {
    "SHAKE256 #2",
    {0x1F, 0x87, 0x7C},
    3,
    {0xF6, 0xBF, 0x03, 0x97, 0xDB, 0xFB, 0xB2, 0x0E,
     0x4A, 0xE3, 0x0F, 0x0A, 0x47, 0xFE, 0x97, 0x6C,
     0xD1, 0x09, 0xB3, 0xAA, 0x09, 0xB0, 0xE3, 0xF2,
     0x9F, 0x56, 0x0E, 0x4E, 0xD3, 0x33, 0xC0, 0xD0,
     0x83, 0x32, 0x6B, 0x03, 0xF6, 0xEA, 0xEB, 0x57,
     0xE2, 0x77, 0xBB, 0xFE, 0x1C, 0xCE, 0x36, 0xC4,
     0x99, 0x43, 0x4D, 0x83, 0x8C, 0xB4, 0xC8, 0xCD,
     0x8B, 0x02, 0xA8, 0x77, 0x90, 0xF4, 0xA6, 0x71,
     0x7B, 0x22, 0xD4, 0x6F, 0x92, 0x20, 0x39, 0x1C,
     0x42, 0x0A, 0x1A, 0x1B, 0xFA, 0xA9, 0xED, 0x5B,
     0x85, 0x11, 0x6B, 0xA1, 0xD9, 0xE1, 0x7F, 0xF1,
     0x6F, 0x6B, 0xCE, 0x67, 0x04, 0xC8, 0x0A, 0x49,
     0xFD, 0x9A, 0xC4, 0x26, 0x89, 0xDB, 0x09, 0x96,
     0xC6, 0xBD, 0x32, 0x66, 0x69, 0x40, 0x77, 0xC6,
     0xDE, 0x12, 0x00, 0x43, 0xA8, 0x27, 0xD4, 0x49,
     0x79, 0xCE, 0x8C, 0xCC, 0x6A, 0xA7, 0xE5, 0x30,
     0x8E, 0xBA, 0x64, 0xAC, 0xF9, 0xFF, 0xFF, 0x51,
     0xD3, 0x6B, 0xC4, 0x40, 0x1F, 0x81, 0x17, 0xD4,
     0xB9, 0x63, 0x40, 0xC6, 0x2D, 0x10, 0x6B, 0x0A,
     0x64, 0x45, 0xF0, 0x19, 0x87, 0xF9, 0xC4, 0xC0,
     0xA4, 0x20, 0xE1, 0xA9, 0xBA, 0xEB, 0x59, 0x4B,
     0xCB, 0x1B, 0xDB, 0xFE, 0x59, 0xB6, 0x06, 0x5E,
     0xB9, 0x1C, 0xBE, 0xB2, 0x52, 0x47, 0x3C, 0x78,
     0x58, 0xEC, 0xA4, 0x75, 0xE1, 0xC8, 0x1E, 0x84,
     0x25, 0xC7, 0xE2, 0xC1, 0x70, 0x6C, 0x4C, 0x4A,
     0xBB, 0x3A, 0xEA, 0xE3, 0x93, 0x32, 0x47, 0x9E,
     0xCD, 0xEF, 0xDF, 0xA9, 0x3C, 0x60, 0xEC, 0x40,
     0x07, 0xA5, 0x1C, 0x5D, 0xD0, 0x93, 0xB5, 0x27,
     0x26, 0x41, 0x55, 0xF2, 0x20, 0x2E, 0x01, 0xD2,
     0x08, 0x3D, 0x27, 0xD7, 0x1A, 0x6F, 0x6C, 0x92,
     0xD8, 0x39, 0xE6, 0xEA, 0x7D, 0x24, 0xAF, 0xDB,
     0x5C, 0x43, 0x63, 0x0F, 0x1B, 0xD0, 0x6E, 0x2B}};
static TestHashVectorSHAKE const testVectorSHAKE256_3 PROGMEM = {
    "SHAKE256 #3",
    {0xB7, 0x71, 0xD5, 0xCE, 0xF5, 0xD1, 0xA4, 0x1A,
     0x93, 0xD1, 0x56, 0x43, 0xD7, 0x18, 0x1D, 0x2A,
     0x2E, 0xF0, 0xA8, 0xE8, 0x4D, 0x91, 0x81, 0x2F,
     0x20, 0xED, 0x21, 0xF1, 0x47, 0xBE, 0xF7, 0x32,
     0xBF, 0x3A, 0x60, 0xEF, 0x40, 0x67, 0xC3, 0x73,
     0x4B, 0x85, 0xBC, 0x8C, 0xD4, 0x71, 0x78, 0x0F,
     0x10, 0xDC, 0x9E, 0x82, 0x91, 0xB5, 0x83, 0x39,
     0xA6, 0x77, 0xB9, 0x60, 0x21, 0x8F, 0x71, 0xE7,
     0x93, 0xF2, 0x79, 0x7A, 0xEA, 0x34, 0x94, 0x06,
     0x51, 0x28, 0x29, 0x06, 0x5D, 0x37, 0xBB, 0x55,
     0xEA, 0x79, 0x6F, 0xA4, 0xF5, 0x6F, 0xD8, 0x89,
     0x6B, 0x49, 0xB2, 0xCD, 0x19, 0xB4, 0x32, 0x15,
     0xAD, 0x96, 0x7C, 0x71, 0x2B, 0x24, 0xE5, 0x03,
     0x2D, 0x06, 0x52, 0x32, 0xE0, 0x2C, 0x12, 0x74,
     0x09, 0xD2, 0xED, 0x41, 0x46, 0xB9, 0xD7, 0x5D,
     0x76, 0x3D, 0x52, 0xDB, 0x98, 0xD9, 0x49, 0xD3,
     0xB0, 0xFE, 0xD6, 0xA8, 0x05, 0x2F, 0xBB},
    135,
    {0x6C, 0x60, 0x95, 0x5D, 0xCB, 0x8A, 0x66, 0x3B,
     0x6D, 0xC7, 0xF5, 0xEF, 0x7E, 0x06, 0x9C, 0xA8,
     0xFE, 0x3D, 0xA9, 0x9A, 0x66, 0xDF, 0x65, 0x96,
     0x92, 0x5D, 0x55, 0x7F, 0xED, 0x91, 0xF4, 0x70,
     0x91, 0x40, 0x7D, 0x6F, 0xDE, 0x32, 0x02, 0x3B,
     0x57, 0xE2, 0xEE, 0x4C, 0x6A, 0xC9, 0x7B, 0x07,
     0x76, 0x24, 0xFA, 0xC2, 0x5F, 0x6E, 0x13, 0xF4,
     0x19, 0x16, 0x96, 0xB4, 0x0A, 0x4D, 0xF7, 0x5F,
     0x61, 0xCD, 0x55, 0x21, 0xD9, 0x82, 0xC6, 0xD0,
     0x9D, 0x83, 0x42, 0xC1, 0x7A, 0x36, 0x6E, 0xC6,
     0x34, 0x6E, 0x35, 0x28, 0xB2, 0x6C, 0xFF, 0x91,
     0x5B, 0xE9, 0x44, 0x2B, 0x9E, 0xBC, 0xC3, 0x0F,
     0xF2, 0xF6, 0xAD, 0xD0, 0xE8, 0x2B, 0xA9, 0x04,
     0xC7, 0x37, 0x00, 0xCC, 0x99, 0xAC, 0xFF, 0x48,
     0x0C, 0xAF, 0x04, 0x87, 0xCE, 0xE5, 0x4C, 0xBA,
     0x37, 0x53, 0xB6, 0xA5, 0xDD, 0x6F, 0x0D, 0xFE,
     0x65, 0x71, 0xF0, 0x11, 0x5E, 0x87, 0x37, 0xB0,
     0x71, 0x03, 0x10, 0x23, 0xB6, 0xBB, 0x0D, 0x79,
     0x86, 0x4C, 0x3F, 0x33, 0x16, 0x2E, 0x78, 0x26,
     0x9C, 0xEE, 0x23, 0xFC, 0xE4, 0x7B, 0x91, 0xB4,
     0xFD, 0xF9, 0x1F, 0x98, 0x46, 0x4A, 0x1D, 0x21,
     0xE7, 0x99, 0xD1, 0x7F, 0x76, 0xC1, 0xBB, 0x80,
     0x7D, 0xEE, 0x66, 0x7B, 0x0B, 0x27, 0x30, 0x54,
     0xBE, 0x29, 0x82, 0x99, 0xBD, 0x12, 0xB7, 0xA8,
     0x0F, 0xB3, 0x54, 0xCE, 0x3E, 0x6D, 0x1A, 0xCF,
     0x98, 0x44, 0x38, 0x79, 0xA5, 0x54, 0xEC, 0xA6,
     0xB9, 0x6D, 0xF0, 0x61, 0xD0, 0x4A, 0x11, 0x7C,
     0x98, 0xAE, 0xEC, 0x1C, 0xDE, 0x1A, 0xFA, 0x9C,
     0xEF, 0x62, 0xDD, 0x68, 0x6D, 0xA9, 0x1B, 0xB2,
     0xB1, 0xF1, 0x23, 0x79, 0xBB, 0xDC, 0x9F, 0xA3,
     0x2A, 0x6B, 0x69, 0x98, 0xB7, 0x7E, 0x8E, 0xB0,
     0xB5, 0x05, 0x07, 0x86, 0x2A, 0xFA, 0x77, 0x99}};

SHAKE256 shake256;
TestHashVectorSHAKE tst;
uint8_t output[MAX_SHAKE_OUTPUT];

bool testSHAKE_N(SHAKE *shake, const struct TestHashVectorSHAKE *test, size_t inc, bool printName = false)
{
    size_t size;
    size_t posn, len;

    // Copy the test case out of program memory.
    memcpy_P(&tst, test, sizeof(tst));
    test = &tst;

    // Print the test name if necessary.
    if (printName)
    {
        Serial.print(test->name);
        Serial.print(" ... ");
    }

    // Hash the input data.
    if (!inc)
        inc = 1;
    size = test->dataLen;
    shake->reset();
    for (posn = 0; posn < size; posn += inc)
    {
        len = size - posn;
        if (len > inc)
            len = inc;
        shake->update(test->data + posn, len);
    }

    // Generate data using extend() and check it.
    size = MAX_SHAKE_OUTPUT;
    for (posn = 0; posn < size; posn += inc)
    {
        len = size - posn;
        if (len > inc)
            len = inc;
        shake->extend(output + posn, len);
    }
    if (memcmp(output, test->hash, size) != 0)
        return false;

    // Restart and use encrypt() this time.
    shake->reset();
    shake->update(test->data, test->dataLen);
    for (posn = 0; posn < size; ++posn)
        output[posn] = (uint8_t)(posn + 0xAA);
    for (posn = 0; posn < size; posn += inc)
    {
        len = size - posn;
        if (len > inc)
            len = inc;
        shake->encrypt(output + posn, output + posn, len);
    }
    for (posn = 0; posn < size; ++posn)
        output[posn] ^= (uint8_t)(posn + 0xAA);
    if (memcmp(output, test->hash, size) != 0)
        return false;

    return true;
}

void testSHAKE(SHAKE *shake, const struct TestHashVectorSHAKE *test)
{
    bool ok;
    size_t dataLen;

    memcpy_P(&dataLen, &(test->dataLen), sizeof(size_t));

    ok = testSHAKE_N(shake, test, dataLen, true);
    ok &= testSHAKE_N(shake, test, 1);
    ok &= testSHAKE_N(shake, test, 2);
    ok &= testSHAKE_N(shake, test, 5);
    ok &= testSHAKE_N(shake, test, 8);
    ok &= testSHAKE_N(shake, test, 13);
    ok &= testSHAKE_N(shake, test, 16);
    ok &= testSHAKE_N(shake, test, 24);
    ok &= testSHAKE_N(shake, test, 63);
    ok &= testSHAKE_N(shake, test, 64);

    if (ok)
        Serial.println("Passed");
    else
        Serial.println("Failed");
}

void perfUpdate(SHAKE *shake)
{
    unsigned long start;
    unsigned long elapsed;
    int count;

    Serial.print("Updating ... ");

    for (size_t posn = 0; posn < MAX_SHAKE_OUTPUT; ++posn)
        output[posn] = (uint8_t)posn;

    shake->reset();
    start = micros();
    for (count = 0; count < 300; ++count)
    {
        shake->update(output, MAX_SHAKE_OUTPUT);
    }
    shake->extend(output, 0); // Force a finalize after the update.
    elapsed = micros() - start;

    Serial.print(elapsed / (MAX_SHAKE_OUTPUT * 300.0));
    Serial.print("us per byte, ");
    Serial.print((MAX_SHAKE_OUTPUT * 300.0 * 1000000.0) / elapsed);
    Serial.println(" bytes per second");
}

void perfExtend(SHAKE *shake)
{
    unsigned long start;
    unsigned long elapsed;
    int count;

    Serial.print("Extending ... ");

    for (size_t posn = 0; posn < MAX_SHAKE_OUTPUT; ++posn)
        output[posn] = (uint8_t)posn;

    shake->reset();
    shake->update(output, MAX_SHAKE_OUTPUT);
    shake->extend(output, 0); // Force a finalize after the update.
    start = micros();
    for (count = 0; count < 300; ++count)
    {
        shake->extend(output, MAX_SHAKE_OUTPUT);
    }
    elapsed = micros() - start;

    Serial.print(elapsed / (MAX_SHAKE_OUTPUT * 300.0));
    Serial.print("us per byte, ");
    Serial.print((MAX_SHAKE_OUTPUT * 300.0 * 1000000.0) / elapsed);
    Serial.println(" bytes per second");
}

void perfEncrypt(SHAKE *shake)
{
    unsigned long start;
    unsigned long elapsed;
    int count;

    Serial.print("Encrypting ... ");

    for (size_t posn = 0; posn < MAX_SHAKE_OUTPUT; ++posn)
        output[posn] = (uint8_t)posn;

    shake->reset();
    shake->update(output, MAX_SHAKE_OUTPUT);
    shake->extend(output, 0); // Force a finalize after the update.
    start = micros();
    for (count = 0; count < 300; ++count)
    {
        shake->encrypt(output, output, MAX_SHAKE_OUTPUT);
    }
    elapsed = micros() - start;

    Serial.print(elapsed / (MAX_SHAKE_OUTPUT * 300.0));
    Serial.print("us per byte, ");
    Serial.print((MAX_SHAKE_OUTPUT * 300.0 * 1000000.0) / elapsed);
    Serial.println(" bytes per second");
}

void setup()
{
    Serial.begin(9600);

    Serial.println();

    Serial.print("State Size ...");
    Serial.println(sizeof(SHAKE256));
    Serial.println();

    Serial.println("Test Vectors:");
    testSHAKE(&shake256, &testVectorSHAKE256_1);
    testSHAKE(&shake256, &testVectorSHAKE256_2);
    testSHAKE(&shake256, &testVectorSHAKE256_3);

    Serial.println();

    Serial.println("Performance Tests:");
    perfUpdate(&shake256);
    perfExtend(&shake256);
    perfEncrypt(&shake256);
}

void loop()
{
}
