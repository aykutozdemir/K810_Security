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

#include "Ascon128.h"

#if defined(__AVR__)

void Ascon128::permute(uint8_t first)
{
    // AVR version generated by the genascon tool.
    __asm__ __volatile__(
        "1:\n"
        "ldd r15,Z+16\n"
        "eor r15,%1\n"
        "ld r14,Z\n"
        "ldd r13,Z+8\n"
        "ldd r12,Z+24\n"
        "ldd r11,Z+32\n"
        "eor r14,r11\n"
        "eor r11,r12\n"
        "eor r15,r13\n"
        "mov r10,r14\n"
        "com r10\n"
        "and r10,r13\n"
        "mov r9,r13\n"
        "com r9\n"
        "and r9,r15\n"
        "mov r8,r15\n"
        "com r8\n"
        "and r8,r12\n"
        "mov r7,r12\n"
        "com r7\n"
        "and r7,r11\n"
        "mov r23,r11\n"
        "com r23\n"
        "and r23,r14\n"
        "eor r14,r9\n"
        "eor r13,r8\n"
        "eor r15,r7\n"
        "eor r12,r23\n"
        "eor r11,r10\n"
        "eor r13,r14\n"
        "eor r14,r11\n"
        "eor r12,r15\n"
        "com r15\n"
        "st Z,r14\n"
        "std Z+8,r13\n"
        "std Z+16,r15\n"
        "std Z+24,r12\n"
        "std Z+32,r11\n"
        "ldd r15,Z+1\n"
        "ldd r14,Z+9\n"
        "ldd r13,Z+17\n"
        "ldd r12,Z+25\n"
        "ldd r11,Z+33\n"
        "eor r15,r11\n"
        "eor r11,r12\n"
        "eor r13,r14\n"
        "mov r10,r15\n"
        "com r10\n"
        "and r10,r14\n"
        "mov r9,r14\n"
        "com r9\n"
        "and r9,r13\n"
        "mov r8,r13\n"
        "com r8\n"
        "and r8,r12\n"
        "mov r7,r12\n"
        "com r7\n"
        "and r7,r11\n"
        "mov r23,r11\n"
        "com r23\n"
        "and r23,r15\n"
        "eor r15,r9\n"
        "eor r14,r8\n"
        "eor r13,r7\n"
        "eor r12,r23\n"
        "eor r11,r10\n"
        "eor r14,r15\n"
        "eor r15,r11\n"
        "eor r12,r13\n"
        "com r13\n"
        "std Z+1,r15\n"
        "std Z+9,r14\n"
        "std Z+17,r13\n"
        "std Z+25,r12\n"
        "std Z+33,r11\n"
        "ldd r15,Z+2\n"
        "ldd r14,Z+10\n"
        "ldd r13,Z+18\n"
        "ldd r12,Z+26\n"
        "ldd r11,Z+34\n"
        "eor r15,r11\n"
        "eor r11,r12\n"
        "eor r13,r14\n"
        "mov r10,r15\n"
        "com r10\n"
        "and r10,r14\n"
        "mov r9,r14\n"
        "com r9\n"
        "and r9,r13\n"
        "mov r8,r13\n"
        "com r8\n"
        "and r8,r12\n"
        "mov r7,r12\n"
        "com r7\n"
        "and r7,r11\n"
        "mov r23,r11\n"
        "com r23\n"
        "and r23,r15\n"
        "eor r15,r9\n"
        "eor r14,r8\n"
        "eor r13,r7\n"
        "eor r12,r23\n"
        "eor r11,r10\n"
        "eor r14,r15\n"
        "eor r15,r11\n"
        "eor r12,r13\n"
        "com r13\n"
        "std Z+2,r15\n"
        "std Z+10,r14\n"
        "std Z+18,r13\n"
        "std Z+26,r12\n"
        "std Z+34,r11\n"
        "ldd r15,Z+3\n"
        "ldd r14,Z+11\n"
        "ldd r13,Z+19\n"
        "ldd r12,Z+27\n"
        "ldd r11,Z+35\n"
        "eor r15,r11\n"
        "eor r11,r12\n"
        "eor r13,r14\n"
        "mov r10,r15\n"
        "com r10\n"
        "and r10,r14\n"
        "mov r9,r14\n"
        "com r9\n"
        "and r9,r13\n"
        "mov r8,r13\n"
        "com r8\n"
        "and r8,r12\n"
        "mov r7,r12\n"
        "com r7\n"
        "and r7,r11\n"
        "mov r23,r11\n"
        "com r23\n"
        "and r23,r15\n"
        "eor r15,r9\n"
        "eor r14,r8\n"
        "eor r13,r7\n"
        "eor r12,r23\n"
        "eor r11,r10\n"
        "eor r14,r15\n"
        "eor r15,r11\n"
        "eor r12,r13\n"
        "com r13\n"
        "std Z+3,r15\n"
        "std Z+11,r14\n"
        "std Z+19,r13\n"
        "std Z+27,r12\n"
        "std Z+35,r11\n"
        "ldd r15,Z+4\n"
        "ldd r14,Z+12\n"
        "ldd r13,Z+20\n"
        "ldd r12,Z+28\n"
        "ldd r11,Z+36\n"
        "eor r15,r11\n"
        "eor r11,r12\n"
        "eor r13,r14\n"
        "mov r10,r15\n"
        "com r10\n"
        "and r10,r14\n"
        "mov r9,r14\n"
        "com r9\n"
        "and r9,r13\n"
        "mov r8,r13\n"
        "com r8\n"
        "and r8,r12\n"
        "mov r7,r12\n"
        "com r7\n"
        "and r7,r11\n"
        "mov r23,r11\n"
        "com r23\n"
        "and r23,r15\n"
        "eor r15,r9\n"
        "eor r14,r8\n"
        "eor r13,r7\n"
        "eor r12,r23\n"
        "eor r11,r10\n"
        "eor r14,r15\n"
        "eor r15,r11\n"
        "eor r12,r13\n"
        "com r13\n"
        "std Z+4,r15\n"
        "std Z+12,r14\n"
        "std Z+20,r13\n"
        "std Z+28,r12\n"
        "std Z+36,r11\n"
        "ldd r15,Z+5\n"
        "ldd r14,Z+13\n"
        "ldd r13,Z+21\n"
        "ldd r12,Z+29\n"
        "ldd r11,Z+37\n"
        "eor r15,r11\n"
        "eor r11,r12\n"
        "eor r13,r14\n"
        "mov r10,r15\n"
        "com r10\n"
        "and r10,r14\n"
        "mov r9,r14\n"
        "com r9\n"
        "and r9,r13\n"
        "mov r8,r13\n"
        "com r8\n"
        "and r8,r12\n"
        "mov r7,r12\n"
        "com r7\n"
        "and r7,r11\n"
        "mov r23,r11\n"
        "com r23\n"
        "and r23,r15\n"
        "eor r15,r9\n"
        "eor r14,r8\n"
        "eor r13,r7\n"
        "eor r12,r23\n"
        "eor r11,r10\n"
        "eor r14,r15\n"
        "eor r15,r11\n"
        "eor r12,r13\n"
        "com r13\n"
        "std Z+5,r15\n"
        "std Z+13,r14\n"
        "std Z+21,r13\n"
        "std Z+29,r12\n"
        "std Z+37,r11\n"
        "ldd r15,Z+6\n"
        "ldd r14,Z+14\n"
        "ldd r13,Z+22\n"
        "ldd r12,Z+30\n"
        "ldd r11,Z+38\n"
        "eor r15,r11\n"
        "eor r11,r12\n"
        "eor r13,r14\n"
        "mov r10,r15\n"
        "com r10\n"
        "and r10,r14\n"
        "mov r9,r14\n"
        "com r9\n"
        "and r9,r13\n"
        "mov r8,r13\n"
        "com r8\n"
        "and r8,r12\n"
        "mov r7,r12\n"
        "com r7\n"
        "and r7,r11\n"
        "mov r23,r11\n"
        "com r23\n"
        "and r23,r15\n"
        "eor r15,r9\n"
        "eor r14,r8\n"
        "eor r13,r7\n"
        "eor r12,r23\n"
        "eor r11,r10\n"
        "eor r14,r15\n"
        "eor r15,r11\n"
        "eor r12,r13\n"
        "com r13\n"
        "std Z+6,r15\n"
        "std Z+14,r14\n"
        "std Z+22,r13\n"
        "std Z+30,r12\n"
        "std Z+38,r11\n"
        "ldd r15,Z+7\n"
        "ldd r14,Z+15\n"
        "ldd r13,Z+23\n"
        "ldd r12,Z+31\n"
        "ldd r11,Z+39\n"
        "eor r15,r11\n"
        "eor r11,r12\n"
        "eor r13,r14\n"
        "mov r10,r15\n"
        "com r10\n"
        "and r10,r14\n"
        "mov r9,r14\n"
        "com r9\n"
        "and r9,r13\n"
        "mov r8,r13\n"
        "com r8\n"
        "and r8,r12\n"
        "mov r7,r12\n"
        "com r7\n"
        "and r7,r11\n"
        "mov r23,r11\n"
        "com r23\n"
        "and r23,r15\n"
        "eor r15,r9\n"
        "eor r14,r8\n"
        "eor r13,r7\n"
        "eor r12,r23\n"
        "eor r11,r10\n"
        "eor r14,r15\n"
        "eor r15,r11\n"
        "eor r12,r13\n"
        "com r13\n"
        "std Z+7,r15\n"
        "std Z+15,r14\n"
        "std Z+23,r13\n"
        "std Z+31,r12\n"
        "std Z+39,r11\n"
        "ld r15,Z\n"
        "ldd r14,Z+1\n"
        "ldd r13,Z+2\n"
        "ldd r12,Z+3\n"
        "ldd r11,Z+4\n"
        "ldd r10,Z+5\n"
        "ldd r9,Z+6\n"
        "ldd r8,Z+7\n"
        "mov r7,r15\n"
        "mov r23,r14\n"
        "mov r22,r13\n"
        "mov r21,r12\n"
        "mov r20,r11\n"
        "mov r19,r10\n"
        "mov r18,r9\n"
        "mov r17,r8\n"
        "bst r22,0\n"
        "ror r23\n"
        "ror r7\n"
        "ror r17\n"
        "ror r18\n"
        "ror r19\n"
        "ror r20\n"
        "ror r21\n"
        "ror r22\n"
        "bld r23,7\n"
        "bst r22,0\n"
        "ror r23\n"
        "ror r7\n"
        "ror r17\n"
        "ror r18\n"
        "ror r19\n"
        "ror r20\n"
        "ror r21\n"
        "ror r22\n"
        "bld r23,7\n"
        "bst r22,0\n"
        "ror r23\n"
        "ror r7\n"
        "ror r17\n"
        "ror r18\n"
        "ror r19\n"
        "ror r20\n"
        "ror r21\n"
        "ror r22\n"
        "bld r23,7\n"
        "eor r22,r15\n"
        "eor r21,r14\n"
        "eor r20,r13\n"
        "eor r19,r12\n"
        "eor r18,r11\n"
        "eor r17,r10\n"
        "eor r7,r9\n"
        "eor r23,r8\n"
        "lsl r11\n"
        "rol r10\n"
        "rol r9\n"
        "rol r8\n"
        "rol r15\n"
        "rol r14\n"
        "rol r13\n"
        "rol r12\n"
        "adc r11,__zero_reg__\n"
        "lsl r11\n"
        "rol r10\n"
        "rol r9\n"
        "rol r8\n"
        "rol r15\n"
        "rol r14\n"
        "rol r13\n"
        "rol r12\n"
        "adc r11,__zero_reg__\n"
        "lsl r11\n"
        "rol r10\n"
        "rol r9\n"
        "rol r8\n"
        "rol r15\n"
        "rol r14\n"
        "rol r13\n"
        "rol r12\n"
        "adc r11,__zero_reg__\n"
        "lsl r11\n"
        "rol r10\n"
        "rol r9\n"
        "rol r8\n"
        "rol r15\n"
        "rol r14\n"
        "rol r13\n"
        "rol r12\n"
        "adc r11,__zero_reg__\n"
        "eor r11,r22\n"
        "eor r10,r21\n"
        "eor r9,r20\n"
        "eor r8,r19\n"
        "eor r15,r18\n"
        "eor r14,r17\n"
        "eor r13,r7\n"
        "eor r12,r23\n"
        "st Z,r11\n"
        "std Z+1,r10\n"
        "std Z+2,r9\n"
        "std Z+3,r8\n"
        "std Z+4,r15\n"
        "std Z+5,r14\n"
        "std Z+6,r13\n"
        "std Z+7,r12\n"
        "ldd r15,Z+8\n"
        "ldd r14,Z+9\n"
        "ldd r13,Z+10\n"
        "ldd r12,Z+11\n"
        "ldd r11,Z+12\n"
        "ldd r10,Z+13\n"
        "ldd r9,Z+14\n"
        "ldd r8,Z+15\n"
        "mov r7,r15\n"
        "mov r23,r14\n"
        "mov r22,r13\n"
        "mov r21,r12\n"
        "mov r20,r11\n"
        "mov r19,r10\n"
        "mov r18,r9\n"
        "mov r17,r8\n"
        "lsl r7\n"
        "rol r23\n"
        "rol r22\n"
        "rol r21\n"
        "rol r20\n"
        "rol r19\n"
        "rol r18\n"
        "rol r17\n"
        "adc r7,__zero_reg__\n"
        "lsl r7\n"
        "rol r23\n"
        "rol r22\n"
        "rol r21\n"
        "rol r20\n"
        "rol r19\n"
        "rol r18\n"
        "rol r17\n"
        "adc r7,__zero_reg__\n"
        "lsl r7\n"
        "rol r23\n"
        "rol r22\n"
        "rol r21\n"
        "rol r20\n"
        "rol r19\n"
        "rol r18\n"
        "rol r17\n"
        "adc r7,__zero_reg__\n"
        "eor r7,r15\n"
        "eor r23,r14\n"
        "eor r22,r13\n"
        "eor r21,r12\n"
        "eor r20,r11\n"
        "eor r19,r10\n"
        "eor r18,r9\n"
        "eor r17,r8\n"
        "lsl r10\n"
        "rol r9\n"
        "rol r8\n"
        "rol r15\n"
        "rol r14\n"
        "rol r13\n"
        "rol r12\n"
        "rol r11\n"
        "adc r10,__zero_reg__\n"
        "eor r10,r7\n"
        "eor r9,r23\n"
        "eor r8,r22\n"
        "eor r15,r21\n"
        "eor r14,r20\n"
        "eor r13,r19\n"
        "eor r12,r18\n"
        "eor r11,r17\n"
        "std Z+8,r10\n"
        "std Z+9,r9\n"
        "std Z+10,r8\n"
        "std Z+11,r15\n"
        "std Z+12,r14\n"
        "std Z+13,r13\n"
        "std Z+14,r12\n"
        "std Z+15,r11\n"
        "ldd r15,Z+16\n"
        "ldd r14,Z+17\n"
        "ldd r13,Z+18\n"
        "ldd r12,Z+19\n"
        "ldd r11,Z+20\n"
        "ldd r10,Z+21\n"
        "ldd r9,Z+22\n"
        "ldd r8,Z+23\n"
        "mov r7,r15\n"
        "mov r23,r14\n"
        "mov r22,r13\n"
        "mov r21,r12\n"
        "mov r20,r11\n"
        "mov r19,r10\n"
        "mov r18,r9\n"
        "mov r17,r8\n"
        "bst r7,0\n"
        "ror r17\n"
        "ror r18\n"
        "ror r19\n"
        "ror r20\n"
        "ror r21\n"
        "ror r22\n"
        "ror r23\n"
        "ror r7\n"
        "bld r17,7\n"
        "eor r7,r15\n"
        "eor r23,r14\n"
        "eor r22,r13\n"
        "eor r21,r12\n"
        "eor r20,r11\n"
        "eor r19,r10\n"
        "eor r18,r9\n"
        "eor r17,r8\n"
        "lsl r14\n"
        "rol r13\n"
        "rol r12\n"
        "rol r11\n"
        "rol r10\n"
        "rol r9\n"
        "rol r8\n"
        "rol r15\n"
        "adc r14,__zero_reg__\n"
        "lsl r14\n"
        "rol r13\n"
        "rol r12\n"
        "rol r11\n"
        "rol r10\n"
        "rol r9\n"
        "rol r8\n"
        "rol r15\n"
        "adc r14,__zero_reg__\n"
        "eor r14,r7\n"
        "eor r13,r23\n"
        "eor r12,r22\n"
        "eor r11,r21\n"
        "eor r10,r20\n"
        "eor r9,r19\n"
        "eor r8,r18\n"
        "eor r15,r17\n"
        "std Z+16,r14\n"
        "std Z+17,r13\n"
        "std Z+18,r12\n"
        "std Z+19,r11\n"
        "std Z+20,r10\n"
        "std Z+21,r9\n"
        "std Z+22,r8\n"
        "std Z+23,r15\n"
        "ldd r15,Z+24\n"
        "ldd r14,Z+25\n"
        "ldd r13,Z+26\n"
        "ldd r12,Z+27\n"
        "ldd r11,Z+28\n"
        "ldd r10,Z+29\n"
        "ldd r9,Z+30\n"
        "ldd r8,Z+31\n"
        "mov r7,r15\n"
        "mov r23,r14\n"
        "mov r22,r13\n"
        "mov r21,r12\n"
        "mov r20,r11\n"
        "mov r19,r10\n"
        "mov r18,r9\n"
        "mov r17,r8\n"
        "bst r23,0\n"
        "ror r7\n"
        "ror r17\n"
        "ror r18\n"
        "ror r19\n"
        "ror r20\n"
        "ror r21\n"
        "ror r22\n"
        "ror r23\n"
        "bld r7,7\n"
        "bst r23,0\n"
        "ror r7\n"
        "ror r17\n"
        "ror r18\n"
        "ror r19\n"
        "ror r20\n"
        "ror r21\n"
        "ror r22\n"
        "ror r23\n"
        "bld r7,7\n"
        "eor r23,r15\n"
        "eor r22,r14\n"
        "eor r21,r13\n"
        "eor r20,r12\n"
        "eor r19,r11\n"
        "eor r18,r10\n"
        "eor r17,r9\n"
        "eor r7,r8\n"
        "bst r13,0\n"
        "ror r14\n"
        "ror r15\n"
        "ror r8\n"
        "ror r9\n"
        "ror r10\n"
        "ror r11\n"
        "ror r12\n"
        "ror r13\n"
        "bld r14,7\n"
        "eor r13,r23\n"
        "eor r12,r22\n"
        "eor r11,r21\n"
        "eor r10,r20\n"
        "eor r9,r19\n"
        "eor r8,r18\n"
        "eor r15,r17\n"
        "eor r14,r7\n"
        "std Z+24,r13\n"
        "std Z+25,r12\n"
        "std Z+26,r11\n"
        "std Z+27,r10\n"
        "std Z+28,r9\n"
        "std Z+29,r8\n"
        "std Z+30,r15\n"
        "std Z+31,r14\n"
        "ldd r15,Z+32\n"
        "ldd r14,Z+33\n"
        "ldd r13,Z+34\n"
        "ldd r12,Z+35\n"
        "ldd r11,Z+36\n"
        "ldd r10,Z+37\n"
        "ldd r9,Z+38\n"
        "ldd r8,Z+39\n"
        "mov r7,r15\n"
        "mov r23,r14\n"
        "mov r22,r13\n"
        "mov r21,r12\n"
        "mov r20,r11\n"
        "mov r19,r10\n"
        "mov r18,r9\n"
        "mov r17,r8\n"
        "lsl r23\n"
        "rol r22\n"
        "rol r21\n"
        "rol r20\n"
        "rol r19\n"
        "rol r18\n"
        "rol r17\n"
        "rol r7\n"
        "adc r23,__zero_reg__\n"
        "eor r23,r15\n"
        "eor r22,r14\n"
        "eor r21,r13\n"
        "eor r20,r12\n"
        "eor r19,r11\n"
        "eor r18,r10\n"
        "eor r17,r9\n"
        "eor r7,r8\n"
        "bst r10,0\n"
        "ror r11\n"
        "ror r12\n"
        "ror r13\n"
        "ror r14\n"
        "ror r15\n"
        "ror r8\n"
        "ror r9\n"
        "ror r10\n"
        "bld r11,7\n"
        "eor r10,r23\n"
        "eor r9,r22\n"
        "eor r8,r21\n"
        "eor r15,r20\n"
        "eor r14,r19\n"
        "eor r13,r18\n"
        "eor r12,r17\n"
        "eor r11,r7\n"
        "std Z+32,r10\n"
        "std Z+33,r9\n"
        "std Z+34,r8\n"
        "std Z+35,r15\n"
        "std Z+36,r14\n"
        "std Z+37,r13\n"
        "std Z+38,r12\n"
        "std Z+39,r11\n"
        "subi %1,0x0F\n"
        "cpi %1,0x3C\n"
        "breq 2f\n"
        "rjmp 1b\n"
        "2:\n" ::"z"(state.S),
        "d"((uint8_t)(0xF0 - (first << 4) + first))
        : "r17", "r18", "r19", "r20", "r21", "r22", "r23", "r7", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "memory");
}

#endif // __AVR__
