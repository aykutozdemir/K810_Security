#include "MemoryUsage.h"

#define STACK_CANARY 0xc5

void MemoryUsage::stackPaint(void)
{
	uint8_t *p = (__brkval == 0 ? (uint8_t *)&__heap_start : __brkval);

	while (p < &__stack)
	{
		*p = STACK_CANARY;
		++p;
	}
}

int MemoryUsage::freeRam()
{
	uint8_t *heap_end = (__brkval == 0) ? (uint8_t *)&__heap_start : __brkval;

	return SP - (int)heap_end; // Subtract from actual heap end
}

int MemoryUsage::minimumFreeRam(void)
{
	uint8_t *scan_start = (__brkval == 0 ? (uint8_t *)&__heap_start : __brkval); // Start scanning from brkval
	uint8_t *scan_end = (uint8_t *)SP;											 // Stop at the stack pointer

	uint8_t *current = scan_start;
	const uint8_t *longest_start = NULL;
	const uint8_t *longest_end = NULL;
	uint8_t *block_start = NULL;

	while (current < scan_end)
	{
		if (*current == STACK_CANARY) // Found a canary byte
		{
			if (block_start == NULL) // Start a new block
				block_start = current;
		}
		else // Found a non-canary byte
		{
			if (block_start != NULL) // End of a canary block
			{
				if ((longest_start == NULL) || ((current - block_start) > (longest_end - longest_start)))
				{
					longest_start = block_start;
					longest_end = current;
				}
				block_start = NULL; // Reset
			}
		}
		++current;
	}

	// Check if the last block is the longest
	if (block_start != NULL && (longest_start == NULL || (scan_end - block_start) > (longest_end - longest_start)))
	{
		longest_start = block_start;
		longest_end = scan_end;
	}

	// Return the size of the largest canary block found
	return longest_end ? (int)(longest_end - longest_start) : 0;
}

void MemoryUsage::ramDisplay(Print &out)
{
	const int data_size = (int)&__data_end - (int)&__data_start;
	const int bss_size = (int)&__bss_end - (int)&__bss_start;
	const int heap_end = (int)(__brkval == 0 ? (uint8_t *)&__heap_start : __brkval);
	const int heap_size = heap_end - (int)&__bss_end;
	const int stack_size = RAMEND - (int)SP + 1;
	const int available = freeRam();
	const int min_available = minimumFreeRam();

	out.println(F("********************"));
	out.print(F("+----------------+ "));
	out.print((int)&__data_start);
	out.println(F(" (__data_start)"));
	out.print(F("+      data      +"));
	out.println();
	out.print(F("+    variables   + size = "));
	out.println(data_size);
	out.print(F("+----------------+ "));
	out.print((int)&__data_end);
	out.println(F(" (__data_end / __bss_start)"));
	out.print(F("+      bss       +"));
	out.println();
	out.print(F("+    variables   + size = "));
	out.println(bss_size);
	out.print(F("+----------------+ "));
	out.print((int)&__bss_end);
	out.println(F(" (__bss_end / __heap_start)"));
	out.print(F("+      heap      + size = "));
	out.println(heap_size);
	out.print(F("+----------------+ "));
	out.print((int)heap_end);
	out.println(F(" (__brkval if not 0, or __heap_start)"));
	out.print(F("+                +"));
	out.println();
	out.print(F("+                +"));
	out.println();
	out.print(F("+   FREE RAM     + size = "));
	out.print(available);
	out.print(F(", min_size = "));
	out.println(min_available);
	out.print(F("+                +"));
	out.println();
	out.print(F("+                +"));
	out.println();
	out.print(F("+----------------+ "));
	out.print((int)SP);
	out.println(F(" (SP)"));
	out.print(F("+     stack      + size = "));
	out.println(stack_size);
	out.print(F("+----------------+ "));
	out.print((int)RAMEND);
	out.println(F(" (RAMEND / __stack)"));
	out.println(F("********************"));

	if (min_available < 100)
	{
		uint8_t *p = (__brkval == 0 ? (uint8_t *)&__heap_start : __brkval);

		int i = 0;
		int j = 0;
		while (i < 100)
		{
			++i;

			if (*p == STACK_CANARY)
			{
				++j;
			}
			++p;
		}

		out.print(F("Warning: Possible collision between heap and stack: %"));
		out.println(100 - j);
		out.println(F("********************"));
	}
}