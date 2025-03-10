/*
 * Copyright (C) 2015 Southern Storm Software, Pty Ltd.
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
This example runs tests on the OFB implementation to verify correct behaviour.
*/

#include <Crypto.h>
#include <CryptoLegacy.h>
#include <AES.h>
#include <OFB.h>
#include <string.h>

#define MAX_PLAINTEXT_SIZE 64
#define MAX_CIPHERTEXT_SIZE 64

struct TestVector
{
    const char *name;
    byte key[16];
    byte plaintext[MAX_PLAINTEXT_SIZE];
    byte ciphertext[MAX_CIPHERTEXT_SIZE];
    byte iv[16];
    size_t size;
};

// Test vectors for AES in OFB mode from section F.4 of:
// http://csrc.nist.gov/publications/nistpubs/800-38a/sp800-38a.pdf
static TestVector const testVectorAES128OFB1 = {
    .name = "AES-128-OFB",
    .key = {0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6,
            0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c},
    .plaintext = {0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96,
                  0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a,
                  0xae, 0x2d, 0x8a, 0x57, 0x1e, 0x03, 0xac, 0x9c,
                  0x9e, 0xb7, 0x6f, 0xac, 0x45, 0xaf, 0x8e, 0x51,
                  0x30, 0xc8, 0x1c, 0x46, 0xa3, 0x5c, 0xe4, 0x11,
                  0xe5, 0xfb, 0xc1, 0x19, 0x1a, 0x0a, 0x52, 0xef,
                  0xf6, 0x9f, 0x24, 0x45, 0xdf, 0x4f, 0x9b, 0x17,
                  0xad, 0x2b, 0x41, 0x7b, 0xe6, 0x6c, 0x37, 0x10},
    .ciphertext = {0x3b, 0x3f, 0xd9, 0x2e, 0xb7, 0x2d, 0xad, 0x20,
                   0x33, 0x34, 0x49, 0xf8, 0xe8, 0x3c, 0xfb, 0x4a,
                   0x77, 0x89, 0x50, 0x8d, 0x16, 0x91, 0x8f, 0x03,
                   0xf5, 0x3c, 0x52, 0xda, 0xc5, 0x4e, 0xd8, 0x25,
                   0x97, 0x40, 0x05, 0x1e, 0x9c, 0x5f, 0xec, 0xf6,
                   0x43, 0x44, 0xf7, 0xa8, 0x22, 0x60, 0xed, 0xcc,
                   0x30, 0x4c, 0x65, 0x28, 0xf6, 0x59, 0xc7, 0x78,
                   0x66, 0xa5, 0x10, 0xd9, 0xc1, 0xd6, 0xae, 0x5e},
    .iv = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
           0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f},
    .size = 64};
static TestVector const testVectorAES128OFB2 = {
    // Same as above, but with a short last block to check that
    // OFB mode works correctly on non block-aligned plaintext.
    .name = "AES-128-OFB",
    .key = {0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6,
            0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c},
    .plaintext = {0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96,
                  0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a,
                  0xae, 0x2d, 0x8a, 0x57, 0x1e, 0x03, 0xac, 0x9c,
                  0x9e, 0xb7, 0x6f, 0xac, 0x45, 0xaf, 0x8e, 0x51,
                  0x30, 0xc8, 0x1c, 0x46, 0xa3, 0x5c, 0xe4, 0x11,
                  0xe5, 0xfb, 0xc1, 0x19, 0x1a, 0x0a, 0x52, 0xef,
                  0xf6, 0x9f, 0x24, 0x45, 0xdf, 0x4f, 0x9b, 0x17,
                  0xad, 0x2b, 0x41, 0x7b, 0xe6},
    .ciphertext = {0x3b, 0x3f, 0xd9, 0x2e, 0xb7, 0x2d, 0xad, 0x20,
                   0x33, 0x34, 0x49, 0xf8, 0xe8, 0x3c, 0xfb, 0x4a,
                   0x77, 0x89, 0x50, 0x8d, 0x16, 0x91, 0x8f, 0x03,
                   0xf5, 0x3c, 0x52, 0xda, 0xc5, 0x4e, 0xd8, 0x25,
                   0x97, 0x40, 0x05, 0x1e, 0x9c, 0x5f, 0xec, 0xf6,
                   0x43, 0x44, 0xf7, 0xa8, 0x22, 0x60, 0xed, 0xcc,
                   0x30, 0x4c, 0x65, 0x28, 0xf6, 0x59, 0xc7, 0x78,
                   0x66, 0xa5, 0x10, 0xd9, 0xc1},
    .iv = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
           0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f},
    .size = 61};

