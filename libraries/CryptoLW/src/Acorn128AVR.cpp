/*
 * Copyright (C) 2018 Southern Storm Software, Pty Ltd.
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

#include "Acorn128.h"

#if defined(CRYPTO_ACORN128_AVR)

// Acorn128 constants for ca and cb.
#define CA_0 ((uint32_t)0x00000000)
#define CA_1 ((uint32_t)0xFFFFFFFF)
#define CB_0 ((uint32_t)0x00000000)
#define CB_1 ((uint32_t)0xFFFFFFFF)
#define CA_0_BYTE ((uint8_t)0x00)
#define CA_1_BYTE ((uint8_t)0xFF)
#define CB_0_BYTE ((uint8_t)0x00)
#define CB_1_BYTE ((uint8_t)0xFF)

// Imports from Acorn128.cpp
extern void acornPad(Acorn128State *state, uint32_t cb);

// Force the acornEncrypt8() and acornDecrypt8() functions to always inline.
static inline uint8_t acornEncrypt8(Acorn128State *state, uint8_t plaintext, uint8_t ca, uint8_t cb);
static inline uint8_t acornDecrypt8(Acorn128State *state, uint8_t ciphertext);

static uint8_t acornEncrypt8(Acorn128State *state, uint8_t plaintext, uint8_t ca, uint8_t cb)
{
    // Automatically generated by the genacorn tool.
    uint8_t ciphertext;
    __asm__ __volatile__(
        "ldd r15,Z+34\n"
        "ldd r14,Z+33\n"
        "ldd r0,Z+32\n"
        "lsl r0\n"
        "rol r14\n"
        "rol r15\n"
        "lsl r0\n"
        "rol r14\n"
        "rol r15\n"
        "lsl r0\n"
        "rol r14\n"
        "ldd r13,Z+28\n"
        "ldd r0,Z+29\n"
        "lsr r0\n"
        "ror r13\n"
        "lsr r0\n"
        "ror r13\n"
        "lsr r0\n"
        "ror r13\n"
        "ldd r0,Z+20\n"
        "ldd r12,Z+21\n"
        "lsl r0\n"
        "rol r12\n"
        "lsl r0\n"
        "rol r12\n"
        "ldd r16,Z+16\n"
        "ldd r17,Z+17\n"
        "swap r16\n"
        "swap r17\n"
        "andi r16,0x0F\n"
        "andi r17,0xF0\n"
        "or r16,r17\n"
        "ldd r0,Z+8\n"
        "ldd r11,Z+9\n"
        "lsl r0\n"
        "rol r11\n"
        "lsl r0\n"
        "rol r11\n"
        "lsl r0\n"
        "rol r11\n"
        "ldd r10,Z+3\n"
        "ldd r9,Z+2\n"
        "ldd r0,Z+1\n"
        "lsl r0\n"
        "rol r9\n"
        "rol r10\n"
        "lsl r0\n"
        "rol r9\n"
        "lsl r0\n"
        "rol r9\n"
        "lsl r0\n"
        "rol r9\n"
        "ldd r8,Z+40\n"
        "eor r8,r14\n"
        "ldd r7,Z+32\n"
        "eor r8,r7\n"
        "eor r7,r13\n"
        "ldd r6,Z+28\n"
        "eor r7,r6\n"
        "eor r6,r12\n"
        "ldd r23,Z+20\n"
        "eor r6,r23\n"
        "eor r23,r16\n"
        "ldd r22,Z+16\n"
        "eor r23,r22\n"
        "eor r22,r11\n"
        "ldd r21,Z+8\n"
        "eor r22,r21\n"
        "eor r21,r10\n"
        "ld r20,Z\n"
        "eor r21,r20\n"
        "eor r9,r23\n"
        "mov r0,r14\n"
        "and r0,r21\n"
        "eor r9,r0\n"
        "and r14,r6\n"
        "eor r9,r14\n"
        "mov r0,r21\n"
        "and r0,r6\n"
        "eor r9,r0\n"
        "and r16,r7\n"
        "eor r9,r16\n"
        "mov r0,r7\n"
        "com r0\n"
        "and r11,r0\n"
        "eor r9,r11\n"
        "mov r16,r22\n"
        "com r16\n"
        "eor r16,r20\n"
        "mov r0,r15\n"
        "and r0,r10\n"
        "eor r16,r0\n"
        "and r10,r12\n"
        "eor r16,r10\n"
        "and r15,r12\n"
        "eor r16,r15\n"
        "and r13,%3\n"
        "eor r16,r13\n"
        "mov r0,r9\n"
        "and r0,%4\n"
        "eor r16,r0\n"
        "eor r16,%2\n"
        "swap r16\n"
        "mov r17,r16\n"
        "andi r17,0xF0\n"
        "eor r8,r17\n"
        "andi r16,0x0F\n"
        "std Z+40,r16\n"
        "ldd r0,Z+33\n"
        "std Z+32,r0\n"
        "ldd r0,Z+34\n"
        "std Z+33,r0\n"
        "ldd r0,Z+35\n"
        "std Z+34,r0\n"
        "ldd r0,Z+36\n"
        "std Z+35,r0\n"
        "ldd r0,Z+37\n"
        "std Z+36,r0\n"
        "ldd r0,Z+38\n"
        "std Z+37,r0\n"
        "ldd r0,Z+39\n"
        "clr r15\n"
        "lsl r8\n"
        "rol r15\n"
        "lsl r8\n"
        "rol r15\n"
        "lsl r8\n"
        "rol r15\n"
        "or r0,r8\n"
        "std Z+38,r0\n"
        "std Z+39,r15\n"
        "ldd r0,Z+29\n"
        "std Z+28,r0\n"
        "ldd r0,Z+30\n"
        "std Z+29,r0\n"
        "ldd r0,Z+31\n"
        "std Z+30,r0\n"
        "ldd r0,Z+26\n"
        "clr r15\n"
        "lsr r7\n"
        "ror r15\n"
        "lsr r7\n"
        "ror r15\n"
        "lsr r7\n"
        "ror r15\n"
        "or r0,r15\n"
        "std Z+31,r0\n"
        "std Z+26,r7\n"
        "ldd r0,Z+21\n"
        "std Z+20,r0\n"
        "ldd r0,Z+22\n"
        "std Z+21,r0\n"
        "ldd r0,Z+23\n"
        "std Z+22,r0\n"
        "ldd r0,Z+24\n"
        "clr r15\n"
        "lsr r6\n"
        "ror r15\n"
        "or r0,r15\n"
        "std Z+23,r0\n"
        "std Z+24,r6\n"
        "ldd r0,Z+17\n"
        "std Z+16,r0\n"
        "ldd r0,Z+18\n"
        "std Z+17,r0\n"
        "ldd r0,Z+19\n"
        "std Z+18,r0\n"
        "ldd r0,Z+14\n"
        "std Z+19,r0\n"
        "ldd r0,Z+15\n"
        "clr r15\n"
        "lsr r23\n"
        "ror r15\n"
        "or r0,r15\n"
        "std Z+14,r0\n"
        "std Z+15,r23\n"
        "ldd r0,Z+9\n"
        "std Z+8,r0\n"
        "ldd r0,Z+10\n"
        "std Z+9,r0\n"
        "ldd r0,Z+11\n"
        "std Z+10,r0\n"
        "ldd r0,Z+12\n"
        "std Z+11,r0\n"
        "ldd r0,Z+13\n"
        "clr r15\n"
        "lsr r22\n"
        "ror r15\n"
        "lsr r22\n"
        "ror r15\n"
        "or r0,r15\n"
        "std Z+12,r0\n"
        "std Z+13,r22\n"
        "ldd r0,Z+1\n"
        "st Z,r0\n"
        "ldd r0,Z+2\n"
        "std Z+1,r0\n"
        "ldd r0,Z+3\n"
        "std Z+2,r0\n"
        "ldd r0,Z+4\n"
        "std Z+3,r0\n"
        "ldd r0,Z+5\n"
        "std Z+4,r0\n"
        "ldd r0,Z+6\n"
        "std Z+5,r0\n"
        "ldd r0,Z+7\n"
        "clr r15\n"
        "lsr r21\n"
        "ror r15\n"
        "lsr r21\n"
        "ror r15\n"
        "lsr r21\n"
        "ror r15\n"
        "or r0,r15\n"
        "std Z+6,r0\n"
        "std Z+7,r21\n"
        "mov %0,%2\n"
        "eor %0,r9\n"
        : "=r"(ciphertext)
        : "z"(&state->s1_l), "r"(plaintext), "r"((uint8_t)ca), "r"((uint8_t)cb)
        : "r16", "r17", "r20", "r21", "r22", "r23", "r6", "r7", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "memory");
    return ciphertext;
}

static uint8_t acornDecrypt8(Acorn128State *state, uint8_t ciphertext)
{
    // Automatically generated by the genacorn tool.
    uint8_t plaintext;
    __asm__ __volatile__(
        "ldd r15,Z+34\n"
        "ldd r14,Z+33\n"
        "ldd r0,Z+32\n"
        "lsl r0\n"
        "rol r14\n"
        "rol r15\n"
        "lsl r0\n"
        "rol r14\n"
        "rol r15\n"
        "lsl r0\n"
        "rol r14\n"
        "ldd r13,Z+28\n"
        "ldd r0,Z+29\n"
        "lsr r0\n"
        "ror r13\n"
        "lsr r0\n"
        "ror r13\n"
        "lsr r0\n"
        "ror r13\n"
        "ldd r0,Z+20\n"
        "ldd r12,Z+21\n"
        "lsl r0\n"
        "rol r12\n"
        "lsl r0\n"
        "rol r12\n"
        "ldd r16,Z+16\n"
        "ldd r17,Z+17\n"
        "swap r16\n"
        "swap r17\n"
        "andi r16,0x0F\n"
        "andi r17,0xF0\n"
        "or r16,r17\n"
        "ldd r0,Z+8\n"
        "ldd r11,Z+9\n"
        "lsl r0\n"
        "rol r11\n"
        "lsl r0\n"
        "rol r11\n"
        "lsl r0\n"
        "rol r11\n"
        "ldd r10,Z+3\n"
        "ldd r9,Z+2\n"
        "ldd r0,Z+1\n"
        "lsl r0\n"
        "rol r9\n"
        "rol r10\n"
        "lsl r0\n"
        "rol r9\n"
        "lsl r0\n"
        "rol r9\n"
        "lsl r0\n"
        "rol r9\n"
        "ldd r8,Z+40\n"
        "eor r8,r14\n"
        "ldd r7,Z+32\n"
        "eor r8,r7\n"
        "eor r7,r13\n"
        "ldd r6,Z+28\n"
        "eor r7,r6\n"
        "eor r6,r12\n"
        "ldd r23,Z+20\n"
        "eor r6,r23\n"
        "eor r23,r16\n"
        "ldd r22,Z+16\n"
        "eor r23,r22\n"
        "eor r22,r11\n"
        "ldd r21,Z+8\n"
        "eor r22,r21\n"
        "eor r21,r10\n"
        "ld r20,Z\n"
        "eor r21,r20\n"
        "eor r9,r23\n"
        "mov r0,r14\n"
        "and r0,r21\n"
        "eor r9,r0\n"
        "and r14,r6\n"
        "eor r9,r14\n"
        "mov r0,r21\n"
        "and r0,r6\n"
        "eor r9,r0\n"
        "and r16,r7\n"
        "eor r9,r16\n"
        "mov r0,r7\n"
        "com r0\n"
        "and r11,r0\n"
        "eor r9,r11\n"
        "mov r16,r22\n"
        "com r16\n"
        "eor r16,r20\n"
        "mov r0,r15\n"
        "and r0,r10\n"
        "eor r16,r0\n"
        "and r10,r12\n"
        "eor r16,r10\n"
        "and r15,r12\n"
        "eor r16,r15\n"
        "eor r16,r13\n"
        "eor r9,%2\n"
        "eor r16,r9\n"
        "swap r16\n"
        "mov r17,r16\n"
        "andi r17,0xF0\n"
        "eor r8,r17\n"
        "andi r16,0x0F\n"
        "std Z+40,r16\n"
        "ldd r0,Z+33\n"
        "std Z+32,r0\n"
        "ldd r0,Z+34\n"
        "std Z+33,r0\n"
        "ldd r0,Z+35\n"
        "std Z+34,r0\n"
        "ldd r0,Z+36\n"
        "std Z+35,r0\n"
        "ldd r0,Z+37\n"
        "std Z+36,r0\n"
        "ldd r0,Z+38\n"
        "std Z+37,r0\n"
        "ldd r0,Z+39\n"
        "clr r15\n"
        "lsl r8\n"
        "rol r15\n"
        "lsl r8\n"
        "rol r15\n"
        "lsl r8\n"
        "rol r15\n"
        "or r0,r8\n"
        "std Z+38,r0\n"
        "std Z+39,r15\n"
        "ldd r0,Z+29\n"
        "std Z+28,r0\n"
        "ldd r0,Z+30\n"
        "std Z+29,r0\n"
        "ldd r0,Z+31\n"
        "std Z+30,r0\n"
        "ldd r0,Z+26\n"
        "clr r15\n"
        "lsr r7\n"
        "ror r15\n"
        "lsr r7\n"
        "ror r15\n"
        "lsr r7\n"
        "ror r15\n"
        "or r0,r15\n"
        "std Z+31,r0\n"
        "std Z+26,r7\n"
        "ldd r0,Z+21\n"
        "std Z+20,r0\n"
        "ldd r0,Z+22\n"
        "std Z+21,r0\n"
        "ldd r0,Z+23\n"
        "std Z+22,r0\n"
        "ldd r0,Z+24\n"
        "clr r15\n"
        "lsr r6\n"
        "ror r15\n"
        "or r0,r15\n"
        "std Z+23,r0\n"
        "std Z+24,r6\n"
        "ldd r0,Z+17\n"
        "std Z+16,r0\n"
        "ldd r0,Z+18\n"
        "std Z+17,r0\n"
        "ldd r0,Z+19\n"
        "std Z+18,r0\n"
        "ldd r0,Z+14\n"
        "std Z+19,r0\n"
        "ldd r0,Z+15\n"
        "clr r15\n"
        "lsr r23\n"
        "ror r15\n"
        "or r0,r15\n"
        "std Z+14,r0\n"
        "std Z+15,r23\n"
        "ldd r0,Z+9\n"
        "std Z+8,r0\n"
        "ldd r0,Z+10\n"
        "std Z+9,r0\n"
        "ldd r0,Z+11\n"
        "std Z+10,r0\n"
        "ldd r0,Z+12\n"
        "std Z+11,r0\n"
        "ldd r0,Z+13\n"
        "clr r15\n"
        "lsr r22\n"
        "ror r15\n"
        "lsr r22\n"
        "ror r15\n"
        "or r0,r15\n"
        "std Z+12,r0\n"
        "std Z+13,r22\n"
        "ldd r0,Z+1\n"
        "st Z,r0\n"
        "ldd r0,Z+2\n"
        "std Z+1,r0\n"
        "ldd r0,Z+3\n"
        "std Z+2,r0\n"
        "ldd r0,Z+4\n"
        "std Z+3,r0\n"
        "ldd r0,Z+5\n"
        "std Z+4,r0\n"
        "ldd r0,Z+6\n"
        "std Z+5,r0\n"
        "ldd r0,Z+7\n"
        "clr r15\n"
        "lsr r21\n"
        "ror r15\n"
        "lsr r21\n"
        "ror r15\n"
        "lsr r21\n"
        "ror r15\n"
        "or r0,r15\n"
        "std Z+6,r0\n"
        "std Z+7,r21\n"
        "mov %0,r9\n"
        : "=r"(plaintext)
        : "z"(&state->s1_l), "r"(ciphertext)
        : "r16", "r17", "r20", "r21", "r22", "r23", "r6", "r7", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "memory");
    return plaintext;
}

uint32_t acornEncrypt32(Acorn128State *state, uint32_t plaintext, uint32_t ca, uint32_t cb)
{
    uint32_t ciphertext;
    ciphertext = acornEncrypt8(state, (uint8_t)plaintext, (uint8_t)ca, (uint8_t)cb);
    ciphertext |= ((uint32_t)(acornEncrypt8(state, (uint8_t)(plaintext >> 8), (uint8_t)ca, (uint8_t)cb))) << 8;
    ciphertext |= ((uint32_t)(acornEncrypt8(state, (uint8_t)(plaintext >> 16), (uint8_t)ca, (uint8_t)cb))) << 16;
    ciphertext |= ((uint32_t)(acornEncrypt8(state, (uint8_t)(plaintext >> 24), (uint8_t)ca, (uint8_t)cb))) << 24;
    return ciphertext;
}

void Acorn128::encrypt(uint8_t *output, const uint8_t *input, size_t len)
{
    if (!state.authDone)
    {
        acornPad(&state, CB_1);
        state.authDone = 1;
    }
    while (len > 0)
    {
        *output++ = acornEncrypt8(&state, *input++, CA_1_BYTE, CB_0_BYTE);
        --len;
    }
}

void Acorn128::decrypt(uint8_t *output, const uint8_t *input, size_t len)
{
    if (!state.authDone)
    {
        acornPad(&state, CB_1);
        state.authDone = 1;
    }
    while (len > 0)
    {
        *output++ = acornDecrypt8(&state, *input++);
        --len;
    }
}

void Acorn128::addAuthData(const void *data, size_t len)
{
    if (state.authDone)
        return;
    const uint8_t *input = (const uint8_t *)data;
    while (len > 0)
    {
        acornEncrypt8(&state, *input++, CA_1_BYTE, CB_1_BYTE);
        --len;
    }
}

#endif // CRYPTO_ACORN128_AVR
