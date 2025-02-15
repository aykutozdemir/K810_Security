#include "StatisticController.h"
#include <MemoryUsage.h>

void StatisticController::setup()
{
  MemoryUsage::stackPaint();
} // end setup

void StatisticController::loop(Print &print,
                               const Statistic *statistics[],
                               const uint8_t statisticSize)
{
  static bool firstRun = true;

  if (firstRun)
  {
    firstRun = false;

    printRam(print);
    printInterruptTable(print);
  }
} // end loop

void StatisticController::printStatisticTable(Print &print,
                                              const Statistic *statistics[],
                                              const uint8_t statisticSize)
{
  print.println(F("********************"));
  for (int i = 0; i < statisticSize; ++i)
  {
    statistics[i]->print(print);
    if ((i + 1) < statisticSize)
    {
      print.println(F("--------------------"));
    }
  }
  print.println(F("********************"));
}

void StatisticController::printRam(Print &print)
{
  MemoryUsage::ramDisplay(print);
}

void StatisticController::printInterruptTable(Print &print)
{
  print.println(F("********************"));
  print.println(F("Enabled Interrupts"));

  // External Interrupts
  print.print(F("EIMSK (External Interrupts): "));
  print.println(EIMSK, BIN);

  // Pin Change Interrupts
  print.print(F("PCICR (Pin Change Interrupts): "));
  print.println(PCICR, BIN);

  print.print(F("PCMSK0: "));
  print.println(PCMSK0, BIN);
#ifdef PCMSK1
  print.print(F("PCMSK1: "));
  print.println(PCMSK1, BIN);
#endif
#ifdef PCMSK2
  print.print(F("PCMSK2: "));
  print.println(PCMSK2, BIN);
#endif

  // Timer Interrupts
  print.print(F("TIMSK0 (Timer0): "));
  print.println(TIMSK0, BIN);
  print.print(F("TIMSK1 (Timer1): "));
  print.println(TIMSK1, BIN);
  print.print(F("TIMSK3 (Timer3): "));
  print.println(TIMSK3, BIN);
  print.print(F("TIMSK4 (Timer4): "));
  print.println(TIMSK4, BIN);

  // USART Interrupts
  print.print(F("UCSR1B (USART Interrupts): "));
  print.println(UCSR1B, BIN);

  // I2C Interrupt
  print.print(F("TWCR (TWI/I2C Interrupt): "));
  print.println(TWCR, BIN);

  // SPI Interrupt
  print.print(F("SPCR (SPI Interrupt): "));
  print.println(SPCR, BIN);

  // ADC Interrupt
  print.print(F("ADCSRA (ADC Interrupt): "));
  print.println(ADCSRA, BIN);

  // EEPROM Ready Interrupt
  print.print(F("EECR (EEPROM Interrupt): "));
  print.println(EECR, BIN);

  // Analog Comparator Interrupt
  print.print(F("ACSR (Analog Comparator Interrupt): "));
  print.println(ACSR, BIN);

  // USB Interrupts
  print.print(F("USBCON (USB Control Register): "));
  print.println(USBCON, BIN);
  print.print(F("UDIEN (USB Interrupt Enable Register): "));
  print.println(UDIEN, BIN);

  print.println(F("********************"));
}