OFB<AES128> ofbaes128;

byte buffer[128];

bool testCipher_N(Cipher *cipher, const struct TestVector *test, size_t inc)
{
    byte output[MAX_CIPHERTEXT_SIZE];
    size_t posn, len;

    cipher->clear();
    if (!cipher->setKey(test->key, cipher->keySize()))
    {
        Serial.print("setKey ");
        return false;
    }
    if (!cipher->setIV(test->iv, cipher->ivSize()))
    {
        Serial.print("setIV ");
        return false;
    }

    memset(output, 0xBA, sizeof(output));

    for (posn = 0; posn < test->size; posn += inc)
    {
        len = test->size - posn;
        if (len > inc)
            len = inc;
        cipher->encrypt(output + posn, test->plaintext + posn, len);
    }

    if (memcmp(output, test->ciphertext, test->size) != 0)
    {
        Serial.print(output[0], HEX);
        Serial.print("->");
        Serial.print(test->ciphertext[0], HEX);
        return false;
    }

    cipher->setKey(test->key, cipher->keySize());
    cipher->setIV(test->iv, cipher->ivSize());

    for (posn = 0; posn < test->size; posn += inc)
    {
        len = test->size - posn;
        if (len > inc)
            len = inc;
        cipher->decrypt(output + posn, test->ciphertext + posn, len);
    }

    if (memcmp(output, test->plaintext, test->size) != 0)
        return false;

    return true;
}

void testCipher(Cipher *cipher, const struct TestVector *test)
{
    bool ok;

    Serial.print(test->name);
    Serial.print(" ... ");

    ok = testCipher_N(cipher, test, test->size);
    ok &= testCipher_N(cipher, test, 1);
    ok &= testCipher_N(cipher, test, 2);
    ok &= testCipher_N(cipher, test, 5);
    ok &= testCipher_N(cipher, test, 8);
    ok &= testCipher_N(cipher, test, 13);
    ok &= testCipher_N(cipher, test, 16);

    if (ok)
        Serial.println("Passed");
    else
        Serial.println("Failed");
}

void perfCipherEncrypt(const char *name, Cipher *cipher, const struct TestVector *test)
{
    unsigned long start;
    unsigned long elapsed;
    int count;

    Serial.print(name);
    Serial.print(" ... ");

    cipher->setKey(test->key, cipher->keySize());
    cipher->setIV(test->iv, cipher->ivSize());
    start = micros();
    for (count = 0; count < 500; ++count)
    {
        cipher->encrypt(buffer, buffer, sizeof(buffer));
    }
    elapsed = micros() - start;

    Serial.print(elapsed / (sizeof(buffer) * 500.0));
    Serial.print("us per byte, ");
    Serial.print((sizeof(buffer) * 500.0 * 1000000.0) / elapsed);
    Serial.println(" bytes per second");
}

void perfCipherDecrypt(const char *name, Cipher *cipher, const struct TestVector *test)
{
    unsigned long start;
    unsigned long elapsed;
    int count;

    Serial.print(name);
    Serial.print(" ... ");

    cipher->setKey(test->key, cipher->keySize());
    cipher->setIV(test->iv, cipher->ivSize());
    start = micros();
    for (count = 0; count < 500; ++count)
    {
        cipher->decrypt(buffer, buffer, sizeof(buffer));
    }
    elapsed = micros() - start;

    Serial.print(elapsed / (sizeof(buffer) * 500.0));
    Serial.print("us per byte, ");
    Serial.print((sizeof(buffer) * 500.0 * 1000000.0) / elapsed);
    Serial.println(" bytes per second");
}

void setup()
{
    Serial.begin(9600);

    Serial.println();

    Serial.println("Test Vectors:");
    testCipher(&ofbaes128, &testVectorAES128OFB1);
    testCipher(&ofbaes128, &testVectorAES128OFB2);

    Serial.println();

    Serial.println("Performance Tests:");
    perfCipherEncrypt("AES-128-OFB Encrypt", &ofbaes128, &testVectorAES128OFB1);
    perfCipherDecrypt("AES-128-OFB Decrypt", &ofbaes128, &testVectorAES128OFB1);
}

void loop()
{
}
