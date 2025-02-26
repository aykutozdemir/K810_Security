
.pio/build/promicro16/firmware.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
       0:	0c 94 49 06 	jmp	0xc92	; 0xc92 <__dtors_end>
       4:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
       8:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
       c:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      10:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      14:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      18:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      1c:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      20:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      24:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      28:	0c 94 2c 1e 	jmp	0x3c58	; 0x3c58 <__vector_10>
      2c:	0c 94 a9 1e 	jmp	0x3d52	; 0x3d52 <__vector_11>
      30:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      34:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      38:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      3c:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      40:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      44:	0c 94 fa 21 	jmp	0x43f4	; 0x43f4 <__vector_17>
      48:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      4c:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      50:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      54:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      58:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      5c:	0c 94 e2 1d 	jmp	0x3bc4	; 0x3bc4 <__vector_23>
      60:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      64:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      68:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      6c:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      70:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      74:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      78:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      7c:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      80:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      84:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      88:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      8c:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      90:	0c 94 db 20 	jmp	0x41b6	; 0x41b6 <__vector_36>
      94:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      98:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      9c:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      a0:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      a4:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>
      a8:	0c 94 71 06 	jmp	0xce2	; 0xce2 <__bad_interrupt>

000000ac <__trampolines_end>:
      ac:	4e 41       	sbci	r20, 0x1E	; 30
      ae:	4e 49       	Address 0x00000000000000ae is out of bounds.
.word	0xffff	; ????

000000af <pstr_inity>:
      af:	49 4e 49 54 59                                      INITY

000000b4 <pstr_inf>:
      b4:	49 4e 46                                            INF

000000b7 <pwr_m10>:
      b7:	cd cc cc 3d 0a d7 23 3c 17 b7 d1 38 77 cc 2b 32     ...=..#<...8w.+2
      c7:	95 95 e6 24 1f b1 4f 0a                             ...$..O.

000000cf <pwr_p10>:
      cf:	00 00 20 41 00 00 c8 42 00 40 1c 46 20 bc be 4c     .. A...B.@.F ..L
      df:	ca 1b 0e 5a ae c5 9d 74                             ...Z...t

000000e7 <_ZZN4impl13ArgConstraint14getTypeNamePgmE7ArgTypeE7_string>:
      e7:	73 74 72 69 6e 67 00                                string.

000000ee <_ZZN4impl13ArgConstraint14getTypeNamePgmE7ArgTypeE6_float>:
      ee:	66 6c 6f 61 74 00                                   float.

000000f4 <_ZZN4impl13ArgConstraint14getTypeNamePgmE7ArgTypeE4_int>:
      f4:	69 6e 74 00                                         int.

000000f8 <_ZZN4impl13ArgConstraint14getTypeNamePgmE7ArgTypeE5_null>:
      f8:	6e 75 6c 6c 00                                      null.

000000fd <_ZZL7printOKR14SerialCommandsE3__c>:
      fd:	0d 0a 4f 4b 00                                      ..OK.

00000102 <_ZZL10printErrorR14SerialCommandsPK19__FlashStringHelperE3__c>:
     102:	45 52 52 4f 52 3a 20 00                             ERROR: .

0000010a <_ZZL12printHexByteR14SerialCommandshE8hexChars>:
     10a:	30 31 32 33 34 35 36 37 38 39 41 42 43 44 45 46     0123456789ABCDEF
	...

0000011b <_ZZ11commandPingR14SerialCommandsR4ArgsE3__c>:
     11b:	70 6f 6e 67 00                                      pong.

00000120 <_ZZNK9Statistic5printER5PrintE3__c_0>:
     120:	28 55 6e 6e 61 6d 65 64 29 00                       (Unnamed).

0000012a <_ZZNK9Statistic5printER5PrintE3__c_4>:
     12a:	75 73 00                                            us.

0000012d <_ZZNK9Statistic5printER5PrintE3__c_3>:
     12d:	75 73 20 41 76 67 3a 20 00                          us Avg: .

00000136 <_ZZNK9Statistic5printER5PrintE3__c_2>:
     136:	75 73 20 4d 61 78 3a 20 00                          us Max: .

0000013f <_ZZNK9Statistic5printER5PrintE3__c_1>:
     13f:	4d 69 6e 3a 20 00                                   Min: .

00000145 <_ZZNK9Statistic5printER5PrintE3__c>:
     145:	53 74 61 74 69 73 74 69 63 3a 20 00                 Statistic: .

00000151 <_ZZNK19StatisticController19printStatisticTableER5PrintPPK9StatistichE3__c>:
     151:	2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d     ----------------
     161:	2d 2d 2d 2d 00                                      ----.

00000166 <_ZZ12commandCheckR14SerialCommandsR4ArgsE3__c>:
     166:	41 6c 72 65 61 64 79 20 63 68 65 63 6b 65 64 00     Already checked.

00000176 <_ZZ9seedCheckR14SerialCommandsR4ArgsE3__c>:
     176:	53 65 65 64 20 6e 6f 74 20                          Seed not 

0000017f <_ZZ5setupE3__c__12_>:
     17f:	63 68 65 63 6b 65 64 00                             checked.

00000187 <_ZZ9seedCheckR14SerialCommandsR4ArgsE3__c_1>:
     187:	53 65 65 64 20 6e 6f 74 20 6d 61 74 63 68 65 64     Seed not matched
	...

00000198 <_ZZ9seedCheckR14SerialCommandsR4ArgsE3__c_0>:
     198:	49 6e 76 61 6c 69 64 20 73 65 65 64 20 66 6f 72     Invalid seed for
     1a8:	6d 61 74 00                                         mat.

000001ac <_ZZL17bluetoothCallbackPK19__FlashStringHelperbRK6StringE3__c>:
     1ac:	42 54 20 73 75 63 63 65 73 73 66 75 6c 6c 79 20     BT successfully 
	...

000001bd <_ZZL17bluetoothCallbackPK19__FlashStringHelperbRK6StringE3__c_1>:
     1bd:	42 54 20 65 72 72 6f 72 20 00                       BT error .

000001c7 <_ZZN5ezLED4loopEvE3__c>:
     1c7:	55 4e 4b 4e 4f 57 20 53 54 41 54 45 00              UNKNOW STATE.

000001d4 <_ZZN14SerialCommands12listCommandsEPK7CommandjE3__c>:
     1d4:	20 2d 20 00                                          - .

000001d8 <_ZZN14SerialCommands16processArgumentsEPK7CommandPPcR4ArgsRhE3__c_2>:
     1d8:	20 28 00                                             (.

000001db <_ZZN14SerialCommands16processArgumentsEPK7CommandPPcR4ArgsRhE3__c_1>:
     1db:	45 52 52 4f 52 3a 20 41 72 67 75 6d 65 6e 74 20     ERROR: Argument 
     1eb:	6f 75 74 20 6f 66 20 72 61 6e 67 65 20 00           out of range .

000001f9 <_ZZN14SerialCommands16processArgumentsEPK7CommandPPcR4ArgsRhE3__c_0>:
     1f9:	45 52 52 4f 52 3a 20 43 61 6e 27 74 20 70 61 72     ERROR: Can't par
     209:	73 65 20 61 72 67 75 6d 65 6e 74 20 00              se argument .

00000216 <_ZZN14SerialCommands16processArgumentsEPK7CommandPPcR4ArgsRhE3__c>:
     216:	45 52 52 4f 52 3a 20 4e 6f 74 20 65 6e 6f 75 67     ERROR: Not enoug
     226:	68 20 61 72 67 75 6d 65 6e 74 73 00                 h arguments.

00000232 <_ZZN14SerialCommands12parseCommandEPcE3__c_0>:
     232:	45 52 52 4f 52 3a 20 43 6f 6d 6d 61 6e 64 20 64     ERROR: Command d
     242:	6f 65 73 20 6e 6f 74 20 65 78 69 73 74 20 22 00     oes not exist ".

00000252 <_ZZN14SerialCommands12parseCommandEPcE3__c>:
     252:	45 52 52 4f 52 3a 20 54 6f 6f 20 6d 61 6e 79 20     ERROR: Too many 
     262:	61 72 67 75 6d 65 6e 74 73 00                       arguments.

0000026c <_ZZN14SerialCommands10readSerialEvE3__c>:
     26c:	45 52 52 4f 52 3a 20 42 75 66 66 65 72 20 6f 76     ERROR: Buffer ov
     27c:	65 72 66 6c 6f 77 00                                erflow.

00000283 <_ZZN11MemoryUsage10ramDisplayER5PrintE3__c__23_>:
     283:	57 61 72 6e 69 6e 67 3a 20 50 6f 73 73 69 62 6c     Warning: Possibl
     293:	65 20 63 6f 6c 6c 69 73 69 6f 6e 20 62 65 74 77     e collision betw
     2a3:	65 65 6e 20 68 65 61 70 20 61 6e 64 20 73 74 61     een heap and sta
     2b3:	63 6b 3a 20 25 00                                   ck: %.

000002b9 <_ZZN11MemoryUsage10ramDisplayER5PrintE3__c__22_>:
     2b9:	20 28 52 41 4d 45 4e 44 20 2f 20 5f 5f 73 74 61      (RAMEND / __sta
     2c9:	63 6b 29 00                                         ck).

000002cd <_ZZN11MemoryUsage10ramDisplayER5PrintE3__c>:
     2cd:	2b 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d     +---------------
     2dd:	2d 2b 20 00                                         -+ .

000002e1 <_ZZN11MemoryUsage10ramDisplayER5PrintE3__c__20_>:
     2e1:	2b 20 20 20 20 20 73 74 61 63 6b 20 20 20 20 20     +     stack     
     2f1:	20 2b 20 73 69 7a 65 20 3d 20 00                     + size = .

000002fc <_ZZN11MemoryUsage10ramDisplayER5PrintE3__c__19_>:
     2fc:	20 28 53 50 29 00                                    (SP).

00000302 <_ZZN11MemoryUsage10ramDisplayER5PrintE3__c__12_>:
     302:	2b 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20     +               
     312:	20 2b 00                                             +.

00000315 <_ZZN11MemoryUsage10ramDisplayER5PrintE3__c__15_>:
     315:	2c 20 6d 69 6e 5f 73 69 7a 65 20 3d 20 00           , min_size = .

00000323 <_ZZN11MemoryUsage10ramDisplayER5PrintE3__c__14_>:
     323:	2b 20 20 20 46 52 45 45 20 52 41 4d 20 20 20 20     +   FREE RAM    
     333:	20 2b 20 73 69 7a 65 20 3d 20 00                     + size = .

0000033e <_ZZN11MemoryUsage10ramDisplayER5PrintE3__c__11_>:
     33e:	20 28 5f 5f 62 72 6b 76 61 6c 20 69 66 20 6e 6f      (__brkval if no
     34e:	74 20 30 2c 20 6f 72 20 5f 5f 68 65 61 70 5f 73     t 0, or __heap_s
     35e:	74 61 72 74 29 00                                   tart).

00000364 <_ZZN11MemoryUsage10ramDisplayER5PrintE3__c_9>:
     364:	2b 20 20 20 20 20 20 68 65 61 70 20 20 20 20 20     +      heap     
     374:	20 2b 20 73 69 7a 65 20 3d 20 00                     + size = .

0000037f <_ZZN11MemoryUsage10ramDisplayER5PrintE3__c_8>:
     37f:	20 28 5f 5f 62 73 73 5f 65 6e 64 20 2f 20 5f 5f      (__bss_end / __
     38f:	68 65 61 70 5f 73 74 61 72 74 29 00                 heap_start).

0000039b <_ZZN11MemoryUsage10ramDisplayER5PrintE3__c_2>:
     39b:	2b 20 20 20 20 76 61 72 69 61 62 6c 65 73 20 20     +    variables  
     3ab:	20 2b 20 73 69 7a 65 20 3d 20 00                     + size = .

000003b6 <_ZZN11MemoryUsage10ramDisplayER5PrintE3__c_5>:
     3b6:	2b 20 20 20 20 20 20 62 73 73 20 20 20 20 20 20     +      bss      
     3c6:	20 2b 00                                             +.

000003c9 <_ZZN11MemoryUsage10ramDisplayER5PrintE3__c_4>:
     3c9:	20 28 5f 5f 64 61 74 61 5f 65 6e 64 20 2f 20 5f      (__data_end / _
     3d9:	5f 62 73 73 5f 73 74 61 72 74 29 00                 _bss_start).

000003e5 <_ZZN11MemoryUsage10ramDisplayER5PrintE3__c_1>:
     3e5:	2b 20 20 20 20 20 20 64 61 74 61 20 20 20 20 20     +      data     
     3f5:	20 2b 00                                             +.

000003f8 <_ZZN11MemoryUsage10ramDisplayER5PrintE3__c_0>:
     3f8:	20 28 5f 5f 64 61 74 61 5f 73 74 61 72 74 29 00      (__data_start).

00000408 <_ZZN11MemoryUsage10printStarsER5PrintE3__c>:
     408:	2a 2a 2a 2a 2a 2a 2a 2a 2a 2a 2a 2a 2a 2a 2a 2a     ****************
     418:	2a 2a 2a 2a 00                                      ****.

0000041d <STRING_MANUFACTURER>:
     41d:	53 70 61 72 6b 46 75 6e 00                          SparkFun.

00000426 <STRING_PRODUCT>:
     426:	53 70 61 72 6b 46 75 6e 20 50 72 6f 20 4d 69 63     SparkFun Pro Mic
     436:	72 6f 00                                            ro.

00000439 <_ZZN18WatchdogController16printResetReasonER6StreamE3__c_5>:
     439:	49 6e 69 74 69 61 6c 20 50 6f 77 65 72 2d 6f 6e     Initial Power-on
	...

0000044a <_ZZN18WatchdogController16printResetReasonER6StreamE3__c_4>:
     44a:	4a 54 41 47 20 52 65 73 65 74 00                    JTAG Reset.

00000455 <_ZZN18WatchdogController16printResetReasonER6StreamE3__c_3>:
     455:	57 61 74 63 68 64 6f 67 20 52 65 73 65 74 00        Watchdog Reset.

00000464 <_ZZN18WatchdogController16printResetReasonER6StreamE3__c_2>:
     464:	42 72 6f 77 6e 2d 6f 75 74 20 52 65 73 65 74 00     Brown-out Reset.

00000474 <_ZZN18WatchdogController16printResetReasonER6StreamE3__c_1>:
     474:	45 78 74 65 72 6e 61 6c 20 52 65 73 65 74 00        External Reset.

00000483 <_ZZN18WatchdogController16printResetReasonER6StreamE3__c_0>:
     483:	50 6f 77 65 72 2d 6f 6e 20 52 65 73 65 74 00        Power-on Reset.

00000492 <_ZZN18WatchdogController16printResetReasonER6StreamE3__c>:
     492:	52 65 73 65 74 20 52 65 61 73 6f 6e 3a 20 00        Reset Reason: .

000004a1 <_ZZL21bluetoothInitSequencevE3__c_2>:
     4a1:	41 54 2b 52 45 53 45 54 00                          AT+RESET.

000004aa <_ZZL21bluetoothInitSequencevE3__c_1>:
     4aa:	41 54 2b 49 4e 49 54 00                             AT+INIT.

000004b2 <_ZZL21bluetoothInitSequencevE3__c_0>:
     4b2:	41 54 2b 43 4d 4f 44 45 3d 31 00                    AT+CMODE=1.

000004bd <_ZZL21bluetoothInitSequencevE3__c>:
     4bd:	41 54 2b 52 4f 4c 45 3d 30 00                       AT+ROLE=0.

000004c7 <_ZZ5setupE3__c__11_>:
     4c7:	4b 38 31 30 20 53 65 63 75 72 69 74 79 20 73 74     K810 Security st
     4d7:	61 72 74 65 64 3a 20 00                             arted: .

000004df <_ZZ5setupE3__c__10_>:
     4df:	4c 6f 6f 70 00                                      Loop.

000004e4 <_ZZ5setupE3__c_9>:
     4e4:	42 75 73 69 6e 65 73 73 20 4c 6f 67 69 63 00        Business Logic.

000004f3 <_ZZ5setupE3__c_8>:
     4f3:	42 54 20 43 6d 64 73 00                             BT Cmds.

000004fb <_ZZ5setupE3__c_7>:
     4fb:	45 45 50 52 4f 4d 00                                EEPROM.

00000502 <_ZZ5setupE3__c_6>:
     502:	48 43 2d 30 35 00                                   HC-05.

00000508 <_ZZ5setupE3__c_5>:
     508:	53 65 72 69 61 6c 20 43 6d 64 73 00                 Serial Cmds.

00000514 <_ZZ5setupE3__c_4>:
     514:	4b 65 79 62 6f 61 72 64 00                          Keyboard.

0000051d <_ZZ5setupE3__c_3>:
     51d:	42 75 74 74 6f 6e 00                                Button.

00000524 <_ZZ5setupE3__c_2>:
     524:	52 78 20 54 78 20                                   Rx Tx 

0000052a <_ZZ5setupE3__c_1>:
     52a:	4c 65 64 00                                         Led.

0000052e <_ZZ5setupE3__c_0>:
     52e:	53 74 61 74 69 73 74 69 63 00                       Statistic.

00000538 <_ZZ5setupE3__c>:
     538:	57 61 74 63 68 64 6f 67 00                          Watchdog.

00000541 <_ZZ5setupE3__c__13_>:
     541:	75 6e 63 68 65 63 6b 65 64 00                       unchecked.

0000054b <_ZZN10SoftSerialILh32ELh32EE4loopEvE3__c_1>:
     54b:	53 6f 66 74 53 65 72 69 61 6c 3a 20 50 61 72 69     SoftSerial: Pari
     55b:	74 79 20 65 72 72 6f 72 00                          ty error.

00000564 <_ZZN10SoftSerialILh32ELh32EE4loopEvE3__c_0>:
     564:	53 6f 66 74 53 65 72 69 61 6c 3a 20 53 74 6f 70     SoftSerial: Stop
     574:	20 62 69 74 20 65 72 72 6f 72 00                     bit error.

0000057f <_ZZN10SoftSerialILh32ELh32EE4loopEvE3__c>:
     57f:	53 6f 66 74 53 65 72 69 61 6c 3a 20 53 74 61 72     SoftSerial: Star
     58f:	74 20 62 69 74 20 65 72 72 6f 72 00                 t bit error.

0000059b <_ZZN4HC0518processNextCommandEvE3__c>:
     59b:	48 43 2d 30 35 20 73 65 6e 64 69 6e 67 20 63 6f     HC-05 sending co
     5ab:	6d 6d 61 6e 64 3a 20 00                             mmand: .

000005b3 <_ZZN4HC0524handleWaitingForResponseEvE3__c>:
     5b3:	48 43 2d 30 35 20 63 6f 6d 6d 61 6e 64 20 70 72     HC-05 command pr
     5c3:	6f 63 65 73 73 69 6e 67 20 73 74 75 63 6b 2e 20     ocessing stuck. 
     5d3:	52 65 73 65 74 74 69 6e 67 2e 2e 2e 00              Resetting....

000005e0 <_ZZN4HC0531processResponseBufferForCommandEvE3__c_1>:
     5e0:	46 41 49 4c 00                                      FAIL.

000005e5 <_ZZN4HC0531processResponseBufferForCommandEvE3__c_0>:
     5e5:	45 52 52 4f 52 3a 00                                ERROR:.

000005ec <_ZZN4HC0526handleWaitingForATResponseEvE3__c>:
     5ec:	4f 4b 0d 0a 00                                      OK...

000005f1 <_ZZN4HC0524handleWaitingForDataModeEvE3__c>:
     5f1:	48 43 2d 30 35 20 69 73 20 69 6e 20 44 41 54 41     HC-05 is in DATA
     601:	20 6d 6f 64 65 00                                    mode.

00000607 <_ZZN4HC0527handleWaitingForCommandModeEvE3__c>:
     607:	48 43 2d 30 35 20 69 73 20 69 6e 20 43 4f 4d 4d     HC-05 is in COMM
     617:	41 4e 44 20 6d 6f 64 65 00                          AND mode.

00000620 <_ZZN4HC0526handleWaitingForATResponseEvE3__c_0>:
     620:	48 43 2d 30 35 20 69 73 20 72 65 63 6f 67 6e 69     HC-05 is recogni
     630:	7a 65 64 2e 00                                      zed..

00000635 <_ZZN4HC0526handleWaitingForATResponseEvE3__c_1>:
     635:	48 43 2d 30 35 20 41 54 20 6d 6f 64 65 20 63 68     HC-05 AT mode ch
     645:	65 63 6b 20 66 61 69 6c 65 64 2e 20 52 65 73 65     eck failed. Rese
     655:	74 74 69 6e 67 2e 2e 2e 3a 20 00                    tting...: .

00000660 <_ZZN4HC0520handleCheckingATModeEvE3__c>:
     660:	41 54 0d 0a 00                                      AT...

00000665 <_ZZN4HC0518handleInitializingEvE3__c>:
     665:	49 6e 69 74 69 61 6c 69 7a 69 6e 67 20 48 43 2d     Initializing HC-
     675:	30 35 2e 2e                                         05..

00000679 <_ZZL17bluetoothCallbackPK19__FlashStringHelperbRK6StringE3__c_0>:
     679:	2e 00                                               ..

0000067b <_ZZN4HC0521updateConnectionStateEvE3__c_0>:
     67b:	42 54 20 64 65 76 69 63 65 20 64 69 73 63 6f 6e     BT device discon
     68b:	6e 65 63 74 65 64 2e 00                             nected..

00000693 <_ZZN4HC0521updateConnectionStateEvE3__c>:
     693:	42 54 20 64 65 76 69 63 65 20 63 6f 6e 6e 65 63     BT device connec
     6a3:	74 65 64 2e 00                                      ted..

000006a8 <_ZZN4HC058sendDataEcE3__c>:
     6a8:	45 72 72 6f 72 3a 20 43 61 6e 6e 6f 74 20 73 65     Error: Cannot se
     6b8:	6e 64 20 64 61 74 61 20 69 6e 20 63 6f 6d 6d 61     nd data in comma
     6c8:	6e 64 20 6d 6f 64 65 21 00                          nd mode!.

000006d1 <_ZZN16EEPROMController19formatInternalPagesEvE3__c>:
     6d1:	49 6e 74 65 72 6e 61 6c 20 45 45 50 52 4f 4d 20     Internal EEPROM 
     6e1:	66 6f 72 6d 61 74 74 65 64 2c 20 63 6f 75 6e 74     formatted, count
     6f1:	65 72 3a 20 00                                      er: .

000006f6 <_ZZN16EEPROMController18formatExternalPageEvE3__c>:
     6f6:	45 78 74 65 72 6e 61 6c 20 45 45 50 52 4f 4d 20     External EEPROM 
     706:	70 61 67 65 20 66 6f 72 6d 61 74 74 65 64 2c 20     page formatted, 
     716:	70 61 67 65 3a 20 00                                page: .

0000071d <_ZZN16EEPROMController4loopEvE3__c>:
     71d:	45 78 74 65 72 6e 61 6c 20 45 45 50 52 4f 4d 20     External EEPROM 
     72d:	66 6f 72 6d 61 74 74 69 6e 67 20 63 6f 6d 70 6c     formatting compl
     73d:	65 74 65 64 2e 00                                   eted..

00000743 <_ZZN16EEPROMController4loopEvE3__c_0>:
     743:	49 6e 74 65 72 6e 61 6c 20 45 45 50 52 4f 4d 20     Internal EEPROM 
     753:	66 6f 72 6d 61 74 74 69 6e 67 20 63 6f 6d 70 6c     formatting compl
     763:	65 74 65 64 2e 00                                   eted..

00000769 <_ZZL22bluetoothResetSequencevE3__c_4>:
     769:	41 54 2b 55 41 52 54 3d 33 38 34 30 30 2c 31 2c     AT+UART=38400,1,
     779:	30 00                                               0.

0000077b <_ZZL22bluetoothResetSequencevE3__c_3>:
     77b:	41 54 2b 50 53 57 44 3d 31 35 38 38 00              AT+PSWD=1588.

00000788 <_ZZL22bluetoothResetSequencevE3__c_2>:
     788:	41 54 2b 4e 41 4d 45 3d 4b 38 31 30 00              AT+NAME=K810.

00000795 <_ZZL22bluetoothResetSequencevE3__c>:
     795:	41 54 2b 52 4d 41 41 44 00                          AT+RMAAD.

0000079e <_ZZL19handleBusinessLogicvE3__c_1>:
     79e:	4b 65 79 70 61 64 20 66 6f 72 6d 61 74 74 69 6e     Keypad formattin
     7ae:	67 2e 2e 2e 00                                      g....

000007b3 <_ZZL19handleBusinessLogicvE3__c_0>:
     7b3:	42 54 20 6d 6f 64 75 6c 65 20 72 65 73 65 74 74     BT module resett
     7c3:	69 6e 67 2e 2e 2e 00                                ing....

000007ca <_ZZL19handleBusinessLogicvE3__c>:
     7ca:	46 6f 72 6d 61 74 74 69 6e 67 20 63 6f 6d 70 6c     Formatting compl
     7da:	65 74 65 64 2c 20 72 65 73 65 74 74 69 6e 67 2e     eted, resetting.
     7ea:	2e 2e 00                                            ...

000007ed <_ZZ4loopE3__c>:
     7ed:	54 69 6d 65 72 31 20 43 6f 6d 70 41 20 6f 76 65     Timer1 CompA ove
     7fd:	72 6c 6f 61 64 65 64 00                             rloaded.

00000805 <_ZZN4HC0511sendCommandERKNS_7CommandEE3__c>:
     805:	45 72 72 6f 72 3a 20 43 6f 6d 6d 61 6e 64 20 71     Error: Command q
     815:	75 65 75 65 20 69 73 20 66 75 6c 6c 21 00           ueue is full!.

00000823 <_ZZNK19StatisticController19printInterruptTableER5PrintE3__c__14_>:
     823:	55 44 49 45 4e 20 28 55 53 42 20 49 6e 74 65 72     UDIEN (USB Inter
     833:	72 75 70 74 20 45 6e 61 62 6c 65 20 52 65 67 69     rupt Enable Regi
     843:	73 74 65 72 29 3a 20 00                             ster): .

0000084b <_ZZNK19StatisticController19printInterruptTableER5PrintE3__c__13_>:
     84b:	55 53 42 43 4f 4e 20 28 55 53 42 20 43 6f 6e 74     USBCON (USB Cont
     85b:	72 6f 6c 20 52 65 67 69 73 74 65 72 29 3a 20 00     rol Register): .

0000086b <_ZZNK19StatisticController19printInterruptTableER5PrintE3__c__12_>:
     86b:	41 43 53 52 20 28 41 6e 61 6c 6f 67 20 43 6f 6d     ACSR (Analog Com
     87b:	70 61 72 61 74 6f 72 20 49 6e 74 65 72 72 75 70     parator Interrup
     88b:	74 29 3a 20 00                                      t): .

00000890 <_ZZNK19StatisticController19printInterruptTableER5PrintE3__c__11_>:
     890:	45 45 43 52 20 28 45 45 50 52 4f 4d 20 49 6e 74     EECR (EEPROM Int
     8a0:	65 72 72 75 70 74 29 3a 20 00                       errupt): .

000008aa <_ZZNK19StatisticController19printInterruptTableER5PrintE3__c__10_>:
     8aa:	41 44 43 53 52 41 20 28 41 44 43 20 49 6e 74 65     ADCSRA (ADC Inte
     8ba:	72 72 75 70 74 29 3a 20 00                          rrupt): .

000008c3 <_ZZNK19StatisticController19printInterruptTableER5PrintE3__c_9>:
     8c3:	53 50 43 52 20 28 53 50 49 20 49 6e 74 65 72 72     SPCR (SPI Interr
     8d3:	75 70 74 29 3a 20 00                                upt): .

000008da <_ZZNK19StatisticController19printInterruptTableER5PrintE3__c_8>:
     8da:	54 57 43 52 20 28 54 57 49 2f 49 32 43 20 49 6e     TWCR (TWI/I2C In
     8ea:	74 65 72 72 75 70 74 29 3a 20 00                    terrupt): .

000008f5 <_ZZNK19StatisticController19printInterruptTableER5PrintE3__c_7>:
     8f5:	55 43 53 52 31 42 20 28 55 53 41 52 54 20 49 6e     UCSR1B (USART In
     905:	74 65 72 72 75 70 74 73 29 3a 20 00                 terrupts): .

00000911 <_ZZNK19StatisticController19printInterruptTableER5PrintE3__c_6>:
     911:	54 49 4d 53 4b 34 20 28 54 69 6d 65 72 34 29 3a     TIMSK4 (Timer4):
     921:	20 00                                                .

00000923 <_ZZNK19StatisticController19printInterruptTableER5PrintE3__c_5>:
     923:	54 49 4d 53 4b 33 20 28 54 69 6d 65 72 33 29 3a     TIMSK3 (Timer3):
     933:	20 00                                                .

00000935 <_ZZNK19StatisticController19printInterruptTableER5PrintE3__c_4>:
     935:	54 49 4d 53 4b 31 20 28 54 69 6d 65 72 31 29 3a     TIMSK1 (Timer1):
     945:	20 00                                                .

00000947 <_ZZNK19StatisticController19printInterruptTableER5PrintE3__c_3>:
     947:	54 49 4d 53 4b 30 20 28 54 69 6d 65 72 30 29        TIMSK0 (Timer0)

00000956 <_ZZL17bluetoothCallbackPK19__FlashStringHelperbRK6StringE3__c_2>:
     956:	3a 20 00                                            : .

00000959 <_ZZNK19StatisticController19printInterruptTableER5PrintE3__c_2>:
     959:	50 43 4d 53 4b 30 3a 20 00                          PCMSK0: .

00000962 <_ZZNK19StatisticController19printInterruptTableER5PrintE3__c_1>:
     962:	50 43 49 43 52 20 28 50 69 6e 20 43 68 61 6e 67     PCICR (Pin Chang
     972:	65 20 49 6e 74 65 72 72 75 70 74 73 29 3a 20 00     e Interrupts): .

00000982 <_ZZNK19StatisticController19printInterruptTableER5PrintE3__c_0>:
     982:	45 49 4d 53 4b 20 28 45 78 74 65 72 6e 61 6c 20     EIMSK (External 
     992:	49 6e 74 65 72 72 75 70 74 73 29 3a 20 00           Interrupts): .

000009a0 <_ZZNK19StatisticController19printInterruptTableER5PrintE3__c>:
     9a0:	45 6e 61 62 6c 65 64 20 49 6e 74 65 72 72 75 70     Enabled Interrup
     9b0:	74 73 00                                            ts.

000009b3 <_ZZN18KeyboardController6unlockEvE3__c>:
     9b3:	4b 65 79 62 6f 61 72 64 20 75 6e 6c 6f 63 6b 65     Keyboard unlocke
     9c3:	64 2e 00                                            d..

000009c6 <_ZZN18KeyboardController4lockEvE3__c>:
     9c6:	4b 65 79 62 6f 61 72 64 20 6c 6f 63 6b 65 64 2e     Keyboard locked.
	...

000009d7 <_ZZN4impl13ArgConstraint14getTypeNamePgmE7ArgTypeE5types>:
     9d7:	f8 00 f4 00 ee 00 e7 00                             ........

000009df <_cdcInterface>:
     9df:	08 0b 00 02 02 02 00 00 09 04 00 00 01 02 02 00     ................
     9ef:	00 05 24 00 10 01 05 24 01 01 01 04 24 02 06 05     ..$....$....$...
     9ff:	24 06 00 01 07 05 81 03 10 00 40 09 04 01 00 02     $.........@.....
     a0f:	0a 00 00 00 07 05 02 02 40 00 00 07 05 83 02 40     ........@......@
	...

00000a21 <STRING_LANGUAGE>:
     a21:	04 03 09 04                                         ....

00000a25 <USB_DeviceDescriptorIAD>:
     a25:	12 01 00 02 ef 02 01 40 4f 1b 06 92 00 01 01 02     .......@O.......
     a35:	03 01                                               ..

00000a37 <digital_pin_to_timer_PGM>:
     a37:	00 00 00 02 00 09 0f 00 00 03 04 01 00 0c 00 00     ................
	...

00000a55 <port_to_mode_PGM>:
     a55:	00 00 00 00 24 00 27 00 2a 00 2d 00 30 00           ....$.'.*.-.0.

00000a63 <port_to_input_PGM>:
     a63:	00 00 00 00 23 00 26 00 29 00 2c 00 2f 00           ....#.&.).,./.

00000a71 <port_to_output_PGM>:
     a71:	00 00 00 00 25 00 28 00 2b 00 2e 00 31 00           ....%.(.+...1.

00000a7f <digital_pin_to_bit_mask_PGM>:
     a7f:	04 08 02 01 10 40 80 40 10 20 40 80 40 80 08 02     .....@.@. @.@...
     a8f:	04 01 80 40 20 10 02 01 10 80 10 20 40 40 20        ...@ ...... @@ 

00000a9e <digital_pin_to_port_PGM>:
     a9e:	04 04 04 04 04 03 04 05 02 02 02 02 04 03 02 02     ................
     aae:	02 02 06 06 06 06 06 06 04 04 02 02 02 04 04        ...............

00000abd <_ZZNKUlvE13_clEvE3cmd>:
     abd:	c0 0d be 0d b9 0d 3e 1d 00 00 00 00 75 6e 6c 6f     ......>.....unlo
     acd:	63 6b 00 75 6e 6c 6f 63 6b 20 74 68 65 20 6b 65     ck.unlock the ke
     add:	79 70 61 64 00 03 00 00 00 00                       ypad......

00000ae7 <_ZZNKUlvE12_clEvE3cmd>:
     ae7:	c9 0d c7 0d c2 0d 5e 1d 00 00 00 00 6c 6f 63 6b     ......^.....lock
     af7:	00 6c 6f 63 6b 20 74 68 65 20 6b 65 79 70 61 64     .lock the keypad
     b07:	00 03 00 00 00 00                                   ......

00000b0d <_ZZNKUlvE11_clEvE3cmd>:
     b0d:	d1 0d cf 0d cb 0d eb 14 00 00 00 00 73 74 61 74     ............stat
     b1d:	65 00 73 74 61 74 65 20 6f 66 20 74 68 65 20 6b     e.state of the k
     b2d:	65 79 70 61 64 00                                   eypad.

00000b33 <_ZZNKUlvE10_clEvE3cmd>:
     b33:	d9 0d d7 0d d3 0d c1 1d 00 00 00 00 63 68 65 63     ............chec
     b43:	6b 00 63 68 65 63 6b 00                             k.check.

00000b4b <_ZZNKUlvE9_clEvE3cmd>:
     b4b:	e1 0d df 0d db 0d 7e 1d 00 00 00 00 67 65 6e 53     ......~.....genS
     b5b:	65 65 64 00 67 65 6e 65 72 61 74 65 20 73 65 65     eed.generate see
     b6b:	64 00                                               d.

00000b6d <_ZZNKUlvE8_clEvE3cmd>:
     b6d:	e1 0d df 0d db 0d 48 1c 00 00 00 00 67 65 6e 53     ......H.....genS
     b7d:	61 6c 74 00 67 65 6e 65 72 61 74 65 20 73 61 6c     alt.generate sal
     b8d:	74 00                                               t.

00000b8f <_ZZNKUlvE5_clEvE3cmd>:
     b8f:	e9 0d e7 0d e3 0d e1 14 00 00 00 00 72 65 73 65     ............rese
     b9f:	74 66 70 00 72 65 73 65 74 20 74 68 65 20 6b 65     tfp.reset the ke
     baf:	79 70 61 64 20 66 6f 72 20 73 65 6c 66 20 70 72     ypad for self pr
     bbf:	6f 67 72 61 6d 6d 69 6e 67 00                       ogramming.

00000bc9 <_ZZNKUlvE4_clEvE3cmd>:
     bc9:	f1 0d ef 0d eb 0d e9 14 00 00 00 00 72 65 73 65     ............rese
     bd9:	74 00 72 65 73 65 74 20 74 68 65 20 6b 65 79 70     t.reset the keyp
     be9:	61 64 00                                            ad.

00000bec <_ZZNKUlvE3_clEvE3cmd>:
     bec:	f9 0d f7 0d f3 0d fb 14 00 00 00 00 73 74 61 74     ............stat
     bfc:	69 73 74 69 63 73 00 6c 69 73 74 20 73 74 61 74     istics.list stat
     c0c:	69 73 74 69 63 73 00                                istics.

00000c13 <_ZZNKUlvE2_clEvE3cmd>:
     c13:	01 0e ff 0d fb 0d 28 17 00 00 00 00 72 61 6d 00     ......(.....ram.
     c23:	64 69 73 70 6c 61 79 20 72 61 6d 20 75 73 61 67     display ram usag
     c33:	65 00                                               e.

00000c35 <_ZZNKUlvE1_clEvE3cmd>:
     c35:	09 0e 07 0e 03 0e 73 15 00 00 00 00 69 72 71 00     ......s.....irq.
     c45:	6c 69 73 74 20 69 72 71 20 72 65 67 69 73 74 65     list irq registe
     c55:	72 73 00                                            rs.

00000c58 <_ZZNKUlvE0_clEvE3cmd>:
     c58:	11 0e 0f 0e 0b 0e 80 15 00 00 00 00 70 69 6e 67     ............ping
     c68:	00 70 69 6e 67 00                                   .ping.

00000c6e <_ZZNKUlvE6_clEvE3cmd>:
     c6e:	19 0e 17 0e 13 0e ef 17 00 00 00 00 68 65 6c 70     ............help
     c7e:	00 6c 69 73 74 20 63 6f 6d 6d 61 6e 64 73 00 00     .list commands..

00000c8e <__ctors_start>:
     c8e:	37 23       	and	r19, r23

00000c90 <__ctors_end>:
     c90:	fb 2f       	mov	r31, r27

00000c92 <__dtors_end>:
     c92:	11 24       	eor	r1, r1
     c94:	1f be       	out	0x3f, r1	; 63
     c96:	cf ef       	ldi	r28, 0xFF	; 255
     c98:	da e0       	ldi	r29, 0x0A	; 10
     c9a:	de bf       	out	0x3e, r29	; 62
     c9c:	cd bf       	out	0x3d, r28	; 61

00000c9e <__do_copy_data>:
     c9e:	11 e0       	ldi	r17, 0x01	; 1
     ca0:	a0 e0       	ldi	r26, 0x00	; 0
     ca2:	b1 e0       	ldi	r27, 0x01	; 1
     ca4:	e6 e7       	ldi	r30, 0x76	; 118
     ca6:	fc e6       	ldi	r31, 0x6C	; 108
     ca8:	02 c0       	rjmp	.+4      	; 0xcae <__do_copy_data+0x10>
     caa:	05 90       	lpm	r0, Z+
     cac:	0d 92       	st	X+, r0
     cae:	a6 39       	cpi	r26, 0x96	; 150
     cb0:	b1 07       	cpc	r27, r17
     cb2:	d9 f7       	brne	.-10     	; 0xcaa <__do_copy_data+0xc>

00000cb4 <__do_clear_bss>:
     cb4:	26 e0       	ldi	r18, 0x06	; 6
     cb6:	a6 e9       	ldi	r26, 0x96	; 150
     cb8:	b1 e0       	ldi	r27, 0x01	; 1
     cba:	01 c0       	rjmp	.+2      	; 0xcbe <.do_clear_bss_start>

00000cbc <.do_clear_bss_loop>:
     cbc:	1d 92       	st	X+, r1

00000cbe <.do_clear_bss_start>:
     cbe:	a1 33       	cpi	r26, 0x31	; 49
     cc0:	b2 07       	cpc	r27, r18
     cc2:	e1 f7       	brne	.-8      	; 0xcbc <.do_clear_bss_loop>

00000cc4 <__do_global_ctors>:
     cc4:	16 e0       	ldi	r17, 0x06	; 6
     cc6:	c8 e4       	ldi	r28, 0x48	; 72
     cc8:	d6 e0       	ldi	r29, 0x06	; 6
     cca:	04 c0       	rjmp	.+8      	; 0xcd4 <__do_global_ctors+0x10>
     ccc:	21 97       	sbiw	r28, 0x01	; 1
     cce:	fe 01       	movw	r30, r28
     cd0:	0e 94 38 35 	call	0x6a70	; 0x6a70 <__tablejump2__>
     cd4:	c7 34       	cpi	r28, 0x47	; 71
     cd6:	d1 07       	cpc	r29, r17
     cd8:	c9 f7       	brne	.-14     	; 0xccc <__do_global_ctors+0x8>
     cda:	0e 94 2a 26 	call	0x4c54	; 0x4c54 <main>
     cde:	0c 94 2e 36 	jmp	0x6c5c	; 0x6c5c <__do_global_dtors>

00000ce2 <__bad_interrupt>:
     ce2:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

00000ce6 <_ZN14SerialCommands7isDelimMUlcE_4_FUNEc>:
     ce6:	91 e0       	ldi	r25, 0x01	; 1
     ce8:	80 32       	cpi	r24, 0x20	; 32
     cea:	09 f0       	breq	.+2      	; 0xcee <_ZN14SerialCommands7isDelimMUlcE_4_FUNEc+0x8>
     cec:	90 e0       	ldi	r25, 0x00	; 0
     cee:	89 2f       	mov	r24, r25
     cf0:	08 95       	ret

00000cf2 <_ZN14SerialCommands11isQuotationMUlcE_4_FUNEc>:
     cf2:	91 e0       	ldi	r25, 0x01	; 1
     cf4:	82 32       	cpi	r24, 0x22	; 34
     cf6:	09 f0       	breq	.+2      	; 0xcfa <_ZN14SerialCommands11isQuotationMUlcE_4_FUNEc+0x8>
     cf8:	90 e0       	ldi	r25, 0x00	; 0
     cfa:	89 2f       	mov	r24, r25
     cfc:	08 95       	ret

00000cfe <_ZN12StringBufferILh64EE5clearEv.constprop.102>:
     cfe:	90 91 a5 04 	lds	r25, 0x04A5	; 0x8004a5 <hc05+0x4f>
     d02:	80 91 a6 04 	lds	r24, 0x04A6	; 0x8004a6 <hc05+0x50>
     d06:	98 17       	cp	r25, r24
     d08:	79 f0       	breq	.+30     	; 0xd28 <_ZN12StringBufferILh64EE5clearEv.constprop.102+0x2a>
     d0a:	90 91 a5 04 	lds	r25, 0x04A5	; 0x8004a5 <hc05+0x4f>
     d0e:	80 91 a6 04 	lds	r24, 0x04A6	; 0x8004a6 <hc05+0x50>
     d12:	98 17       	cp	r25, r24
     d14:	a1 f3       	breq	.-24     	; 0xcfe <_ZN12StringBufferILh64EE5clearEv.constprop.102>
     d16:	80 91 a6 04 	lds	r24, 0x04A6	; 0x8004a6 <hc05+0x50>
     d1a:	80 91 a6 04 	lds	r24, 0x04A6	; 0x8004a6 <hc05+0x50>
     d1e:	8f 5f       	subi	r24, 0xFF	; 255
     d20:	8f 73       	andi	r24, 0x3F	; 63
     d22:	80 93 a6 04 	sts	0x04A6, r24	; 0x8004a6 <hc05+0x50>
     d26:	eb cf       	rjmp	.-42     	; 0xcfe <_ZN12StringBufferILh64EE5clearEv.constprop.102>
     d28:	08 95       	ret

00000d2a <_Z9USB_Flushh.constprop.46>:
     d2a:	83 e0       	ldi	r24, 0x03	; 3
     d2c:	80 93 e9 00 	sts	0x00E9, r24	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
     d30:	80 91 f2 00 	lds	r24, 0x00F2	; 0x8000f2 <__TEXT_REGION_LENGTH__+0x7e00f2>
     d34:	88 23       	and	r24, r24
     d36:	19 f0       	breq	.+6      	; 0xd3e <_Z9USB_Flushh.constprop.46+0x14>
     d38:	8a e3       	ldi	r24, 0x3A	; 58
     d3a:	80 93 e8 00 	sts	0x00E8, r24	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
     d3e:	08 95       	ret

00000d40 <_ZNK17FastCircularQueueIcLh64EE6peekAtEhRc.constprop.33>:
     d40:	90 91 a5 04 	lds	r25, 0x04A5	; 0x8004a5 <hc05+0x4f>
     d44:	20 91 a6 04 	lds	r18, 0x04A6	; 0x8004a6 <hc05+0x50>
     d48:	92 1b       	sub	r25, r18
     d4a:	9f 73       	andi	r25, 0x3F	; 63
     d4c:	89 17       	cp	r24, r25
     d4e:	68 f4       	brcc	.+26     	; 0xd6a <_ZNK17FastCircularQueueIcLh64EE6peekAtEhRc.constprop.33+0x2a>
     d50:	e0 91 a6 04 	lds	r30, 0x04A6	; 0x8004a6 <hc05+0x50>
     d54:	8e 0f       	add	r24, r30
     d56:	8f 73       	andi	r24, 0x3F	; 63
     d58:	e8 2f       	mov	r30, r24
     d5a:	f0 e0       	ldi	r31, 0x00	; 0
     d5c:	ea 5a       	subi	r30, 0xAA	; 170
     d5e:	fb 4f       	sbci	r31, 0xFB	; 251
     d60:	87 85       	ldd	r24, Z+15	; 0x0f
     d62:	fb 01       	movw	r30, r22
     d64:	80 83       	st	Z, r24
     d66:	81 e0       	ldi	r24, 0x01	; 1
     d68:	08 95       	ret
     d6a:	80 e0       	ldi	r24, 0x00	; 0
     d6c:	08 95       	ret

00000d6e <_ZNK12StringBufferILh64EE9toCStringEPch.part.11.constprop.32>:
     d6e:	ef 92       	push	r14
     d70:	ff 92       	push	r15
     d72:	0f 93       	push	r16
     d74:	1f 93       	push	r17
     d76:	cf 93       	push	r28
     d78:	df 93       	push	r29
     d7a:	7c 01       	movw	r14, r24
     d7c:	80 91 a5 04 	lds	r24, 0x04A5	; 0x8004a5 <hc05+0x4f>
     d80:	80 91 a6 04 	lds	r24, 0x04A6	; 0x8004a6 <hc05+0x50>
     d84:	e0 91 a5 04 	lds	r30, 0x04A5	; 0x8004a5 <hc05+0x4f>
     d88:	80 91 a6 04 	lds	r24, 0x04A6	; 0x8004a6 <hc05+0x50>
     d8c:	e8 1b       	sub	r30, r24
     d8e:	ce 2f       	mov	r28, r30
     d90:	cf 73       	andi	r28, 0x3F	; 63
     d92:	10 e0       	ldi	r17, 0x00	; 0
     d94:	00 e0       	ldi	r16, 0x00	; 0
     d96:	0c 17       	cp	r16, r28
     d98:	48 f4       	brcc	.+18     	; 0xdac <_ZNK12StringBufferILh64EE9toCStringEPch.part.11.constprop.32+0x3e>
     d9a:	b7 01       	movw	r22, r14
     d9c:	60 0f       	add	r22, r16
     d9e:	71 1f       	adc	r23, r17
     da0:	80 2f       	mov	r24, r16
     da2:	0e 94 a0 06 	call	0xd40	; 0xd40 <_ZNK17FastCircularQueueIcLh64EE6peekAtEhRc.constprop.33>
     da6:	0f 5f       	subi	r16, 0xFF	; 255
     da8:	1f 4f       	sbci	r17, 0xFF	; 255
     daa:	f5 cf       	rjmp	.-22     	; 0xd96 <_ZNK12StringBufferILh64EE9toCStringEPch.part.11.constprop.32+0x28>
     dac:	ce 0d       	add	r28, r14
     dae:	df 2d       	mov	r29, r15
     db0:	d1 1d       	adc	r29, r1
     db2:	18 82       	st	Y, r1
     db4:	cd b7       	in	r28, 0x3d	; 61
     db6:	de b7       	in	r29, 0x3e	; 62
     db8:	e6 e0       	ldi	r30, 0x06	; 6
     dba:	0c 94 c0 34 	jmp	0x6980	; 0x6980 <__epilogue_restores__+0x18>

00000dbe <_ZN4HC0516appendStreamDataEv.constprop.25>:
     dbe:	80 91 56 04 	lds	r24, 0x0456	; 0x800456 <hc05>
     dc2:	90 91 57 04 	lds	r25, 0x0457	; 0x800457 <hc05+0x1>
     dc6:	dc 01       	movw	r26, r24
     dc8:	ed 91       	ld	r30, X+
     dca:	fc 91       	ld	r31, X
     dcc:	00 84       	ldd	r0, Z+8	; 0x08
     dce:	f1 85       	ldd	r31, Z+9	; 0x09
     dd0:	e0 2d       	mov	r30, r0
     dd2:	09 95       	icall
     dd4:	89 2b       	or	r24, r25
     dd6:	09 f1       	breq	.+66     	; 0xe1a <_ZN4HC0516appendStreamDataEv.constprop.25+0x5c>
     dd8:	80 91 56 04 	lds	r24, 0x0456	; 0x800456 <hc05>
     ddc:	90 91 57 04 	lds	r25, 0x0457	; 0x800457 <hc05+0x1>
     de0:	dc 01       	movw	r26, r24
     de2:	ed 91       	ld	r30, X+
     de4:	fc 91       	ld	r31, X
     de6:	02 84       	ldd	r0, Z+10	; 0x0a
     de8:	f3 85       	ldd	r31, Z+11	; 0x0b
     dea:	e0 2d       	mov	r30, r0
     dec:	09 95       	icall
     dee:	e0 91 a5 04 	lds	r30, 0x04A5	; 0x8004a5 <hc05+0x4f>
     df2:	21 e0       	ldi	r18, 0x01	; 1
     df4:	2e 0f       	add	r18, r30
     df6:	2f 73       	andi	r18, 0x3F	; 63
     df8:	90 91 a6 04 	lds	r25, 0x04A6	; 0x8004a6 <hc05+0x50>
     dfc:	29 13       	cpse	r18, r25
     dfe:	06 c0       	rjmp	.+12     	; 0xe0c <_ZN4HC0516appendStreamDataEv.constprop.25+0x4e>
     e00:	90 91 a6 04 	lds	r25, 0x04A6	; 0x8004a6 <hc05+0x50>
     e04:	9f 5f       	subi	r25, 0xFF	; 255
     e06:	9f 73       	andi	r25, 0x3F	; 63
     e08:	90 93 a6 04 	sts	0x04A6, r25	; 0x8004a6 <hc05+0x50>
     e0c:	f0 e0       	ldi	r31, 0x00	; 0
     e0e:	ea 5a       	subi	r30, 0xAA	; 170
     e10:	fb 4f       	sbci	r31, 0xFB	; 251
     e12:	87 87       	std	Z+15, r24	; 0x0f
     e14:	20 93 a5 04 	sts	0x04A5, r18	; 0x8004a5 <hc05+0x4f>
     e18:	d2 cf       	rjmp	.-92     	; 0xdbe <_ZN4HC0516appendStreamDataEv.constprop.25>
     e1a:	08 95       	ret

00000e1c <_Z8USB_RecvhPvi.constprop.8>:
     e1c:	fc 01       	movw	r30, r24
     e1e:	80 91 44 02 	lds	r24, 0x0244	; 0x800244 <_usbConfiguration>
     e22:	88 23       	and	r24, r24
     e24:	11 f1       	breq	.+68     	; 0xe6a <_Z8USB_RecvhPvi.constprop.8+0x4e>
     e26:	3f b7       	in	r19, 0x3f	; 63
     e28:	f8 94       	cli
     e2a:	82 e0       	ldi	r24, 0x02	; 2
     e2c:	80 93 e9 00 	sts	0x00E9, r24	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
     e30:	20 91 f2 00 	lds	r18, 0x00F2	; 0x8000f2 <__TEXT_REGION_LENGTH__+0x7e00f2>
     e34:	82 2f       	mov	r24, r18
     e36:	90 e0       	ldi	r25, 0x00	; 0
     e38:	18 16       	cp	r1, r24
     e3a:	19 06       	cpc	r1, r25
     e3c:	14 f4       	brge	.+4      	; 0xe42 <_Z8USB_RecvhPvi.constprop.8+0x26>
     e3e:	81 e0       	ldi	r24, 0x01	; 1
     e40:	90 e0       	ldi	r25, 0x00	; 0
     e42:	88 23       	and	r24, r24
     e44:	39 f0       	breq	.+14     	; 0xe54 <_Z8USB_RecvhPvi.constprop.8+0x38>
     e46:	28 98       	cbi	0x05, 0	; 5
     e48:	44 e6       	ldi	r20, 0x64	; 100
     e4a:	40 93 43 02 	sts	0x0243, r20	; 0x800243 <RxLEDPulse>
     e4e:	40 91 f1 00 	lds	r20, 0x00F1	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
     e52:	40 83       	st	Z, r20
     e54:	22 23       	and	r18, r18
     e56:	39 f0       	breq	.+14     	; 0xe66 <_Z8USB_RecvhPvi.constprop.8+0x4a>
     e58:	20 91 f2 00 	lds	r18, 0x00F2	; 0x8000f2 <__TEXT_REGION_LENGTH__+0x7e00f2>
     e5c:	21 11       	cpse	r18, r1
     e5e:	03 c0       	rjmp	.+6      	; 0xe66 <_Z8USB_RecvhPvi.constprop.8+0x4a>
     e60:	2b e6       	ldi	r18, 0x6B	; 107
     e62:	20 93 e8 00 	sts	0x00E8, r18	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
     e66:	3f bf       	out	0x3f, r19	; 63
     e68:	08 95       	ret
     e6a:	8f ef       	ldi	r24, 0xFF	; 255
     e6c:	9f ef       	ldi	r25, 0xFF	; 255
     e6e:	08 95       	ret

00000e70 <_Z13USB_SendSpaceh.constprop.6>:
     e70:	2f b7       	in	r18, 0x3f	; 63
     e72:	f8 94       	cli
     e74:	83 e0       	ldi	r24, 0x03	; 3
     e76:	80 93 e9 00 	sts	0x00E9, r24	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
     e7a:	90 91 e8 00 	lds	r25, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
     e7e:	89 2f       	mov	r24, r25
     e80:	80 72       	andi	r24, 0x20	; 32
     e82:	95 ff       	sbrs	r25, 5
     e84:	04 c0       	rjmp	.+8      	; 0xe8e <_Z13USB_SendSpaceh.constprop.6+0x1e>
     e86:	90 91 f2 00 	lds	r25, 0x00F2	; 0x8000f2 <__TEXT_REGION_LENGTH__+0x7e00f2>
     e8a:	80 e4       	ldi	r24, 0x40	; 64
     e8c:	89 1b       	sub	r24, r25
     e8e:	2f bf       	out	0x3f, r18	; 63
     e90:	08 95       	ret

00000e92 <_Z12PluggableUSBv>:
     e92:	80 91 3b 02 	lds	r24, 0x023B	; 0x80023b <_ZGVZ12PluggableUSBvE3obj>
     e96:	81 11       	cpse	r24, r1
     e98:	0d c0       	rjmp	.+26     	; 0xeb4 <_Z12PluggableUSBv+0x22>
     e9a:	82 e0       	ldi	r24, 0x02	; 2
     e9c:	80 93 37 02 	sts	0x0237, r24	; 0x800237 <_ZZ12PluggableUSBvE3obj>
     ea0:	84 e0       	ldi	r24, 0x04	; 4
     ea2:	80 93 38 02 	sts	0x0238, r24	; 0x800238 <_ZZ12PluggableUSBvE3obj+0x1>
     ea6:	10 92 3a 02 	sts	0x023A, r1	; 0x80023a <_ZZ12PluggableUSBvE3obj+0x3>
     eaa:	10 92 39 02 	sts	0x0239, r1	; 0x800239 <_ZZ12PluggableUSBvE3obj+0x2>
     eae:	81 e0       	ldi	r24, 0x01	; 1
     eb0:	80 93 3b 02 	sts	0x023B, r24	; 0x80023b <_ZGVZ12PluggableUSBvE3obj>
     eb4:	87 e3       	ldi	r24, 0x37	; 55
     eb6:	92 e0       	ldi	r25, 0x02	; 2
     eb8:	08 95       	ret

00000eba <turnOffPWM>:
     eba:	81 50       	subi	r24, 0x01	; 1
     ebc:	8f 30       	cpi	r24, 0x0F	; 15
     ebe:	08 f0       	brcs	.+2      	; 0xec2 <turnOffPWM+0x8>
     ec0:	47 c0       	rjmp	.+142    	; 0xf50 <turnOffPWM+0x96>
     ec2:	e8 2f       	mov	r30, r24
     ec4:	f0 e0       	ldi	r31, 0x00	; 0
     ec6:	e9 59       	subi	r30, 0x99	; 153
     ec8:	f8 4f       	sbci	r31, 0xF8	; 248
     eca:	0c 94 38 35 	jmp	0x6a70	; 0x6a70 <__tablejump2__>
     ece:	84 07       	cpc	r24, r20
     ed0:	88 07       	cpc	r24, r24
     ed2:	76 07       	cpc	r23, r22
     ed4:	7c 07       	cpc	r23, r28
     ed6:	80 07       	cpc	r24, r16
     ed8:	a8 07       	cpc	r26, r24
     eda:	a8 07       	cpc	r26, r24
     edc:	a8 07       	cpc	r26, r24
     ede:	8b 07       	cpc	r24, r27
     ee0:	91 07       	cpc	r25, r17
     ee2:	95 07       	cpc	r25, r21
     ee4:	99 07       	cpc	r25, r25
     ee6:	9f 07       	cpc	r25, r31
     ee8:	a8 07       	cpc	r26, r24
     eea:	a3 07       	cpc	r26, r19
     eec:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
     ef0:	8f 77       	andi	r24, 0x7F	; 127
     ef2:	80 93 80 00 	sts	0x0080, r24	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
     ef6:	08 95       	ret
     ef8:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
     efc:	8f 7d       	andi	r24, 0xDF	; 223
     efe:	f9 cf       	rjmp	.-14     	; 0xef2 <turnOffPWM+0x38>
     f00:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
     f04:	87 7f       	andi	r24, 0xF7	; 247
     f06:	f5 cf       	rjmp	.-22     	; 0xef2 <turnOffPWM+0x38>
     f08:	84 b5       	in	r24, 0x24	; 36
     f0a:	8f 77       	andi	r24, 0x7F	; 127
     f0c:	84 bd       	out	0x24, r24	; 36
     f0e:	08 95       	ret
     f10:	84 b5       	in	r24, 0x24	; 36
     f12:	8f 7d       	andi	r24, 0xDF	; 223
     f14:	fb cf       	rjmp	.-10     	; 0xf0c <turnOffPWM+0x52>
     f16:	80 91 90 00 	lds	r24, 0x0090	; 0x800090 <__TEXT_REGION_LENGTH__+0x7e0090>
     f1a:	8f 77       	andi	r24, 0x7F	; 127
     f1c:	80 93 90 00 	sts	0x0090, r24	; 0x800090 <__TEXT_REGION_LENGTH__+0x7e0090>
     f20:	08 95       	ret
     f22:	80 91 90 00 	lds	r24, 0x0090	; 0x800090 <__TEXT_REGION_LENGTH__+0x7e0090>
     f26:	8f 7d       	andi	r24, 0xDF	; 223
     f28:	f9 cf       	rjmp	.-14     	; 0xf1c <turnOffPWM+0x62>
     f2a:	80 91 90 00 	lds	r24, 0x0090	; 0x800090 <__TEXT_REGION_LENGTH__+0x7e0090>
     f2e:	87 7f       	andi	r24, 0xF7	; 247
     f30:	f5 cf       	rjmp	.-22     	; 0xf1c <turnOffPWM+0x62>
     f32:	80 91 c0 00 	lds	r24, 0x00C0	; 0x8000c0 <__TEXT_REGION_LENGTH__+0x7e00c0>
     f36:	8f 77       	andi	r24, 0x7F	; 127
     f38:	80 93 c0 00 	sts	0x00C0, r24	; 0x8000c0 <__TEXT_REGION_LENGTH__+0x7e00c0>
     f3c:	08 95       	ret
     f3e:	80 91 c0 00 	lds	r24, 0x00C0	; 0x8000c0 <__TEXT_REGION_LENGTH__+0x7e00c0>
     f42:	8f 7d       	andi	r24, 0xDF	; 223
     f44:	f9 cf       	rjmp	.-14     	; 0xf38 <turnOffPWM+0x7e>
     f46:	80 91 c2 00 	lds	r24, 0x00C2	; 0x8000c2 <__TEXT_REGION_LENGTH__+0x7e00c2>
     f4a:	87 7f       	andi	r24, 0xF7	; 247
     f4c:	80 93 c2 00 	sts	0x00C2, r24	; 0x8000c2 <__TEXT_REGION_LENGTH__+0x7e00c2>
     f50:	08 95       	ret

00000f52 <digitalRead>:
     f52:	cf 93       	push	r28
     f54:	df 93       	push	r29
     f56:	28 2f       	mov	r18, r24
     f58:	30 e0       	ldi	r19, 0x00	; 0
     f5a:	f9 01       	movw	r30, r18
     f5c:	e9 5c       	subi	r30, 0xC9	; 201
     f5e:	f5 4f       	sbci	r31, 0xF5	; 245
     f60:	84 91       	lpm	r24, Z
     f62:	f9 01       	movw	r30, r18
     f64:	e1 58       	subi	r30, 0x81	; 129
     f66:	f5 4f       	sbci	r31, 0xF5	; 245
     f68:	d4 91       	lpm	r29, Z
     f6a:	f9 01       	movw	r30, r18
     f6c:	e2 56       	subi	r30, 0x62	; 98
     f6e:	f5 4f       	sbci	r31, 0xF5	; 245
     f70:	c4 91       	lpm	r28, Z
     f72:	cc 23       	and	r28, r28
     f74:	a1 f0       	breq	.+40     	; 0xf9e <digitalRead+0x4c>
     f76:	81 11       	cpse	r24, r1
     f78:	0e 94 5d 07 	call	0xeba	; 0xeba <turnOffPWM>
     f7c:	ec 2f       	mov	r30, r28
     f7e:	f0 e0       	ldi	r31, 0x00	; 0
     f80:	ee 0f       	add	r30, r30
     f82:	ff 1f       	adc	r31, r31
     f84:	ed 59       	subi	r30, 0x9D	; 157
     f86:	f5 4f       	sbci	r31, 0xF5	; 245
     f88:	a5 91       	lpm	r26, Z+
     f8a:	b4 91       	lpm	r27, Z
     f8c:	ec 91       	ld	r30, X
     f8e:	ed 23       	and	r30, r29
     f90:	81 e0       	ldi	r24, 0x01	; 1
     f92:	90 e0       	ldi	r25, 0x00	; 0
     f94:	09 f4       	brne	.+2      	; 0xf98 <digitalRead+0x46>
     f96:	80 e0       	ldi	r24, 0x00	; 0
     f98:	df 91       	pop	r29
     f9a:	cf 91       	pop	r28
     f9c:	08 95       	ret
     f9e:	80 e0       	ldi	r24, 0x00	; 0
     fa0:	90 e0       	ldi	r25, 0x00	; 0
     fa2:	fa cf       	rjmp	.-12     	; 0xf98 <digitalRead+0x46>

00000fa4 <digitalWrite>:
     fa4:	1f 93       	push	r17
     fa6:	cf 93       	push	r28
     fa8:	df 93       	push	r29
     faa:	28 2f       	mov	r18, r24
     fac:	30 e0       	ldi	r19, 0x00	; 0
     fae:	f9 01       	movw	r30, r18
     fb0:	e9 5c       	subi	r30, 0xC9	; 201
     fb2:	f5 4f       	sbci	r31, 0xF5	; 245
     fb4:	84 91       	lpm	r24, Z
     fb6:	f9 01       	movw	r30, r18
     fb8:	e1 58       	subi	r30, 0x81	; 129
     fba:	f5 4f       	sbci	r31, 0xF5	; 245
     fbc:	d4 91       	lpm	r29, Z
     fbe:	f9 01       	movw	r30, r18
     fc0:	e2 56       	subi	r30, 0x62	; 98
     fc2:	f5 4f       	sbci	r31, 0xF5	; 245
     fc4:	c4 91       	lpm	r28, Z
     fc6:	cc 23       	and	r28, r28
     fc8:	a9 f0       	breq	.+42     	; 0xff4 <digitalWrite+0x50>
     fca:	16 2f       	mov	r17, r22
     fcc:	81 11       	cpse	r24, r1
     fce:	0e 94 5d 07 	call	0xeba	; 0xeba <turnOffPWM>
     fd2:	ec 2f       	mov	r30, r28
     fd4:	f0 e0       	ldi	r31, 0x00	; 0
     fd6:	ee 0f       	add	r30, r30
     fd8:	ff 1f       	adc	r31, r31
     fda:	ef 58       	subi	r30, 0x8F	; 143
     fdc:	f5 4f       	sbci	r31, 0xF5	; 245
     fde:	a5 91       	lpm	r26, Z+
     fe0:	b4 91       	lpm	r27, Z
     fe2:	8f b7       	in	r24, 0x3f	; 63
     fe4:	f8 94       	cli
     fe6:	ec 91       	ld	r30, X
     fe8:	11 11       	cpse	r17, r1
     fea:	08 c0       	rjmp	.+16     	; 0xffc <digitalWrite+0x58>
     fec:	d0 95       	com	r29
     fee:	de 23       	and	r29, r30
     ff0:	dc 93       	st	X, r29
     ff2:	8f bf       	out	0x3f, r24	; 63
     ff4:	df 91       	pop	r29
     ff6:	cf 91       	pop	r28
     ff8:	1f 91       	pop	r17
     ffa:	08 95       	ret
     ffc:	de 2b       	or	r29, r30
     ffe:	f8 cf       	rjmp	.-16     	; 0xff0 <digitalWrite+0x4c>

00001000 <pinMode>:
    1000:	cf 93       	push	r28
    1002:	df 93       	push	r29
    1004:	90 e0       	ldi	r25, 0x00	; 0
    1006:	fc 01       	movw	r30, r24
    1008:	e1 58       	subi	r30, 0x81	; 129
    100a:	f5 4f       	sbci	r31, 0xF5	; 245
    100c:	24 91       	lpm	r18, Z
    100e:	82 56       	subi	r24, 0x62	; 98
    1010:	95 4f       	sbci	r25, 0xF5	; 245
    1012:	fc 01       	movw	r30, r24
    1014:	84 91       	lpm	r24, Z
    1016:	88 23       	and	r24, r24
    1018:	c9 f0       	breq	.+50     	; 0x104c <pinMode+0x4c>
    101a:	90 e0       	ldi	r25, 0x00	; 0
    101c:	88 0f       	add	r24, r24
    101e:	99 1f       	adc	r25, r25
    1020:	fc 01       	movw	r30, r24
    1022:	eb 5a       	subi	r30, 0xAB	; 171
    1024:	f5 4f       	sbci	r31, 0xF5	; 245
    1026:	a5 91       	lpm	r26, Z+
    1028:	b4 91       	lpm	r27, Z
    102a:	fc 01       	movw	r30, r24
    102c:	ef 58       	subi	r30, 0x8F	; 143
    102e:	f5 4f       	sbci	r31, 0xF5	; 245
    1030:	c5 91       	lpm	r28, Z+
    1032:	d4 91       	lpm	r29, Z
    1034:	61 11       	cpse	r22, r1
    1036:	0d c0       	rjmp	.+26     	; 0x1052 <pinMode+0x52>
    1038:	9f b7       	in	r25, 0x3f	; 63
    103a:	f8 94       	cli
    103c:	8c 91       	ld	r24, X
    103e:	20 95       	com	r18
    1040:	82 23       	and	r24, r18
    1042:	8c 93       	st	X, r24
    1044:	88 81       	ld	r24, Y
    1046:	28 23       	and	r18, r24
    1048:	28 83       	st	Y, r18
    104a:	9f bf       	out	0x3f, r25	; 63
    104c:	df 91       	pop	r29
    104e:	cf 91       	pop	r28
    1050:	08 95       	ret
    1052:	62 30       	cpi	r22, 0x02	; 2
    1054:	51 f4       	brne	.+20     	; 0x106a <pinMode+0x6a>
    1056:	9f b7       	in	r25, 0x3f	; 63
    1058:	f8 94       	cli
    105a:	3c 91       	ld	r19, X
    105c:	82 2f       	mov	r24, r18
    105e:	80 95       	com	r24
    1060:	83 23       	and	r24, r19
    1062:	8c 93       	st	X, r24
    1064:	e8 81       	ld	r30, Y
    1066:	2e 2b       	or	r18, r30
    1068:	ef cf       	rjmp	.-34     	; 0x1048 <pinMode+0x48>
    106a:	8f b7       	in	r24, 0x3f	; 63
    106c:	f8 94       	cli
    106e:	ec 91       	ld	r30, X
    1070:	2e 2b       	or	r18, r30
    1072:	2c 93       	st	X, r18
    1074:	8f bf       	out	0x3f, r24	; 63
    1076:	ea cf       	rjmp	.-44     	; 0x104c <pinMode+0x4c>

00001078 <micros>:
    1078:	3f b7       	in	r19, 0x3f	; 63
    107a:	f8 94       	cli
    107c:	80 91 33 02 	lds	r24, 0x0233	; 0x800233 <timer0_overflow_count>
    1080:	90 91 34 02 	lds	r25, 0x0234	; 0x800234 <timer0_overflow_count+0x1>
    1084:	a0 91 35 02 	lds	r26, 0x0235	; 0x800235 <timer0_overflow_count+0x2>
    1088:	b0 91 36 02 	lds	r27, 0x0236	; 0x800236 <timer0_overflow_count+0x3>
    108c:	26 b5       	in	r18, 0x26	; 38
    108e:	a8 9b       	sbis	0x15, 0	; 21
    1090:	05 c0       	rjmp	.+10     	; 0x109c <micros+0x24>
    1092:	2f 3f       	cpi	r18, 0xFF	; 255
    1094:	19 f0       	breq	.+6      	; 0x109c <micros+0x24>
    1096:	01 96       	adiw	r24, 0x01	; 1
    1098:	a1 1d       	adc	r26, r1
    109a:	b1 1d       	adc	r27, r1
    109c:	3f bf       	out	0x3f, r19	; 63
    109e:	ba 2f       	mov	r27, r26
    10a0:	a9 2f       	mov	r26, r25
    10a2:	98 2f       	mov	r25, r24
    10a4:	88 27       	eor	r24, r24
    10a6:	bc 01       	movw	r22, r24
    10a8:	cd 01       	movw	r24, r26
    10aa:	62 0f       	add	r22, r18
    10ac:	71 1d       	adc	r23, r1
    10ae:	81 1d       	adc	r24, r1
    10b0:	91 1d       	adc	r25, r1
    10b2:	42 e0       	ldi	r20, 0x02	; 2
    10b4:	66 0f       	add	r22, r22
    10b6:	77 1f       	adc	r23, r23
    10b8:	88 1f       	adc	r24, r24
    10ba:	99 1f       	adc	r25, r25
    10bc:	4a 95       	dec	r20
    10be:	d1 f7       	brne	.-12     	; 0x10b4 <micros+0x3c>
    10c0:	08 95       	ret

000010c2 <delay>:
    10c2:	8f 92       	push	r8
    10c4:	9f 92       	push	r9
    10c6:	af 92       	push	r10
    10c8:	bf 92       	push	r11
    10ca:	cf 92       	push	r12
    10cc:	df 92       	push	r13
    10ce:	ef 92       	push	r14
    10d0:	ff 92       	push	r15
    10d2:	4b 01       	movw	r8, r22
    10d4:	5c 01       	movw	r10, r24
    10d6:	0e 94 3c 08 	call	0x1078	; 0x1078 <micros>
    10da:	6b 01       	movw	r12, r22
    10dc:	7c 01       	movw	r14, r24
    10de:	0e 94 3c 08 	call	0x1078	; 0x1078 <micros>
    10e2:	6c 19       	sub	r22, r12
    10e4:	7d 09       	sbc	r23, r13
    10e6:	8e 09       	sbc	r24, r14
    10e8:	9f 09       	sbc	r25, r15
    10ea:	68 3e       	cpi	r22, 0xE8	; 232
    10ec:	73 40       	sbci	r23, 0x03	; 3
    10ee:	81 05       	cpc	r24, r1
    10f0:	91 05       	cpc	r25, r1
    10f2:	a8 f3       	brcs	.-22     	; 0x10de <delay+0x1c>
    10f4:	21 e0       	ldi	r18, 0x01	; 1
    10f6:	82 1a       	sub	r8, r18
    10f8:	91 08       	sbc	r9, r1
    10fa:	a1 08       	sbc	r10, r1
    10fc:	b1 08       	sbc	r11, r1
    10fe:	88 ee       	ldi	r24, 0xE8	; 232
    1100:	c8 0e       	add	r12, r24
    1102:	83 e0       	ldi	r24, 0x03	; 3
    1104:	d8 1e       	adc	r13, r24
    1106:	e1 1c       	adc	r14, r1
    1108:	f1 1c       	adc	r15, r1
    110a:	81 14       	cp	r8, r1
    110c:	91 04       	cpc	r9, r1
    110e:	a1 04       	cpc	r10, r1
    1110:	b1 04       	cpc	r11, r1
    1112:	29 f7       	brne	.-54     	; 0x10de <delay+0x1c>
    1114:	ff 90       	pop	r15
    1116:	ef 90       	pop	r14
    1118:	df 90       	pop	r13
    111a:	cf 90       	pop	r12
    111c:	bf 90       	pop	r11
    111e:	af 90       	pop	r10
    1120:	9f 90       	pop	r9
    1122:	8f 90       	pop	r8
    1124:	08 95       	ret

00001126 <millis>:
    1126:	2f b7       	in	r18, 0x3f	; 63
    1128:	f8 94       	cli
    112a:	60 91 2f 02 	lds	r22, 0x022F	; 0x80022f <timer0_millis>
    112e:	70 91 30 02 	lds	r23, 0x0230	; 0x800230 <timer0_millis+0x1>
    1132:	80 91 31 02 	lds	r24, 0x0231	; 0x800231 <timer0_millis+0x2>
    1136:	90 91 32 02 	lds	r25, 0x0232	; 0x800232 <timer0_millis+0x3>
    113a:	2f bf       	out	0x3f, r18	; 63
    113c:	08 95       	ret

0000113e <_ZN4HC058setStateENS_5StateE.constprop.73>:
    113e:	90 91 a7 04 	lds	r25, 0x04A7	; 0x8004a7 <hc05+0x51>
    1142:	49 2f       	mov	r20, r25
    1144:	4f 70       	andi	r20, 0x0F	; 15
    1146:	28 2f       	mov	r18, r24
    1148:	30 e0       	ldi	r19, 0x00	; 0
    114a:	42 17       	cp	r20, r18
    114c:	13 06       	cpc	r1, r19
    114e:	79 f0       	breq	.+30     	; 0x116e <_ZN4HC058setStateENS_5StateE.constprop.73+0x30>
    1150:	8f 70       	andi	r24, 0x0F	; 15
    1152:	90 7f       	andi	r25, 0xF0	; 240
    1154:	98 2b       	or	r25, r24
    1156:	90 93 a7 04 	sts	0x04A7, r25	; 0x8004a7 <hc05+0x51>
    115a:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    115e:	60 93 a8 04 	sts	0x04A8, r22	; 0x8004a8 <hc05+0x52>
    1162:	70 93 a9 04 	sts	0x04A9, r23	; 0x8004a9 <hc05+0x53>
    1166:	80 93 aa 04 	sts	0x04AA, r24	; 0x8004aa <hc05+0x54>
    116a:	90 93 ab 04 	sts	0x04AB, r25	; 0x8004ab <hc05+0x55>
    116e:	08 95       	ret

00001170 <_ZN4HC055resetEb.constprop.72>:
    1170:	cf 93       	push	r28
    1172:	c8 2f       	mov	r28, r24
    1174:	60 e0       	ldi	r22, 0x00	; 0
    1176:	80 91 5a 04 	lds	r24, 0x045A	; 0x80045a <hc05+0x4>
    117a:	0e 94 d2 07 	call	0xfa4	; 0xfa4 <digitalWrite>
    117e:	84 e0       	ldi	r24, 0x04	; 4
    1180:	c1 11       	cpse	r28, r1
    1182:	85 e0       	ldi	r24, 0x05	; 5
    1184:	0e 94 9f 08 	call	0x113e	; 0x113e <_ZN4HC058setStateENS_5StateE.constprop.73>
    1188:	cf 91       	pop	r28
    118a:	08 95       	ret

0000118c <_ZN7Serial_5flushEv>:
    118c:	0e 94 95 06 	call	0xd2a	; 0xd2a <_Z9USB_Flushh.constprop.46>
    1190:	08 95       	ret

00001192 <_ZL21bluetoothDataCallbackc>:
    1192:	68 2f       	mov	r22, r24
    1194:	85 e2       	ldi	r24, 0x25	; 37
    1196:	94 e0       	ldi	r25, 0x04	; 4
    1198:	0e 94 fd 0a 	call	0x15fa	; 0x15fa <_ZN11PipedStream5writeEh>
    119c:	08 95       	ret

0000119e <_ZN7TwoWire16onRequestServiceEv>:
    119e:	08 95       	ret

000011a0 <_ZN7TwoWire16onReceiveServiceEPhi>:
    11a0:	08 95       	ret

000011a2 <_ZN14LoopbackStream5flushEv>:
    11a2:	08 95       	ret

000011a4 <_ZL11SendControlh>:
    11a4:	40 91 0f 02 	lds	r20, 0x020F	; 0x80020f <_ZL6_cmark>
    11a8:	50 91 10 02 	lds	r21, 0x0210	; 0x800210 <_ZL6_cmark+0x1>
    11ac:	20 91 0d 02 	lds	r18, 0x020D	; 0x80020d <_ZL5_cend>
    11b0:	30 91 0e 02 	lds	r19, 0x020E	; 0x80020e <_ZL5_cend+0x1>
    11b4:	42 17       	cp	r20, r18
    11b6:	53 07       	cpc	r21, r19
    11b8:	b4 f4       	brge	.+44     	; 0x11e6 <_ZL11SendControlh+0x42>
    11ba:	90 91 e8 00 	lds	r25, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    11be:	95 70       	andi	r25, 0x05	; 5
    11c0:	e1 f3       	breq	.-8      	; 0x11ba <_ZL11SendControlh+0x16>
    11c2:	90 91 e8 00 	lds	r25, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    11c6:	92 fd       	sbrc	r25, 2
    11c8:	19 c0       	rjmp	.+50     	; 0x11fc <_ZL11SendControlh+0x58>
    11ca:	80 93 f1 00 	sts	0x00F1, r24	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    11ce:	80 91 0f 02 	lds	r24, 0x020F	; 0x80020f <_ZL6_cmark>
    11d2:	90 91 10 02 	lds	r25, 0x0210	; 0x800210 <_ZL6_cmark+0x1>
    11d6:	01 96       	adiw	r24, 0x01	; 1
    11d8:	8f 73       	andi	r24, 0x3F	; 63
    11da:	99 27       	eor	r25, r25
    11dc:	89 2b       	or	r24, r25
    11de:	19 f4       	brne	.+6      	; 0x11e6 <_ZL11SendControlh+0x42>
    11e0:	8e ef       	ldi	r24, 0xFE	; 254
    11e2:	80 93 e8 00 	sts	0x00E8, r24	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    11e6:	80 91 0f 02 	lds	r24, 0x020F	; 0x80020f <_ZL6_cmark>
    11ea:	90 91 10 02 	lds	r25, 0x0210	; 0x800210 <_ZL6_cmark+0x1>
    11ee:	01 96       	adiw	r24, 0x01	; 1
    11f0:	90 93 10 02 	sts	0x0210, r25	; 0x800210 <_ZL6_cmark+0x1>
    11f4:	80 93 0f 02 	sts	0x020F, r24	; 0x80020f <_ZL6_cmark>
    11f8:	81 e0       	ldi	r24, 0x01	; 1
    11fa:	08 95       	ret
    11fc:	80 e0       	ldi	r24, 0x00	; 0
    11fe:	08 95       	ret

00001200 <_Z15USB_SendControlhPKvi>:
    1200:	b0 e0       	ldi	r27, 0x00	; 0
    1202:	a0 e0       	ldi	r26, 0x00	; 0
    1204:	e6 e0       	ldi	r30, 0x06	; 6
    1206:	f9 e0       	ldi	r31, 0x09	; 9
    1208:	0c 94 a3 34 	jmp	0x6946	; 0x6946 <__prologue_saves__+0x16>
    120c:	d8 2e       	mov	r13, r24
    120e:	8a 01       	movw	r16, r20
    1210:	eb 01       	movw	r28, r22
    1212:	7b 01       	movw	r14, r22
    1214:	e4 0e       	add	r14, r20
    1216:	f5 1e       	adc	r15, r21
    1218:	ce 15       	cp	r28, r14
    121a:	df 05       	cpc	r29, r15
    121c:	59 f0       	breq	.+22     	; 0x1234 <_Z15USB_SendControlhPKvi+0x34>
    121e:	d7 fe       	sbrs	r13, 7
    1220:	0f c0       	rjmp	.+30     	; 0x1240 <_Z15USB_SendControlhPKvi+0x40>
    1222:	fe 01       	movw	r30, r28
    1224:	84 91       	lpm	r24, Z
    1226:	0e 94 d2 08 	call	0x11a4	; 0x11a4 <_ZL11SendControlh>
    122a:	21 96       	adiw	r28, 0x01	; 1
    122c:	81 11       	cpse	r24, r1
    122e:	f4 cf       	rjmp	.-24     	; 0x1218 <_Z15USB_SendControlhPKvi+0x18>
    1230:	0f ef       	ldi	r16, 0xFF	; 255
    1232:	1f ef       	ldi	r17, 0xFF	; 255
    1234:	c8 01       	movw	r24, r16
    1236:	cd b7       	in	r28, 0x3d	; 61
    1238:	de b7       	in	r29, 0x3e	; 62
    123a:	e7 e0       	ldi	r30, 0x07	; 7
    123c:	0c 94 bf 34 	jmp	0x697e	; 0x697e <__epilogue_restores__+0x16>
    1240:	88 81       	ld	r24, Y
    1242:	f1 cf       	rjmp	.-30     	; 0x1226 <_Z15USB_SendControlhPKvi+0x26>

00001244 <_ZL14SendInterfacesv>:
    1244:	a1 e0       	ldi	r26, 0x01	; 1
    1246:	b0 e0       	ldi	r27, 0x00	; 0
    1248:	e8 e2       	ldi	r30, 0x28	; 40
    124a:	f9 e0       	ldi	r31, 0x09	; 9
    124c:	0c 94 a6 34 	jmp	0x694c	; 0x694c <__prologue_saves__+0x1c>
    1250:	82 e0       	ldi	r24, 0x02	; 2
    1252:	89 83       	std	Y+1, r24	; 0x01
    1254:	42 e4       	ldi	r20, 0x42	; 66
    1256:	50 e0       	ldi	r21, 0x00	; 0
    1258:	6f ed       	ldi	r22, 0xDF	; 223
    125a:	79 e0       	ldi	r23, 0x09	; 9
    125c:	80 e8       	ldi	r24, 0x80	; 128
    125e:	0e 94 00 09 	call	0x1200	; 0x1200 <_Z15USB_SendControlhPKvi>
    1262:	0e 94 49 07 	call	0xe92	; 0xe92 <_Z12PluggableUSBv>
    1266:	dc 01       	movw	r26, r24
    1268:	12 96       	adiw	r26, 0x02	; 2
    126a:	0d 91       	ld	r16, X+
    126c:	1c 91       	ld	r17, X
    126e:	01 15       	cp	r16, r1
    1270:	11 05       	cpc	r17, r1
    1272:	89 f0       	breq	.+34     	; 0x1296 <_ZL14SendInterfacesv+0x52>
    1274:	d8 01       	movw	r26, r16
    1276:	ed 91       	ld	r30, X+
    1278:	fc 91       	ld	r31, X
    127a:	02 80       	ldd	r0, Z+2	; 0x02
    127c:	f3 81       	ldd	r31, Z+3	; 0x03
    127e:	e0 2d       	mov	r30, r0
    1280:	be 01       	movw	r22, r28
    1282:	6f 5f       	subi	r22, 0xFF	; 255
    1284:	7f 4f       	sbci	r23, 0xFF	; 255
    1286:	c8 01       	movw	r24, r16
    1288:	09 95       	icall
    128a:	97 fd       	sbrc	r25, 7
    128c:	04 c0       	rjmp	.+8      	; 0x1296 <_ZL14SendInterfacesv+0x52>
    128e:	f8 01       	movw	r30, r16
    1290:	00 85       	ldd	r16, Z+8	; 0x08
    1292:	11 85       	ldd	r17, Z+9	; 0x09
    1294:	ec cf       	rjmp	.-40     	; 0x126e <_ZL14SendInterfacesv+0x2a>
    1296:	89 81       	ldd	r24, Y+1	; 0x01
    1298:	21 96       	adiw	r28, 0x01	; 1
    129a:	e4 e0       	ldi	r30, 0x04	; 4
    129c:	0c 94 c2 34 	jmp	0x6984	; 0x6984 <__epilogue_restores__+0x1c>

000012a0 <_ZL4RecvPVhh>:
    12a0:	61 50       	subi	r22, 0x01	; 1
    12a2:	30 f0       	brcs	.+12     	; 0x12b0 <_ZL4RecvPVhh+0x10>
    12a4:	20 91 f1 00 	lds	r18, 0x00F1	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    12a8:	fc 01       	movw	r30, r24
    12aa:	20 83       	st	Z, r18
    12ac:	01 96       	adiw	r24, 0x01	; 1
    12ae:	f8 cf       	rjmp	.-16     	; 0x12a0 <_ZL4RecvPVhh>
    12b0:	28 98       	cbi	0x05, 0	; 5
    12b2:	84 e6       	ldi	r24, 0x64	; 100
    12b4:	80 93 43 02 	sts	0x0243, r24	; 0x800243 <RxLEDPulse>
    12b8:	08 95       	ret

000012ba <_ZN5Print5printEc>:
    12ba:	dc 01       	movw	r26, r24
    12bc:	ed 91       	ld	r30, X+
    12be:	fc 91       	ld	r31, X
    12c0:	01 90       	ld	r0, Z+
    12c2:	f0 81       	ld	r31, Z
    12c4:	e0 2d       	mov	r30, r0
    12c6:	09 95       	icall
    12c8:	08 95       	ret

000012ca <_ZN5Print5printEPK19__FlashStringHelper>:
    12ca:	ef 92       	push	r14
    12cc:	ff 92       	push	r15
    12ce:	0f 93       	push	r16
    12d0:	1f 93       	push	r17
    12d2:	cf 93       	push	r28
    12d4:	df 93       	push	r29
    12d6:	8c 01       	movw	r16, r24
    12d8:	7b 01       	movw	r14, r22
    12da:	d0 e0       	ldi	r29, 0x00	; 0
    12dc:	c0 e0       	ldi	r28, 0x00	; 0
    12de:	f7 01       	movw	r30, r14
    12e0:	ec 0f       	add	r30, r28
    12e2:	fd 1f       	adc	r31, r29
    12e4:	64 91       	lpm	r22, Z
    12e6:	66 23       	and	r22, r22
    12e8:	61 f0       	breq	.+24     	; 0x1302 <_ZN5Print5printEPK19__FlashStringHelper+0x38>
    12ea:	d8 01       	movw	r26, r16
    12ec:	ed 91       	ld	r30, X+
    12ee:	fc 91       	ld	r31, X
    12f0:	01 90       	ld	r0, Z+
    12f2:	f0 81       	ld	r31, Z
    12f4:	e0 2d       	mov	r30, r0
    12f6:	c8 01       	movw	r24, r16
    12f8:	09 95       	icall
    12fa:	89 2b       	or	r24, r25
    12fc:	11 f0       	breq	.+4      	; 0x1302 <_ZN5Print5printEPK19__FlashStringHelper+0x38>
    12fe:	21 96       	adiw	r28, 0x01	; 1
    1300:	ee cf       	rjmp	.-36     	; 0x12de <_ZN5Print5printEPK19__FlashStringHelper+0x14>
    1302:	ce 01       	movw	r24, r28
    1304:	cd b7       	in	r28, 0x3d	; 61
    1306:	de b7       	in	r29, 0x3e	; 62
    1308:	e6 e0       	ldi	r30, 0x06	; 6
    130a:	0c 94 c0 34 	jmp	0x6980	; 0x6980 <__epilogue_restores__+0x18>

0000130e <_ZN5Print5writeEPKhj>:
    130e:	b0 e0       	ldi	r27, 0x00	; 0
    1310:	a0 e0       	ldi	r26, 0x00	; 0
    1312:	ed e8       	ldi	r30, 0x8D	; 141
    1314:	f9 e0       	ldi	r31, 0x09	; 9
    1316:	0c 94 a0 34 	jmp	0x6940	; 0x6940 <__prologue_saves__+0x10>
    131a:	6c 01       	movw	r12, r24
    131c:	7b 01       	movw	r14, r22
    131e:	8b 01       	movw	r16, r22
    1320:	04 0f       	add	r16, r20
    1322:	15 1f       	adc	r17, r21
    1324:	eb 01       	movw	r28, r22
    1326:	5e 01       	movw	r10, r28
    1328:	ae 18       	sub	r10, r14
    132a:	bf 08       	sbc	r11, r15
    132c:	c0 17       	cp	r28, r16
    132e:	d1 07       	cpc	r29, r17
    1330:	59 f0       	breq	.+22     	; 0x1348 <_ZN5Print5writeEPKhj+0x3a>
    1332:	69 91       	ld	r22, Y+
    1334:	d6 01       	movw	r26, r12
    1336:	ed 91       	ld	r30, X+
    1338:	fc 91       	ld	r31, X
    133a:	01 90       	ld	r0, Z+
    133c:	f0 81       	ld	r31, Z
    133e:	e0 2d       	mov	r30, r0
    1340:	c6 01       	movw	r24, r12
    1342:	09 95       	icall
    1344:	89 2b       	or	r24, r25
    1346:	79 f7       	brne	.-34     	; 0x1326 <_ZN5Print5writeEPKhj+0x18>
    1348:	c5 01       	movw	r24, r10
    134a:	cd b7       	in	r28, 0x3d	; 61
    134c:	de b7       	in	r29, 0x3e	; 62
    134e:	ea e0       	ldi	r30, 0x0A	; 10
    1350:	0c 94 bc 34 	jmp	0x6978	; 0x6978 <__epilogue_restores__+0x10>

00001354 <_ZN7Serial_5writeEPKhj>:
    1354:	b0 e0       	ldi	r27, 0x00	; 0
    1356:	a0 e0       	ldi	r26, 0x00	; 0
    1358:	e0 eb       	ldi	r30, 0xB0	; 176
    135a:	f9 e0       	ldi	r31, 0x09	; 9
    135c:	0c 94 9e 34 	jmp	0x693c	; 0x693c <__prologue_saves__+0xc>
    1360:	6c 01       	movw	r12, r24
    1362:	7b 01       	movw	r14, r22
    1364:	8a 01       	movw	r16, r20
    1366:	80 91 0b 01 	lds	r24, 0x010B	; 0x80010b <_ZL12_usbLineInfo+0x7>
    136a:	88 23       	and	r24, r24
    136c:	09 f4       	brne	.+2      	; 0x1370 <_ZN7Serial_5writeEPKhj+0x1c>
    136e:	5c c0       	rjmp	.+184    	; 0x1428 <_ZN7Serial_5writeEPKhj+0xd4>
    1370:	80 91 44 02 	lds	r24, 0x0244	; 0x800244 <_usbConfiguration>
    1374:	88 23       	and	r24, r24
    1376:	09 f4       	brne	.+2      	; 0x137a <_ZN7Serial_5writeEPKhj+0x26>
    1378:	57 c0       	rjmp	.+174    	; 0x1428 <_ZN7Serial_5writeEPKhj+0xd4>
    137a:	80 91 13 02 	lds	r24, 0x0213	; 0x800213 <_usbSuspendState>
    137e:	80 ff       	sbrs	r24, 0
    1380:	05 c0       	rjmp	.+10     	; 0x138c <_ZN7Serial_5writeEPKhj+0x38>
    1382:	80 91 e0 00 	lds	r24, 0x00E0	; 0x8000e0 <__TEXT_REGION_LENGTH__+0x7e00e0>
    1386:	82 60       	ori	r24, 0x02	; 2
    1388:	80 93 e0 00 	sts	0x00E0, r24	; 0x8000e0 <__TEXT_REGION_LENGTH__+0x7e00e0>
    138c:	e8 01       	movw	r28, r16
    138e:	b1 2c       	mov	r11, r1
    1390:	8a ef       	ldi	r24, 0xFA	; 250
    1392:	a8 2e       	mov	r10, r24
    1394:	93 e0       	ldi	r25, 0x03	; 3
    1396:	89 2e       	mov	r8, r25
    1398:	2a e3       	ldi	r18, 0x3A	; 58
    139a:	92 2e       	mov	r9, r18
    139c:	20 97       	sbiw	r28, 0x00	; 0
    139e:	11 f4       	brne	.+4      	; 0x13a4 <_ZN7Serial_5writeEPKhj+0x50>
    13a0:	bb 20       	and	r11, r11
    13a2:	d9 f1       	breq	.+118    	; 0x141a <_ZN7Serial_5writeEPKhj+0xc6>
    13a4:	0e 94 38 07 	call	0xe70	; 0xe70 <_Z13USB_SendSpaceh.constprop.6>
    13a8:	81 11       	cpse	r24, r1
    13aa:	0a c0       	rjmp	.+20     	; 0x13c0 <_ZN7Serial_5writeEPKhj+0x6c>
    13ac:	aa 94       	dec	r10
    13ae:	aa 20       	and	r10, r10
    13b0:	d9 f1       	breq	.+118    	; 0x1428 <_ZN7Serial_5writeEPKhj+0xd4>
    13b2:	61 e0       	ldi	r22, 0x01	; 1
    13b4:	70 e0       	ldi	r23, 0x00	; 0
    13b6:	80 e0       	ldi	r24, 0x00	; 0
    13b8:	90 e0       	ldi	r25, 0x00	; 0
    13ba:	0e 94 61 08 	call	0x10c2	; 0x10c2 <delay>
    13be:	ee cf       	rjmp	.-36     	; 0x139c <_ZN7Serial_5writeEPKhj+0x48>
    13c0:	8c 17       	cp	r24, r28
    13c2:	1d 06       	cpc	r1, r29
    13c4:	11 f0       	breq	.+4      	; 0x13ca <_ZN7Serial_5writeEPKhj+0x76>
    13c6:	0c f0       	brlt	.+2      	; 0x13ca <_ZN7Serial_5writeEPKhj+0x76>
    13c8:	8c 2f       	mov	r24, r28
    13ca:	9f b7       	in	r25, 0x3f	; 63
    13cc:	f8 94       	cli
    13ce:	80 92 e9 00 	sts	0x00E9, r8	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
    13d2:	20 91 e8 00 	lds	r18, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    13d6:	25 fd       	sbrc	r18, 5
    13d8:	02 c0       	rjmp	.+4      	; 0x13de <_ZN7Serial_5writeEPKhj+0x8a>
    13da:	9f bf       	out	0x3f, r25	; 63
    13dc:	df cf       	rjmp	.-66     	; 0x139c <_ZN7Serial_5writeEPKhj+0x48>
    13de:	28 2f       	mov	r18, r24
    13e0:	30 e0       	ldi	r19, 0x00	; 0
    13e2:	c2 1b       	sub	r28, r18
    13e4:	d3 0b       	sbc	r29, r19
    13e6:	f7 01       	movw	r30, r14
    13e8:	81 50       	subi	r24, 0x01	; 1
    13ea:	20 f0       	brcs	.+8      	; 0x13f4 <_ZN7Serial_5writeEPKhj+0xa0>
    13ec:	41 91       	ld	r20, Z+
    13ee:	40 93 f1 00 	sts	0x00F1, r20	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    13f2:	fa cf       	rjmp	.-12     	; 0x13e8 <_ZN7Serial_5writeEPKhj+0x94>
    13f4:	e2 0e       	add	r14, r18
    13f6:	f3 1e       	adc	r15, r19
    13f8:	bb 20       	and	r11, r11
    13fa:	21 f0       	breq	.+8      	; 0x1404 <_ZN7Serial_5writeEPKhj+0xb0>
    13fc:	90 92 e8 00 	sts	0x00E8, r9	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1400:	b1 2c       	mov	r11, r1
    1402:	eb cf       	rjmp	.-42     	; 0x13da <_ZN7Serial_5writeEPKhj+0x86>
    1404:	80 91 e8 00 	lds	r24, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1408:	85 fd       	sbrc	r24, 5
    140a:	e7 cf       	rjmp	.-50     	; 0x13da <_ZN7Serial_5writeEPKhj+0x86>
    140c:	90 92 e8 00 	sts	0x00E8, r9	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    1410:	bb 24       	eor	r11, r11
    1412:	b3 94       	inc	r11
    1414:	20 97       	sbiw	r28, 0x00	; 0
    1416:	09 f3       	breq	.-62     	; 0x13da <_ZN7Serial_5writeEPKhj+0x86>
    1418:	f3 cf       	rjmp	.-26     	; 0x1400 <_ZN7Serial_5writeEPKhj+0xac>
    141a:	5d 98       	cbi	0x0b, 5	; 11
    141c:	84 e6       	ldi	r24, 0x64	; 100
    141e:	80 93 12 02 	sts	0x0212, r24	; 0x800212 <TxLEDPulse>
    1422:	10 16       	cp	r1, r16
    1424:	11 06       	cpc	r1, r17
    1426:	3c f0       	brlt	.+14     	; 0x1436 <_ZN7Serial_5writeEPKhj+0xe2>
    1428:	81 e0       	ldi	r24, 0x01	; 1
    142a:	90 e0       	ldi	r25, 0x00	; 0
    142c:	f6 01       	movw	r30, r12
    142e:	93 83       	std	Z+3, r25	; 0x03
    1430:	82 83       	std	Z+2, r24	; 0x02
    1432:	10 e0       	ldi	r17, 0x00	; 0
    1434:	00 e0       	ldi	r16, 0x00	; 0
    1436:	c8 01       	movw	r24, r16
    1438:	cd b7       	in	r28, 0x3d	; 61
    143a:	de b7       	in	r29, 0x3e	; 62
    143c:	ec e0       	ldi	r30, 0x0C	; 12
    143e:	0c 94 ba 34 	jmp	0x6974	; 0x6974 <__epilogue_restores__+0xc>

00001442 <_ZN7Serial_5writeEh>:
    1442:	a1 e0       	ldi	r26, 0x01	; 1
    1444:	b0 e0       	ldi	r27, 0x00	; 0
    1446:	e7 e2       	ldi	r30, 0x27	; 39
    1448:	fa e0       	ldi	r31, 0x0A	; 10
    144a:	0c 94 a8 34 	jmp	0x6950	; 0x6950 <__prologue_saves__+0x20>
    144e:	69 83       	std	Y+1, r22	; 0x01
    1450:	dc 01       	movw	r26, r24
    1452:	ed 91       	ld	r30, X+
    1454:	fc 91       	ld	r31, X
    1456:	02 80       	ldd	r0, Z+2	; 0x02
    1458:	f3 81       	ldd	r31, Z+3	; 0x03
    145a:	e0 2d       	mov	r30, r0
    145c:	41 e0       	ldi	r20, 0x01	; 1
    145e:	50 e0       	ldi	r21, 0x00	; 0
    1460:	be 01       	movw	r22, r28
    1462:	6f 5f       	subi	r22, 0xFF	; 255
    1464:	7f 4f       	sbci	r23, 0xFF	; 255
    1466:	09 95       	icall
    1468:	21 96       	adiw	r28, 0x01	; 1
    146a:	e2 e0       	ldi	r30, 0x02	; 2
    146c:	0c 94 c4 34 	jmp	0x6988	; 0x6988 <__epilogue_restores__+0x20>

00001470 <_ZN7Serial_17availableForWriteEv>:
    1470:	0e 94 38 07 	call	0xe70	; 0xe70 <_Z13USB_SendSpaceh.constprop.6>
    1474:	90 e0       	ldi	r25, 0x00	; 0
    1476:	08 95       	ret

00001478 <_ZN7Serial_4readEv>:
    1478:	a1 e0       	ldi	r26, 0x01	; 1
    147a:	b0 e0       	ldi	r27, 0x00	; 0
    147c:	e2 e4       	ldi	r30, 0x42	; 66
    147e:	fa e0       	ldi	r31, 0x0A	; 10
    1480:	0c 94 a8 34 	jmp	0x6950	; 0x6950 <__prologue_saves__+0x20>
    1484:	fc 01       	movw	r30, r24
    1486:	84 85       	ldd	r24, Z+12	; 0x0c
    1488:	95 85       	ldd	r25, Z+13	; 0x0d
    148a:	97 fd       	sbrc	r25, 7
    148c:	08 c0       	rjmp	.+16     	; 0x149e <_ZN7Serial_4readEv+0x26>
    148e:	2f ef       	ldi	r18, 0xFF	; 255
    1490:	3f ef       	ldi	r19, 0xFF	; 255
    1492:	35 87       	std	Z+13, r19	; 0x0d
    1494:	24 87       	std	Z+12, r18	; 0x0c
    1496:	21 96       	adiw	r28, 0x01	; 1
    1498:	e2 e0       	ldi	r30, 0x02	; 2
    149a:	0c 94 c4 34 	jmp	0x6988	; 0x6988 <__epilogue_restores__+0x20>
    149e:	ce 01       	movw	r24, r28
    14a0:	01 96       	adiw	r24, 0x01	; 1
    14a2:	0e 94 0e 07 	call	0xe1c	; 0xe1c <_Z8USB_RecvhPvi.constprop.8>
    14a6:	01 97       	sbiw	r24, 0x01	; 1
    14a8:	19 f4       	brne	.+6      	; 0x14b0 <_ZN7Serial_4readEv+0x38>
    14aa:	89 81       	ldd	r24, Y+1	; 0x01
    14ac:	90 e0       	ldi	r25, 0x00	; 0
    14ae:	f3 cf       	rjmp	.-26     	; 0x1496 <_ZN7Serial_4readEv+0x1e>
    14b0:	8f ef       	ldi	r24, 0xFF	; 255
    14b2:	9f ef       	ldi	r25, 0xFF	; 255
    14b4:	f0 cf       	rjmp	.-32     	; 0x1496 <_ZN7Serial_4readEv+0x1e>

000014b6 <_ZN7Serial_4peekEv>:
    14b6:	a1 e0       	ldi	r26, 0x01	; 1
    14b8:	b0 e0       	ldi	r27, 0x00	; 0
    14ba:	e1 e6       	ldi	r30, 0x61	; 97
    14bc:	fa e0       	ldi	r31, 0x0A	; 10
    14be:	0c 94 a6 34 	jmp	0x694c	; 0x694c <__prologue_saves__+0x1c>
    14c2:	8c 01       	movw	r16, r24
    14c4:	fc 01       	movw	r30, r24
    14c6:	84 85       	ldd	r24, Z+12	; 0x0c
    14c8:	95 85       	ldd	r25, Z+13	; 0x0d
    14ca:	97 ff       	sbrs	r25, 7
    14cc:	0b c0       	rjmp	.+22     	; 0x14e4 <_ZN7Serial_4peekEv+0x2e>
    14ce:	ce 01       	movw	r24, r28
    14d0:	01 96       	adiw	r24, 0x01	; 1
    14d2:	0e 94 0e 07 	call	0xe1c	; 0xe1c <_Z8USB_RecvhPvi.constprop.8>
    14d6:	01 97       	sbiw	r24, 0x01	; 1
    14d8:	61 f4       	brne	.+24     	; 0x14f2 <_ZN7Serial_4peekEv+0x3c>
    14da:	89 81       	ldd	r24, Y+1	; 0x01
    14dc:	90 e0       	ldi	r25, 0x00	; 0
    14de:	f8 01       	movw	r30, r16
    14e0:	95 87       	std	Z+13, r25	; 0x0d
    14e2:	84 87       	std	Z+12, r24	; 0x0c
    14e4:	f8 01       	movw	r30, r16
    14e6:	84 85       	ldd	r24, Z+12	; 0x0c
    14e8:	95 85       	ldd	r25, Z+13	; 0x0d
    14ea:	21 96       	adiw	r28, 0x01	; 1
    14ec:	e4 e0       	ldi	r30, 0x04	; 4
    14ee:	0c 94 c2 34 	jmp	0x6984	; 0x6984 <__epilogue_restores__+0x1c>
    14f2:	8f ef       	ldi	r24, 0xFF	; 255
    14f4:	9f ef       	ldi	r25, 0xFF	; 255
    14f6:	f3 cf       	rjmp	.-26     	; 0x14de <_ZN7Serial_4peekEv+0x28>

000014f8 <_ZN7Serial_9availableEv>:
    14f8:	fc 01       	movw	r30, r24
    14fa:	84 85       	ldd	r24, Z+12	; 0x0c
    14fc:	95 85       	ldd	r25, Z+13	; 0x0d
    14fe:	97 fd       	sbrc	r25, 7
    1500:	0b c0       	rjmp	.+22     	; 0x1518 <_ZN7Serial_9availableEv+0x20>
    1502:	9f b7       	in	r25, 0x3f	; 63
    1504:	f8 94       	cli
    1506:	82 e0       	ldi	r24, 0x02	; 2
    1508:	80 93 e9 00 	sts	0x00E9, r24	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
    150c:	80 91 f2 00 	lds	r24, 0x00F2	; 0x8000f2 <__TEXT_REGION_LENGTH__+0x7e00f2>
    1510:	9f bf       	out	0x3f, r25	; 63
    1512:	90 e0       	ldi	r25, 0x00	; 0
    1514:	01 96       	adiw	r24, 0x01	; 1
    1516:	08 95       	ret
    1518:	9f b7       	in	r25, 0x3f	; 63
    151a:	f8 94       	cli
    151c:	82 e0       	ldi	r24, 0x02	; 2
    151e:	80 93 e9 00 	sts	0x00E9, r24	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
    1522:	80 91 f2 00 	lds	r24, 0x00F2	; 0x8000f2 <__TEXT_REGION_LENGTH__+0x7e00f2>
    1526:	9f bf       	out	0x3f, r25	; 63
    1528:	90 e0       	ldi	r25, 0x00	; 0
    152a:	08 95       	ret

0000152c <_ZN9Statistic3endEv>:
    152c:	cf 93       	push	r28
    152e:	df 93       	push	r29
    1530:	ec 01       	movw	r28, r24
    1532:	0e 94 3c 08 	call	0x1078	; 0x1078 <micros>
    1536:	2a 81       	ldd	r18, Y+2	; 0x02
    1538:	3b 81       	ldd	r19, Y+3	; 0x03
    153a:	62 1b       	sub	r22, r18
    153c:	73 0b       	sbc	r23, r19
    153e:	8c 81       	ldd	r24, Y+4	; 0x04
    1540:	9d 81       	ldd	r25, Y+5	; 0x05
    1542:	68 17       	cp	r22, r24
    1544:	79 07       	cpc	r23, r25
    1546:	10 f4       	brcc	.+4      	; 0x154c <_ZN9Statistic3endEv+0x20>
    1548:	7d 83       	std	Y+5, r23	; 0x05
    154a:	6c 83       	std	Y+4, r22	; 0x04
    154c:	8e 81       	ldd	r24, Y+6	; 0x06
    154e:	9f 81       	ldd	r25, Y+7	; 0x07
    1550:	86 17       	cp	r24, r22
    1552:	97 07       	cpc	r25, r23
    1554:	10 f4       	brcc	.+4      	; 0x155a <_ZN9Statistic3endEv+0x2e>
    1556:	7f 83       	std	Y+7, r23	; 0x07
    1558:	6e 83       	std	Y+6, r22	; 0x06
    155a:	88 85       	ldd	r24, Y+8	; 0x08
    155c:	99 85       	ldd	r25, Y+9	; 0x09
    155e:	9c 01       	movw	r18, r24
    1560:	44 e0       	ldi	r20, 0x04	; 4
    1562:	36 95       	lsr	r19
    1564:	27 95       	ror	r18
    1566:	4a 95       	dec	r20
    1568:	e1 f7       	brne	.-8      	; 0x1562 <_ZN9Statistic3endEv+0x36>
    156a:	82 1b       	sub	r24, r18
    156c:	93 0b       	sbc	r25, r19
    156e:	54 e0       	ldi	r21, 0x04	; 4
    1570:	76 95       	lsr	r23
    1572:	67 95       	ror	r22
    1574:	5a 95       	dec	r21
    1576:	e1 f7       	brne	.-8      	; 0x1570 <_ZN9Statistic3endEv+0x44>
    1578:	68 0f       	add	r22, r24
    157a:	79 1f       	adc	r23, r25
    157c:	79 87       	std	Y+9, r23	; 0x09
    157e:	68 87       	std	Y+8, r22	; 0x08
    1580:	df 91       	pop	r29
    1582:	cf 91       	pop	r28
    1584:	08 95       	ret

00001586 <_ZN9Statistic5startEv>:
    1586:	cf 93       	push	r28
    1588:	df 93       	push	r29
    158a:	ec 01       	movw	r28, r24
    158c:	0e 94 3c 08 	call	0x1078	; 0x1078 <micros>
    1590:	7b 83       	std	Y+3, r23	; 0x03
    1592:	6a 83       	std	Y+2, r22	; 0x02
    1594:	df 91       	pop	r29
    1596:	cf 91       	pop	r28
    1598:	08 95       	ret

0000159a <_ZN11PipedStream5flushEv>:
    159a:	dc 01       	movw	r26, r24
    159c:	1e 96       	adiw	r26, 0x0e	; 14
    159e:	8d 91       	ld	r24, X+
    15a0:	9c 91       	ld	r25, X
    15a2:	dc 01       	movw	r26, r24
    15a4:	ed 91       	ld	r30, X+
    15a6:	fc 91       	ld	r31, X
    15a8:	06 80       	ldd	r0, Z+6	; 0x06
    15aa:	f7 81       	ldd	r31, Z+7	; 0x07
    15ac:	e0 2d       	mov	r30, r0
    15ae:	09 95       	icall
    15b0:	08 95       	ret

000015b2 <_ZN11PipedStream4peekEv>:
    15b2:	dc 01       	movw	r26, r24
    15b4:	1c 96       	adiw	r26, 0x0c	; 12
    15b6:	8d 91       	ld	r24, X+
    15b8:	9c 91       	ld	r25, X
    15ba:	dc 01       	movw	r26, r24
    15bc:	ed 91       	ld	r30, X+
    15be:	fc 91       	ld	r31, X
    15c0:	04 84       	ldd	r0, Z+12	; 0x0c
    15c2:	f5 85       	ldd	r31, Z+13	; 0x0d
    15c4:	e0 2d       	mov	r30, r0
    15c6:	09 95       	icall
    15c8:	08 95       	ret

000015ca <_ZN11PipedStream17availableForWriteEv>:
    15ca:	dc 01       	movw	r26, r24
    15cc:	1e 96       	adiw	r26, 0x0e	; 14
    15ce:	8d 91       	ld	r24, X+
    15d0:	9c 91       	ld	r25, X
    15d2:	dc 01       	movw	r26, r24
    15d4:	ed 91       	ld	r30, X+
    15d6:	fc 91       	ld	r31, X
    15d8:	04 80       	ldd	r0, Z+4	; 0x04
    15da:	f5 81       	ldd	r31, Z+5	; 0x05
    15dc:	e0 2d       	mov	r30, r0
    15de:	09 95       	icall
    15e0:	08 95       	ret

000015e2 <_ZN11PipedStream9availableEv>:
    15e2:	dc 01       	movw	r26, r24
    15e4:	1c 96       	adiw	r26, 0x0c	; 12
    15e6:	8d 91       	ld	r24, X+
    15e8:	9c 91       	ld	r25, X
    15ea:	dc 01       	movw	r26, r24
    15ec:	ed 91       	ld	r30, X+
    15ee:	fc 91       	ld	r31, X
    15f0:	00 84       	ldd	r0, Z+8	; 0x08
    15f2:	f1 85       	ldd	r31, Z+9	; 0x09
    15f4:	e0 2d       	mov	r30, r0
    15f6:	09 95       	icall
    15f8:	08 95       	ret

000015fa <_ZN11PipedStream5writeEh>:
    15fa:	dc 01       	movw	r26, r24
    15fc:	1e 96       	adiw	r26, 0x0e	; 14
    15fe:	8d 91       	ld	r24, X+
    1600:	9c 91       	ld	r25, X
    1602:	dc 01       	movw	r26, r24
    1604:	ed 91       	ld	r30, X+
    1606:	fc 91       	ld	r31, X
    1608:	01 90       	ld	r0, Z+
    160a:	f0 81       	ld	r31, Z
    160c:	e0 2d       	mov	r30, r0
    160e:	09 95       	icall
    1610:	08 95       	ret

00001612 <_ZN11PipedStream4readEv>:
    1612:	dc 01       	movw	r26, r24
    1614:	1c 96       	adiw	r26, 0x0c	; 12
    1616:	8d 91       	ld	r24, X+
    1618:	9c 91       	ld	r25, X
    161a:	dc 01       	movw	r26, r24
    161c:	ed 91       	ld	r30, X+
    161e:	fc 91       	ld	r31, X
    1620:	02 84       	ldd	r0, Z+10	; 0x0a
    1622:	f3 85       	ldd	r31, Z+11	; 0x0b
    1624:	e0 2d       	mov	r30, r0
    1626:	09 95       	icall
    1628:	08 95       	ret

0000162a <_ZN14LoopbackStream4peekEv>:
    162a:	dc 01       	movw	r26, r24
    162c:	52 96       	adiw	r26, 0x12	; 18
    162e:	8d 91       	ld	r24, X+
    1630:	9c 91       	ld	r25, X
    1632:	53 97       	sbiw	r26, 0x13	; 19
    1634:	89 2b       	or	r24, r25
    1636:	61 f0       	breq	.+24     	; 0x1650 <_ZN14LoopbackStream4peekEv+0x26>
    1638:	1c 96       	adiw	r26, 0x0c	; 12
    163a:	ed 91       	ld	r30, X+
    163c:	fc 91       	ld	r31, X
    163e:	1d 97       	sbiw	r26, 0x0d	; 13
    1640:	50 96       	adiw	r26, 0x10	; 16
    1642:	8d 91       	ld	r24, X+
    1644:	9c 91       	ld	r25, X
    1646:	e8 0f       	add	r30, r24
    1648:	f9 1f       	adc	r31, r25
    164a:	80 81       	ld	r24, Z
    164c:	90 e0       	ldi	r25, 0x00	; 0
    164e:	08 95       	ret
    1650:	8f ef       	ldi	r24, 0xFF	; 255
    1652:	9f ef       	ldi	r25, 0xFF	; 255
    1654:	08 95       	ret

00001656 <_ZN14LoopbackStream8containsEc>:
    1656:	fc 01       	movw	r30, r24
    1658:	20 89       	ldd	r18, Z+16	; 0x10
    165a:	31 89       	ldd	r19, Z+17	; 0x11
    165c:	82 89       	ldd	r24, Z+18	; 0x12
    165e:	93 89       	ldd	r25, Z+19	; 0x13
    1660:	06 2e       	mov	r0, r22
    1662:	00 0c       	add	r0, r0
    1664:	77 0b       	sbc	r23, r23
    1666:	00 97       	sbiw	r24, 0x00	; 0
    1668:	99 f0       	breq	.+38     	; 0x1690 <_ZN14LoopbackStream8containsEc+0x3a>
    166a:	a4 85       	ldd	r26, Z+12	; 0x0c
    166c:	b5 85       	ldd	r27, Z+13	; 0x0d
    166e:	a2 0f       	add	r26, r18
    1670:	b3 1f       	adc	r27, r19
    1672:	4c 91       	ld	r20, X
    1674:	46 17       	cp	r20, r22
    1676:	17 06       	cpc	r1, r23
    1678:	69 f0       	breq	.+26     	; 0x1694 <_ZN14LoopbackStream8containsEc+0x3e>
    167a:	2f 5f       	subi	r18, 0xFF	; 255
    167c:	3f 4f       	sbci	r19, 0xFF	; 255
    167e:	46 85       	ldd	r20, Z+14	; 0x0e
    1680:	57 85       	ldd	r21, Z+15	; 0x0f
    1682:	42 17       	cp	r20, r18
    1684:	53 07       	cpc	r21, r19
    1686:	11 f4       	brne	.+4      	; 0x168c <_ZN14LoopbackStream8containsEc+0x36>
    1688:	30 e0       	ldi	r19, 0x00	; 0
    168a:	20 e0       	ldi	r18, 0x00	; 0
    168c:	01 97       	sbiw	r24, 0x01	; 1
    168e:	eb cf       	rjmp	.-42     	; 0x1666 <_ZN14LoopbackStream8containsEc+0x10>
    1690:	80 e0       	ldi	r24, 0x00	; 0
    1692:	08 95       	ret
    1694:	81 e0       	ldi	r24, 0x01	; 1
    1696:	08 95       	ret

00001698 <_ZN14LoopbackStream17availableForWriteEv>:
    1698:	fc 01       	movw	r30, r24
    169a:	86 85       	ldd	r24, Z+14	; 0x0e
    169c:	97 85       	ldd	r25, Z+15	; 0x0f
    169e:	22 89       	ldd	r18, Z+18	; 0x12
    16a0:	33 89       	ldd	r19, Z+19	; 0x13
    16a2:	82 1b       	sub	r24, r18
    16a4:	93 0b       	sbc	r25, r19
    16a6:	08 95       	ret

000016a8 <_ZN14LoopbackStream9availableEv>:
    16a8:	fc 01       	movw	r30, r24
    16aa:	82 89       	ldd	r24, Z+18	; 0x12
    16ac:	93 89       	ldd	r25, Z+19	; 0x13
    16ae:	08 95       	ret

000016b0 <_ZN14LoopbackStream5writeEh>:
    16b0:	fc 01       	movw	r30, r24
    16b2:	26 2f       	mov	r18, r22
    16b4:	82 89       	ldd	r24, Z+18	; 0x12
    16b6:	93 89       	ldd	r25, Z+19	; 0x13
    16b8:	66 85       	ldd	r22, Z+14	; 0x0e
    16ba:	77 85       	ldd	r23, Z+15	; 0x0f
    16bc:	86 17       	cp	r24, r22
    16be:	97 07       	cpc	r25, r23
    16c0:	99 f0       	breq	.+38     	; 0x16e8 <_ZN14LoopbackStream5writeEh+0x38>
    16c2:	40 89       	ldd	r20, Z+16	; 0x10
    16c4:	51 89       	ldd	r21, Z+17	; 0x11
    16c6:	84 0f       	add	r24, r20
    16c8:	95 1f       	adc	r25, r21
    16ca:	0e 94 10 35 	call	0x6a20	; 0x6a20 <__udivmodhi4>
    16ce:	a4 85       	ldd	r26, Z+12	; 0x0c
    16d0:	b5 85       	ldd	r27, Z+13	; 0x0d
    16d2:	a8 0f       	add	r26, r24
    16d4:	b9 1f       	adc	r27, r25
    16d6:	2c 93       	st	X, r18
    16d8:	82 89       	ldd	r24, Z+18	; 0x12
    16da:	93 89       	ldd	r25, Z+19	; 0x13
    16dc:	01 96       	adiw	r24, 0x01	; 1
    16de:	93 8b       	std	Z+19, r25	; 0x13
    16e0:	82 8b       	std	Z+18, r24	; 0x12
    16e2:	81 e0       	ldi	r24, 0x01	; 1
    16e4:	90 e0       	ldi	r25, 0x00	; 0
    16e6:	08 95       	ret
    16e8:	90 e0       	ldi	r25, 0x00	; 0
    16ea:	80 e0       	ldi	r24, 0x00	; 0
    16ec:	08 95       	ret

000016ee <_ZN14LoopbackStream4readEv>:
    16ee:	fc 01       	movw	r30, r24
    16f0:	42 89       	ldd	r20, Z+18	; 0x12
    16f2:	53 89       	ldd	r21, Z+19	; 0x13
    16f4:	41 15       	cp	r20, r1
    16f6:	51 05       	cpc	r21, r1
    16f8:	c1 f0       	breq	.+48     	; 0x172a <_ZN14LoopbackStream4readEv+0x3c>
    16fa:	20 89       	ldd	r18, Z+16	; 0x10
    16fc:	31 89       	ldd	r19, Z+17	; 0x11
    16fe:	a4 85       	ldd	r26, Z+12	; 0x0c
    1700:	b5 85       	ldd	r27, Z+13	; 0x0d
    1702:	a2 0f       	add	r26, r18
    1704:	b3 1f       	adc	r27, r19
    1706:	8c 91       	ld	r24, X
    1708:	90 e0       	ldi	r25, 0x00	; 0
    170a:	2f 5f       	subi	r18, 0xFF	; 255
    170c:	3f 4f       	sbci	r19, 0xFF	; 255
    170e:	31 8b       	std	Z+17, r19	; 0x11
    1710:	20 8b       	std	Z+16, r18	; 0x10
    1712:	41 50       	subi	r20, 0x01	; 1
    1714:	51 09       	sbc	r21, r1
    1716:	53 8b       	std	Z+19, r21	; 0x13
    1718:	42 8b       	std	Z+18, r20	; 0x12
    171a:	46 85       	ldd	r20, Z+14	; 0x0e
    171c:	57 85       	ldd	r21, Z+15	; 0x0f
    171e:	24 17       	cp	r18, r20
    1720:	35 07       	cpc	r19, r21
    1722:	29 f4       	brne	.+10     	; 0x172e <_ZN14LoopbackStream4readEv+0x40>
    1724:	11 8a       	std	Z+17, r1	; 0x11
    1726:	10 8a       	std	Z+16, r1	; 0x10
    1728:	08 95       	ret
    172a:	8f ef       	ldi	r24, 0xFF	; 255
    172c:	9f ef       	ldi	r25, 0xFF	; 255
    172e:	08 95       	ret

00001730 <_ZN14SerialCommands8getTokenEPPc>:
    1730:	b0 e0       	ldi	r27, 0x00	; 0
    1732:	a0 e0       	ldi	r26, 0x00	; 0
    1734:	ee e9       	ldi	r30, 0x9E	; 158
    1736:	fb e0       	ldi	r31, 0x0B	; 11
    1738:	0c 94 a2 34 	jmp	0x6944	; 0x6944 <__prologue_saves__+0x14>
    173c:	db 01       	movw	r26, r22
    173e:	0d 91       	ld	r16, X+
    1740:	1c 91       	ld	r17, X
    1742:	01 15       	cp	r16, r1
    1744:	11 05       	cpc	r17, r1
    1746:	a9 f1       	breq	.+106    	; 0x17b2 <_ZN14SerialCommands8getTokenEPPc+0x82>
    1748:	6b 01       	movw	r12, r22
    174a:	7c 01       	movw	r14, r24
    174c:	e8 01       	movw	r28, r16
    174e:	8e 01       	movw	r16, r28
    1750:	21 96       	adiw	r28, 0x01	; 1
    1752:	d7 01       	movw	r26, r14
    1754:	1c 96       	adiw	r26, 0x0c	; 12
    1756:	ed 91       	ld	r30, X+
    1758:	fc 91       	ld	r31, X
    175a:	d8 01       	movw	r26, r16
    175c:	8c 91       	ld	r24, X
    175e:	09 95       	icall
    1760:	81 11       	cpse	r24, r1
    1762:	f5 cf       	rjmp	.-22     	; 0x174e <_ZN14SerialCommands8getTokenEPPc+0x1e>
    1764:	d7 01       	movw	r26, r14
    1766:	1e 96       	adiw	r26, 0x0e	; 14
    1768:	ed 91       	ld	r30, X+
    176a:	fc 91       	ld	r31, X
    176c:	d8 01       	movw	r26, r16
    176e:	8c 91       	ld	r24, X
    1770:	09 95       	icall
    1772:	88 23       	and	r24, r24
    1774:	21 f1       	breq	.+72     	; 0x17be <_ZN14SerialCommands8getTokenEPPc+0x8e>
    1776:	f8 01       	movw	r30, r16
    1778:	80 81       	ld	r24, Z
    177a:	8e 01       	movw	r16, r28
    177c:	9e 01       	movw	r18, r28
    177e:	e9 01       	movw	r28, r18
    1780:	98 81       	ld	r25, Y
    1782:	2f 5f       	subi	r18, 0xFF	; 255
    1784:	3f 4f       	sbci	r19, 0xFF	; 255
    1786:	98 13       	cpse	r25, r24
    1788:	02 c0       	rjmp	.+4      	; 0x178e <_ZN14SerialCommands8getTokenEPPc+0x5e>
    178a:	19 92       	st	Y+, r1
    178c:	04 c0       	rjmp	.+8      	; 0x1796 <_ZN14SerialCommands8getTokenEPPc+0x66>
    178e:	91 11       	cpse	r25, r1
    1790:	f6 cf       	rjmp	.-20     	; 0x177e <_ZN14SerialCommands8getTokenEPPc+0x4e>
    1792:	88 23       	and	r24, r24
    1794:	d1 f3       	breq	.-12     	; 0x178a <_ZN14SerialCommands8getTokenEPPc+0x5a>
    1796:	d7 01       	movw	r26, r14
    1798:	1c 96       	adiw	r26, 0x0c	; 12
    179a:	ed 91       	ld	r30, X+
    179c:	fc 91       	ld	r31, X
    179e:	88 81       	ld	r24, Y
    17a0:	09 95       	icall
    17a2:	81 11       	cpse	r24, r1
    17a4:	f2 cf       	rjmp	.-28     	; 0x178a <_ZN14SerialCommands8getTokenEPPc+0x5a>
    17a6:	88 81       	ld	r24, Y
    17a8:	88 23       	and	r24, r24
    17aa:	b9 f0       	breq	.+46     	; 0x17da <_ZN14SerialCommands8getTokenEPPc+0xaa>
    17ac:	f6 01       	movw	r30, r12
    17ae:	d1 83       	std	Z+1, r29	; 0x01
    17b0:	c0 83       	st	Z, r28
    17b2:	c8 01       	movw	r24, r16
    17b4:	cd b7       	in	r28, 0x3d	; 61
    17b6:	de b7       	in	r29, 0x3e	; 62
    17b8:	e8 e0       	ldi	r30, 0x08	; 8
    17ba:	0c 94 be 34 	jmp	0x697c	; 0x697c <__epilogue_restores__+0x14>
    17be:	e8 01       	movw	r28, r16
    17c0:	d7 01       	movw	r26, r14
    17c2:	1c 96       	adiw	r26, 0x0c	; 12
    17c4:	ed 91       	ld	r30, X+
    17c6:	fc 91       	ld	r31, X
    17c8:	88 81       	ld	r24, Y
    17ca:	09 95       	icall
    17cc:	81 11       	cpse	r24, r1
    17ce:	e3 cf       	rjmp	.-58     	; 0x1796 <_ZN14SerialCommands8getTokenEPPc+0x66>
    17d0:	88 81       	ld	r24, Y
    17d2:	88 23       	and	r24, r24
    17d4:	01 f3       	breq	.-64     	; 0x1796 <_ZN14SerialCommands8getTokenEPPc+0x66>
    17d6:	21 96       	adiw	r28, 0x01	; 1
    17d8:	f3 cf       	rjmp	.-26     	; 0x17c0 <_ZN14SerialCommands8getTokenEPPc+0x90>
    17da:	d6 01       	movw	r26, r12
    17dc:	1d 92       	st	X+, r1
    17de:	1c 92       	st	X, r1
    17e0:	e8 cf       	rjmp	.-48     	; 0x17b2 <_ZN14SerialCommands8getTokenEPPc+0x82>

000017e2 <twi_transmit>:
    17e2:	20 91 d8 01 	lds	r18, 0x01D8	; 0x8001d8 <twi_txBufferLength>
    17e6:	26 0f       	add	r18, r22
    17e8:	33 27       	eor	r19, r19
    17ea:	33 1f       	adc	r19, r19
    17ec:	21 32       	cpi	r18, 0x21	; 33
    17ee:	31 05       	cpc	r19, r1
    17f0:	ec f4       	brge	.+58     	; 0x182c <twi_transmit+0x4a>
    17f2:	20 91 6b 02 	lds	r18, 0x026B	; 0x80026b <twi_state>
    17f6:	fc 01       	movw	r30, r24
    17f8:	90 e0       	ldi	r25, 0x00	; 0
    17fa:	80 e0       	ldi	r24, 0x00	; 0
    17fc:	24 30       	cpi	r18, 0x04	; 4
    17fe:	69 f0       	breq	.+26     	; 0x181a <twi_transmit+0x38>
    1800:	82 e0       	ldi	r24, 0x02	; 2
    1802:	08 95       	ret
    1804:	a0 91 d8 01 	lds	r26, 0x01D8	; 0x8001d8 <twi_txBufferLength>
    1808:	21 91       	ld	r18, Z+
    180a:	ac 01       	movw	r20, r24
    180c:	48 54       	subi	r20, 0x48	; 72
    180e:	5e 4f       	sbci	r21, 0xFE	; 254
    1810:	a4 0f       	add	r26, r20
    1812:	b5 2f       	mov	r27, r21
    1814:	b1 1d       	adc	r27, r1
    1816:	2c 93       	st	X, r18
    1818:	01 96       	adiw	r24, 0x01	; 1
    181a:	86 17       	cp	r24, r22
    181c:	98 f3       	brcs	.-26     	; 0x1804 <twi_transmit+0x22>
    181e:	80 91 d8 01 	lds	r24, 0x01D8	; 0x8001d8 <twi_txBufferLength>
    1822:	68 0f       	add	r22, r24
    1824:	60 93 d8 01 	sts	0x01D8, r22	; 0x8001d8 <twi_txBufferLength>
    1828:	80 e0       	ldi	r24, 0x00	; 0
    182a:	08 95       	ret
    182c:	81 e0       	ldi	r24, 0x01	; 1
    182e:	08 95       	ret

00001830 <twi_init>:
    1830:	10 92 6b 02 	sts	0x026B, r1	; 0x80026b <twi_state>
    1834:	81 e0       	ldi	r24, 0x01	; 1
    1836:	80 93 6a 02 	sts	0x026A, r24	; 0x80026a <twi_sendStop>
    183a:	10 92 45 02 	sts	0x0245, r1	; 0x800245 <twi_inRepStart>
    183e:	61 e0       	ldi	r22, 0x01	; 1
    1840:	82 e0       	ldi	r24, 0x02	; 2
    1842:	0e 94 d2 07 	call	0xfa4	; 0xfa4 <digitalWrite>
    1846:	61 e0       	ldi	r22, 0x01	; 1
    1848:	83 e0       	ldi	r24, 0x03	; 3
    184a:	0e 94 d2 07 	call	0xfa4	; 0xfa4 <digitalWrite>
    184e:	e9 eb       	ldi	r30, 0xB9	; 185
    1850:	f0 e0       	ldi	r31, 0x00	; 0
    1852:	80 81       	ld	r24, Z
    1854:	8e 7f       	andi	r24, 0xFE	; 254
    1856:	80 83       	st	Z, r24
    1858:	80 81       	ld	r24, Z
    185a:	8d 7f       	andi	r24, 0xFD	; 253
    185c:	80 83       	st	Z, r24
    185e:	88 e4       	ldi	r24, 0x48	; 72
    1860:	80 93 b8 00 	sts	0x00B8, r24	; 0x8000b8 <__TEXT_REGION_LENGTH__+0x7e00b8>
    1864:	85 e4       	ldi	r24, 0x45	; 69
    1866:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    186a:	08 95       	ret

0000186c <twi_handleTimeout>:
    186c:	cf 93       	push	r28
    186e:	df 93       	push	r29
    1870:	91 e0       	ldi	r25, 0x01	; 1
    1872:	90 93 b7 01 	sts	0x01B7, r25	; 0x8001b7 <twi_timed_out_flag>
    1876:	88 23       	and	r24, r24
    1878:	b9 f0       	breq	.+46     	; 0x18a8 <twi_handleTimeout+0x3c>
    187a:	c0 91 b8 00 	lds	r28, 0x00B8	; 0x8000b8 <__TEXT_REGION_LENGTH__+0x7e00b8>
    187e:	d0 91 ba 00 	lds	r29, 0x00BA	; 0x8000ba <__TEXT_REGION_LENGTH__+0x7e00ba>
    1882:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    1886:	8a 7b       	andi	r24, 0xBA	; 186
    1888:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    188c:	60 e0       	ldi	r22, 0x00	; 0
    188e:	82 e0       	ldi	r24, 0x02	; 2
    1890:	0e 94 d2 07 	call	0xfa4	; 0xfa4 <digitalWrite>
    1894:	60 e0       	ldi	r22, 0x00	; 0
    1896:	83 e0       	ldi	r24, 0x03	; 3
    1898:	0e 94 d2 07 	call	0xfa4	; 0xfa4 <digitalWrite>
    189c:	0e 94 18 0c 	call	0x1830	; 0x1830 <twi_init>
    18a0:	d0 93 ba 00 	sts	0x00BA, r29	; 0x8000ba <__TEXT_REGION_LENGTH__+0x7e00ba>
    18a4:	c0 93 b8 00 	sts	0x00B8, r28	; 0x8000b8 <__TEXT_REGION_LENGTH__+0x7e00b8>
    18a8:	df 91       	pop	r29
    18aa:	cf 91       	pop	r28
    18ac:	08 95       	ret

000018ae <_ZN7TwoWire15endTransmissionEh.constprop.115>:
    18ae:	b0 e0       	ldi	r27, 0x00	; 0
    18b0:	a0 e0       	ldi	r26, 0x00	; 0
    18b2:	ed e5       	ldi	r30, 0x5D	; 93
    18b4:	fc e0       	ldi	r31, 0x0C	; 12
    18b6:	0c 94 a2 34 	jmp	0x6944	; 0x6944 <__prologue_saves__+0x14>
    18ba:	d0 91 94 02 	lds	r29, 0x0294	; 0x800294 <_ZN7TwoWire14txBufferLengthE>
    18be:	81 e0       	ldi	r24, 0x01	; 1
    18c0:	d1 32       	cpi	r29, 0x21	; 33
    18c2:	08 f0       	brcs	.+2      	; 0x18c6 <_ZN7TwoWire15endTransmissionEh.constprop.115+0x18>
    18c4:	9c c0       	rjmp	.+312    	; 0x19fe <_ZN7TwoWire15endTransmissionEh.constprop.115+0x150>
    18c6:	c0 91 93 02 	lds	r28, 0x0293	; 0x800293 <_ZN7TwoWire9txAddressE>
    18ca:	0e 94 3c 08 	call	0x1078	; 0x1078 <micros>
    18ce:	6b 01       	movw	r12, r22
    18d0:	7c 01       	movw	r14, r24
    18d2:	80 91 6b 02 	lds	r24, 0x026B	; 0x80026b <twi_state>
    18d6:	81 11       	cpse	r24, r1
    18d8:	6c c0       	rjmp	.+216    	; 0x19b2 <_ZN7TwoWire15endTransmissionEh.constprop.115+0x104>
    18da:	82 e0       	ldi	r24, 0x02	; 2
    18dc:	80 93 6b 02 	sts	0x026B, r24	; 0x80026b <twi_state>
    18e0:	81 e0       	ldi	r24, 0x01	; 1
    18e2:	80 93 6a 02 	sts	0x026A, r24	; 0x80026a <twi_sendStop>
    18e6:	8f ef       	ldi	r24, 0xFF	; 255
    18e8:	80 93 69 02 	sts	0x0269, r24	; 0x800269 <twi_error>
    18ec:	10 92 68 02 	sts	0x0268, r1	; 0x800268 <twi_masterBufferIndex>
    18f0:	d0 93 67 02 	sts	0x0267, r29	; 0x800267 <twi_masterBufferLength>
    18f4:	a3 e7       	ldi	r26, 0x73	; 115
    18f6:	b2 e0       	ldi	r27, 0x02	; 2
    18f8:	e7 e4       	ldi	r30, 0x47	; 71
    18fa:	f2 e0       	ldi	r31, 0x02	; 2
    18fc:	80 e0       	ldi	r24, 0x00	; 0
    18fe:	d8 13       	cpse	r29, r24
    1900:	89 c0       	rjmp	.+274    	; 0x1a14 <_ZN7TwoWire15endTransmissionEh.constprop.115+0x166>
    1902:	10 92 46 02 	sts	0x0246, r1	; 0x800246 <twi_slarw>
    1906:	80 91 46 02 	lds	r24, 0x0246	; 0x800246 <twi_slarw>
    190a:	cc 0f       	add	r28, r28
    190c:	c8 2b       	or	r28, r24
    190e:	c0 93 46 02 	sts	0x0246, r28	; 0x800246 <twi_slarw>
    1912:	80 91 45 02 	lds	r24, 0x0245	; 0x800245 <twi_inRepStart>
    1916:	81 30       	cpi	r24, 0x01	; 1
    1918:	09 f0       	breq	.+2      	; 0x191c <_ZN7TwoWire15endTransmissionEh.constprop.115+0x6e>
    191a:	80 c0       	rjmp	.+256    	; 0x1a1c <_ZN7TwoWire15endTransmissionEh.constprop.115+0x16e>
    191c:	10 92 45 02 	sts	0x0245, r1	; 0x800245 <twi_inRepStart>
    1920:	0e 94 3c 08 	call	0x1078	; 0x1078 <micros>
    1924:	6b 01       	movw	r12, r22
    1926:	7c 01       	movw	r14, r24
    1928:	80 91 46 02 	lds	r24, 0x0246	; 0x800246 <twi_slarw>
    192c:	80 93 bb 00 	sts	0x00BB, r24	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
    1930:	80 91 6d 02 	lds	r24, 0x026D	; 0x80026d <twi_timeout_us>
    1934:	90 91 6e 02 	lds	r25, 0x026E	; 0x80026e <twi_timeout_us+0x1>
    1938:	a0 91 6f 02 	lds	r26, 0x026F	; 0x80026f <twi_timeout_us+0x2>
    193c:	b0 91 70 02 	lds	r27, 0x0270	; 0x800270 <twi_timeout_us+0x3>
    1940:	89 2b       	or	r24, r25
    1942:	8a 2b       	or	r24, r26
    1944:	8b 2b       	or	r24, r27
    1946:	a1 f0       	breq	.+40     	; 0x1970 <_ZN7TwoWire15endTransmissionEh.constprop.115+0xc2>
    1948:	0e 94 3c 08 	call	0x1078	; 0x1078 <micros>
    194c:	00 91 6d 02 	lds	r16, 0x026D	; 0x80026d <twi_timeout_us>
    1950:	10 91 6e 02 	lds	r17, 0x026E	; 0x80026e <twi_timeout_us+0x1>
    1954:	20 91 6f 02 	lds	r18, 0x026F	; 0x80026f <twi_timeout_us+0x2>
    1958:	30 91 70 02 	lds	r19, 0x0270	; 0x800270 <twi_timeout_us+0x3>
    195c:	6c 19       	sub	r22, r12
    195e:	7d 09       	sbc	r23, r13
    1960:	8e 09       	sbc	r24, r14
    1962:	9f 09       	sbc	r25, r15
    1964:	06 17       	cp	r16, r22
    1966:	17 07       	cpc	r17, r23
    1968:	28 07       	cpc	r18, r24
    196a:	39 07       	cpc	r19, r25
    196c:	08 f4       	brcc	.+2      	; 0x1970 <_ZN7TwoWire15endTransmissionEh.constprop.115+0xc2>
    196e:	42 c0       	rjmp	.+132    	; 0x19f4 <_ZN7TwoWire15endTransmissionEh.constprop.115+0x146>
    1970:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    1974:	83 fd       	sbrc	r24, 3
    1976:	d8 cf       	rjmp	.-80     	; 0x1928 <_ZN7TwoWire15endTransmissionEh.constprop.115+0x7a>
    1978:	85 ec       	ldi	r24, 0xC5	; 197
    197a:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    197e:	0e 94 3c 08 	call	0x1078	; 0x1078 <micros>
    1982:	6b 01       	movw	r12, r22
    1984:	7c 01       	movw	r14, r24
    1986:	80 91 6b 02 	lds	r24, 0x026B	; 0x80026b <twi_state>
    198a:	82 30       	cpi	r24, 0x02	; 2
    198c:	09 f4       	brne	.+2      	; 0x1990 <_ZN7TwoWire15endTransmissionEh.constprop.115+0xe2>
    198e:	48 c0       	rjmp	.+144    	; 0x1a20 <_ZN7TwoWire15endTransmissionEh.constprop.115+0x172>
    1990:	80 91 69 02 	lds	r24, 0x0269	; 0x800269 <twi_error>
    1994:	8f 3f       	cpi	r24, 0xFF	; 255
    1996:	09 f4       	brne	.+2      	; 0x199a <_ZN7TwoWire15endTransmissionEh.constprop.115+0xec>
    1998:	65 c0       	rjmp	.+202    	; 0x1a64 <_ZN7TwoWire15endTransmissionEh.constprop.115+0x1b6>
    199a:	80 91 69 02 	lds	r24, 0x0269	; 0x800269 <twi_error>
    199e:	80 32       	cpi	r24, 0x20	; 32
    19a0:	09 f4       	brne	.+2      	; 0x19a4 <_ZN7TwoWire15endTransmissionEh.constprop.115+0xf6>
    19a2:	62 c0       	rjmp	.+196    	; 0x1a68 <_ZN7TwoWire15endTransmissionEh.constprop.115+0x1ba>
    19a4:	80 91 69 02 	lds	r24, 0x0269	; 0x800269 <twi_error>
    19a8:	80 33       	cpi	r24, 0x30	; 48
    19aa:	09 f4       	brne	.+2      	; 0x19ae <_ZN7TwoWire15endTransmissionEh.constprop.115+0x100>
    19ac:	5f c0       	rjmp	.+190    	; 0x1a6c <_ZN7TwoWire15endTransmissionEh.constprop.115+0x1be>
    19ae:	84 e0       	ldi	r24, 0x04	; 4
    19b0:	26 c0       	rjmp	.+76     	; 0x19fe <_ZN7TwoWire15endTransmissionEh.constprop.115+0x150>
    19b2:	80 91 6d 02 	lds	r24, 0x026D	; 0x80026d <twi_timeout_us>
    19b6:	90 91 6e 02 	lds	r25, 0x026E	; 0x80026e <twi_timeout_us+0x1>
    19ba:	a0 91 6f 02 	lds	r26, 0x026F	; 0x80026f <twi_timeout_us+0x2>
    19be:	b0 91 70 02 	lds	r27, 0x0270	; 0x800270 <twi_timeout_us+0x3>
    19c2:	89 2b       	or	r24, r25
    19c4:	8a 2b       	or	r24, r26
    19c6:	8b 2b       	or	r24, r27
    19c8:	09 f4       	brne	.+2      	; 0x19cc <_ZN7TwoWire15endTransmissionEh.constprop.115+0x11e>
    19ca:	83 cf       	rjmp	.-250    	; 0x18d2 <_ZN7TwoWire15endTransmissionEh.constprop.115+0x24>
    19cc:	0e 94 3c 08 	call	0x1078	; 0x1078 <micros>
    19d0:	00 91 6d 02 	lds	r16, 0x026D	; 0x80026d <twi_timeout_us>
    19d4:	10 91 6e 02 	lds	r17, 0x026E	; 0x80026e <twi_timeout_us+0x1>
    19d8:	20 91 6f 02 	lds	r18, 0x026F	; 0x80026f <twi_timeout_us+0x2>
    19dc:	30 91 70 02 	lds	r19, 0x0270	; 0x800270 <twi_timeout_us+0x3>
    19e0:	6c 19       	sub	r22, r12
    19e2:	7d 09       	sbc	r23, r13
    19e4:	8e 09       	sbc	r24, r14
    19e6:	9f 09       	sbc	r25, r15
    19e8:	06 17       	cp	r16, r22
    19ea:	17 07       	cpc	r17, r23
    19ec:	28 07       	cpc	r18, r24
    19ee:	39 07       	cpc	r19, r25
    19f0:	08 f0       	brcs	.+2      	; 0x19f4 <_ZN7TwoWire15endTransmissionEh.constprop.115+0x146>
    19f2:	6f cf       	rjmp	.-290    	; 0x18d2 <_ZN7TwoWire15endTransmissionEh.constprop.115+0x24>
    19f4:	80 91 6c 02 	lds	r24, 0x026C	; 0x80026c <twi_do_reset_on_timeout>
    19f8:	0e 94 36 0c 	call	0x186c	; 0x186c <twi_handleTimeout>
    19fc:	85 e0       	ldi	r24, 0x05	; 5
    19fe:	10 92 72 02 	sts	0x0272, r1	; 0x800272 <_ZN7TwoWire13txBufferIndexE>
    1a02:	10 92 94 02 	sts	0x0294, r1	; 0x800294 <_ZN7TwoWire14txBufferLengthE>
    1a06:	10 92 71 02 	sts	0x0271, r1	; 0x800271 <_ZN7TwoWire12transmittingE>
    1a0a:	cd b7       	in	r28, 0x3d	; 61
    1a0c:	de b7       	in	r29, 0x3e	; 62
    1a0e:	e8 e0       	ldi	r30, 0x08	; 8
    1a10:	0c 94 be 34 	jmp	0x697c	; 0x697c <__epilogue_restores__+0x14>
    1a14:	9d 91       	ld	r25, X+
    1a16:	91 93       	st	Z+, r25
    1a18:	8f 5f       	subi	r24, 0xFF	; 255
    1a1a:	71 cf       	rjmp	.-286    	; 0x18fe <_ZN7TwoWire15endTransmissionEh.constprop.115+0x50>
    1a1c:	85 ee       	ldi	r24, 0xE5	; 229
    1a1e:	ad cf       	rjmp	.-166    	; 0x197a <_ZN7TwoWire15endTransmissionEh.constprop.115+0xcc>
    1a20:	80 91 6d 02 	lds	r24, 0x026D	; 0x80026d <twi_timeout_us>
    1a24:	90 91 6e 02 	lds	r25, 0x026E	; 0x80026e <twi_timeout_us+0x1>
    1a28:	a0 91 6f 02 	lds	r26, 0x026F	; 0x80026f <twi_timeout_us+0x2>
    1a2c:	b0 91 70 02 	lds	r27, 0x0270	; 0x800270 <twi_timeout_us+0x3>
    1a30:	89 2b       	or	r24, r25
    1a32:	8a 2b       	or	r24, r26
    1a34:	8b 2b       	or	r24, r27
    1a36:	09 f4       	brne	.+2      	; 0x1a3a <_ZN7TwoWire15endTransmissionEh.constprop.115+0x18c>
    1a38:	a6 cf       	rjmp	.-180    	; 0x1986 <_ZN7TwoWire15endTransmissionEh.constprop.115+0xd8>
    1a3a:	0e 94 3c 08 	call	0x1078	; 0x1078 <micros>
    1a3e:	00 91 6d 02 	lds	r16, 0x026D	; 0x80026d <twi_timeout_us>
    1a42:	10 91 6e 02 	lds	r17, 0x026E	; 0x80026e <twi_timeout_us+0x1>
    1a46:	20 91 6f 02 	lds	r18, 0x026F	; 0x80026f <twi_timeout_us+0x2>
    1a4a:	30 91 70 02 	lds	r19, 0x0270	; 0x800270 <twi_timeout_us+0x3>
    1a4e:	6c 19       	sub	r22, r12
    1a50:	7d 09       	sbc	r23, r13
    1a52:	8e 09       	sbc	r24, r14
    1a54:	9f 09       	sbc	r25, r15
    1a56:	06 17       	cp	r16, r22
    1a58:	17 07       	cpc	r17, r23
    1a5a:	28 07       	cpc	r18, r24
    1a5c:	39 07       	cpc	r19, r25
    1a5e:	08 f0       	brcs	.+2      	; 0x1a62 <_ZN7TwoWire15endTransmissionEh.constprop.115+0x1b4>
    1a60:	92 cf       	rjmp	.-220    	; 0x1986 <_ZN7TwoWire15endTransmissionEh.constprop.115+0xd8>
    1a62:	c8 cf       	rjmp	.-112    	; 0x19f4 <_ZN7TwoWire15endTransmissionEh.constprop.115+0x146>
    1a64:	80 e0       	ldi	r24, 0x00	; 0
    1a66:	cb cf       	rjmp	.-106    	; 0x19fe <_ZN7TwoWire15endTransmissionEh.constprop.115+0x150>
    1a68:	82 e0       	ldi	r24, 0x02	; 2
    1a6a:	c9 cf       	rjmp	.-110    	; 0x19fe <_ZN7TwoWire15endTransmissionEh.constprop.115+0x150>
    1a6c:	83 e0       	ldi	r24, 0x03	; 3
    1a6e:	c7 cf       	rjmp	.-114    	; 0x19fe <_ZN7TwoWire15endTransmissionEh.constprop.115+0x150>

00001a70 <_ZN7TwoWire4peekEv>:
    1a70:	e0 91 1a 02 	lds	r30, 0x021A	; 0x80021a <_ZN7TwoWire13rxBufferIndexE>
    1a74:	80 91 19 02 	lds	r24, 0x0219	; 0x800219 <_ZN7TwoWire14rxBufferLengthE>
    1a78:	e8 17       	cp	r30, r24
    1a7a:	30 f4       	brcc	.+12     	; 0x1a88 <_ZN7TwoWire4peekEv+0x18>
    1a7c:	f0 e0       	ldi	r31, 0x00	; 0
    1a7e:	e9 56       	subi	r30, 0x69	; 105
    1a80:	fe 4f       	sbci	r31, 0xFE	; 254
    1a82:	80 81       	ld	r24, Z
    1a84:	90 e0       	ldi	r25, 0x00	; 0
    1a86:	08 95       	ret
    1a88:	8f ef       	ldi	r24, 0xFF	; 255
    1a8a:	9f ef       	ldi	r25, 0xFF	; 255
    1a8c:	08 95       	ret

00001a8e <_ZN7TwoWire4readEv>:
    1a8e:	90 91 1a 02 	lds	r25, 0x021A	; 0x80021a <_ZN7TwoWire13rxBufferIndexE>
    1a92:	80 91 19 02 	lds	r24, 0x0219	; 0x800219 <_ZN7TwoWire14rxBufferLengthE>
    1a96:	2f ef       	ldi	r18, 0xFF	; 255
    1a98:	3f ef       	ldi	r19, 0xFF	; 255
    1a9a:	98 17       	cp	r25, r24
    1a9c:	48 f4       	brcc	.+18     	; 0x1ab0 <_ZN7TwoWire4readEv+0x22>
    1a9e:	e9 2f       	mov	r30, r25
    1aa0:	f0 e0       	ldi	r31, 0x00	; 0
    1aa2:	e9 56       	subi	r30, 0x69	; 105
    1aa4:	fe 4f       	sbci	r31, 0xFE	; 254
    1aa6:	20 81       	ld	r18, Z
    1aa8:	30 e0       	ldi	r19, 0x00	; 0
    1aaa:	9f 5f       	subi	r25, 0xFF	; 255
    1aac:	90 93 1a 02 	sts	0x021A, r25	; 0x80021a <_ZN7TwoWire13rxBufferIndexE>
    1ab0:	c9 01       	movw	r24, r18
    1ab2:	08 95       	ret

00001ab4 <_ZN7TwoWire9availableEv>:
    1ab4:	80 91 19 02 	lds	r24, 0x0219	; 0x800219 <_ZN7TwoWire14rxBufferLengthE>
    1ab8:	90 91 1a 02 	lds	r25, 0x021A	; 0x80021a <_ZN7TwoWire13rxBufferIndexE>
    1abc:	89 1b       	sub	r24, r25
    1abe:	99 0b       	sbc	r25, r25
    1ac0:	08 95       	ret

00001ac2 <_ZN7TwoWire5writeEPKhj>:
    1ac2:	b0 e0       	ldi	r27, 0x00	; 0
    1ac4:	a0 e0       	ldi	r26, 0x00	; 0
    1ac6:	e7 e6       	ldi	r30, 0x67	; 103
    1ac8:	fd e0       	ldi	r31, 0x0D	; 13
    1aca:	0c 94 a2 34 	jmp	0x6944	; 0x6944 <__prologue_saves__+0x14>
    1ace:	7c 01       	movw	r14, r24
    1ad0:	cb 01       	movw	r24, r22
    1ad2:	8a 01       	movw	r16, r20
    1ad4:	20 91 71 02 	lds	r18, 0x0271	; 0x800271 <_ZN7TwoWire12transmittingE>
    1ad8:	22 23       	and	r18, r18
    1ada:	89 f0       	breq	.+34     	; 0x1afe <_ZN7TwoWire5writeEPKhj+0x3c>
    1adc:	eb 01       	movw	r28, r22
    1ade:	6b 01       	movw	r12, r22
    1ae0:	c4 0e       	add	r12, r20
    1ae2:	d5 1e       	adc	r13, r21
    1ae4:	cc 15       	cp	r28, r12
    1ae6:	dd 05       	cpc	r29, r13
    1ae8:	69 f0       	breq	.+26     	; 0x1b04 <_ZN7TwoWire5writeEPKhj+0x42>
    1aea:	69 91       	ld	r22, Y+
    1aec:	d7 01       	movw	r26, r14
    1aee:	ed 91       	ld	r30, X+
    1af0:	fc 91       	ld	r31, X
    1af2:	01 90       	ld	r0, Z+
    1af4:	f0 81       	ld	r31, Z
    1af6:	e0 2d       	mov	r30, r0
    1af8:	c7 01       	movw	r24, r14
    1afa:	09 95       	icall
    1afc:	f3 cf       	rjmp	.-26     	; 0x1ae4 <_ZN7TwoWire5writeEPKhj+0x22>
    1afe:	64 2f       	mov	r22, r20
    1b00:	0e 94 f1 0b 	call	0x17e2	; 0x17e2 <twi_transmit>
    1b04:	c8 01       	movw	r24, r16
    1b06:	cd b7       	in	r28, 0x3d	; 61
    1b08:	de b7       	in	r29, 0x3e	; 62
    1b0a:	e8 e0       	ldi	r30, 0x08	; 8
    1b0c:	0c 94 be 34 	jmp	0x697c	; 0x697c <__epilogue_restores__+0x14>

00001b10 <_ZN7TwoWire5writeEh>:
    1b10:	a1 e0       	ldi	r26, 0x01	; 1
    1b12:	b0 e0       	ldi	r27, 0x00	; 0
    1b14:	ee e8       	ldi	r30, 0x8E	; 142
    1b16:	fd e0       	ldi	r31, 0x0D	; 13
    1b18:	0c 94 a8 34 	jmp	0x6950	; 0x6950 <__prologue_saves__+0x20>
    1b1c:	69 83       	std	Y+1, r22	; 0x01
    1b1e:	20 91 71 02 	lds	r18, 0x0271	; 0x800271 <_ZN7TwoWire12transmittingE>
    1b22:	22 23       	and	r18, r18
    1b24:	f9 f0       	breq	.+62     	; 0x1b64 <_ZN7TwoWire5writeEh+0x54>
    1b26:	20 91 94 02 	lds	r18, 0x0294	; 0x800294 <_ZN7TwoWire14txBufferLengthE>
    1b2a:	20 32       	cpi	r18, 0x20	; 32
    1b2c:	58 f0       	brcs	.+22     	; 0x1b44 <_ZN7TwoWire5writeEh+0x34>
    1b2e:	21 e0       	ldi	r18, 0x01	; 1
    1b30:	30 e0       	ldi	r19, 0x00	; 0
    1b32:	fc 01       	movw	r30, r24
    1b34:	33 83       	std	Z+3, r19	; 0x03
    1b36:	22 83       	std	Z+2, r18	; 0x02
    1b38:	90 e0       	ldi	r25, 0x00	; 0
    1b3a:	80 e0       	ldi	r24, 0x00	; 0
    1b3c:	21 96       	adiw	r28, 0x01	; 1
    1b3e:	e2 e0       	ldi	r30, 0x02	; 2
    1b40:	0c 94 c4 34 	jmp	0x6988	; 0x6988 <__epilogue_restores__+0x20>
    1b44:	80 91 72 02 	lds	r24, 0x0272	; 0x800272 <_ZN7TwoWire13txBufferIndexE>
    1b48:	e8 2f       	mov	r30, r24
    1b4a:	f0 e0       	ldi	r31, 0x00	; 0
    1b4c:	ed 58       	subi	r30, 0x8D	; 141
    1b4e:	fd 4f       	sbci	r31, 0xFD	; 253
    1b50:	99 81       	ldd	r25, Y+1	; 0x01
    1b52:	90 83       	st	Z, r25
    1b54:	8f 5f       	subi	r24, 0xFF	; 255
    1b56:	80 93 72 02 	sts	0x0272, r24	; 0x800272 <_ZN7TwoWire13txBufferIndexE>
    1b5a:	80 93 94 02 	sts	0x0294, r24	; 0x800294 <_ZN7TwoWire14txBufferLengthE>
    1b5e:	81 e0       	ldi	r24, 0x01	; 1
    1b60:	90 e0       	ldi	r25, 0x00	; 0
    1b62:	ec cf       	rjmp	.-40     	; 0x1b3c <_ZN7TwoWire5writeEh+0x2c>
    1b64:	61 e0       	ldi	r22, 0x01	; 1
    1b66:	ce 01       	movw	r24, r28
    1b68:	01 96       	adiw	r24, 0x01	; 1
    1b6a:	0e 94 f1 0b 	call	0x17e2	; 0x17e2 <twi_transmit>
    1b6e:	f7 cf       	rjmp	.-18     	; 0x1b5e <_ZN7TwoWire5writeEh+0x4e>

00001b70 <_ZN10SoftSerialILh32ELh32EE5flushEv>:
    1b70:	08 95       	ret

00001b72 <_ZN4impl7CommandILh7ELj18ELh1EE11_getArgsPgmEPKvPh>:
    1b72:	21 e0       	ldi	r18, 0x01	; 1
    1b74:	fb 01       	movw	r30, r22
    1b76:	20 83       	st	Z, r18
    1b78:	85 96       	adiw	r24, 0x25	; 37
    1b7a:	08 95       	ret

00001b7c <_ZN4impl7CommandILh7ELj18ELh1EE18_getDescriptionPgmEPKv>:
    1b7c:	43 96       	adiw	r24, 0x13	; 19
    1b7e:	08 95       	ret

00001b80 <_ZN4impl7CommandILh7ELj18ELh1EE14_getCommandPgmEPKv>:
    1b80:	0c 96       	adiw	r24, 0x0c	; 12
    1b82:	08 95       	ret

00001b84 <_ZN4impl7CommandILh5ELj16ELh1EE11_getArgsPgmEPKvPh>:
    1b84:	21 e0       	ldi	r18, 0x01	; 1
    1b86:	fb 01       	movw	r30, r22
    1b88:	20 83       	st	Z, r18
    1b8a:	81 96       	adiw	r24, 0x21	; 33
    1b8c:	08 95       	ret

00001b8e <_ZN4impl7CommandILh5ELj16ELh1EE18_getDescriptionPgmEPKv>:
    1b8e:	41 96       	adiw	r24, 0x11	; 17
    1b90:	08 95       	ret

00001b92 <_ZN4impl7CommandILh5ELj16ELh1EE14_getCommandPgmEPKv>:
    1b92:	0c 96       	adiw	r24, 0x0c	; 12
    1b94:	08 95       	ret

00001b96 <_ZN4impl7CommandILh6ELj20ELh0EE11_getArgsPgmEPKvPh>:
    1b96:	fb 01       	movw	r30, r22
    1b98:	10 82       	st	Z, r1
    1b9a:	86 96       	adiw	r24, 0x26	; 38
    1b9c:	08 95       	ret

00001b9e <_ZN4impl7CommandILh6ELj20ELh0EE18_getDescriptionPgmEPKv>:
    1b9e:	42 96       	adiw	r24, 0x12	; 18
    1ba0:	08 95       	ret

00001ba2 <_ZN4impl7CommandILh6ELj20ELh0EE14_getCommandPgmEPKv>:
    1ba2:	0c 96       	adiw	r24, 0x0c	; 12
    1ba4:	08 95       	ret

00001ba6 <_ZN4impl7CommandILh6ELj6ELh0EE11_getArgsPgmEPKvPh>:
    1ba6:	fb 01       	movw	r30, r22
    1ba8:	10 82       	st	Z, r1
    1baa:	48 96       	adiw	r24, 0x18	; 24
    1bac:	08 95       	ret

00001bae <_ZN4impl7CommandILh6ELj6ELh0EE18_getDescriptionPgmEPKv>:
    1bae:	42 96       	adiw	r24, 0x12	; 18
    1bb0:	08 95       	ret

00001bb2 <_ZN4impl7CommandILh6ELj6ELh0EE14_getCommandPgmEPKv>:
    1bb2:	0c 96       	adiw	r24, 0x0c	; 12
    1bb4:	08 95       	ret

00001bb6 <_ZN4impl7CommandILh8ELj14ELh0EE11_getArgsPgmEPKvPh>:
    1bb6:	fb 01       	movw	r30, r22
    1bb8:	10 82       	st	Z, r1
    1bba:	82 96       	adiw	r24, 0x22	; 34
    1bbc:	08 95       	ret

00001bbe <_ZN4impl7CommandILh8ELj14ELh0EE18_getDescriptionPgmEPKv>:
    1bbe:	44 96       	adiw	r24, 0x14	; 20
    1bc0:	08 95       	ret

00001bc2 <_ZN4impl7CommandILh8ELj14ELh0EE14_getCommandPgmEPKv>:
    1bc2:	0c 96       	adiw	r24, 0x0c	; 12
    1bc4:	08 95       	ret

00001bc6 <_ZN4impl7CommandILh8ELj38ELh0EE11_getArgsPgmEPKvPh>:
    1bc6:	fb 01       	movw	r30, r22
    1bc8:	10 82       	st	Z, r1
    1bca:	ca 96       	adiw	r24, 0x3a	; 58
    1bcc:	08 95       	ret

00001bce <_ZN4impl7CommandILh8ELj38ELh0EE18_getDescriptionPgmEPKv>:
    1bce:	44 96       	adiw	r24, 0x14	; 20
    1bd0:	08 95       	ret

00001bd2 <_ZN4impl7CommandILh8ELj38ELh0EE14_getCommandPgmEPKv>:
    1bd2:	0c 96       	adiw	r24, 0x0c	; 12
    1bd4:	08 95       	ret

00001bd6 <_ZN4impl7CommandILh6ELj17ELh0EE11_getArgsPgmEPKvPh>:
    1bd6:	fb 01       	movw	r30, r22
    1bd8:	10 82       	st	Z, r1
    1bda:	83 96       	adiw	r24, 0x23	; 35
    1bdc:	08 95       	ret

00001bde <_ZN4impl7CommandILh6ELj17ELh0EE18_getDescriptionPgmEPKv>:
    1bde:	42 96       	adiw	r24, 0x12	; 18
    1be0:	08 95       	ret

00001be2 <_ZN4impl7CommandILh6ELj17ELh0EE14_getCommandPgmEPKv>:
    1be2:	0c 96       	adiw	r24, 0x0c	; 12
    1be4:	08 95       	ret

00001be6 <_ZN4impl7CommandILh11ELj16ELh0EE11_getArgsPgmEPKvPh>:
    1be6:	fb 01       	movw	r30, r22
    1be8:	10 82       	st	Z, r1
    1bea:	87 96       	adiw	r24, 0x27	; 39
    1bec:	08 95       	ret

00001bee <_ZN4impl7CommandILh11ELj16ELh0EE18_getDescriptionPgmEPKv>:
    1bee:	47 96       	adiw	r24, 0x17	; 23
    1bf0:	08 95       	ret

00001bf2 <_ZN4impl7CommandILh11ELj16ELh0EE14_getCommandPgmEPKv>:
    1bf2:	0c 96       	adiw	r24, 0x0c	; 12
    1bf4:	08 95       	ret

00001bf6 <_ZN4impl7CommandILh4ELj18ELh0EE11_getArgsPgmEPKvPh>:
    1bf6:	fb 01       	movw	r30, r22
    1bf8:	10 82       	st	Z, r1
    1bfa:	82 96       	adiw	r24, 0x22	; 34
    1bfc:	08 95       	ret

00001bfe <_ZN4impl7CommandILh4ELj18ELh0EE18_getDescriptionPgmEPKv>:
    1bfe:	40 96       	adiw	r24, 0x10	; 16
    1c00:	08 95       	ret

00001c02 <_ZN4impl7CommandILh4ELj18ELh0EE14_getCommandPgmEPKv>:
    1c02:	0c 96       	adiw	r24, 0x0c	; 12
    1c04:	08 95       	ret

00001c06 <_ZN4impl7CommandILh4ELj19ELh0EE11_getArgsPgmEPKvPh>:
    1c06:	fb 01       	movw	r30, r22
    1c08:	10 82       	st	Z, r1
    1c0a:	83 96       	adiw	r24, 0x23	; 35
    1c0c:	08 95       	ret

00001c0e <_ZN4impl7CommandILh4ELj19ELh0EE18_getDescriptionPgmEPKv>:
    1c0e:	40 96       	adiw	r24, 0x10	; 16
    1c10:	08 95       	ret

00001c12 <_ZN4impl7CommandILh4ELj19ELh0EE14_getCommandPgmEPKv>:
    1c12:	0c 96       	adiw	r24, 0x0c	; 12
    1c14:	08 95       	ret

00001c16 <_ZN4impl7CommandILh5ELj5ELh0EE11_getArgsPgmEPKvPh>:
    1c16:	fb 01       	movw	r30, r22
    1c18:	10 82       	st	Z, r1
    1c1a:	46 96       	adiw	r24, 0x16	; 22
    1c1c:	08 95       	ret

00001c1e <_ZN4impl7CommandILh5ELj5ELh0EE18_getDescriptionPgmEPKv>:
    1c1e:	41 96       	adiw	r24, 0x11	; 17
    1c20:	08 95       	ret

00001c22 <_ZN4impl7CommandILh5ELj5ELh0EE14_getCommandPgmEPKv>:
    1c22:	0c 96       	adiw	r24, 0x0c	; 12
    1c24:	08 95       	ret

00001c26 <_ZN4impl7CommandILh5ELj14ELh0EE11_getArgsPgmEPKvPh>:
    1c26:	fb 01       	movw	r30, r22
    1c28:	10 82       	st	Z, r1
    1c2a:	4f 96       	adiw	r24, 0x1f	; 31
    1c2c:	08 95       	ret

00001c2e <_ZN4impl7CommandILh5ELj14ELh0EE18_getDescriptionPgmEPKv>:
    1c2e:	41 96       	adiw	r24, 0x11	; 17
    1c30:	08 95       	ret

00001c32 <_ZN4impl7CommandILh5ELj14ELh0EE14_getCommandPgmEPKv>:
    1c32:	0c 96       	adiw	r24, 0x0c	; 12
    1c34:	08 95       	ret

00001c36 <_ZN14SerialCommands6isTermMUlcE_4_FUNEc>:
    1c36:	98 2f       	mov	r25, r24
    1c38:	81 e0       	ldi	r24, 0x01	; 1
    1c3a:	9a 30       	cpi	r25, 0x0A	; 10
    1c3c:	21 f0       	breq	.+8      	; 0x1c46 <_ZN14SerialCommands6isTermMUlcE_4_FUNEc+0x10>
    1c3e:	9d 30       	cpi	r25, 0x0D	; 13
    1c40:	11 f0       	breq	.+4      	; 0x1c46 <_ZN14SerialCommands6isTermMUlcE_4_FUNEc+0x10>
    1c42:	80 e0       	ldi	r24, 0x00	; 0
    1c44:	08 95       	ret
    1c46:	08 95       	ret

00001c48 <_ZN14SafeInterrupts6enableEv>:
    1c48:	80 91 96 01 	lds	r24, 0x0196	; 0x800196 <__data_end>
    1c4c:	8f 77       	andi	r24, 0x7F	; 127
    1c4e:	99 f0       	breq	.+38     	; 0x1c76 <_ZN14SafeInterrupts6enableEv+0x2e>
    1c50:	81 50       	subi	r24, 0x01	; 1
    1c52:	90 91 96 01 	lds	r25, 0x0196	; 0x800196 <__data_end>
    1c56:	90 78       	andi	r25, 0x80	; 128
    1c58:	98 2b       	or	r25, r24
    1c5a:	90 93 96 01 	sts	0x0196, r25	; 0x800196 <__data_end>
    1c5e:	81 11       	cpse	r24, r1
    1c60:	0a c0       	rjmp	.+20     	; 0x1c76 <_ZN14SafeInterrupts6enableEv+0x2e>
    1c62:	80 91 96 01 	lds	r24, 0x0196	; 0x800196 <__data_end>
    1c66:	87 ff       	sbrs	r24, 7
    1c68:	06 c0       	rjmp	.+12     	; 0x1c76 <_ZN14SafeInterrupts6enableEv+0x2e>
    1c6a:	78 94       	sei
    1c6c:	80 91 96 01 	lds	r24, 0x0196	; 0x800196 <__data_end>
    1c70:	8f 77       	andi	r24, 0x7F	; 127
    1c72:	80 93 96 01 	sts	0x0196, r24	; 0x800196 <__data_end>
    1c76:	08 95       	ret

00001c78 <_ZN14SafeInterrupts7disableEv>:
    1c78:	80 91 96 01 	lds	r24, 0x0196	; 0x800196 <__data_end>
    1c7c:	8f 77       	andi	r24, 0x7F	; 127
    1c7e:	71 f4       	brne	.+28     	; 0x1c9c <_ZN14SafeInterrupts7disableEv+0x24>
    1c80:	f8 94       	cli
    1c82:	90 91 96 01 	lds	r25, 0x0196	; 0x800196 <__data_end>
    1c86:	90 68       	ori	r25, 0x80	; 128
    1c88:	90 93 96 01 	sts	0x0196, r25	; 0x800196 <__data_end>
    1c8c:	90 91 96 01 	lds	r25, 0x0196	; 0x800196 <__data_end>
    1c90:	90 78       	andi	r25, 0x80	; 128
    1c92:	8f 5f       	subi	r24, 0xFF	; 255
    1c94:	89 2b       	or	r24, r25
    1c96:	80 93 96 01 	sts	0x0196, r24	; 0x800196 <__data_end>
    1c9a:	02 c0       	rjmp	.+4      	; 0x1ca0 <_ZN14SafeInterrupts7disableEv+0x28>
    1c9c:	8f 37       	cpi	r24, 0x7F	; 127
    1c9e:	b1 f7       	brne	.-20     	; 0x1c8c <_ZN14SafeInterrupts7disableEv+0x14>
    1ca0:	08 95       	ret

00001ca2 <_ZN18WatchdogController8resetMCUEv.constprop.124>:
    1ca2:	0e 94 3c 0e 	call	0x1c78	; 0x1c78 <_ZN14SafeInterrupts7disableEv>
    1ca6:	88 e1       	ldi	r24, 0x18	; 24
    1ca8:	98 e0       	ldi	r25, 0x08	; 8
    1caa:	0f b6       	in	r0, 0x3f	; 63
    1cac:	f8 94       	cli
    1cae:	a8 95       	wdr
    1cb0:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    1cb4:	0f be       	out	0x3f, r0	; 63
    1cb6:	90 93 60 00 	sts	0x0060, r25	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    1cba:	ff cf       	rjmp	.-2      	; 0x1cba <_ZN18WatchdogController8resetMCUEv.constprop.124+0x18>

00001cbc <_ZN10SoftSerialILh32ELh32EE4peekEv>:
    1cbc:	cf 93       	push	r28
    1cbe:	df 93       	push	r29
    1cc0:	ec 01       	movw	r28, r24
    1cc2:	0e 94 3c 0e 	call	0x1c78	; 0x1c78 <_ZN14SafeInterrupts7disableEv>
    1cc6:	9e a9       	ldd	r25, Y+54	; 0x36
    1cc8:	8f a9       	ldd	r24, Y+55	; 0x37
    1cca:	98 17       	cp	r25, r24
    1ccc:	59 f0       	breq	.+22     	; 0x1ce4 <_ZN10SoftSerialILh32ELh32EE4peekEv+0x28>
    1cce:	8f a9       	ldd	r24, Y+55	; 0x37
    1cd0:	c8 0f       	add	r28, r24
    1cd2:	d1 1d       	adc	r29, r1
    1cd4:	ce 89       	ldd	r28, Y+22	; 0x16
    1cd6:	d0 e0       	ldi	r29, 0x00	; 0
    1cd8:	0e 94 24 0e 	call	0x1c48	; 0x1c48 <_ZN14SafeInterrupts6enableEv>
    1cdc:	ce 01       	movw	r24, r28
    1cde:	df 91       	pop	r29
    1ce0:	cf 91       	pop	r28
    1ce2:	08 95       	ret
    1ce4:	cf ef       	ldi	r28, 0xFF	; 255
    1ce6:	df ef       	ldi	r29, 0xFF	; 255
    1ce8:	f7 cf       	rjmp	.-18     	; 0x1cd8 <_ZN10SoftSerialILh32ELh32EE4peekEv+0x1c>

00001cea <_ZN10SoftSerialILh32ELh32EE4readEv>:
    1cea:	cf 93       	push	r28
    1cec:	df 93       	push	r29
    1cee:	ec 01       	movw	r28, r24
    1cf0:	0e 94 3c 0e 	call	0x1c78	; 0x1c78 <_ZN14SafeInterrupts7disableEv>
    1cf4:	9e a9       	ldd	r25, Y+54	; 0x36
    1cf6:	8f a9       	ldd	r24, Y+55	; 0x37
    1cf8:	98 17       	cp	r25, r24
    1cfa:	89 f0       	breq	.+34     	; 0x1d1e <_ZN10SoftSerialILh32ELh32EE4readEv+0x34>
    1cfc:	ef a9       	ldd	r30, Y+55	; 0x37
    1cfe:	ec 0f       	add	r30, r28
    1d00:	fd 2f       	mov	r31, r29
    1d02:	f1 1d       	adc	r31, r1
    1d04:	86 89       	ldd	r24, Z+22	; 0x16
    1d06:	9f a9       	ldd	r25, Y+55	; 0x37
    1d08:	9f 5f       	subi	r25, 0xFF	; 255
    1d0a:	9f 71       	andi	r25, 0x1F	; 31
    1d0c:	9f ab       	std	Y+55, r25	; 0x37
    1d0e:	c8 2f       	mov	r28, r24
    1d10:	d0 e0       	ldi	r29, 0x00	; 0
    1d12:	0e 94 24 0e 	call	0x1c48	; 0x1c48 <_ZN14SafeInterrupts6enableEv>
    1d16:	ce 01       	movw	r24, r28
    1d18:	df 91       	pop	r29
    1d1a:	cf 91       	pop	r28
    1d1c:	08 95       	ret
    1d1e:	cf ef       	ldi	r28, 0xFF	; 255
    1d20:	df ef       	ldi	r29, 0xFF	; 255
    1d22:	f7 cf       	rjmp	.-18     	; 0x1d12 <_ZN10SoftSerialILh32ELh32EE4readEv+0x28>

00001d24 <_ZN10SoftSerialILh32ELh32EE9availableEv>:
    1d24:	0f 93       	push	r16
    1d26:	1f 93       	push	r17
    1d28:	cf 93       	push	r28
    1d2a:	8c 01       	movw	r16, r24
    1d2c:	0e 94 3c 0e 	call	0x1c78	; 0x1c78 <_ZN14SafeInterrupts7disableEv>
    1d30:	f8 01       	movw	r30, r16
    1d32:	c6 a9       	ldd	r28, Z+54	; 0x36
    1d34:	17 a9       	ldd	r17, Z+55	; 0x37
    1d36:	0e 94 24 0e 	call	0x1c48	; 0x1c48 <_ZN14SafeInterrupts6enableEv>
    1d3a:	c1 1b       	sub	r28, r17
    1d3c:	cf 71       	andi	r28, 0x1F	; 31
    1d3e:	8c 2f       	mov	r24, r28
    1d40:	90 e0       	ldi	r25, 0x00	; 0
    1d42:	cf 91       	pop	r28
    1d44:	1f 91       	pop	r17
    1d46:	0f 91       	pop	r16
    1d48:	08 95       	ret

00001d4a <_ZN10SoftSerialILh32ELh32EE5writeEh>:
    1d4a:	1f 93       	push	r17
    1d4c:	cf 93       	push	r28
    1d4e:	df 93       	push	r29
    1d50:	ec 01       	movw	r28, r24
    1d52:	16 2f       	mov	r17, r22
    1d54:	0e 94 3c 0e 	call	0x1c78	; 0x1c78 <_ZN14SafeInterrupts7disableEv>
    1d58:	de 01       	movw	r26, r28
    1d5a:	a8 5a       	subi	r26, 0xA8	; 168
    1d5c:	bf 4f       	sbci	r27, 0xFF	; 255
    1d5e:	4c 91       	ld	r20, X
    1d60:	91 e0       	ldi	r25, 0x01	; 1
    1d62:	94 0f       	add	r25, r20
    1d64:	9f 71       	andi	r25, 0x1F	; 31
    1d66:	9e 01       	movw	r18, r28
    1d68:	27 5a       	subi	r18, 0xA7	; 167
    1d6a:	3f 4f       	sbci	r19, 0xFF	; 255
    1d6c:	f9 01       	movw	r30, r18
    1d6e:	80 81       	ld	r24, Z
    1d70:	98 17       	cp	r25, r24
    1d72:	71 f0       	breq	.+28     	; 0x1d90 <_ZN10SoftSerialILh32ELh32EE5writeEh+0x46>
    1d74:	fe 01       	movw	r30, r28
    1d76:	e4 0f       	add	r30, r20
    1d78:	f1 1d       	adc	r31, r1
    1d7a:	10 af       	std	Z+56, r17	; 0x38
    1d7c:	9c 93       	st	X, r25
    1d7e:	c1 e0       	ldi	r28, 0x01	; 1
    1d80:	d0 e0       	ldi	r29, 0x00	; 0
    1d82:	0e 94 24 0e 	call	0x1c48	; 0x1c48 <_ZN14SafeInterrupts6enableEv>
    1d86:	ce 01       	movw	r24, r28
    1d88:	df 91       	pop	r29
    1d8a:	cf 91       	pop	r28
    1d8c:	1f 91       	pop	r17
    1d8e:	08 95       	ret
    1d90:	d0 e0       	ldi	r29, 0x00	; 0
    1d92:	c0 e0       	ldi	r28, 0x00	; 0
    1d94:	f6 cf       	rjmp	.-20     	; 0x1d82 <_ZN10SoftSerialILh32ELh32EE5writeEh+0x38>

00001d96 <_ZN5Print17availableForWriteEv>:
    1d96:	90 e0       	ldi	r25, 0x00	; 0
    1d98:	80 e0       	ldi	r24, 0x00	; 0
    1d9a:	08 95       	ret

00001d9c <_ZL13hexCharToBytecRh>:
    1d9c:	fb 01       	movw	r30, r22
    1d9e:	90 ed       	ldi	r25, 0xD0	; 208
    1da0:	98 0f       	add	r25, r24
    1da2:	9a 30       	cpi	r25, 0x0A	; 10
    1da4:	18 f4       	brcc	.+6      	; 0x1dac <_ZL13hexCharToBytecRh+0x10>
    1da6:	90 83       	st	Z, r25
    1da8:	81 e0       	ldi	r24, 0x01	; 1
    1daa:	08 95       	ret
    1dac:	9f e9       	ldi	r25, 0x9F	; 159
    1dae:	98 0f       	add	r25, r24
    1db0:	96 30       	cpi	r25, 0x06	; 6
    1db2:	18 f4       	brcc	.+6      	; 0x1dba <_ZL13hexCharToBytecRh+0x1e>
    1db4:	87 55       	subi	r24, 0x57	; 87
    1db6:	80 83       	st	Z, r24
    1db8:	f7 cf       	rjmp	.-18     	; 0x1da8 <_ZL13hexCharToBytecRh+0xc>
    1dba:	9f eb       	ldi	r25, 0xBF	; 191
    1dbc:	98 0f       	add	r25, r24
    1dbe:	87 53       	subi	r24, 0x37	; 55
    1dc0:	96 30       	cpi	r25, 0x06	; 6
    1dc2:	c8 f3       	brcs	.-14     	; 0x1db6 <_ZL13hexCharToBytecRh+0x1a>
    1dc4:	80 e0       	ldi	r24, 0x00	; 0
    1dc6:	08 95       	ret

00001dc8 <_ZL12printHexByteR14SerialCommandsh>:
    1dc8:	0f 93       	push	r16
    1dca:	1f 93       	push	r17
    1dcc:	cf 93       	push	r28
    1dce:	8c 01       	movw	r16, r24
    1dd0:	c6 2f       	mov	r28, r22
    1dd2:	dc 01       	movw	r26, r24
    1dd4:	8d 91       	ld	r24, X+
    1dd6:	9c 91       	ld	r25, X
    1dd8:	e6 2f       	mov	r30, r22
    1dda:	f0 e0       	ldi	r31, 0x00	; 0
    1ddc:	24 e0       	ldi	r18, 0x04	; 4
    1dde:	f5 95       	asr	r31
    1de0:	e7 95       	ror	r30
    1de2:	2a 95       	dec	r18
    1de4:	e1 f7       	brne	.-8      	; 0x1dde <_ZL12printHexByteR14SerialCommandsh+0x16>
    1de6:	e6 5f       	subi	r30, 0xF6	; 246
    1de8:	fe 4f       	sbci	r31, 0xFE	; 254
    1dea:	64 91       	lpm	r22, Z
    1dec:	dc 01       	movw	r26, r24
    1dee:	ed 91       	ld	r30, X+
    1df0:	fc 91       	ld	r31, X
    1df2:	01 90       	ld	r0, Z+
    1df4:	f0 81       	ld	r31, Z
    1df6:	e0 2d       	mov	r30, r0
    1df8:	09 95       	icall
    1dfa:	f8 01       	movw	r30, r16
    1dfc:	80 81       	ld	r24, Z
    1dfe:	91 81       	ldd	r25, Z+1	; 0x01
    1e00:	cf 70       	andi	r28, 0x0F	; 15
    1e02:	ec 2f       	mov	r30, r28
    1e04:	f0 e0       	ldi	r31, 0x00	; 0
    1e06:	e6 5f       	subi	r30, 0xF6	; 246
    1e08:	fe 4f       	sbci	r31, 0xFE	; 254
    1e0a:	64 91       	lpm	r22, Z
    1e0c:	dc 01       	movw	r26, r24
    1e0e:	ed 91       	ld	r30, X+
    1e10:	fc 91       	ld	r31, X
    1e12:	01 90       	ld	r0, Z+
    1e14:	f0 81       	ld	r31, Z
    1e16:	e0 2d       	mov	r30, r0
    1e18:	09 95       	icall
    1e1a:	cf 91       	pop	r28
    1e1c:	1f 91       	pop	r17
    1e1e:	0f 91       	pop	r16
    1e20:	08 95       	ret

00001e22 <_ZN12ArduinoQueueIPKN4HC057CommandEE7dequeueEv.constprop.70>:
    1e22:	cf 93       	push	r28
    1e24:	df 93       	push	r29
    1e26:	80 91 63 04 	lds	r24, 0x0463	; 0x800463 <hc05+0xd>
    1e2a:	90 91 64 04 	lds	r25, 0x0464	; 0x800464 <hc05+0xe>
    1e2e:	89 2b       	or	r24, r25
    1e30:	41 f1       	breq	.+80     	; 0x1e82 <_ZN12ArduinoQueueIPKN4HC057CommandEE7dequeueEv.constprop.70+0x60>
    1e32:	80 91 5b 04 	lds	r24, 0x045B	; 0x80045b <hc05+0x5>
    1e36:	90 91 5c 04 	lds	r25, 0x045C	; 0x80045c <hc05+0x6>
    1e3a:	00 97       	sbiw	r24, 0x00	; 0
    1e3c:	11 f1       	breq	.+68     	; 0x1e82 <_ZN12ArduinoQueueIPKN4HC057CommandEE7dequeueEv.constprop.70+0x60>
    1e3e:	fc 01       	movw	r30, r24
    1e40:	22 81       	ldd	r18, Z+2	; 0x02
    1e42:	33 81       	ldd	r19, Z+3	; 0x03
    1e44:	30 93 5c 04 	sts	0x045C, r19	; 0x80045c <hc05+0x6>
    1e48:	20 93 5b 04 	sts	0x045B, r18	; 0x80045b <hc05+0x5>
    1e4c:	c0 81       	ld	r28, Z
    1e4e:	d1 81       	ldd	r29, Z+1	; 0x01
    1e50:	0e 94 b2 30 	call	0x6164	; 0x6164 <free>
    1e54:	80 91 5b 04 	lds	r24, 0x045B	; 0x80045b <hc05+0x5>
    1e58:	90 91 5c 04 	lds	r25, 0x045C	; 0x80045c <hc05+0x6>
    1e5c:	89 2b       	or	r24, r25
    1e5e:	21 f4       	brne	.+8      	; 0x1e68 <_ZN12ArduinoQueueIPKN4HC057CommandEE7dequeueEv.constprop.70+0x46>
    1e60:	10 92 5e 04 	sts	0x045E, r1	; 0x80045e <hc05+0x8>
    1e64:	10 92 5d 04 	sts	0x045D, r1	; 0x80045d <hc05+0x7>
    1e68:	80 91 63 04 	lds	r24, 0x0463	; 0x800463 <hc05+0xd>
    1e6c:	90 91 64 04 	lds	r25, 0x0464	; 0x800464 <hc05+0xe>
    1e70:	01 97       	sbiw	r24, 0x01	; 1
    1e72:	90 93 64 04 	sts	0x0464, r25	; 0x800464 <hc05+0xe>
    1e76:	80 93 63 04 	sts	0x0463, r24	; 0x800463 <hc05+0xd>
    1e7a:	ce 01       	movw	r24, r28
    1e7c:	df 91       	pop	r29
    1e7e:	cf 91       	pop	r28
    1e80:	08 95       	ret
    1e82:	d0 e0       	ldi	r29, 0x00	; 0
    1e84:	c0 e0       	ldi	r28, 0x00	; 0
    1e86:	f9 cf       	rjmp	.-14     	; 0x1e7a <_ZN12ArduinoQueueIPKN4HC057CommandEE7dequeueEv.constprop.70+0x58>

00001e88 <_ZN18KeyboardController13isSeedCheckedEv>:
    1e88:	81 e0       	ldi	r24, 0x01	; 1
    1e8a:	90 e0       	ldi	r25, 0x00	; 0
    1e8c:	0e 94 50 34 	call	0x68a0	; 0x68a0 <eeprom_read_byte>
    1e90:	91 e0       	ldi	r25, 0x01	; 1
    1e92:	81 11       	cpse	r24, r1
    1e94:	01 c0       	rjmp	.+2      	; 0x1e98 <_ZN18KeyboardController13isSeedCheckedEv+0x10>
    1e96:	90 e0       	ldi	r25, 0x00	; 0
    1e98:	89 2f       	mov	r24, r25
    1e9a:	08 95       	ret

00001e9c <_ZNK12StringBufferILh64EE7indexOfEPK19__FlashStringHelper.constprop.30>:
    1e9c:	a1 e0       	ldi	r26, 0x01	; 1
    1e9e:	b0 e0       	ldi	r27, 0x00	; 0
    1ea0:	e4 e5       	ldi	r30, 0x54	; 84
    1ea2:	ff e0       	ldi	r31, 0x0F	; 15
    1ea4:	0c 94 9e 34 	jmp	0x693c	; 0x693c <__prologue_saves__+0xc>
    1ea8:	7c 01       	movw	r14, r24
    1eaa:	60 e4       	ldi	r22, 0x40	; 64
    1eac:	70 e0       	ldi	r23, 0x00	; 0
    1eae:	0e 94 1e 33 	call	0x663c	; 0x663c <strnlen_P>
    1eb2:	8c 01       	movw	r16, r24
    1eb4:	89 2b       	or	r24, r25
    1eb6:	31 f4       	brne	.+12     	; 0x1ec4 <_ZNK12StringBufferILh64EE7indexOfEPK19__FlashStringHelper.constprop.30+0x28>
    1eb8:	8f ef       	ldi	r24, 0xFF	; 255
    1eba:	9f ef       	ldi	r25, 0xFF	; 255
    1ebc:	21 96       	adiw	r28, 0x01	; 1
    1ebe:	ec e0       	ldi	r30, 0x0C	; 12
    1ec0:	0c 94 ba 34 	jmp	0x6974	; 0x6974 <__epilogue_restores__+0xc>
    1ec4:	80 91 a5 04 	lds	r24, 0x04A5	; 0x8004a5 <hc05+0x4f>
    1ec8:	90 91 a6 04 	lds	r25, 0x04A6	; 0x8004a6 <hc05+0x50>
    1ecc:	89 1b       	sub	r24, r25
    1ece:	8f 73       	andi	r24, 0x3F	; 63
    1ed0:	80 17       	cp	r24, r16
    1ed2:	11 06       	cpc	r1, r17
    1ed4:	88 f3       	brcs	.-30     	; 0x1eb8 <_ZNK12StringBufferILh64EE7indexOfEPK19__FlashStringHelper.constprop.30+0x1c>
    1ed6:	91 2c       	mov	r9, r1
    1ed8:	80 91 a5 04 	lds	r24, 0x04A5	; 0x8004a5 <hc05+0x4f>
    1edc:	90 91 a6 04 	lds	r25, 0x04A6	; 0x8004a6 <hc05+0x50>
    1ee0:	c9 2c       	mov	r12, r9
    1ee2:	d1 2c       	mov	r13, r1
    1ee4:	89 1b       	sub	r24, r25
    1ee6:	8f 73       	andi	r24, 0x3F	; 63
    1ee8:	90 e0       	ldi	r25, 0x00	; 0
    1eea:	80 1b       	sub	r24, r16
    1eec:	91 0b       	sbc	r25, r17
    1eee:	8c 15       	cp	r24, r12
    1ef0:	9d 05       	cpc	r25, r13
    1ef2:	10 f3       	brcs	.-60     	; 0x1eb8 <_ZNK12StringBufferILh64EE7indexOfEPK19__FlashStringHelper.constprop.30+0x1c>
    1ef4:	81 2c       	mov	r8, r1
    1ef6:	a8 2c       	mov	r10, r8
    1ef8:	b1 2c       	mov	r11, r1
    1efa:	a0 16       	cp	r10, r16
    1efc:	b1 06       	cpc	r11, r17
    1efe:	90 f4       	brcc	.+36     	; 0x1f24 <_ZNK12StringBufferILh64EE7indexOfEPK19__FlashStringHelper.constprop.30+0x88>
    1f00:	be 01       	movw	r22, r28
    1f02:	6f 5f       	subi	r22, 0xFF	; 255
    1f04:	7f 4f       	sbci	r23, 0xFF	; 255
    1f06:	89 2d       	mov	r24, r9
    1f08:	88 0d       	add	r24, r8
    1f0a:	0e 94 a0 06 	call	0xd40	; 0xd40 <_ZNK17FastCircularQueueIcLh64EE6peekAtEhRc.constprop.33>
    1f0e:	f7 01       	movw	r30, r14
    1f10:	ea 0d       	add	r30, r10
    1f12:	fb 1d       	adc	r31, r11
    1f14:	e4 91       	lpm	r30, Z
    1f16:	89 81       	ldd	r24, Y+1	; 0x01
    1f18:	e8 17       	cp	r30, r24
    1f1a:	11 f0       	breq	.+4      	; 0x1f20 <_ZNK12StringBufferILh64EE7indexOfEPK19__FlashStringHelper.constprop.30+0x84>
    1f1c:	93 94       	inc	r9
    1f1e:	dc cf       	rjmp	.-72     	; 0x1ed8 <_ZNK12StringBufferILh64EE7indexOfEPK19__FlashStringHelper.constprop.30+0x3c>
    1f20:	83 94       	inc	r8
    1f22:	e9 cf       	rjmp	.-46     	; 0x1ef6 <_ZNK12StringBufferILh64EE7indexOfEPK19__FlashStringHelper.constprop.30+0x5a>
    1f24:	c6 01       	movw	r24, r12
    1f26:	ca cf       	rjmp	.-108    	; 0x1ebc <_ZNK12StringBufferILh64EE7indexOfEPK19__FlashStringHelper.constprop.30+0x20>

00001f28 <_ZNK12StringBufferILh64EE8endsWithEPK19__FlashStringHelper.constprop.29>:
    1f28:	a1 e0       	ldi	r26, 0x01	; 1
    1f2a:	b0 e0       	ldi	r27, 0x00	; 0
    1f2c:	ea e9       	ldi	r30, 0x9A	; 154
    1f2e:	ff e0       	ldi	r31, 0x0F	; 15
    1f30:	0c 94 a0 34 	jmp	0x6940	; 0x6940 <__prologue_saves__+0x10>
    1f34:	6c 01       	movw	r12, r24
    1f36:	60 e4       	ldi	r22, 0x40	; 64
    1f38:	70 e0       	ldi	r23, 0x00	; 0
    1f3a:	0e 94 1e 33 	call	0x663c	; 0x663c <strnlen_P>
    1f3e:	5c 01       	movw	r10, r24
    1f40:	89 2b       	or	r24, r25
    1f42:	21 f1       	breq	.+72     	; 0x1f8c <_ZNK12StringBufferILh64EE8endsWithEPK19__FlashStringHelper.constprop.29+0x64>
    1f44:	80 91 a5 04 	lds	r24, 0x04A5	; 0x8004a5 <hc05+0x4f>
    1f48:	90 91 a6 04 	lds	r25, 0x04A6	; 0x8004a6 <hc05+0x50>
    1f4c:	89 1b       	sub	r24, r25
    1f4e:	8f 73       	andi	r24, 0x3F	; 63
    1f50:	8a 15       	cp	r24, r10
    1f52:	1b 04       	cpc	r1, r11
    1f54:	d8 f0       	brcs	.+54     	; 0x1f8c <_ZNK12StringBufferILh64EE8endsWithEPK19__FlashStringHelper.constprop.29+0x64>
    1f56:	10 91 a5 04 	lds	r17, 0x04A5	; 0x8004a5 <hc05+0x4f>
    1f5a:	80 91 a6 04 	lds	r24, 0x04A6	; 0x8004a6 <hc05+0x50>
    1f5e:	18 1b       	sub	r17, r24
    1f60:	1f 73       	andi	r17, 0x3F	; 63
    1f62:	1a 19       	sub	r17, r10
    1f64:	00 e0       	ldi	r16, 0x00	; 0
    1f66:	e0 2e       	mov	r14, r16
    1f68:	f1 2c       	mov	r15, r1
    1f6a:	ea 14       	cp	r14, r10
    1f6c:	fb 04       	cpc	r15, r11
    1f6e:	a8 f4       	brcc	.+42     	; 0x1f9a <_ZNK12StringBufferILh64EE8endsWithEPK19__FlashStringHelper.constprop.29+0x72>
    1f70:	be 01       	movw	r22, r28
    1f72:	6f 5f       	subi	r22, 0xFF	; 255
    1f74:	7f 4f       	sbci	r23, 0xFF	; 255
    1f76:	81 2f       	mov	r24, r17
    1f78:	80 0f       	add	r24, r16
    1f7a:	0e 94 a0 06 	call	0xd40	; 0xd40 <_ZNK17FastCircularQueueIcLh64EE6peekAtEhRc.constprop.33>
    1f7e:	f6 01       	movw	r30, r12
    1f80:	ee 0d       	add	r30, r14
    1f82:	ff 1d       	adc	r31, r15
    1f84:	e4 91       	lpm	r30, Z
    1f86:	89 81       	ldd	r24, Y+1	; 0x01
    1f88:	e8 17       	cp	r30, r24
    1f8a:	29 f0       	breq	.+10     	; 0x1f96 <_ZNK12StringBufferILh64EE8endsWithEPK19__FlashStringHelper.constprop.29+0x6e>
    1f8c:	80 e0       	ldi	r24, 0x00	; 0
    1f8e:	21 96       	adiw	r28, 0x01	; 1
    1f90:	ea e0       	ldi	r30, 0x0A	; 10
    1f92:	0c 94 bc 34 	jmp	0x6978	; 0x6978 <__epilogue_restores__+0x10>
    1f96:	0f 5f       	subi	r16, 0xFF	; 255
    1f98:	e6 cf       	rjmp	.-52     	; 0x1f66 <_ZNK12StringBufferILh64EE8endsWithEPK19__FlashStringHelper.constprop.29+0x3e>
    1f9a:	81 e0       	ldi	r24, 0x01	; 1
    1f9c:	f8 cf       	rjmp	.-16     	; 0x1f8e <_ZNK12StringBufferILh64EE8endsWithEPK19__FlashStringHelper.constprop.29+0x66>

00001f9e <_ZN5Print5writeEPKc.part.2>:
    1f9e:	fb 01       	movw	r30, r22
    1fa0:	01 90       	ld	r0, Z+
    1fa2:	00 20       	and	r0, r0
    1fa4:	e9 f7       	brne	.-6      	; 0x1fa0 <_ZN5Print5writeEPKc.part.2+0x2>
    1fa6:	31 97       	sbiw	r30, 0x01	; 1
    1fa8:	af 01       	movw	r20, r30
    1faa:	46 1b       	sub	r20, r22
    1fac:	57 0b       	sbc	r21, r23
    1fae:	dc 01       	movw	r26, r24
    1fb0:	ed 91       	ld	r30, X+
    1fb2:	fc 91       	ld	r31, X
    1fb4:	02 80       	ldd	r0, Z+2	; 0x02
    1fb6:	f3 81       	ldd	r31, Z+3	; 0x03
    1fb8:	e0 2d       	mov	r30, r0
    1fba:	09 95       	icall
    1fbc:	08 95       	ret

00001fbe <_ZN5Print11printNumberEmh>:
    1fbe:	8f 92       	push	r8
    1fc0:	9f 92       	push	r9
    1fc2:	af 92       	push	r10
    1fc4:	bf 92       	push	r11
    1fc6:	ef 92       	push	r14
    1fc8:	ff 92       	push	r15
    1fca:	0f 93       	push	r16
    1fcc:	1f 93       	push	r17
    1fce:	cf 93       	push	r28
    1fd0:	df 93       	push	r29
    1fd2:	cd b7       	in	r28, 0x3d	; 61
    1fd4:	de b7       	in	r29, 0x3e	; 62
    1fd6:	a1 97       	sbiw	r28, 0x21	; 33
    1fd8:	0f b6       	in	r0, 0x3f	; 63
    1fda:	f8 94       	cli
    1fdc:	de bf       	out	0x3e, r29	; 62
    1fde:	0f be       	out	0x3f, r0	; 63
    1fe0:	cd bf       	out	0x3d, r28	; 61
    1fe2:	7c 01       	movw	r14, r24
    1fe4:	fa 01       	movw	r30, r20
    1fe6:	cb 01       	movw	r24, r22
    1fe8:	19 a2       	std	Y+33, r1	; 0x21
    1fea:	22 30       	cpi	r18, 0x02	; 2
    1fec:	08 f4       	brcc	.+2      	; 0x1ff0 <_ZN5Print11printNumberEmh+0x32>
    1fee:	2a e0       	ldi	r18, 0x0A	; 10
    1ff0:	8e 01       	movw	r16, r28
    1ff2:	0f 5d       	subi	r16, 0xDF	; 223
    1ff4:	1f 4f       	sbci	r17, 0xFF	; 255
    1ff6:	82 2e       	mov	r8, r18
    1ff8:	91 2c       	mov	r9, r1
    1ffa:	b1 2c       	mov	r11, r1
    1ffc:	a1 2c       	mov	r10, r1
    1ffe:	bf 01       	movw	r22, r30
    2000:	a5 01       	movw	r20, r10
    2002:	94 01       	movw	r18, r8
    2004:	0e 94 cf 34 	call	0x699e	; 0x699e <__udivmodsi4>
    2008:	f9 01       	movw	r30, r18
    200a:	ca 01       	movw	r24, r20
    200c:	6a 30       	cpi	r22, 0x0A	; 10
    200e:	0c f5       	brge	.+66     	; 0x2052 <_ZN5Print11printNumberEmh+0x94>
    2010:	60 5d       	subi	r22, 0xD0	; 208
    2012:	d8 01       	movw	r26, r16
    2014:	6e 93       	st	-X, r22
    2016:	8d 01       	movw	r16, r26
    2018:	23 2b       	or	r18, r19
    201a:	24 2b       	or	r18, r20
    201c:	25 2b       	or	r18, r21
    201e:	79 f7       	brne	.-34     	; 0x1ffe <_ZN5Print11printNumberEmh+0x40>
    2020:	90 e0       	ldi	r25, 0x00	; 0
    2022:	80 e0       	ldi	r24, 0x00	; 0
    2024:	10 97       	sbiw	r26, 0x00	; 0
    2026:	21 f0       	breq	.+8      	; 0x2030 <_ZN5Print11printNumberEmh+0x72>
    2028:	bd 01       	movw	r22, r26
    202a:	c7 01       	movw	r24, r14
    202c:	0e 94 cf 0f 	call	0x1f9e	; 0x1f9e <_ZN5Print5writeEPKc.part.2>
    2030:	a1 96       	adiw	r28, 0x21	; 33
    2032:	0f b6       	in	r0, 0x3f	; 63
    2034:	f8 94       	cli
    2036:	de bf       	out	0x3e, r29	; 62
    2038:	0f be       	out	0x3f, r0	; 63
    203a:	cd bf       	out	0x3d, r28	; 61
    203c:	df 91       	pop	r29
    203e:	cf 91       	pop	r28
    2040:	1f 91       	pop	r17
    2042:	0f 91       	pop	r16
    2044:	ff 90       	pop	r15
    2046:	ef 90       	pop	r14
    2048:	bf 90       	pop	r11
    204a:	af 90       	pop	r10
    204c:	9f 90       	pop	r9
    204e:	8f 90       	pop	r8
    2050:	08 95       	ret
    2052:	69 5c       	subi	r22, 0xC9	; 201
    2054:	de cf       	rjmp	.-68     	; 0x2012 <_ZN5Print11printNumberEmh+0x54>

00002056 <_ZN5Print5printEli.constprop.131>:
    2056:	b0 e0       	ldi	r27, 0x00	; 0
    2058:	a0 e0       	ldi	r26, 0x00	; 0
    205a:	e1 e3       	ldi	r30, 0x31	; 49
    205c:	f0 e1       	ldi	r31, 0x10	; 16
    205e:	0c 94 a2 34 	jmp	0x6944	; 0x6944 <__prologue_saves__+0x14>
    2062:	8c 01       	movw	r16, r24
    2064:	6a 01       	movw	r12, r20
    2066:	7b 01       	movw	r14, r22
    2068:	f7 fe       	sbrs	r15, 7
    206a:	16 c0       	rjmp	.+44     	; 0x2098 <_ZN5Print5printEli.constprop.131+0x42>
    206c:	6d e2       	ldi	r22, 0x2D	; 45
    206e:	0e 94 5d 09 	call	0x12ba	; 0x12ba <_ZN5Print5printEc>
    2072:	ec 01       	movw	r28, r24
    2074:	44 27       	eor	r20, r20
    2076:	55 27       	eor	r21, r21
    2078:	ba 01       	movw	r22, r20
    207a:	4c 19       	sub	r20, r12
    207c:	5d 09       	sbc	r21, r13
    207e:	6e 09       	sbc	r22, r14
    2080:	7f 09       	sbc	r23, r15
    2082:	2a e0       	ldi	r18, 0x0A	; 10
    2084:	c8 01       	movw	r24, r16
    2086:	0e 94 df 0f 	call	0x1fbe	; 0x1fbe <_ZN5Print11printNumberEmh>
    208a:	8c 0f       	add	r24, r28
    208c:	9d 1f       	adc	r25, r29
    208e:	cd b7       	in	r28, 0x3d	; 61
    2090:	de b7       	in	r29, 0x3e	; 62
    2092:	e8 e0       	ldi	r30, 0x08	; 8
    2094:	0c 94 be 34 	jmp	0x697c	; 0x697c <__epilogue_restores__+0x14>
    2098:	2a e0       	ldi	r18, 0x0A	; 10
    209a:	0e 94 df 0f 	call	0x1fbe	; 0x1fbe <_ZN5Print11printNumberEmh>
    209e:	f7 cf       	rjmp	.-18     	; 0x208e <_ZN5Print5printEli.constprop.131+0x38>

000020a0 <_ZN5Print5printEii.constprop.130>:
    20a0:	ab 01       	movw	r20, r22
    20a2:	77 0f       	add	r23, r23
    20a4:	66 0b       	sbc	r22, r22
    20a6:	77 0b       	sbc	r23, r23
    20a8:	0e 94 2b 10 	call	0x2056	; 0x2056 <_ZN5Print5printEli.constprop.131>
    20ac:	08 95       	ret

000020ae <_ZN5Print7printlnEv>:
    20ae:	62 e9       	ldi	r22, 0x92	; 146
    20b0:	71 e0       	ldi	r23, 0x01	; 1
    20b2:	0e 94 cf 0f 	call	0x1f9e	; 0x1f9e <_ZN5Print5writeEPKc.part.2>
    20b6:	08 95       	ret

000020b8 <_ZN5Print7printlnEhi.constprop.133>:
    20b8:	0f 93       	push	r16
    20ba:	1f 93       	push	r17
    20bc:	cf 93       	push	r28
    20be:	df 93       	push	r29
    20c0:	ec 01       	movw	r28, r24
    20c2:	46 2f       	mov	r20, r22
    20c4:	50 e0       	ldi	r21, 0x00	; 0
    20c6:	70 e0       	ldi	r23, 0x00	; 0
    20c8:	60 e0       	ldi	r22, 0x00	; 0
    20ca:	22 e0       	ldi	r18, 0x02	; 2
    20cc:	0e 94 df 0f 	call	0x1fbe	; 0x1fbe <_ZN5Print11printNumberEmh>
    20d0:	8c 01       	movw	r16, r24
    20d2:	ce 01       	movw	r24, r28
    20d4:	0e 94 57 10 	call	0x20ae	; 0x20ae <_ZN5Print7printlnEv>
    20d8:	80 0f       	add	r24, r16
    20da:	91 1f       	adc	r25, r17
    20dc:	df 91       	pop	r29
    20de:	cf 91       	pop	r28
    20e0:	1f 91       	pop	r17
    20e2:	0f 91       	pop	r16
    20e4:	08 95       	ret

000020e6 <_ZN5Print7printlnEii.constprop.129>:
    20e6:	0f 93       	push	r16
    20e8:	1f 93       	push	r17
    20ea:	cf 93       	push	r28
    20ec:	df 93       	push	r29
    20ee:	ec 01       	movw	r28, r24
    20f0:	0e 94 50 10 	call	0x20a0	; 0x20a0 <_ZN5Print5printEii.constprop.130>
    20f4:	8c 01       	movw	r16, r24
    20f6:	ce 01       	movw	r24, r28
    20f8:	0e 94 57 10 	call	0x20ae	; 0x20ae <_ZN5Print7printlnEv>
    20fc:	80 0f       	add	r24, r16
    20fe:	91 1f       	adc	r25, r17
    2100:	df 91       	pop	r29
    2102:	cf 91       	pop	r28
    2104:	1f 91       	pop	r17
    2106:	0f 91       	pop	r16
    2108:	08 95       	ret

0000210a <_ZN5Print7printlnEPK19__FlashStringHelper>:
    210a:	0f 93       	push	r16
    210c:	1f 93       	push	r17
    210e:	cf 93       	push	r28
    2110:	df 93       	push	r29
    2112:	ec 01       	movw	r28, r24
    2114:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2118:	8c 01       	movw	r16, r24
    211a:	ce 01       	movw	r24, r28
    211c:	0e 94 57 10 	call	0x20ae	; 0x20ae <_ZN5Print7printlnEv>
    2120:	80 0f       	add	r24, r16
    2122:	91 1f       	adc	r25, r17
    2124:	df 91       	pop	r29
    2126:	cf 91       	pop	r28
    2128:	1f 91       	pop	r17
    212a:	0f 91       	pop	r16
    212c:	08 95       	ret

0000212e <_ZN18KeyboardController4lockEv.constprop.138>:
    212e:	80 91 84 05 	lds	r24, 0x0584	; 0x800584 <keyboardController+0x14>
    2132:	88 23       	and	r24, r24
    2134:	99 f0       	breq	.+38     	; 0x215c <_ZN18KeyboardController4lockEv.constprop.138+0x2e>
    2136:	10 92 84 05 	sts	0x0584, r1	; 0x800584 <keyboardController+0x14>
    213a:	80 91 71 05 	lds	r24, 0x0571	; 0x800571 <keyboardController+0x1>
    213e:	89 7f       	andi	r24, 0xF9	; 249
    2140:	8e 7f       	andi	r24, 0xFE	; 254
    2142:	80 93 71 05 	sts	0x0571, r24	; 0x800571 <keyboardController+0x1>
    2146:	60 e0       	ldi	r22, 0x00	; 0
    2148:	80 91 70 05 	lds	r24, 0x0570	; 0x800570 <keyboardController>
    214c:	0e 94 d2 07 	call	0xfa4	; 0xfa4 <digitalWrite>
    2150:	66 ec       	ldi	r22, 0xC6	; 198
    2152:	79 e0       	ldi	r23, 0x09	; 9
    2154:	87 e0       	ldi	r24, 0x07	; 7
    2156:	93 e0       	ldi	r25, 0x03	; 3
    2158:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    215c:	08 95       	ret

0000215e <_ZN18KeyboardController6unlockEv.constprop.135>:
    215e:	80 91 84 05 	lds	r24, 0x0584	; 0x800584 <keyboardController+0x14>
    2162:	81 30       	cpi	r24, 0x01	; 1
    2164:	a1 f0       	breq	.+40     	; 0x218e <_ZN18KeyboardController6unlockEv.constprop.135+0x30>
    2166:	81 e0       	ldi	r24, 0x01	; 1
    2168:	80 93 84 05 	sts	0x0584, r24	; 0x800584 <keyboardController+0x14>
    216c:	80 91 71 05 	lds	r24, 0x0571	; 0x800571 <keyboardController+0x1>
    2170:	89 7f       	andi	r24, 0xF9	; 249
    2172:	81 60       	ori	r24, 0x01	; 1
    2174:	80 93 71 05 	sts	0x0571, r24	; 0x800571 <keyboardController+0x1>
    2178:	61 e0       	ldi	r22, 0x01	; 1
    217a:	80 91 70 05 	lds	r24, 0x0570	; 0x800570 <keyboardController>
    217e:	0e 94 d2 07 	call	0xfa4	; 0xfa4 <digitalWrite>
    2182:	63 eb       	ldi	r22, 0xB3	; 179
    2184:	79 e0       	ldi	r23, 0x09	; 9
    2186:	87 e0       	ldi	r24, 0x07	; 7
    2188:	93 e0       	ldi	r25, 0x03	; 3
    218a:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    218e:	08 95       	ret

00002190 <_ZN4HC0511sendCommandERKNS_7CommandE.constprop.77>:
    2190:	ef 92       	push	r14
    2192:	ff 92       	push	r15
    2194:	0f 93       	push	r16
    2196:	1f 93       	push	r17
    2198:	cf 93       	push	r28
    219a:	df 93       	push	r29
    219c:	7c 01       	movw	r14, r24
    219e:	c0 91 63 04 	lds	r28, 0x0463	; 0x800463 <hc05+0xd>
    21a2:	d0 91 64 04 	lds	r29, 0x0464	; 0x800464 <hc05+0xe>
    21a6:	80 91 5f 04 	lds	r24, 0x045F	; 0x80045f <hc05+0x9>
    21aa:	90 91 60 04 	lds	r25, 0x0460	; 0x800460 <hc05+0xa>
    21ae:	c8 17       	cp	r28, r24
    21b0:	d9 07       	cpc	r29, r25
    21b2:	59 f4       	brne	.+22     	; 0x21ca <_ZN4HC0511sendCommandERKNS_7CommandE.constprop.77+0x3a>
    21b4:	65 e0       	ldi	r22, 0x05	; 5
    21b6:	78 e0       	ldi	r23, 0x08	; 8
    21b8:	87 e0       	ldi	r24, 0x07	; 7
    21ba:	93 e0       	ldi	r25, 0x03	; 3
    21bc:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    21c0:	cd b7       	in	r28, 0x3d	; 61
    21c2:	de b7       	in	r29, 0x3e	; 62
    21c4:	e6 e0       	ldi	r30, 0x06	; 6
    21c6:	0c 94 c0 34 	jmp	0x6980	; 0x6980 <__epilogue_restores__+0x18>
    21ca:	86 e0       	ldi	r24, 0x06	; 6
    21cc:	90 e0       	ldi	r25, 0x00	; 0
    21ce:	0e 94 16 30 	call	0x602c	; 0x602c <malloc>
    21d2:	8c 01       	movw	r16, r24
    21d4:	86 e0       	ldi	r24, 0x06	; 6
    21d6:	f7 01       	movw	r30, r14
    21d8:	d8 01       	movw	r26, r16
    21da:	01 90       	ld	r0, Z+
    21dc:	0d 92       	st	X+, r0
    21de:	8a 95       	dec	r24
    21e0:	e1 f7       	brne	.-8      	; 0x21da <_ZN4HC0511sendCommandERKNS_7CommandE.constprop.77+0x4a>
    21e2:	84 e0       	ldi	r24, 0x04	; 4
    21e4:	90 e0       	ldi	r25, 0x00	; 0
    21e6:	0e 94 16 30 	call	0x602c	; 0x602c <malloc>
    21ea:	00 97       	sbiw	r24, 0x00	; 0
    21ec:	49 f3       	breq	.-46     	; 0x21c0 <_ZN4HC0511sendCommandERKNS_7CommandE.constprop.77+0x30>
    21ee:	fc 01       	movw	r30, r24
    21f0:	11 83       	std	Z+1, r17	; 0x01
    21f2:	00 83       	st	Z, r16
    21f4:	13 82       	std	Z+3, r1	; 0x03
    21f6:	12 82       	std	Z+2, r1	; 0x02
    21f8:	21 96       	adiw	r28, 0x01	; 1
    21fa:	20 91 5b 04 	lds	r18, 0x045B	; 0x80045b <hc05+0x5>
    21fe:	30 91 5c 04 	lds	r19, 0x045C	; 0x80045c <hc05+0x6>
    2202:	23 2b       	or	r18, r19
    2204:	69 f4       	brne	.+26     	; 0x2220 <_ZN4HC0511sendCommandERKNS_7CommandE.constprop.77+0x90>
    2206:	90 93 5c 04 	sts	0x045C, r25	; 0x80045c <hc05+0x6>
    220a:	80 93 5b 04 	sts	0x045B, r24	; 0x80045b <hc05+0x5>
    220e:	90 93 5e 04 	sts	0x045E, r25	; 0x80045e <hc05+0x8>
    2212:	80 93 5d 04 	sts	0x045D, r24	; 0x80045d <hc05+0x7>
    2216:	d0 93 64 04 	sts	0x0464, r29	; 0x800464 <hc05+0xe>
    221a:	c0 93 63 04 	sts	0x0463, r28	; 0x800463 <hc05+0xd>
    221e:	d0 cf       	rjmp	.-96     	; 0x21c0 <_ZN4HC0511sendCommandERKNS_7CommandE.constprop.77+0x30>
    2220:	e0 91 5d 04 	lds	r30, 0x045D	; 0x80045d <hc05+0x7>
    2224:	f0 91 5e 04 	lds	r31, 0x045E	; 0x80045e <hc05+0x8>
    2228:	93 83       	std	Z+3, r25	; 0x03
    222a:	82 83       	std	Z+2, r24	; 0x02
    222c:	f0 cf       	rjmp	.-32     	; 0x220e <_ZN4HC0511sendCommandERKNS_7CommandE.constprop.77+0x7e>

0000222e <_ZN11MemoryUsage10printStarsER5Print>:
    222e:	68 e0       	ldi	r22, 0x08	; 8
    2230:	74 e0       	ldi	r23, 0x04	; 4
    2232:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    2236:	08 95       	ret

00002238 <_ZNK19StatisticController19printInterruptTableER5Print.constprop.132>:
    2238:	cf 93       	push	r28
    223a:	df 93       	push	r29
    223c:	ec 01       	movw	r28, r24
    223e:	0e 94 17 11 	call	0x222e	; 0x222e <_ZN11MemoryUsage10printStarsER5Print>
    2242:	60 ea       	ldi	r22, 0xA0	; 160
    2244:	79 e0       	ldi	r23, 0x09	; 9
    2246:	ce 01       	movw	r24, r28
    2248:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    224c:	62 e8       	ldi	r22, 0x82	; 130
    224e:	79 e0       	ldi	r23, 0x09	; 9
    2250:	ce 01       	movw	r24, r28
    2252:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2256:	6d b3       	in	r22, 0x1d	; 29
    2258:	ce 01       	movw	r24, r28
    225a:	0e 94 5c 10 	call	0x20b8	; 0x20b8 <_ZN5Print7printlnEhi.constprop.133>
    225e:	62 e6       	ldi	r22, 0x62	; 98
    2260:	79 e0       	ldi	r23, 0x09	; 9
    2262:	ce 01       	movw	r24, r28
    2264:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2268:	60 91 68 00 	lds	r22, 0x0068	; 0x800068 <__TEXT_REGION_LENGTH__+0x7e0068>
    226c:	ce 01       	movw	r24, r28
    226e:	0e 94 5c 10 	call	0x20b8	; 0x20b8 <_ZN5Print7printlnEhi.constprop.133>
    2272:	69 e5       	ldi	r22, 0x59	; 89
    2274:	79 e0       	ldi	r23, 0x09	; 9
    2276:	ce 01       	movw	r24, r28
    2278:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    227c:	60 91 6b 00 	lds	r22, 0x006B	; 0x80006b <__TEXT_REGION_LENGTH__+0x7e006b>
    2280:	ce 01       	movw	r24, r28
    2282:	0e 94 5c 10 	call	0x20b8	; 0x20b8 <_ZN5Print7printlnEhi.constprop.133>
    2286:	67 e4       	ldi	r22, 0x47	; 71
    2288:	79 e0       	ldi	r23, 0x09	; 9
    228a:	ce 01       	movw	r24, r28
    228c:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2290:	60 91 6e 00 	lds	r22, 0x006E	; 0x80006e <__TEXT_REGION_LENGTH__+0x7e006e>
    2294:	ce 01       	movw	r24, r28
    2296:	0e 94 5c 10 	call	0x20b8	; 0x20b8 <_ZN5Print7printlnEhi.constprop.133>
    229a:	65 e3       	ldi	r22, 0x35	; 53
    229c:	79 e0       	ldi	r23, 0x09	; 9
    229e:	ce 01       	movw	r24, r28
    22a0:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    22a4:	60 91 6f 00 	lds	r22, 0x006F	; 0x80006f <__TEXT_REGION_LENGTH__+0x7e006f>
    22a8:	ce 01       	movw	r24, r28
    22aa:	0e 94 5c 10 	call	0x20b8	; 0x20b8 <_ZN5Print7printlnEhi.constprop.133>
    22ae:	63 e2       	ldi	r22, 0x23	; 35
    22b0:	79 e0       	ldi	r23, 0x09	; 9
    22b2:	ce 01       	movw	r24, r28
    22b4:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    22b8:	60 91 71 00 	lds	r22, 0x0071	; 0x800071 <__TEXT_REGION_LENGTH__+0x7e0071>
    22bc:	ce 01       	movw	r24, r28
    22be:	0e 94 5c 10 	call	0x20b8	; 0x20b8 <_ZN5Print7printlnEhi.constprop.133>
    22c2:	61 e1       	ldi	r22, 0x11	; 17
    22c4:	79 e0       	ldi	r23, 0x09	; 9
    22c6:	ce 01       	movw	r24, r28
    22c8:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    22cc:	60 91 72 00 	lds	r22, 0x0072	; 0x800072 <__TEXT_REGION_LENGTH__+0x7e0072>
    22d0:	ce 01       	movw	r24, r28
    22d2:	0e 94 5c 10 	call	0x20b8	; 0x20b8 <_ZN5Print7printlnEhi.constprop.133>
    22d6:	65 ef       	ldi	r22, 0xF5	; 245
    22d8:	78 e0       	ldi	r23, 0x08	; 8
    22da:	ce 01       	movw	r24, r28
    22dc:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    22e0:	60 91 c9 00 	lds	r22, 0x00C9	; 0x8000c9 <__TEXT_REGION_LENGTH__+0x7e00c9>
    22e4:	ce 01       	movw	r24, r28
    22e6:	0e 94 5c 10 	call	0x20b8	; 0x20b8 <_ZN5Print7printlnEhi.constprop.133>
    22ea:	6a ed       	ldi	r22, 0xDA	; 218
    22ec:	78 e0       	ldi	r23, 0x08	; 8
    22ee:	ce 01       	movw	r24, r28
    22f0:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    22f4:	60 91 bc 00 	lds	r22, 0x00BC	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    22f8:	ce 01       	movw	r24, r28
    22fa:	0e 94 5c 10 	call	0x20b8	; 0x20b8 <_ZN5Print7printlnEhi.constprop.133>
    22fe:	63 ec       	ldi	r22, 0xC3	; 195
    2300:	78 e0       	ldi	r23, 0x08	; 8
    2302:	ce 01       	movw	r24, r28
    2304:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2308:	6c b5       	in	r22, 0x2c	; 44
    230a:	ce 01       	movw	r24, r28
    230c:	0e 94 5c 10 	call	0x20b8	; 0x20b8 <_ZN5Print7printlnEhi.constprop.133>
    2310:	6a ea       	ldi	r22, 0xAA	; 170
    2312:	78 e0       	ldi	r23, 0x08	; 8
    2314:	ce 01       	movw	r24, r28
    2316:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    231a:	60 91 7a 00 	lds	r22, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    231e:	ce 01       	movw	r24, r28
    2320:	0e 94 5c 10 	call	0x20b8	; 0x20b8 <_ZN5Print7printlnEhi.constprop.133>
    2324:	60 e9       	ldi	r22, 0x90	; 144
    2326:	78 e0       	ldi	r23, 0x08	; 8
    2328:	ce 01       	movw	r24, r28
    232a:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    232e:	6f b3       	in	r22, 0x1f	; 31
    2330:	ce 01       	movw	r24, r28
    2332:	0e 94 5c 10 	call	0x20b8	; 0x20b8 <_ZN5Print7printlnEhi.constprop.133>
    2336:	6b e6       	ldi	r22, 0x6B	; 107
    2338:	78 e0       	ldi	r23, 0x08	; 8
    233a:	ce 01       	movw	r24, r28
    233c:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2340:	60 b7       	in	r22, 0x30	; 48
    2342:	ce 01       	movw	r24, r28
    2344:	0e 94 5c 10 	call	0x20b8	; 0x20b8 <_ZN5Print7printlnEhi.constprop.133>
    2348:	6b e4       	ldi	r22, 0x4B	; 75
    234a:	78 e0       	ldi	r23, 0x08	; 8
    234c:	ce 01       	movw	r24, r28
    234e:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2352:	60 91 d8 00 	lds	r22, 0x00D8	; 0x8000d8 <__TEXT_REGION_LENGTH__+0x7e00d8>
    2356:	ce 01       	movw	r24, r28
    2358:	0e 94 5c 10 	call	0x20b8	; 0x20b8 <_ZN5Print7printlnEhi.constprop.133>
    235c:	63 e2       	ldi	r22, 0x23	; 35
    235e:	78 e0       	ldi	r23, 0x08	; 8
    2360:	ce 01       	movw	r24, r28
    2362:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2366:	60 91 e2 00 	lds	r22, 0x00E2	; 0x8000e2 <__TEXT_REGION_LENGTH__+0x7e00e2>
    236a:	ce 01       	movw	r24, r28
    236c:	0e 94 5c 10 	call	0x20b8	; 0x20b8 <_ZN5Print7printlnEhi.constprop.133>
    2370:	ce 01       	movw	r24, r28
    2372:	0e 94 17 11 	call	0x222e	; 0x222e <_ZN11MemoryUsage10printStarsER5Print>
    2376:	df 91       	pop	r29
    2378:	cf 91       	pop	r28
    237a:	08 95       	ret

0000237c <_ZN5ezLED4loopEv>:
    237c:	b0 e0       	ldi	r27, 0x00	; 0
    237e:	a0 e0       	ldi	r26, 0x00	; 0
    2380:	e4 ec       	ldi	r30, 0xC4	; 196
    2382:	f1 e1       	ldi	r31, 0x11	; 17
    2384:	0c 94 9e 34 	jmp	0x693c	; 0x693c <__prologue_saves__+0xc>
    2388:	ec 01       	movw	r28, r24
    238a:	8a 81       	ldd	r24, Y+2	; 0x02
    238c:	98 2f       	mov	r25, r24
    238e:	92 95       	swap	r25
    2390:	97 70       	andi	r25, 0x07	; 7
    2392:	92 30       	cpi	r25, 0x02	; 2
    2394:	09 f4       	brne	.+2      	; 0x2398 <_ZN5ezLED4loopEv+0x1c>
    2396:	96 c0       	rjmp	.+300    	; 0x24c4 <_ZN5ezLED4loopEv+0x148>
    2398:	68 f4       	brcc	.+26     	; 0x23b4 <_ZN5ezLED4loopEv+0x38>
    239a:	99 23       	and	r25, r25
    239c:	09 f4       	brne	.+2      	; 0x23a0 <_ZN5ezLED4loopEv+0x24>
    239e:	41 c1       	rjmp	.+642    	; 0x2622 <_ZN5ezLED4loopEv+0x2a6>
    23a0:	91 30       	cpi	r25, 0x01	; 1
    23a2:	09 f4       	brne	.+2      	; 0x23a6 <_ZN5ezLED4loopEv+0x2a>
    23a4:	43 c0       	rjmp	.+134    	; 0x242c <_ZN5ezLED4loopEv+0xb0>
    23a6:	67 ec       	ldi	r22, 0xC7	; 199
    23a8:	71 e0       	ldi	r23, 0x01	; 1
    23aa:	87 e0       	ldi	r24, 0x07	; 7
    23ac:	93 e0       	ldi	r25, 0x03	; 3
    23ae:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    23b2:	65 c0       	rjmp	.+202    	; 0x247e <_ZN5ezLED4loopEv+0x102>
    23b4:	93 30       	cpi	r25, 0x03	; 3
    23b6:	09 f4       	brne	.+2      	; 0x23ba <_ZN5ezLED4loopEv+0x3e>
    23b8:	9c c0       	rjmp	.+312    	; 0x24f2 <_ZN5ezLED4loopEv+0x176>
    23ba:	94 30       	cpi	r25, 0x04	; 4
    23bc:	a1 f7       	brne	.-24     	; 0x23a6 <_ZN5ezLED4loopEv+0x2a>
    23be:	87 fd       	sbrc	r24, 7
    23c0:	d9 c0       	rjmp	.+434    	; 0x2574 <_ZN5ezLED4loopEv+0x1f8>
    23c2:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    23c6:	09 a1       	ldd	r16, Y+33	; 0x21
    23c8:	1a a1       	ldd	r17, Y+34	; 0x22
    23ca:	2b a1       	ldd	r18, Y+35	; 0x23
    23cc:	3c a1       	ldd	r19, Y+36	; 0x24
    23ce:	60 1b       	sub	r22, r16
    23d0:	71 0b       	sbc	r23, r17
    23d2:	82 0b       	sbc	r24, r18
    23d4:	93 0b       	sbc	r25, r19
    23d6:	0d 85       	ldd	r16, Y+13	; 0x0d
    23d8:	1e 85       	ldd	r17, Y+14	; 0x0e
    23da:	2f 85       	ldd	r18, Y+15	; 0x0f
    23dc:	38 89       	ldd	r19, Y+16	; 0x10
    23de:	60 17       	cp	r22, r16
    23e0:	71 07       	cpc	r23, r17
    23e2:	82 07       	cpc	r24, r18
    23e4:	93 07       	cpc	r25, r19
    23e6:	08 f4       	brcc	.+2      	; 0x23ea <_ZN5ezLED4loopEv+0x6e>
    23e8:	c5 c0       	rjmp	.+394    	; 0x2574 <_ZN5ezLED4loopEv+0x1f8>
    23ea:	8a 81       	ldd	r24, Y+2	; 0x02
    23ec:	80 68       	ori	r24, 0x80	; 128
    23ee:	8a 83       	std	Y+2, r24	; 0x02
    23f0:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    23f4:	69 a3       	std	Y+33, r22	; 0x21
    23f6:	7a a3       	std	Y+34, r23	; 0x22
    23f8:	8b a3       	std	Y+35, r24	; 0x23
    23fa:	9c a3       	std	Y+36, r25	; 0x24
    23fc:	89 8d       	ldd	r24, Y+25	; 0x19
    23fe:	9a 8d       	ldd	r25, Y+26	; 0x1a
    2400:	01 96       	adiw	r24, 0x01	; 1
    2402:	9a 8f       	std	Y+26, r25	; 0x1a
    2404:	89 8f       	std	Y+25, r24	; 0x19
    2406:	8a 81       	ldd	r24, Y+2	; 0x02
    2408:	86 95       	lsr	r24
    240a:	87 70       	andi	r24, 0x07	; 7
    240c:	85 30       	cpi	r24, 0x05	; 5
    240e:	09 f4       	brne	.+2      	; 0x2412 <_ZN5ezLED4loopEv+0x96>
    2410:	cb c0       	rjmp	.+406    	; 0x25a8 <_ZN5ezLED4loopEv+0x22c>
    2412:	86 30       	cpi	r24, 0x06	; 6
    2414:	a1 f5       	brne	.+104    	; 0x247e <_ZN5ezLED4loopEv+0x102>
    2416:	8b 8d       	ldd	r24, Y+27	; 0x1b
    2418:	9c 8d       	ldd	r25, Y+28	; 0x1c
    241a:	88 0f       	add	r24, r24
    241c:	99 1f       	adc	r25, r25
    241e:	29 8d       	ldd	r18, Y+25	; 0x19
    2420:	3a 8d       	ldd	r19, Y+26	; 0x1a
    2422:	28 17       	cp	r18, r24
    2424:	39 07       	cpc	r19, r25
    2426:	08 f0       	brcs	.+2      	; 0x242a <_ZN5ezLED4loopEv+0xae>
    2428:	d3 c0       	rjmp	.+422    	; 0x25d0 <_ZN5ezLED4loopEv+0x254>
    242a:	29 c0       	rjmp	.+82     	; 0x247e <_ZN5ezLED4loopEv+0x102>
    242c:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    2430:	09 a1       	ldd	r16, Y+33	; 0x21
    2432:	1a a1       	ldd	r17, Y+34	; 0x22
    2434:	2b a1       	ldd	r18, Y+35	; 0x23
    2436:	3c a1       	ldd	r19, Y+36	; 0x24
    2438:	60 1b       	sub	r22, r16
    243a:	71 0b       	sbc	r23, r17
    243c:	82 0b       	sbc	r24, r18
    243e:	93 0b       	sbc	r25, r19
    2440:	0d 8d       	ldd	r16, Y+29	; 0x1d
    2442:	1e 8d       	ldd	r17, Y+30	; 0x1e
    2444:	2f 8d       	ldd	r18, Y+31	; 0x1f
    2446:	38 a1       	ldd	r19, Y+32	; 0x20
    2448:	60 17       	cp	r22, r16
    244a:	71 07       	cpc	r23, r17
    244c:	82 07       	cpc	r24, r18
    244e:	93 07       	cpc	r25, r19
    2450:	b0 f0       	brcs	.+44     	; 0x247e <_ZN5ezLED4loopEv+0x102>
    2452:	8a 81       	ldd	r24, Y+2	; 0x02
    2454:	98 2f       	mov	r25, r24
    2456:	96 95       	lsr	r25
    2458:	97 70       	andi	r25, 0x07	; 7
    245a:	93 30       	cpi	r25, 0x03	; 3
    245c:	81 f1       	breq	.+96     	; 0x24be <_ZN5ezLED4loopEv+0x142>
    245e:	30 f0       	brcs	.+12     	; 0x246c <_ZN5ezLED4loopEv+0xf0>
    2460:	97 30       	cpi	r25, 0x07	; 7
    2462:	38 f4       	brcc	.+14     	; 0x2472 <_ZN5ezLED4loopEv+0xf6>
    2464:	8f 78       	andi	r24, 0x8F	; 143
    2466:	80 64       	ori	r24, 0x40	; 64
    2468:	80 68       	ori	r24, 0x80	; 128
    246a:	02 c0       	rjmp	.+4      	; 0x2470 <_ZN5ezLED4loopEv+0xf4>
    246c:	8f 78       	andi	r24, 0x8F	; 143
    246e:	80 62       	ori	r24, 0x20	; 32
    2470:	8a 83       	std	Y+2, r24	; 0x02
    2472:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    2476:	69 a3       	std	Y+33, r22	; 0x21
    2478:	7a a3       	std	Y+34, r23	; 0x22
    247a:	8b a3       	std	Y+35, r24	; 0x23
    247c:	9c a3       	std	Y+36, r25	; 0x24
    247e:	6a 81       	ldd	r22, Y+2	; 0x02
    2480:	86 2f       	mov	r24, r22
    2482:	81 70       	andi	r24, 0x01	; 1
    2484:	96 2f       	mov	r25, r22
    2486:	90 77       	andi	r25, 0x70	; 112
    2488:	90 33       	cpi	r25, 0x30	; 48
    248a:	09 f0       	breq	.+2      	; 0x248e <_ZN5ezLED4loopEv+0x112>
    248c:	37 c1       	rjmp	.+622    	; 0x26fc <_ZN5ezLED4loopEv+0x380>
    248e:	09 81       	ldd	r16, Y+1	; 0x01
    2490:	10 e0       	ldi	r17, 0x00	; 0
    2492:	88 23       	and	r24, r24
    2494:	31 f0       	breq	.+12     	; 0x24a2 <_ZN5ezLED4loopEv+0x126>
    2496:	8f ef       	ldi	r24, 0xFF	; 255
    2498:	90 e0       	ldi	r25, 0x00	; 0
    249a:	5c 01       	movw	r10, r24
    249c:	a0 1a       	sub	r10, r16
    249e:	b1 0a       	sbc	r11, r17
    24a0:	85 01       	movw	r16, r10
    24a2:	c8 81       	ld	r28, Y
    24a4:	61 e0       	ldi	r22, 0x01	; 1
    24a6:	8c 2f       	mov	r24, r28
    24a8:	0e 94 00 08 	call	0x1000	; 0x1000 <pinMode>
    24ac:	01 15       	cp	r16, r1
    24ae:	11 05       	cpc	r17, r1
    24b0:	09 f0       	breq	.+2      	; 0x24b4 <_ZN5ezLED4loopEv+0x138>
    24b2:	91 c0       	rjmp	.+290    	; 0x25d6 <_ZN5ezLED4loopEv+0x25a>
    24b4:	60 e0       	ldi	r22, 0x00	; 0
    24b6:	8c 2f       	mov	r24, r28
    24b8:	0e 94 d2 07 	call	0xfa4	; 0xfa4 <digitalWrite>
    24bc:	b2 c0       	rjmp	.+356    	; 0x2622 <_ZN5ezLED4loopEv+0x2a6>
    24be:	8f 78       	andi	r24, 0x8F	; 143
    24c0:	80 63       	ori	r24, 0x30	; 48
    24c2:	d6 cf       	rjmp	.-84     	; 0x2470 <_ZN5ezLED4loopEv+0xf4>
    24c4:	98 2f       	mov	r25, r24
    24c6:	96 95       	lsr	r25
    24c8:	97 70       	andi	r25, 0x07	; 7
    24ca:	91 30       	cpi	r25, 0x01	; 1
    24cc:	51 f0       	breq	.+20     	; 0x24e2 <_ZN5ezLED4loopEv+0x166>
    24ce:	30 f0       	brcs	.+12     	; 0x24dc <_ZN5ezLED4loopEv+0x160>
    24d0:	92 30       	cpi	r25, 0x02	; 2
    24d2:	49 f0       	breq	.+18     	; 0x24e6 <_ZN5ezLED4loopEv+0x16a>
    24d4:	8a 81       	ldd	r24, Y+2	; 0x02
    24d6:	8f 78       	andi	r24, 0x8F	; 143
    24d8:	8a 83       	std	Y+2, r24	; 0x02
    24da:	d1 cf       	rjmp	.-94     	; 0x247e <_ZN5ezLED4loopEv+0x102>
    24dc:	8f 77       	andi	r24, 0x7F	; 127
    24de:	8a 83       	std	Y+2, r24	; 0x02
    24e0:	f9 cf       	rjmp	.-14     	; 0x24d4 <_ZN5ezLED4loopEv+0x158>
    24e2:	80 68       	ori	r24, 0x80	; 128
    24e4:	fc cf       	rjmp	.-8      	; 0x24de <_ZN5ezLED4loopEv+0x162>
    24e6:	98 2f       	mov	r25, r24
    24e8:	87 fb       	bst	r24, 7
    24ea:	97 f9       	bld	r25, 7
    24ec:	90 58       	subi	r25, 0x80	; 128
    24ee:	9a 83       	std	Y+2, r25	; 0x02
    24f0:	f1 cf       	rjmp	.-30     	; 0x24d4 <_ZN5ezLED4loopEv+0x158>
    24f2:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    24f6:	09 a1       	ldd	r16, Y+33	; 0x21
    24f8:	1a a1       	ldd	r17, Y+34	; 0x22
    24fa:	2b a1       	ldd	r18, Y+35	; 0x23
    24fc:	3c a1       	ldd	r19, Y+36	; 0x24
    24fe:	60 1b       	sub	r22, r16
    2500:	71 0b       	sbc	r23, r17
    2502:	82 0b       	sbc	r24, r18
    2504:	93 0b       	sbc	r25, r19
    2506:	0d 81       	ldd	r16, Y+5	; 0x05
    2508:	1e 81       	ldd	r17, Y+6	; 0x06
    250a:	2f 81       	ldd	r18, Y+7	; 0x07
    250c:	38 85       	ldd	r19, Y+8	; 0x08
    250e:	06 17       	cp	r16, r22
    2510:	17 07       	cpc	r17, r23
    2512:	28 07       	cpc	r18, r24
    2514:	39 07       	cpc	r19, r25
    2516:	50 f1       	brcs	.+84     	; 0x256c <_ZN5ezLED4loopEv+0x1f0>
    2518:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    251c:	cb 80       	ldd	r12, Y+3	; 0x03
    251e:	d1 2c       	mov	r13, r1
    2520:	f1 2c       	mov	r15, r1
    2522:	e1 2c       	mov	r14, r1
    2524:	09 a1       	ldd	r16, Y+33	; 0x21
    2526:	1a a1       	ldd	r17, Y+34	; 0x22
    2528:	2b a1       	ldd	r18, Y+35	; 0x23
    252a:	3c a1       	ldd	r19, Y+36	; 0x24
    252c:	4b 01       	movw	r8, r22
    252e:	5c 01       	movw	r10, r24
    2530:	80 1a       	sub	r8, r16
    2532:	91 0a       	sbc	r9, r17
    2534:	a2 0a       	sbc	r10, r18
    2536:	b3 0a       	sbc	r11, r19
    2538:	a5 01       	movw	r20, r10
    253a:	94 01       	movw	r18, r8
    253c:	8c 81       	ldd	r24, Y+4	; 0x04
    253e:	90 e0       	ldi	r25, 0x00	; 0
    2540:	b0 e0       	ldi	r27, 0x00	; 0
    2542:	a0 e0       	ldi	r26, 0x00	; 0
    2544:	bc 01       	movw	r22, r24
    2546:	cd 01       	movw	r24, r26
    2548:	6c 19       	sub	r22, r12
    254a:	7d 09       	sbc	r23, r13
    254c:	8e 09       	sbc	r24, r14
    254e:	9f 09       	sbc	r25, r15
    2550:	0e 94 00 35 	call	0x6a00	; 0x6a00 <__mulsi3>
    2554:	2d 81       	ldd	r18, Y+5	; 0x05
    2556:	3e 81       	ldd	r19, Y+6	; 0x06
    2558:	4f 81       	ldd	r20, Y+7	; 0x07
    255a:	58 85       	ldd	r21, Y+8	; 0x08
    255c:	0e 94 66 34 	call	0x68cc	; 0x68cc <__divmodsi4>
    2560:	c2 0e       	add	r12, r18
    2562:	d3 1e       	adc	r13, r19
    2564:	e4 1e       	adc	r14, r20
    2566:	f5 1e       	adc	r15, r21
    2568:	c9 82       	std	Y+1, r12	; 0x01
    256a:	89 cf       	rjmp	.-238    	; 0x247e <_ZN5ezLED4loopEv+0x102>
    256c:	8a 81       	ldd	r24, Y+2	; 0x02
    256e:	8f 78       	andi	r24, 0x8F	; 143
    2570:	8f 77       	andi	r24, 0x7F	; 127
    2572:	b2 cf       	rjmp	.-156    	; 0x24d8 <_ZN5ezLED4loopEv+0x15c>
    2574:	8a 81       	ldd	r24, Y+2	; 0x02
    2576:	87 ff       	sbrs	r24, 7
    2578:	46 cf       	rjmp	.-372    	; 0x2406 <_ZN5ezLED4loopEv+0x8a>
    257a:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    257e:	09 a1       	ldd	r16, Y+33	; 0x21
    2580:	1a a1       	ldd	r17, Y+34	; 0x22
    2582:	2b a1       	ldd	r18, Y+35	; 0x23
    2584:	3c a1       	ldd	r19, Y+36	; 0x24
    2586:	60 1b       	sub	r22, r16
    2588:	71 0b       	sbc	r23, r17
    258a:	82 0b       	sbc	r24, r18
    258c:	93 0b       	sbc	r25, r19
    258e:	09 85       	ldd	r16, Y+9	; 0x09
    2590:	1a 85       	ldd	r17, Y+10	; 0x0a
    2592:	2b 85       	ldd	r18, Y+11	; 0x0b
    2594:	3c 85       	ldd	r19, Y+12	; 0x0c
    2596:	60 17       	cp	r22, r16
    2598:	71 07       	cpc	r23, r17
    259a:	82 07       	cpc	r24, r18
    259c:	93 07       	cpc	r25, r19
    259e:	08 f4       	brcc	.+2      	; 0x25a2 <_ZN5ezLED4loopEv+0x226>
    25a0:	32 cf       	rjmp	.-412    	; 0x2406 <_ZN5ezLED4loopEv+0x8a>
    25a2:	8a 81       	ldd	r24, Y+2	; 0x02
    25a4:	8f 77       	andi	r24, 0x7F	; 127
    25a6:	23 cf       	rjmp	.-442    	; 0x23ee <_ZN5ezLED4loopEv+0x72>
    25a8:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    25ac:	0d 89       	ldd	r16, Y+21	; 0x15
    25ae:	1e 89       	ldd	r17, Y+22	; 0x16
    25b0:	2f 89       	ldd	r18, Y+23	; 0x17
    25b2:	38 8d       	ldd	r19, Y+24	; 0x18
    25b4:	60 1b       	sub	r22, r16
    25b6:	71 0b       	sbc	r23, r17
    25b8:	82 0b       	sbc	r24, r18
    25ba:	93 0b       	sbc	r25, r19
    25bc:	09 89       	ldd	r16, Y+17	; 0x11
    25be:	1a 89       	ldd	r17, Y+18	; 0x12
    25c0:	2b 89       	ldd	r18, Y+19	; 0x13
    25c2:	3c 89       	ldd	r19, Y+20	; 0x14
    25c4:	60 17       	cp	r22, r16
    25c6:	71 07       	cpc	r23, r17
    25c8:	82 07       	cpc	r24, r18
    25ca:	93 07       	cpc	r25, r19
    25cc:	08 f4       	brcc	.+2      	; 0x25d0 <_ZN5ezLED4loopEv+0x254>
    25ce:	57 cf       	rjmp	.-338    	; 0x247e <_ZN5ezLED4loopEv+0x102>
    25d0:	8a 81       	ldd	r24, Y+2	; 0x02
    25d2:	8f 70       	andi	r24, 0x0F	; 15
    25d4:	81 cf       	rjmp	.-254    	; 0x24d8 <_ZN5ezLED4loopEv+0x15c>
    25d6:	0f 3f       	cpi	r16, 0xFF	; 255
    25d8:	11 05       	cpc	r17, r1
    25da:	11 f4       	brne	.+4      	; 0x25e0 <_ZN5ezLED4loopEv+0x264>
    25dc:	61 e0       	ldi	r22, 0x01	; 1
    25de:	6b cf       	rjmp	.-298    	; 0x24b6 <_ZN5ezLED4loopEv+0x13a>
    25e0:	ec 2f       	mov	r30, r28
    25e2:	f0 e0       	ldi	r31, 0x00	; 0
    25e4:	e9 5c       	subi	r30, 0xC9	; 201
    25e6:	f5 4f       	sbci	r31, 0xF5	; 245
    25e8:	e4 91       	lpm	r30, Z
    25ea:	e1 50       	subi	r30, 0x01	; 1
    25ec:	ef 30       	cpi	r30, 0x0F	; 15
    25ee:	08 f0       	brcs	.+2      	; 0x25f2 <_ZN5ezLED4loopEv+0x276>
    25f0:	80 c0       	rjmp	.+256    	; 0x26f2 <_ZN5ezLED4loopEv+0x376>
    25f2:	f0 e0       	ldi	r31, 0x00	; 0
    25f4:	e2 50       	subi	r30, 0x02	; 2
    25f6:	fd 4e       	sbci	r31, 0xED	; 237
    25f8:	0c 94 38 35 	jmp	0x6a70	; 0x6a70 <__tablejump2__>
    25fc:	0d 13       	cpse	r16, r29
    25fe:	16 13       	cpse	r17, r22
    2600:	1b 13       	cpse	r17, r27
    2602:	25 13       	cpse	r18, r21
    2604:	2f 13       	cpse	r18, r31
    2606:	79 13       	cpse	r23, r25
    2608:	79 13       	cpse	r23, r25
    260a:	79 13       	cpse	r23, r25
    260c:	39 13       	cpse	r19, r25
    260e:	43 13       	cpse	r20, r19
    2610:	4d 13       	cpse	r20, r29
    2612:	57 13       	cpse	r21, r23
    2614:	64 13       	cpse	r22, r20
    2616:	79 13       	cpse	r23, r25
    2618:	6c 13       	cpse	r22, r28
    261a:	84 b5       	in	r24, 0x24	; 36
    261c:	80 68       	ori	r24, 0x80	; 128
    261e:	84 bd       	out	0x24, r24	; 36
    2620:	07 bd       	out	0x27, r16	; 39
    2622:	cd b7       	in	r28, 0x3d	; 61
    2624:	de b7       	in	r29, 0x3e	; 62
    2626:	ec e0       	ldi	r30, 0x0C	; 12
    2628:	0c 94 ba 34 	jmp	0x6974	; 0x6974 <__epilogue_restores__+0xc>
    262c:	84 b5       	in	r24, 0x24	; 36
    262e:	80 62       	ori	r24, 0x20	; 32
    2630:	84 bd       	out	0x24, r24	; 36
    2632:	08 bd       	out	0x28, r16	; 40
    2634:	f6 cf       	rjmp	.-20     	; 0x2622 <_ZN5ezLED4loopEv+0x2a6>
    2636:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    263a:	80 68       	ori	r24, 0x80	; 128
    263c:	80 93 80 00 	sts	0x0080, r24	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    2640:	10 93 89 00 	sts	0x0089, r17	; 0x800089 <__TEXT_REGION_LENGTH__+0x7e0089>
    2644:	00 93 88 00 	sts	0x0088, r16	; 0x800088 <__TEXT_REGION_LENGTH__+0x7e0088>
    2648:	ec cf       	rjmp	.-40     	; 0x2622 <_ZN5ezLED4loopEv+0x2a6>
    264a:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    264e:	80 62       	ori	r24, 0x20	; 32
    2650:	80 93 80 00 	sts	0x0080, r24	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    2654:	10 93 8b 00 	sts	0x008B, r17	; 0x80008b <__TEXT_REGION_LENGTH__+0x7e008b>
    2658:	00 93 8a 00 	sts	0x008A, r16	; 0x80008a <__TEXT_REGION_LENGTH__+0x7e008a>
    265c:	e2 cf       	rjmp	.-60     	; 0x2622 <_ZN5ezLED4loopEv+0x2a6>
    265e:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    2662:	88 60       	ori	r24, 0x08	; 8
    2664:	80 93 80 00 	sts	0x0080, r24	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    2668:	10 93 8d 00 	sts	0x008D, r17	; 0x80008d <__TEXT_REGION_LENGTH__+0x7e008d>
    266c:	00 93 8c 00 	sts	0x008C, r16	; 0x80008c <__TEXT_REGION_LENGTH__+0x7e008c>
    2670:	d8 cf       	rjmp	.-80     	; 0x2622 <_ZN5ezLED4loopEv+0x2a6>
    2672:	80 91 90 00 	lds	r24, 0x0090	; 0x800090 <__TEXT_REGION_LENGTH__+0x7e0090>
    2676:	80 68       	ori	r24, 0x80	; 128
    2678:	80 93 90 00 	sts	0x0090, r24	; 0x800090 <__TEXT_REGION_LENGTH__+0x7e0090>
    267c:	10 93 99 00 	sts	0x0099, r17	; 0x800099 <__TEXT_REGION_LENGTH__+0x7e0099>
    2680:	00 93 98 00 	sts	0x0098, r16	; 0x800098 <__TEXT_REGION_LENGTH__+0x7e0098>
    2684:	ce cf       	rjmp	.-100    	; 0x2622 <_ZN5ezLED4loopEv+0x2a6>
    2686:	80 91 90 00 	lds	r24, 0x0090	; 0x800090 <__TEXT_REGION_LENGTH__+0x7e0090>
    268a:	80 62       	ori	r24, 0x20	; 32
    268c:	80 93 90 00 	sts	0x0090, r24	; 0x800090 <__TEXT_REGION_LENGTH__+0x7e0090>
    2690:	10 93 9b 00 	sts	0x009B, r17	; 0x80009b <__TEXT_REGION_LENGTH__+0x7e009b>
    2694:	00 93 9a 00 	sts	0x009A, r16	; 0x80009a <__TEXT_REGION_LENGTH__+0x7e009a>
    2698:	c4 cf       	rjmp	.-120    	; 0x2622 <_ZN5ezLED4loopEv+0x2a6>
    269a:	80 91 90 00 	lds	r24, 0x0090	; 0x800090 <__TEXT_REGION_LENGTH__+0x7e0090>
    269e:	88 60       	ori	r24, 0x08	; 8
    26a0:	80 93 90 00 	sts	0x0090, r24	; 0x800090 <__TEXT_REGION_LENGTH__+0x7e0090>
    26a4:	10 93 9d 00 	sts	0x009D, r17	; 0x80009d <__TEXT_REGION_LENGTH__+0x7e009d>
    26a8:	00 93 9c 00 	sts	0x009C, r16	; 0x80009c <__TEXT_REGION_LENGTH__+0x7e009c>
    26ac:	ba cf       	rjmp	.-140    	; 0x2622 <_ZN5ezLED4loopEv+0x2a6>
    26ae:	80 91 c0 00 	lds	r24, 0x00C0	; 0x8000c0 <__TEXT_REGION_LENGTH__+0x7e00c0>
    26b2:	80 68       	ori	r24, 0x80	; 128
    26b4:	80 93 c0 00 	sts	0x00C0, r24	; 0x8000c0 <__TEXT_REGION_LENGTH__+0x7e00c0>
    26b8:	80 91 c0 00 	lds	r24, 0x00C0	; 0x8000c0 <__TEXT_REGION_LENGTH__+0x7e00c0>
    26bc:	8f 7b       	andi	r24, 0xBF	; 191
    26be:	80 93 c0 00 	sts	0x00C0, r24	; 0x8000c0 <__TEXT_REGION_LENGTH__+0x7e00c0>
    26c2:	00 93 cf 00 	sts	0x00CF, r16	; 0x8000cf <__TEXT_REGION_LENGTH__+0x7e00cf>
    26c6:	ad cf       	rjmp	.-166    	; 0x2622 <_ZN5ezLED4loopEv+0x2a6>
    26c8:	80 91 c0 00 	lds	r24, 0x00C0	; 0x8000c0 <__TEXT_REGION_LENGTH__+0x7e00c0>
    26cc:	80 62       	ori	r24, 0x20	; 32
    26ce:	80 93 c0 00 	sts	0x00C0, r24	; 0x8000c0 <__TEXT_REGION_LENGTH__+0x7e00c0>
    26d2:	00 93 d0 00 	sts	0x00D0, r16	; 0x8000d0 <__TEXT_REGION_LENGTH__+0x7e00d0>
    26d6:	a5 cf       	rjmp	.-182    	; 0x2622 <_ZN5ezLED4loopEv+0x2a6>
    26d8:	80 91 c2 00 	lds	r24, 0x00C2	; 0x8000c2 <__TEXT_REGION_LENGTH__+0x7e00c2>
    26dc:	88 60       	ori	r24, 0x08	; 8
    26de:	80 93 c2 00 	sts	0x00C2, r24	; 0x8000c2 <__TEXT_REGION_LENGTH__+0x7e00c2>
    26e2:	80 91 c2 00 	lds	r24, 0x00C2	; 0x8000c2 <__TEXT_REGION_LENGTH__+0x7e00c2>
    26e6:	8b 7f       	andi	r24, 0xFB	; 251
    26e8:	80 93 c2 00 	sts	0x00C2, r24	; 0x8000c2 <__TEXT_REGION_LENGTH__+0x7e00c2>
    26ec:	00 93 d2 00 	sts	0x00D2, r16	; 0x8000d2 <__TEXT_REGION_LENGTH__+0x7e00d2>
    26f0:	98 cf       	rjmp	.-208    	; 0x2622 <_ZN5ezLED4loopEv+0x2a6>
    26f2:	00 38       	cpi	r16, 0x80	; 128
    26f4:	11 05       	cpc	r17, r1
    26f6:	0c f0       	brlt	.+2      	; 0x26fa <_ZN5ezLED4loopEv+0x37e>
    26f8:	71 cf       	rjmp	.-286    	; 0x25dc <_ZN5ezLED4loopEv+0x260>
    26fa:	dc ce       	rjmp	.-584    	; 0x24b4 <_ZN5ezLED4loopEv+0x138>
    26fc:	88 23       	and	r24, r24
    26fe:	31 f0       	breq	.+12     	; 0x270c <_ZN5ezLED4loopEv+0x390>
    2700:	60 95       	com	r22
    2702:	66 1f       	adc	r22, r22
    2704:	66 27       	eor	r22, r22
    2706:	66 1f       	adc	r22, r22
    2708:	88 81       	ld	r24, Y
    270a:	d6 ce       	rjmp	.-596    	; 0x24b8 <_ZN5ezLED4loopEv+0x13c>
    270c:	67 fb       	bst	r22, 7
    270e:	66 27       	eor	r22, r22
    2710:	60 f9       	bld	r22, 0
    2712:	fa cf       	rjmp	.-12     	; 0x2708 <_ZN5ezLED4loopEv+0x38c>

00002714 <_ZN5ezLED5blinkEmmm>:
    2714:	b0 e0       	ldi	r27, 0x00	; 0
    2716:	a0 e0       	ldi	r26, 0x00	; 0
    2718:	e0 e9       	ldi	r30, 0x90	; 144
    271a:	f3 e1       	ldi	r31, 0x13	; 19
    271c:	0c 94 a2 34 	jmp	0x6944	; 0x6944 <__prologue_saves__+0x14>
    2720:	ec 01       	movw	r28, r24
    2722:	49 87       	std	Y+9, r20	; 0x09
    2724:	5a 87       	std	Y+10, r21	; 0x0a
    2726:	6b 87       	std	Y+11, r22	; 0x0b
    2728:	7c 87       	std	Y+12, r23	; 0x0c
    272a:	0d 87       	std	Y+13, r16	; 0x0d
    272c:	1e 87       	std	Y+14, r17	; 0x0e
    272e:	2f 87       	std	Y+15, r18	; 0x0f
    2730:	38 8b       	std	Y+16, r19	; 0x10
    2732:	cd 8e       	std	Y+29, r12	; 0x1d
    2734:	de 8e       	std	Y+30, r13	; 0x1e
    2736:	ef 8e       	std	Y+31, r14	; 0x1f
    2738:	f8 a2       	std	Y+32, r15	; 0x20
    273a:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    273e:	69 a3       	std	Y+33, r22	; 0x21
    2740:	7a a3       	std	Y+34, r23	; 0x22
    2742:	8b a3       	std	Y+35, r24	; 0x23
    2744:	9c a3       	std	Y+36, r25	; 0x24
    2746:	8a 81       	ldd	r24, Y+2	; 0x02
    2748:	81 7f       	andi	r24, 0xF1	; 241
    274a:	88 60       	ori	r24, 0x08	; 8
    274c:	8a 83       	std	Y+2, r24	; 0x02
    274e:	98 2f       	mov	r25, r24
    2750:	90 77       	andi	r25, 0x70	; 112
    2752:	41 f4       	brne	.+16     	; 0x2764 <_ZN5ezLED5blinkEmmm+0x50>
    2754:	8f 78       	andi	r24, 0x8F	; 143
    2756:	c1 14       	cp	r12, r1
    2758:	d1 04       	cpc	r13, r1
    275a:	e1 04       	cpc	r14, r1
    275c:	f1 04       	cpc	r15, r1
    275e:	51 f0       	breq	.+20     	; 0x2774 <_ZN5ezLED5blinkEmmm+0x60>
    2760:	80 61       	ori	r24, 0x10	; 16
    2762:	8a 83       	std	Y+2, r24	; 0x02
    2764:	ce 01       	movw	r24, r28
    2766:	0e 94 be 11 	call	0x237c	; 0x237c <_ZN5ezLED4loopEv>
    276a:	cd b7       	in	r28, 0x3d	; 61
    276c:	de b7       	in	r29, 0x3e	; 62
    276e:	e8 e0       	ldi	r30, 0x08	; 8
    2770:	0c 94 be 34 	jmp	0x697c	; 0x697c <__epilogue_restores__+0x14>
    2774:	80 64       	ori	r24, 0x40	; 64
    2776:	80 68       	ori	r24, 0x80	; 128
    2778:	8a 83       	std	Y+2, r24	; 0x02
    277a:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    277e:	69 a3       	std	Y+33, r22	; 0x21
    2780:	7a a3       	std	Y+34, r23	; 0x22
    2782:	8b a3       	std	Y+35, r24	; 0x23
    2784:	9c a3       	std	Y+36, r25	; 0x24
    2786:	ee cf       	rjmp	.-36     	; 0x2764 <_ZN5ezLED5blinkEmmm+0x50>

00002788 <_ZN13LEDController8setStateENS_5StateE.constprop.87>:
    2788:	cf 92       	push	r12
    278a:	df 92       	push	r13
    278c:	ef 92       	push	r14
    278e:	ff 92       	push	r15
    2790:	0f 93       	push	r16
    2792:	1f 93       	push	r17
    2794:	90 91 2a 06 	lds	r25, 0x062A	; 0x80062a <ledController+0x4a>
    2798:	98 17       	cp	r25, r24
    279a:	61 f0       	breq	.+24     	; 0x27b4 <_ZN13LEDController8setStateENS_5StateE.constprop.87+0x2c>
    279c:	80 93 2a 06 	sts	0x062A, r24	; 0x80062a <ledController+0x4a>
    27a0:	84 30       	cpi	r24, 0x04	; 4
    27a2:	78 f4       	brcc	.+30     	; 0x27c2 <_ZN13LEDController8setStateENS_5StateE.constprop.87+0x3a>
    27a4:	82 30       	cpi	r24, 0x02	; 2
    27a6:	08 f0       	brcs	.+2      	; 0x27aa <_ZN13LEDController8setStateENS_5StateE.constprop.87+0x22>
    27a8:	74 c0       	rjmp	.+232    	; 0x2892 <_ZN13LEDController8setStateENS_5StateE.constprop.87+0x10a>
    27aa:	88 23       	and	r24, r24
    27ac:	59 f1       	breq	.+86     	; 0x2804 <_ZN13LEDController8setStateENS_5StateE.constprop.87+0x7c>
    27ae:	81 30       	cpi	r24, 0x01	; 1
    27b0:	09 f4       	brne	.+2      	; 0x27b4 <_ZN13LEDController8setStateENS_5StateE.constprop.87+0x2c>
    27b2:	4d c0       	rjmp	.+154    	; 0x284e <_ZN13LEDController8setStateENS_5StateE.constprop.87+0xc6>
    27b4:	1f 91       	pop	r17
    27b6:	0f 91       	pop	r16
    27b8:	ff 90       	pop	r15
    27ba:	ef 90       	pop	r14
    27bc:	df 90       	pop	r13
    27be:	cf 90       	pop	r12
    27c0:	08 95       	ret
    27c2:	84 30       	cpi	r24, 0x04	; 4
    27c4:	b9 f7       	brne	.-18     	; 0x27b4 <_ZN13LEDController8setStateENS_5StateE.constprop.87+0x2c>
    27c6:	10 92 fd 05 	sts	0x05FD, r1	; 0x8005fd <ledController+0x1d>
    27ca:	10 92 fe 05 	sts	0x05FE, r1	; 0x8005fe <ledController+0x1e>
    27ce:	10 92 ff 05 	sts	0x05FF, r1	; 0x8005ff <ledController+0x1f>
    27d2:	10 92 00 06 	sts	0x0600, r1	; 0x800600 <ledController+0x20>
    27d6:	80 91 e2 05 	lds	r24, 0x05E2	; 0x8005e2 <ledController+0x2>
    27da:	81 78       	andi	r24, 0x81	; 129
    27dc:	82 62       	ori	r24, 0x22	; 34
    27de:	80 93 e2 05 	sts	0x05E2, r24	; 0x8005e2 <ledController+0x2>
    27e2:	80 ee       	ldi	r24, 0xE0	; 224
    27e4:	95 e0       	ldi	r25, 0x05	; 5
    27e6:	0e 94 be 11 	call	0x237c	; 0x237c <_ZN5ezLED4loopEv>
    27ea:	10 92 22 06 	sts	0x0622, r1	; 0x800622 <ledController+0x42>
    27ee:	10 92 23 06 	sts	0x0623, r1	; 0x800623 <ledController+0x43>
    27f2:	10 92 24 06 	sts	0x0624, r1	; 0x800624 <ledController+0x44>
    27f6:	10 92 25 06 	sts	0x0625, r1	; 0x800625 <ledController+0x45>
    27fa:	80 91 07 06 	lds	r24, 0x0607	; 0x800607 <ledController+0x27>
    27fe:	81 78       	andi	r24, 0x81	; 129
    2800:	80 62       	ori	r24, 0x20	; 32
    2802:	1e c0       	rjmp	.+60     	; 0x2840 <_ZN13LEDController8setStateENS_5StateE.constprop.87+0xb8>
    2804:	10 92 fd 05 	sts	0x05FD, r1	; 0x8005fd <ledController+0x1d>
    2808:	10 92 fe 05 	sts	0x05FE, r1	; 0x8005fe <ledController+0x1e>
    280c:	10 92 ff 05 	sts	0x05FF, r1	; 0x8005ff <ledController+0x1f>
    2810:	10 92 00 06 	sts	0x0600, r1	; 0x800600 <ledController+0x20>
    2814:	80 91 e2 05 	lds	r24, 0x05E2	; 0x8005e2 <ledController+0x2>
    2818:	81 78       	andi	r24, 0x81	; 129
    281a:	80 62       	ori	r24, 0x20	; 32
    281c:	80 93 e2 05 	sts	0x05E2, r24	; 0x8005e2 <ledController+0x2>
    2820:	80 ee       	ldi	r24, 0xE0	; 224
    2822:	95 e0       	ldi	r25, 0x05	; 5
    2824:	0e 94 be 11 	call	0x237c	; 0x237c <_ZN5ezLED4loopEv>
    2828:	10 92 22 06 	sts	0x0622, r1	; 0x800622 <ledController+0x42>
    282c:	10 92 23 06 	sts	0x0623, r1	; 0x800623 <ledController+0x43>
    2830:	10 92 24 06 	sts	0x0624, r1	; 0x800624 <ledController+0x44>
    2834:	10 92 25 06 	sts	0x0625, r1	; 0x800625 <ledController+0x45>
    2838:	80 91 07 06 	lds	r24, 0x0607	; 0x800607 <ledController+0x27>
    283c:	81 78       	andi	r24, 0x81	; 129
    283e:	82 62       	ori	r24, 0x22	; 34
    2840:	80 93 07 06 	sts	0x0607, r24	; 0x800607 <ledController+0x27>
    2844:	85 e0       	ldi	r24, 0x05	; 5
    2846:	96 e0       	ldi	r25, 0x06	; 6
    2848:	0e 94 be 11 	call	0x237c	; 0x237c <_ZN5ezLED4loopEv>
    284c:	b3 cf       	rjmp	.-154    	; 0x27b4 <_ZN13LEDController8setStateENS_5StateE.constprop.87+0x2c>
    284e:	10 92 fd 05 	sts	0x05FD, r1	; 0x8005fd <ledController+0x1d>
    2852:	10 92 fe 05 	sts	0x05FE, r1	; 0x8005fe <ledController+0x1e>
    2856:	10 92 ff 05 	sts	0x05FF, r1	; 0x8005ff <ledController+0x1f>
    285a:	10 92 00 06 	sts	0x0600, r1	; 0x800600 <ledController+0x20>
    285e:	80 91 e2 05 	lds	r24, 0x05E2	; 0x8005e2 <ledController+0x2>
    2862:	81 78       	andi	r24, 0x81	; 129
    2864:	80 62       	ori	r24, 0x20	; 32
    2866:	80 93 e2 05 	sts	0x05E2, r24	; 0x8005e2 <ledController+0x2>
    286a:	80 ee       	ldi	r24, 0xE0	; 224
    286c:	95 e0       	ldi	r25, 0x05	; 5
    286e:	0e 94 be 11 	call	0x237c	; 0x237c <_ZN5ezLED4loopEv>
    2872:	c1 2c       	mov	r12, r1
    2874:	d1 2c       	mov	r13, r1
    2876:	76 01       	movw	r14, r12
    2878:	0a ef       	ldi	r16, 0xFA	; 250
    287a:	10 e0       	ldi	r17, 0x00	; 0
    287c:	20 e0       	ldi	r18, 0x00	; 0
    287e:	30 e0       	ldi	r19, 0x00	; 0
    2880:	4a ef       	ldi	r20, 0xFA	; 250
    2882:	50 e0       	ldi	r21, 0x00	; 0
    2884:	60 e0       	ldi	r22, 0x00	; 0
    2886:	70 e0       	ldi	r23, 0x00	; 0
    2888:	85 e0       	ldi	r24, 0x05	; 5
    288a:	96 e0       	ldi	r25, 0x06	; 6
    288c:	0e 94 8a 13 	call	0x2714	; 0x2714 <_ZN5ezLED5blinkEmmm>
    2890:	91 cf       	rjmp	.-222    	; 0x27b4 <_ZN13LEDController8setStateENS_5StateE.constprop.87+0x2c>
    2892:	10 92 fd 05 	sts	0x05FD, r1	; 0x8005fd <ledController+0x1d>
    2896:	10 92 fe 05 	sts	0x05FE, r1	; 0x8005fe <ledController+0x1e>
    289a:	10 92 ff 05 	sts	0x05FF, r1	; 0x8005ff <ledController+0x1f>
    289e:	10 92 00 06 	sts	0x0600, r1	; 0x800600 <ledController+0x20>
    28a2:	80 91 e2 05 	lds	r24, 0x05E2	; 0x8005e2 <ledController+0x2>
    28a6:	81 78       	andi	r24, 0x81	; 129
    28a8:	80 62       	ori	r24, 0x20	; 32
    28aa:	80 93 e2 05 	sts	0x05E2, r24	; 0x8005e2 <ledController+0x2>
    28ae:	80 ee       	ldi	r24, 0xE0	; 224
    28b0:	95 e0       	ldi	r25, 0x05	; 5
    28b2:	0e 94 be 11 	call	0x237c	; 0x237c <_ZN5ezLED4loopEv>
    28b6:	c1 2c       	mov	r12, r1
    28b8:	d1 2c       	mov	r13, r1
    28ba:	76 01       	movw	r14, r12
    28bc:	04 ef       	ldi	r16, 0xF4	; 244
    28be:	11 e0       	ldi	r17, 0x01	; 1
    28c0:	20 e0       	ldi	r18, 0x00	; 0
    28c2:	30 e0       	ldi	r19, 0x00	; 0
    28c4:	44 ef       	ldi	r20, 0xF4	; 244
    28c6:	51 e0       	ldi	r21, 0x01	; 1
    28c8:	60 e0       	ldi	r22, 0x00	; 0
    28ca:	70 e0       	ldi	r23, 0x00	; 0
    28cc:	dd cf       	rjmp	.-70     	; 0x2888 <_ZN13LEDController8setStateENS_5StateE.constprop.87+0x100>

000028ce <_ZL17bluetoothCallbackPK19__FlashStringHelperbRK6String>:
    28ce:	0f 93       	push	r16
    28d0:	1f 93       	push	r17
    28d2:	cf 93       	push	r28
    28d4:	df 93       	push	r29
    28d6:	8c 01       	movw	r16, r24
    28d8:	ea 01       	movw	r28, r20
    28da:	66 23       	and	r22, r22
    28dc:	b1 f0       	breq	.+44     	; 0x290a <_ZL17bluetoothCallbackPK19__FlashStringHelperbRK6String+0x3c>
    28de:	6c ea       	ldi	r22, 0xAC	; 172
    28e0:	71 e0       	ldi	r23, 0x01	; 1
    28e2:	87 e0       	ldi	r24, 0x07	; 7
    28e4:	93 e0       	ldi	r25, 0x03	; 3
    28e6:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    28ea:	b8 01       	movw	r22, r16
    28ec:	87 e0       	ldi	r24, 0x07	; 7
    28ee:	93 e0       	ldi	r25, 0x03	; 3
    28f0:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    28f4:	69 e7       	ldi	r22, 0x79	; 121
    28f6:	76 e0       	ldi	r23, 0x06	; 6
    28f8:	87 e0       	ldi	r24, 0x07	; 7
    28fa:	93 e0       	ldi	r25, 0x03	; 3
    28fc:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    2900:	df 91       	pop	r29
    2902:	cf 91       	pop	r28
    2904:	1f 91       	pop	r17
    2906:	0f 91       	pop	r16
    2908:	08 95       	ret
    290a:	6d eb       	ldi	r22, 0xBD	; 189
    290c:	71 e0       	ldi	r23, 0x01	; 1
    290e:	87 e0       	ldi	r24, 0x07	; 7
    2910:	93 e0       	ldi	r25, 0x03	; 3
    2912:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2916:	b8 01       	movw	r22, r16
    2918:	87 e0       	ldi	r24, 0x07	; 7
    291a:	93 e0       	ldi	r25, 0x03	; 3
    291c:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2920:	66 e5       	ldi	r22, 0x56	; 86
    2922:	79 e0       	ldi	r23, 0x09	; 9
    2924:	87 e0       	ldi	r24, 0x07	; 7
    2926:	93 e0       	ldi	r25, 0x03	; 3
    2928:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    292c:	4c 81       	ldd	r20, Y+4	; 0x04
    292e:	5d 81       	ldd	r21, Y+5	; 0x05
    2930:	68 81       	ld	r22, Y
    2932:	79 81       	ldd	r23, Y+1	; 0x01
    2934:	87 e0       	ldi	r24, 0x07	; 7
    2936:	93 e0       	ldi	r25, 0x03	; 3
    2938:	0e 94 aa 09 	call	0x1354	; 0x1354 <_ZN7Serial_5writeEPKhj>
    293c:	69 e7       	ldi	r22, 0x79	; 121
    293e:	76 e0       	ldi	r23, 0x06	; 6
    2940:	db cf       	rjmp	.-74     	; 0x28f8 <_ZL17bluetoothCallbackPK19__FlashStringHelperbRK6String+0x2a>

00002942 <_ZL22bluetoothResetCallbackPK19__FlashStringHelperbRK6String>:
    2942:	ef 92       	push	r14
    2944:	ff 92       	push	r15
    2946:	0f 93       	push	r16
    2948:	1f 93       	push	r17
    294a:	cf 93       	push	r28
    294c:	8c 01       	movw	r16, r24
    294e:	c6 2f       	mov	r28, r22
    2950:	7a 01       	movw	r14, r20
    2952:	66 23       	and	r22, r22
    2954:	69 f0       	breq	.+26     	; 0x2970 <_ZL22bluetoothResetCallbackPK19__FlashStringHelperbRK6String+0x2e>
    2956:	60 e0       	ldi	r22, 0x00	; 0
    2958:	80 91 58 04 	lds	r24, 0x0458	; 0x800458 <hc05+0x2>
    295c:	0e 94 d2 07 	call	0xfa4	; 0xfa4 <digitalWrite>
    2960:	80 91 a7 04 	lds	r24, 0x04A7	; 0x8004a7 <hc05+0x51>
    2964:	8f 7e       	andi	r24, 0xEF	; 239
    2966:	80 93 a7 04 	sts	0x04A7, r24	; 0x8004a7 <hc05+0x51>
    296a:	8b e0       	ldi	r24, 0x0B	; 11
    296c:	0e 94 9f 08 	call	0x113e	; 0x113e <_ZN4HC058setStateENS_5StateE.constprop.73>
    2970:	a7 01       	movw	r20, r14
    2972:	6c 2f       	mov	r22, r28
    2974:	c8 01       	movw	r24, r16
    2976:	0e 94 67 14 	call	0x28ce	; 0x28ce <_ZL17bluetoothCallbackPK19__FlashStringHelperbRK6String>
    297a:	cf 91       	pop	r28
    297c:	1f 91       	pop	r17
    297e:	0f 91       	pop	r16
    2980:	ff 90       	pop	r15
    2982:	ef 90       	pop	r14
    2984:	08 95       	ret

00002986 <_ZL10printErrorR14SerialCommandsPK19__FlashStringHelper>:
    2986:	0f 93       	push	r16
    2988:	1f 93       	push	r17
    298a:	cf 93       	push	r28
    298c:	df 93       	push	r29
    298e:	ec 01       	movw	r28, r24
    2990:	8b 01       	movw	r16, r22
    2992:	62 e0       	ldi	r22, 0x02	; 2
    2994:	71 e0       	ldi	r23, 0x01	; 1
    2996:	88 81       	ld	r24, Y
    2998:	99 81       	ldd	r25, Y+1	; 0x01
    299a:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    299e:	b8 01       	movw	r22, r16
    29a0:	88 81       	ld	r24, Y
    29a2:	99 81       	ldd	r25, Y+1	; 0x01
    29a4:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    29a8:	df 91       	pop	r29
    29aa:	cf 91       	pop	r28
    29ac:	1f 91       	pop	r17
    29ae:	0f 91       	pop	r16
    29b0:	08 95       	ret

000029b2 <_ZL7printOKR14SerialCommands>:
    29b2:	6d ef       	ldi	r22, 0xFD	; 253
    29b4:	70 e0       	ldi	r23, 0x00	; 0
    29b6:	fc 01       	movw	r30, r24
    29b8:	80 81       	ld	r24, Z
    29ba:	91 81       	ldd	r25, Z+1	; 0x01
    29bc:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    29c0:	08 95       	ret

000029c2 <_Z26commandResetForProgrammingR14SerialCommandsR4Args>:
    29c2:	87 e7       	ldi	r24, 0x77	; 119
    29c4:	97 e7       	ldi	r25, 0x77	; 119
    29c6:	90 93 01 08 	sts	0x0801, r25	; 0x800801 <__bss_end+0x1d0>
    29ca:	80 93 00 08 	sts	0x0800, r24	; 0x800800 <__bss_end+0x1cf>
    29ce:	0e 94 51 0e 	call	0x1ca2	; 0x1ca2 <_ZN18WatchdogController8resetMCUEv.constprop.124>

000029d2 <_Z12commandResetR14SerialCommandsR4Args>:
    29d2:	0e 94 51 0e 	call	0x1ca2	; 0x1ca2 <_ZN18WatchdogController8resetMCUEv.constprop.124>

000029d6 <_Z12commandStateR14SerialCommandsR4Args>:
    29d6:	cf 93       	push	r28
    29d8:	df 93       	push	r29
    29da:	ec 01       	movw	r28, r24
    29dc:	60 91 84 05 	lds	r22, 0x0584	; 0x800584 <keyboardController+0x14>
    29e0:	70 e0       	ldi	r23, 0x00	; 0
    29e2:	88 81       	ld	r24, Y
    29e4:	99 81       	ldd	r25, Y+1	; 0x01
    29e6:	0e 94 73 10 	call	0x20e6	; 0x20e6 <_ZN5Print7printlnEii.constprop.129>
    29ea:	ce 01       	movw	r24, r28
    29ec:	0e 94 d9 14 	call	0x29b2	; 0x29b2 <_ZL7printOKR14SerialCommands>
    29f0:	df 91       	pop	r29
    29f2:	cf 91       	pop	r28
    29f4:	08 95       	ret

000029f6 <_Z17commandStatisticsR14SerialCommandsR4Args>:
    29f6:	af 92       	push	r10
    29f8:	bf 92       	push	r11
    29fa:	cf 92       	push	r12
    29fc:	df 92       	push	r13
    29fe:	ff 92       	push	r15
    2a00:	0f 93       	push	r16
    2a02:	1f 93       	push	r17
    2a04:	cf 93       	push	r28
    2a06:	df 93       	push	r29
    2a08:	6c 01       	movw	r12, r24
    2a0a:	fc 01       	movw	r30, r24
    2a0c:	c0 81       	ld	r28, Z
    2a0e:	d1 81       	ldd	r29, Z+1	; 0x01
    2a10:	ce 01       	movw	r24, r28
    2a12:	0e 94 17 11 	call	0x222e	; 0x222e <_ZN11MemoryUsage10printStarsER5Print>
    2a16:	8d e0       	ldi	r24, 0x0D	; 13
    2a18:	a8 2e       	mov	r10, r24
    2a1a:	81 e0       	ldi	r24, 0x01	; 1
    2a1c:	b8 2e       	mov	r11, r24
    2a1e:	f1 2c       	mov	r15, r1
    2a20:	f5 01       	movw	r30, r10
    2a22:	01 91       	ld	r16, Z+
    2a24:	11 91       	ld	r17, Z+
    2a26:	5f 01       	movw	r10, r30
    2a28:	01 15       	cp	r16, r1
    2a2a:	11 05       	cpc	r17, r1
    2a2c:	09 f4       	brne	.+2      	; 0x2a30 <_Z17commandStatisticsR14SerialCommandsR4Args+0x3a>
    2a2e:	47 c0       	rjmp	.+142    	; 0x2abe <_Z17commandStatisticsR14SerialCommandsR4Args+0xc8>
    2a30:	65 e4       	ldi	r22, 0x45	; 69
    2a32:	71 e0       	ldi	r23, 0x01	; 1
    2a34:	ce 01       	movw	r24, r28
    2a36:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2a3a:	f8 01       	movw	r30, r16
    2a3c:	60 81       	ld	r22, Z
    2a3e:	71 81       	ldd	r23, Z+1	; 0x01
    2a40:	61 15       	cp	r22, r1
    2a42:	71 05       	cpc	r23, r1
    2a44:	11 f4       	brne	.+4      	; 0x2a4a <_Z17commandStatisticsR14SerialCommandsR4Args+0x54>
    2a46:	60 e2       	ldi	r22, 0x20	; 32
    2a48:	71 e0       	ldi	r23, 0x01	; 1
    2a4a:	ce 01       	movw	r24, r28
    2a4c:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    2a50:	6f e3       	ldi	r22, 0x3F	; 63
    2a52:	71 e0       	ldi	r23, 0x01	; 1
    2a54:	ce 01       	movw	r24, r28
    2a56:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2a5a:	f8 01       	movw	r30, r16
    2a5c:	44 81       	ldd	r20, Z+4	; 0x04
    2a5e:	55 81       	ldd	r21, Z+5	; 0x05
    2a60:	70 e0       	ldi	r23, 0x00	; 0
    2a62:	60 e0       	ldi	r22, 0x00	; 0
    2a64:	2a e0       	ldi	r18, 0x0A	; 10
    2a66:	ce 01       	movw	r24, r28
    2a68:	0e 94 df 0f 	call	0x1fbe	; 0x1fbe <_ZN5Print11printNumberEmh>
    2a6c:	66 e3       	ldi	r22, 0x36	; 54
    2a6e:	71 e0       	ldi	r23, 0x01	; 1
    2a70:	ce 01       	movw	r24, r28
    2a72:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2a76:	f8 01       	movw	r30, r16
    2a78:	46 81       	ldd	r20, Z+6	; 0x06
    2a7a:	57 81       	ldd	r21, Z+7	; 0x07
    2a7c:	70 e0       	ldi	r23, 0x00	; 0
    2a7e:	60 e0       	ldi	r22, 0x00	; 0
    2a80:	2a e0       	ldi	r18, 0x0A	; 10
    2a82:	ce 01       	movw	r24, r28
    2a84:	0e 94 df 0f 	call	0x1fbe	; 0x1fbe <_ZN5Print11printNumberEmh>
    2a88:	6d e2       	ldi	r22, 0x2D	; 45
    2a8a:	71 e0       	ldi	r23, 0x01	; 1
    2a8c:	ce 01       	movw	r24, r28
    2a8e:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2a92:	f8 01       	movw	r30, r16
    2a94:	40 85       	ldd	r20, Z+8	; 0x08
    2a96:	51 85       	ldd	r21, Z+9	; 0x09
    2a98:	70 e0       	ldi	r23, 0x00	; 0
    2a9a:	60 e0       	ldi	r22, 0x00	; 0
    2a9c:	2a e0       	ldi	r18, 0x0A	; 10
    2a9e:	ce 01       	movw	r24, r28
    2aa0:	0e 94 df 0f 	call	0x1fbe	; 0x1fbe <_ZN5Print11printNumberEmh>
    2aa4:	6a e2       	ldi	r22, 0x2A	; 42
    2aa6:	71 e0       	ldi	r23, 0x01	; 1
    2aa8:	ce 01       	movw	r24, r28
    2aaa:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    2aae:	fb e0       	ldi	r31, 0x0B	; 11
    2ab0:	ff 16       	cp	r15, r31
    2ab2:	49 f0       	breq	.+18     	; 0x2ac6 <_Z17commandStatisticsR14SerialCommandsR4Args+0xd0>
    2ab4:	61 e5       	ldi	r22, 0x51	; 81
    2ab6:	71 e0       	ldi	r23, 0x01	; 1
    2ab8:	ce 01       	movw	r24, r28
    2aba:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    2abe:	f3 94       	inc	r15
    2ac0:	8c e0       	ldi	r24, 0x0C	; 12
    2ac2:	f8 12       	cpse	r15, r24
    2ac4:	ad cf       	rjmp	.-166    	; 0x2a20 <_Z17commandStatisticsR14SerialCommandsR4Args+0x2a>
    2ac6:	ce 01       	movw	r24, r28
    2ac8:	0e 94 17 11 	call	0x222e	; 0x222e <_ZN11MemoryUsage10printStarsER5Print>
    2acc:	c6 01       	movw	r24, r12
    2ace:	0e 94 d9 14 	call	0x29b2	; 0x29b2 <_ZL7printOKR14SerialCommands>
    2ad2:	df 91       	pop	r29
    2ad4:	cf 91       	pop	r28
    2ad6:	1f 91       	pop	r17
    2ad8:	0f 91       	pop	r16
    2ada:	ff 90       	pop	r15
    2adc:	df 90       	pop	r13
    2ade:	cf 90       	pop	r12
    2ae0:	bf 90       	pop	r11
    2ae2:	af 90       	pop	r10
    2ae4:	08 95       	ret

00002ae6 <_Z10commandIrqR14SerialCommandsR4Args>:
    2ae6:	cf 93       	push	r28
    2ae8:	df 93       	push	r29
    2aea:	ec 01       	movw	r28, r24
    2aec:	88 81       	ld	r24, Y
    2aee:	99 81       	ldd	r25, Y+1	; 0x01
    2af0:	0e 94 1c 11 	call	0x2238	; 0x2238 <_ZNK19StatisticController19printInterruptTableER5Print.constprop.132>
    2af4:	ce 01       	movw	r24, r28
    2af6:	0e 94 d9 14 	call	0x29b2	; 0x29b2 <_ZL7printOKR14SerialCommands>
    2afa:	df 91       	pop	r29
    2afc:	cf 91       	pop	r28
    2afe:	08 95       	ret

00002b00 <_Z11commandPingR14SerialCommandsR4Args>:
    2b00:	cf 93       	push	r28
    2b02:	df 93       	push	r29
    2b04:	ec 01       	movw	r28, r24
    2b06:	6b e1       	ldi	r22, 0x1B	; 27
    2b08:	71 e0       	ldi	r23, 0x01	; 1
    2b0a:	88 81       	ld	r24, Y
    2b0c:	99 81       	ldd	r25, Y+1	; 0x01
    2b0e:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    2b12:	ce 01       	movw	r24, r28
    2b14:	0e 94 d9 14 	call	0x29b2	; 0x29b2 <_ZL7printOKR14SerialCommands>
    2b18:	df 91       	pop	r29
    2b1a:	cf 91       	pop	r28
    2b1c:	08 95       	ret

00002b1e <_ZN11MemoryUsage10ramDisplayER5Print>:
    2b1e:	a6 e0       	ldi	r26, 0x06	; 6
    2b20:	b0 e0       	ldi	r27, 0x00	; 0
    2b22:	e5 e9       	ldi	r30, 0x95	; 149
    2b24:	f5 e1       	ldi	r31, 0x15	; 21
    2b26:	0c 94 98 34 	jmp	0x6930	; 0x6930 <__prologue_saves__>
    2b2a:	9c 83       	std	Y+4, r25	; 0x04
    2b2c:	8b 83       	std	Y+3, r24	; 0x03
    2b2e:	06 e9       	ldi	r16, 0x96	; 150
    2b30:	11 e0       	ldi	r17, 0x01	; 1
    2b32:	98 01       	movw	r18, r16
    2b34:	20 50       	subi	r18, 0x00	; 0
    2b36:	31 40       	sbci	r19, 0x01	; 1
    2b38:	3e 83       	std	Y+6, r19	; 0x06
    2b3a:	2d 83       	std	Y+5, r18	; 0x05
    2b3c:	81 e3       	ldi	r24, 0x31	; 49
    2b3e:	96 e0       	ldi	r25, 0x06	; 6
    2b40:	9c 01       	movw	r18, r24
    2b42:	26 59       	subi	r18, 0x96	; 150
    2b44:	31 40       	sbci	r19, 0x01	; 1
    2b46:	3a 83       	std	Y+2, r19	; 0x02
    2b48:	29 83       	std	Y+1, r18	; 0x01
    2b4a:	e0 91 2b 06 	lds	r30, 0x062B	; 0x80062b <__brkval>
    2b4e:	f0 91 2c 06 	lds	r31, 0x062C	; 0x80062c <__brkval+0x1>
    2b52:	7f 01       	movw	r14, r30
    2b54:	30 97       	sbiw	r30, 0x00	; 0
    2b56:	21 f4       	brne	.+8      	; 0x2b60 <_ZN11MemoryUsage10ramDisplayER5Print+0x42>
    2b58:	81 e3       	ldi	r24, 0x31	; 49
    2b5a:	e8 2e       	mov	r14, r24
    2b5c:	86 e0       	ldi	r24, 0x06	; 6
    2b5e:	f8 2e       	mov	r15, r24
    2b60:	c7 01       	movw	r24, r14
    2b62:	81 53       	subi	r24, 0x31	; 49
    2b64:	96 40       	sbci	r25, 0x06	; 6
    2b66:	4c 01       	movw	r8, r24
    2b68:	8d b7       	in	r24, 0x3d	; 61
    2b6a:	9e b7       	in	r25, 0x3e	; 62
    2b6c:	20 e0       	ldi	r18, 0x00	; 0
    2b6e:	3b e0       	ldi	r19, 0x0B	; 11
    2b70:	29 01       	movw	r4, r18
    2b72:	48 1a       	sub	r4, r24
    2b74:	59 0a       	sbc	r5, r25
    2b76:	30 97       	sbiw	r30, 0x00	; 0
    2b78:	11 f4       	brne	.+4      	; 0x2b7e <_ZN11MemoryUsage10ramDisplayER5Print+0x60>
    2b7a:	e1 e3       	ldi	r30, 0x31	; 49
    2b7c:	f6 e0       	ldi	r31, 0x06	; 6
    2b7e:	6d b6       	in	r6, 0x3d	; 61
    2b80:	7e b6       	in	r7, 0x3e	; 62
    2b82:	6e 1a       	sub	r6, r30
    2b84:	7f 0a       	sbc	r7, r31
    2b86:	ad b7       	in	r26, 0x3d	; 61
    2b88:	be b7       	in	r27, 0x3e	; 62
    2b8a:	bd 01       	movw	r22, r26
    2b8c:	90 e0       	ldi	r25, 0x00	; 0
    2b8e:	80 e0       	ldi	r24, 0x00	; 0
    2b90:	50 e0       	ldi	r21, 0x00	; 0
    2b92:	40 e0       	ldi	r20, 0x00	; 0
    2b94:	30 e0       	ldi	r19, 0x00	; 0
    2b96:	20 e0       	ldi	r18, 0x00	; 0
    2b98:	ea 17       	cp	r30, r26
    2b9a:	fb 07       	cpc	r31, r27
    2b9c:	08 f5       	brcc	.+66     	; 0x2be0 <_ZN11MemoryUsage10ramDisplayER5Print+0xc2>
    2b9e:	5f 01       	movw	r10, r30
    2ba0:	1f ef       	ldi	r17, 0xFF	; 255
    2ba2:	a1 1a       	sub	r10, r17
    2ba4:	b1 0a       	sbc	r11, r17
    2ba6:	d0 80       	ld	r13, Z
    2ba8:	15 ec       	ldi	r17, 0xC5	; 197
    2baa:	d1 12       	cpse	r13, r17
    2bac:	05 c0       	rjmp	.+10     	; 0x2bb8 <_ZN11MemoryUsage10ramDisplayER5Print+0x9a>
    2bae:	00 97       	sbiw	r24, 0x00	; 0
    2bb0:	09 f4       	brne	.+2      	; 0x2bb4 <_ZN11MemoryUsage10ramDisplayER5Print+0x96>
    2bb2:	cf 01       	movw	r24, r30
    2bb4:	f5 01       	movw	r30, r10
    2bb6:	f0 cf       	rjmp	.-32     	; 0x2b98 <_ZN11MemoryUsage10ramDisplayER5Print+0x7a>
    2bb8:	00 97       	sbiw	r24, 0x00	; 0
    2bba:	e1 f3       	breq	.-8      	; 0x2bb4 <_ZN11MemoryUsage10ramDisplayER5Print+0x96>
    2bbc:	21 15       	cp	r18, r1
    2bbe:	31 05       	cpc	r19, r1
    2bc0:	61 f0       	breq	.+24     	; 0x2bda <_ZN11MemoryUsage10ramDisplayER5Print+0xbc>
    2bc2:	1a 01       	movw	r2, r20
    2bc4:	22 1a       	sub	r2, r18
    2bc6:	33 0a       	sbc	r3, r19
    2bc8:	6f 01       	movw	r12, r30
    2bca:	c8 1a       	sub	r12, r24
    2bcc:	d9 0a       	sbc	r13, r25
    2bce:	2c 14       	cp	r2, r12
    2bd0:	3d 04       	cpc	r3, r13
    2bd2:	1c f0       	brlt	.+6      	; 0x2bda <_ZN11MemoryUsage10ramDisplayER5Print+0xbc>
    2bd4:	90 e0       	ldi	r25, 0x00	; 0
    2bd6:	80 e0       	ldi	r24, 0x00	; 0
    2bd8:	ed cf       	rjmp	.-38     	; 0x2bb4 <_ZN11MemoryUsage10ramDisplayER5Print+0x96>
    2bda:	af 01       	movw	r20, r30
    2bdc:	9c 01       	movw	r18, r24
    2bde:	fa cf       	rjmp	.-12     	; 0x2bd4 <_ZN11MemoryUsage10ramDisplayER5Print+0xb6>
    2be0:	00 97       	sbiw	r24, 0x00	; 0
    2be2:	59 f0       	breq	.+22     	; 0x2bfa <_ZN11MemoryUsage10ramDisplayER5Print+0xdc>
    2be4:	21 15       	cp	r18, r1
    2be6:	31 05       	cpc	r19, r1
    2be8:	51 f0       	breq	.+20     	; 0x2bfe <_ZN11MemoryUsage10ramDisplayER5Print+0xe0>
    2bea:	a8 1b       	sub	r26, r24
    2bec:	b9 0b       	sbc	r27, r25
    2bee:	fa 01       	movw	r30, r20
    2bf0:	e2 1b       	sub	r30, r18
    2bf2:	f3 0b       	sbc	r31, r19
    2bf4:	ea 17       	cp	r30, r26
    2bf6:	fb 07       	cpc	r31, r27
    2bf8:	14 f0       	brlt	.+4      	; 0x2bfe <_ZN11MemoryUsage10ramDisplayER5Print+0xe0>
    2bfa:	ba 01       	movw	r22, r20
    2bfc:	c9 01       	movw	r24, r18
    2bfe:	6b 01       	movw	r12, r22
    2c00:	c8 1a       	sub	r12, r24
    2c02:	d9 0a       	sbc	r13, r25
    2c04:	67 2b       	or	r22, r23
    2c06:	11 f4       	brne	.+4      	; 0x2c0c <_ZN11MemoryUsage10ramDisplayER5Print+0xee>
    2c08:	d1 2c       	mov	r13, r1
    2c0a:	c1 2c       	mov	r12, r1
    2c0c:	8b 81       	ldd	r24, Y+3	; 0x03
    2c0e:	9c 81       	ldd	r25, Y+4	; 0x04
    2c10:	0e 94 17 11 	call	0x222e	; 0x222e <_ZN11MemoryUsage10printStarsER5Print>
    2c14:	6d ec       	ldi	r22, 0xCD	; 205
    2c16:	72 e0       	ldi	r23, 0x02	; 2
    2c18:	8b 81       	ldd	r24, Y+3	; 0x03
    2c1a:	9c 81       	ldd	r25, Y+4	; 0x04
    2c1c:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2c20:	60 e0       	ldi	r22, 0x00	; 0
    2c22:	71 e0       	ldi	r23, 0x01	; 1
    2c24:	8b 81       	ldd	r24, Y+3	; 0x03
    2c26:	9c 81       	ldd	r25, Y+4	; 0x04
    2c28:	0e 94 50 10 	call	0x20a0	; 0x20a0 <_ZN5Print5printEii.constprop.130>
    2c2c:	68 ef       	ldi	r22, 0xF8	; 248
    2c2e:	73 e0       	ldi	r23, 0x03	; 3
    2c30:	8b 81       	ldd	r24, Y+3	; 0x03
    2c32:	9c 81       	ldd	r25, Y+4	; 0x04
    2c34:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    2c38:	65 ee       	ldi	r22, 0xE5	; 229
    2c3a:	73 e0       	ldi	r23, 0x03	; 3
    2c3c:	8b 81       	ldd	r24, Y+3	; 0x03
    2c3e:	9c 81       	ldd	r25, Y+4	; 0x04
    2c40:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2c44:	8b 81       	ldd	r24, Y+3	; 0x03
    2c46:	9c 81       	ldd	r25, Y+4	; 0x04
    2c48:	0e 94 57 10 	call	0x20ae	; 0x20ae <_ZN5Print7printlnEv>
    2c4c:	6b e9       	ldi	r22, 0x9B	; 155
    2c4e:	73 e0       	ldi	r23, 0x03	; 3
    2c50:	8b 81       	ldd	r24, Y+3	; 0x03
    2c52:	9c 81       	ldd	r25, Y+4	; 0x04
    2c54:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2c58:	6d 81       	ldd	r22, Y+5	; 0x05
    2c5a:	7e 81       	ldd	r23, Y+6	; 0x06
    2c5c:	8b 81       	ldd	r24, Y+3	; 0x03
    2c5e:	9c 81       	ldd	r25, Y+4	; 0x04
    2c60:	0e 94 73 10 	call	0x20e6	; 0x20e6 <_ZN5Print7printlnEii.constprop.129>
    2c64:	6d ec       	ldi	r22, 0xCD	; 205
    2c66:	72 e0       	ldi	r23, 0x02	; 2
    2c68:	8b 81       	ldd	r24, Y+3	; 0x03
    2c6a:	9c 81       	ldd	r25, Y+4	; 0x04
    2c6c:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2c70:	66 e9       	ldi	r22, 0x96	; 150
    2c72:	71 e0       	ldi	r23, 0x01	; 1
    2c74:	8b 81       	ldd	r24, Y+3	; 0x03
    2c76:	9c 81       	ldd	r25, Y+4	; 0x04
    2c78:	0e 94 50 10 	call	0x20a0	; 0x20a0 <_ZN5Print5printEii.constprop.130>
    2c7c:	69 ec       	ldi	r22, 0xC9	; 201
    2c7e:	73 e0       	ldi	r23, 0x03	; 3
    2c80:	8b 81       	ldd	r24, Y+3	; 0x03
    2c82:	9c 81       	ldd	r25, Y+4	; 0x04
    2c84:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    2c88:	66 eb       	ldi	r22, 0xB6	; 182
    2c8a:	73 e0       	ldi	r23, 0x03	; 3
    2c8c:	8b 81       	ldd	r24, Y+3	; 0x03
    2c8e:	9c 81       	ldd	r25, Y+4	; 0x04
    2c90:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2c94:	8b 81       	ldd	r24, Y+3	; 0x03
    2c96:	9c 81       	ldd	r25, Y+4	; 0x04
    2c98:	0e 94 57 10 	call	0x20ae	; 0x20ae <_ZN5Print7printlnEv>
    2c9c:	6b e9       	ldi	r22, 0x9B	; 155
    2c9e:	73 e0       	ldi	r23, 0x03	; 3
    2ca0:	8b 81       	ldd	r24, Y+3	; 0x03
    2ca2:	9c 81       	ldd	r25, Y+4	; 0x04
    2ca4:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2ca8:	69 81       	ldd	r22, Y+1	; 0x01
    2caa:	7a 81       	ldd	r23, Y+2	; 0x02
    2cac:	8b 81       	ldd	r24, Y+3	; 0x03
    2cae:	9c 81       	ldd	r25, Y+4	; 0x04
    2cb0:	0e 94 73 10 	call	0x20e6	; 0x20e6 <_ZN5Print7printlnEii.constprop.129>
    2cb4:	6d ec       	ldi	r22, 0xCD	; 205
    2cb6:	72 e0       	ldi	r23, 0x02	; 2
    2cb8:	8b 81       	ldd	r24, Y+3	; 0x03
    2cba:	9c 81       	ldd	r25, Y+4	; 0x04
    2cbc:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2cc0:	61 e3       	ldi	r22, 0x31	; 49
    2cc2:	76 e0       	ldi	r23, 0x06	; 6
    2cc4:	8b 81       	ldd	r24, Y+3	; 0x03
    2cc6:	9c 81       	ldd	r25, Y+4	; 0x04
    2cc8:	0e 94 50 10 	call	0x20a0	; 0x20a0 <_ZN5Print5printEii.constprop.130>
    2ccc:	6f e7       	ldi	r22, 0x7F	; 127
    2cce:	73 e0       	ldi	r23, 0x03	; 3
    2cd0:	8b 81       	ldd	r24, Y+3	; 0x03
    2cd2:	9c 81       	ldd	r25, Y+4	; 0x04
    2cd4:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    2cd8:	64 e6       	ldi	r22, 0x64	; 100
    2cda:	73 e0       	ldi	r23, 0x03	; 3
    2cdc:	8b 81       	ldd	r24, Y+3	; 0x03
    2cde:	9c 81       	ldd	r25, Y+4	; 0x04
    2ce0:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2ce4:	b4 01       	movw	r22, r8
    2ce6:	8b 81       	ldd	r24, Y+3	; 0x03
    2ce8:	9c 81       	ldd	r25, Y+4	; 0x04
    2cea:	0e 94 73 10 	call	0x20e6	; 0x20e6 <_ZN5Print7printlnEii.constprop.129>
    2cee:	6d ec       	ldi	r22, 0xCD	; 205
    2cf0:	72 e0       	ldi	r23, 0x02	; 2
    2cf2:	8b 81       	ldd	r24, Y+3	; 0x03
    2cf4:	9c 81       	ldd	r25, Y+4	; 0x04
    2cf6:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2cfa:	b7 01       	movw	r22, r14
    2cfc:	8b 81       	ldd	r24, Y+3	; 0x03
    2cfe:	9c 81       	ldd	r25, Y+4	; 0x04
    2d00:	0e 94 50 10 	call	0x20a0	; 0x20a0 <_ZN5Print5printEii.constprop.130>
    2d04:	6e e3       	ldi	r22, 0x3E	; 62
    2d06:	73 e0       	ldi	r23, 0x03	; 3
    2d08:	8b 81       	ldd	r24, Y+3	; 0x03
    2d0a:	9c 81       	ldd	r25, Y+4	; 0x04
    2d0c:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    2d10:	62 e0       	ldi	r22, 0x02	; 2
    2d12:	73 e0       	ldi	r23, 0x03	; 3
    2d14:	8b 81       	ldd	r24, Y+3	; 0x03
    2d16:	9c 81       	ldd	r25, Y+4	; 0x04
    2d18:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2d1c:	8b 81       	ldd	r24, Y+3	; 0x03
    2d1e:	9c 81       	ldd	r25, Y+4	; 0x04
    2d20:	0e 94 57 10 	call	0x20ae	; 0x20ae <_ZN5Print7printlnEv>
    2d24:	62 e0       	ldi	r22, 0x02	; 2
    2d26:	73 e0       	ldi	r23, 0x03	; 3
    2d28:	8b 81       	ldd	r24, Y+3	; 0x03
    2d2a:	9c 81       	ldd	r25, Y+4	; 0x04
    2d2c:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2d30:	8b 81       	ldd	r24, Y+3	; 0x03
    2d32:	9c 81       	ldd	r25, Y+4	; 0x04
    2d34:	0e 94 57 10 	call	0x20ae	; 0x20ae <_ZN5Print7printlnEv>
    2d38:	63 e2       	ldi	r22, 0x23	; 35
    2d3a:	73 e0       	ldi	r23, 0x03	; 3
    2d3c:	8b 81       	ldd	r24, Y+3	; 0x03
    2d3e:	9c 81       	ldd	r25, Y+4	; 0x04
    2d40:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2d44:	b3 01       	movw	r22, r6
    2d46:	8b 81       	ldd	r24, Y+3	; 0x03
    2d48:	9c 81       	ldd	r25, Y+4	; 0x04
    2d4a:	0e 94 50 10 	call	0x20a0	; 0x20a0 <_ZN5Print5printEii.constprop.130>
    2d4e:	65 e1       	ldi	r22, 0x15	; 21
    2d50:	73 e0       	ldi	r23, 0x03	; 3
    2d52:	8b 81       	ldd	r24, Y+3	; 0x03
    2d54:	9c 81       	ldd	r25, Y+4	; 0x04
    2d56:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2d5a:	b6 01       	movw	r22, r12
    2d5c:	8b 81       	ldd	r24, Y+3	; 0x03
    2d5e:	9c 81       	ldd	r25, Y+4	; 0x04
    2d60:	0e 94 73 10 	call	0x20e6	; 0x20e6 <_ZN5Print7printlnEii.constprop.129>
    2d64:	62 e0       	ldi	r22, 0x02	; 2
    2d66:	73 e0       	ldi	r23, 0x03	; 3
    2d68:	8b 81       	ldd	r24, Y+3	; 0x03
    2d6a:	9c 81       	ldd	r25, Y+4	; 0x04
    2d6c:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2d70:	8b 81       	ldd	r24, Y+3	; 0x03
    2d72:	9c 81       	ldd	r25, Y+4	; 0x04
    2d74:	0e 94 57 10 	call	0x20ae	; 0x20ae <_ZN5Print7printlnEv>
    2d78:	62 e0       	ldi	r22, 0x02	; 2
    2d7a:	73 e0       	ldi	r23, 0x03	; 3
    2d7c:	8b 81       	ldd	r24, Y+3	; 0x03
    2d7e:	9c 81       	ldd	r25, Y+4	; 0x04
    2d80:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2d84:	8b 81       	ldd	r24, Y+3	; 0x03
    2d86:	9c 81       	ldd	r25, Y+4	; 0x04
    2d88:	0e 94 57 10 	call	0x20ae	; 0x20ae <_ZN5Print7printlnEv>
    2d8c:	6d ec       	ldi	r22, 0xCD	; 205
    2d8e:	72 e0       	ldi	r23, 0x02	; 2
    2d90:	8b 81       	ldd	r24, Y+3	; 0x03
    2d92:	9c 81       	ldd	r25, Y+4	; 0x04
    2d94:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2d98:	6d b7       	in	r22, 0x3d	; 61
    2d9a:	7e b7       	in	r23, 0x3e	; 62
    2d9c:	8b 81       	ldd	r24, Y+3	; 0x03
    2d9e:	9c 81       	ldd	r25, Y+4	; 0x04
    2da0:	0e 94 50 10 	call	0x20a0	; 0x20a0 <_ZN5Print5printEii.constprop.130>
    2da4:	6c ef       	ldi	r22, 0xFC	; 252
    2da6:	72 e0       	ldi	r23, 0x02	; 2
    2da8:	8b 81       	ldd	r24, Y+3	; 0x03
    2daa:	9c 81       	ldd	r25, Y+4	; 0x04
    2dac:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    2db0:	61 ee       	ldi	r22, 0xE1	; 225
    2db2:	72 e0       	ldi	r23, 0x02	; 2
    2db4:	8b 81       	ldd	r24, Y+3	; 0x03
    2db6:	9c 81       	ldd	r25, Y+4	; 0x04
    2db8:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2dbc:	b2 01       	movw	r22, r4
    2dbe:	8b 81       	ldd	r24, Y+3	; 0x03
    2dc0:	9c 81       	ldd	r25, Y+4	; 0x04
    2dc2:	0e 94 73 10 	call	0x20e6	; 0x20e6 <_ZN5Print7printlnEii.constprop.129>
    2dc6:	6d ec       	ldi	r22, 0xCD	; 205
    2dc8:	72 e0       	ldi	r23, 0x02	; 2
    2dca:	8b 81       	ldd	r24, Y+3	; 0x03
    2dcc:	9c 81       	ldd	r25, Y+4	; 0x04
    2dce:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2dd2:	6f ef       	ldi	r22, 0xFF	; 255
    2dd4:	7a e0       	ldi	r23, 0x0A	; 10
    2dd6:	8b 81       	ldd	r24, Y+3	; 0x03
    2dd8:	9c 81       	ldd	r25, Y+4	; 0x04
    2dda:	0e 94 50 10 	call	0x20a0	; 0x20a0 <_ZN5Print5printEii.constprop.130>
    2dde:	69 eb       	ldi	r22, 0xB9	; 185
    2de0:	72 e0       	ldi	r23, 0x02	; 2
    2de2:	8b 81       	ldd	r24, Y+3	; 0x03
    2de4:	9c 81       	ldd	r25, Y+4	; 0x04
    2de6:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    2dea:	8b 81       	ldd	r24, Y+3	; 0x03
    2dec:	9c 81       	ldd	r25, Y+4	; 0x04
    2dee:	0e 94 17 11 	call	0x222e	; 0x222e <_ZN11MemoryUsage10printStarsER5Print>
    2df2:	24 e6       	ldi	r18, 0x64	; 100
    2df4:	c2 16       	cp	r12, r18
    2df6:	d1 04       	cpc	r13, r1
    2df8:	3c f5       	brge	.+78     	; 0x2e48 <_ZN11MemoryUsage10ramDisplayER5Print+0x32a>
    2dfa:	e0 91 2b 06 	lds	r30, 0x062B	; 0x80062b <__brkval>
    2dfe:	f0 91 2c 06 	lds	r31, 0x062C	; 0x80062c <__brkval+0x1>
    2e02:	30 97       	sbiw	r30, 0x00	; 0
    2e04:	11 f4       	brne	.+4      	; 0x2e0a <_ZN11MemoryUsage10ramDisplayER5Print+0x2ec>
    2e06:	e1 e3       	ldi	r30, 0x31	; 49
    2e08:	f6 e0       	ldi	r31, 0x06	; 6
    2e0a:	cf 01       	movw	r24, r30
    2e0c:	8c 59       	subi	r24, 0x9C	; 156
    2e0e:	9f 4f       	sbci	r25, 0xFF	; 255
    2e10:	10 e0       	ldi	r17, 0x00	; 0
    2e12:	00 e0       	ldi	r16, 0x00	; 0
    2e14:	21 91       	ld	r18, Z+
    2e16:	25 3c       	cpi	r18, 0xC5	; 197
    2e18:	11 f4       	brne	.+4      	; 0x2e1e <_ZN11MemoryUsage10ramDisplayER5Print+0x300>
    2e1a:	0f 5f       	subi	r16, 0xFF	; 255
    2e1c:	1f 4f       	sbci	r17, 0xFF	; 255
    2e1e:	e8 17       	cp	r30, r24
    2e20:	f9 07       	cpc	r31, r25
    2e22:	c1 f7       	brne	.-16     	; 0x2e14 <_ZN11MemoryUsage10ramDisplayER5Print+0x2f6>
    2e24:	63 e8       	ldi	r22, 0x83	; 131
    2e26:	72 e0       	ldi	r23, 0x02	; 2
    2e28:	8b 81       	ldd	r24, Y+3	; 0x03
    2e2a:	9c 81       	ldd	r25, Y+4	; 0x04
    2e2c:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2e30:	64 e6       	ldi	r22, 0x64	; 100
    2e32:	70 e0       	ldi	r23, 0x00	; 0
    2e34:	60 1b       	sub	r22, r16
    2e36:	71 0b       	sbc	r23, r17
    2e38:	8b 81       	ldd	r24, Y+3	; 0x03
    2e3a:	9c 81       	ldd	r25, Y+4	; 0x04
    2e3c:	0e 94 73 10 	call	0x20e6	; 0x20e6 <_ZN5Print7printlnEii.constprop.129>
    2e40:	8b 81       	ldd	r24, Y+3	; 0x03
    2e42:	9c 81       	ldd	r25, Y+4	; 0x04
    2e44:	0e 94 17 11 	call	0x222e	; 0x222e <_ZN11MemoryUsage10printStarsER5Print>
    2e48:	26 96       	adiw	r28, 0x06	; 6
    2e4a:	e2 e1       	ldi	r30, 0x12	; 18
    2e4c:	0c 94 b4 34 	jmp	0x6968	; 0x6968 <__epilogue_restores__>

00002e50 <_Z10commandRamR14SerialCommandsR4Args>:
    2e50:	cf 93       	push	r28
    2e52:	df 93       	push	r29
    2e54:	ec 01       	movw	r28, r24
    2e56:	88 81       	ld	r24, Y
    2e58:	99 81       	ldd	r25, Y+1	; 0x01
    2e5a:	0e 94 8f 15 	call	0x2b1e	; 0x2b1e <_ZN11MemoryUsage10ramDisplayER5Print>
    2e5e:	ce 01       	movw	r24, r28
    2e60:	0e 94 d9 14 	call	0x29b2	; 0x29b2 <_ZL7printOKR14SerialCommands>
    2e64:	df 91       	pop	r29
    2e66:	cf 91       	pop	r28
    2e68:	08 95       	ret

00002e6a <_ZN6String4copyEPKcj>:
    2e6a:	ef 92       	push	r14
    2e6c:	ff 92       	push	r15
    2e6e:	0f 93       	push	r16
    2e70:	1f 93       	push	r17
    2e72:	cf 93       	push	r28
    2e74:	df 93       	push	r29
    2e76:	ec 01       	movw	r28, r24
    2e78:	7b 01       	movw	r14, r22
    2e7a:	8a 01       	movw	r16, r20
    2e7c:	88 81       	ld	r24, Y
    2e7e:	99 81       	ldd	r25, Y+1	; 0x01
    2e80:	00 97       	sbiw	r24, 0x00	; 0
    2e82:	29 f0       	breq	.+10     	; 0x2e8e <_ZN6String4copyEPKcj+0x24>
    2e84:	2a 81       	ldd	r18, Y+2	; 0x02
    2e86:	3b 81       	ldd	r19, Y+3	; 0x03
    2e88:	24 17       	cp	r18, r20
    2e8a:	35 07       	cpc	r19, r21
    2e8c:	88 f4       	brcc	.+34     	; 0x2eb0 <_ZN6String4copyEPKcj+0x46>
    2e8e:	b8 01       	movw	r22, r16
    2e90:	6f 5f       	subi	r22, 0xFF	; 255
    2e92:	7f 4f       	sbci	r23, 0xFF	; 255
    2e94:	0e 94 61 35 	call	0x6ac2	; 0x6ac2 <realloc>
    2e98:	00 97       	sbiw	r24, 0x00	; 0
    2e9a:	91 f0       	breq	.+36     	; 0x2ec0 <_ZN6String4copyEPKcj+0x56>
    2e9c:	99 83       	std	Y+1, r25	; 0x01
    2e9e:	88 83       	st	Y, r24
    2ea0:	1b 83       	std	Y+3, r17	; 0x03
    2ea2:	0a 83       	std	Y+2, r16	; 0x02
    2ea4:	2c 81       	ldd	r18, Y+4	; 0x04
    2ea6:	3d 81       	ldd	r19, Y+5	; 0x05
    2ea8:	23 2b       	or	r18, r19
    2eaa:	11 f4       	brne	.+4      	; 0x2eb0 <_ZN6String4copyEPKcj+0x46>
    2eac:	fc 01       	movw	r30, r24
    2eae:	10 82       	st	Z, r1
    2eb0:	1d 83       	std	Y+5, r17	; 0x05
    2eb2:	0c 83       	std	Y+4, r16	; 0x04
    2eb4:	b7 01       	movw	r22, r14
    2eb6:	88 81       	ld	r24, Y
    2eb8:	99 81       	ldd	r25, Y+1	; 0x01
    2eba:	0e 94 27 36 	call	0x6c4e	; 0x6c4e <strcpy>
    2ebe:	0c c0       	rjmp	.+24     	; 0x2ed8 <_ZN6String4copyEPKcj+0x6e>
    2ec0:	88 81       	ld	r24, Y
    2ec2:	99 81       	ldd	r25, Y+1	; 0x01
    2ec4:	00 97       	sbiw	r24, 0x00	; 0
    2ec6:	11 f0       	breq	.+4      	; 0x2ecc <_ZN6String4copyEPKcj+0x62>
    2ec8:	0e 94 b2 30 	call	0x6164	; 0x6164 <free>
    2ecc:	19 82       	std	Y+1, r1	; 0x01
    2ece:	18 82       	st	Y, r1
    2ed0:	1d 82       	std	Y+5, r1	; 0x05
    2ed2:	1c 82       	std	Y+4, r1	; 0x04
    2ed4:	1b 82       	std	Y+3, r1	; 0x03
    2ed6:	1a 82       	std	Y+2, r1	; 0x02
    2ed8:	ce 01       	movw	r24, r28
    2eda:	cd b7       	in	r28, 0x3d	; 61
    2edc:	de b7       	in	r29, 0x3e	; 62
    2ede:	e6 e0       	ldi	r30, 0x06	; 6
    2ee0:	0c 94 c0 34 	jmp	0x6980	; 0x6980 <__epilogue_restores__+0x18>

00002ee4 <_ZN14SerialCommands12printCommandERK7Command>:
    2ee4:	a6 e0       	ldi	r26, 0x06	; 6
    2ee6:	b0 e0       	ldi	r27, 0x00	; 0
    2ee8:	e8 e7       	ldi	r30, 0x78	; 120
    2eea:	f7 e1       	ldi	r31, 0x17	; 23
    2eec:	0c 94 a2 34 	jmp	0x6944	; 0x6944 <__prologue_saves__+0x14>
    2ef0:	8c 01       	movw	r16, r24
    2ef2:	7b 01       	movw	r14, r22
    2ef4:	fb 01       	movw	r30, r22
    2ef6:	82 81       	ldd	r24, Z+2	; 0x02
    2ef8:	93 81       	ldd	r25, Z+3	; 0x03
    2efa:	00 97       	sbiw	r24, 0x00	; 0
    2efc:	81 f0       	breq	.+32     	; 0x2f1e <_ZN14SerialCommands12printCommandERK7Command+0x3a>
    2efe:	9a 83       	std	Y+2, r25	; 0x02
    2f00:	89 83       	std	Y+1, r24	; 0x01
    2f02:	1c 82       	std	Y+4, r1	; 0x04
    2f04:	1b 82       	std	Y+3, r1	; 0x03
    2f06:	be 01       	movw	r22, r28
    2f08:	6f 5f       	subi	r22, 0xFF	; 255
    2f0a:	7f 4f       	sbci	r23, 0xFF	; 255
    2f0c:	c8 01       	movw	r24, r16
    2f0e:	0e 94 72 17 	call	0x2ee4	; 0x2ee4 <_ZN14SerialCommands12printCommandERK7Command>
    2f12:	60 e2       	ldi	r22, 0x20	; 32
    2f14:	f8 01       	movw	r30, r16
    2f16:	80 81       	ld	r24, Z
    2f18:	91 81       	ldd	r25, Z+1	; 0x01
    2f1a:	0e 94 5d 09 	call	0x12ba	; 0x12ba <_ZN5Print5printEc>
    2f1e:	f7 01       	movw	r30, r14
    2f20:	80 81       	ld	r24, Z
    2f22:	91 81       	ldd	r25, Z+1	; 0x01
    2f24:	fc 01       	movw	r30, r24
    2f26:	25 91       	lpm	r18, Z+
    2f28:	34 91       	lpm	r19, Z
    2f2a:	f9 01       	movw	r30, r18
    2f2c:	09 95       	icall
    2f2e:	bc 01       	movw	r22, r24
    2f30:	f8 01       	movw	r30, r16
    2f32:	80 81       	ld	r24, Z
    2f34:	91 81       	ldd	r25, Z+1	; 0x01
    2f36:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2f3a:	1e 82       	std	Y+6, r1	; 0x06
    2f3c:	f7 01       	movw	r30, r14
    2f3e:	80 81       	ld	r24, Z
    2f40:	91 81       	ldd	r25, Z+1	; 0x01
    2f42:	fc 01       	movw	r30, r24
    2f44:	34 96       	adiw	r30, 0x04	; 4
    2f46:	25 91       	lpm	r18, Z+
    2f48:	34 91       	lpm	r19, Z
    2f4a:	be 01       	movw	r22, r28
    2f4c:	6a 5f       	subi	r22, 0xFA	; 250
    2f4e:	7f 4f       	sbci	r23, 0xFF	; 255
    2f50:	f9 01       	movw	r30, r18
    2f52:	09 95       	icall
    2f54:	19 82       	std	Y+1, r1	; 0x01
    2f56:	1b 82       	std	Y+3, r1	; 0x03
    2f58:	1a 82       	std	Y+2, r1	; 0x02
    2f5a:	1d 82       	std	Y+5, r1	; 0x05
    2f5c:	1c 82       	std	Y+4, r1	; 0x04
    2f5e:	7c 01       	movw	r14, r24
    2f60:	d1 2c       	mov	r13, r1
    2f62:	c1 2c       	mov	r12, r1
    2f64:	8e 81       	ldd	r24, Y+6	; 0x06
    2f66:	8c 15       	cp	r24, r12
    2f68:	1d 04       	cpc	r1, r13
    2f6a:	a9 f1       	breq	.+106    	; 0x2fd6 <_ZN14SerialCommands12printCommandERK7Command+0xf2>
    2f6c:	a0 f1       	brcs	.+104    	; 0x2fd6 <_ZN14SerialCommands12printCommandERK7Command+0xf2>
    2f6e:	45 e0       	ldi	r20, 0x05	; 5
    2f70:	50 e0       	ldi	r21, 0x00	; 0
    2f72:	b7 01       	movw	r22, r14
    2f74:	ce 01       	movw	r24, r28
    2f76:	01 96       	adiw	r24, 0x01	; 1
    2f78:	0e 94 fd 32 	call	0x65fa	; 0x65fa <memcpy_P>
    2f7c:	60 e2       	ldi	r22, 0x20	; 32
    2f7e:	f8 01       	movw	r30, r16
    2f80:	80 81       	ld	r24, Z
    2f82:	91 81       	ldd	r25, Z+1	; 0x01
    2f84:	0e 94 5d 09 	call	0x12ba	; 0x12ba <_ZN5Print5printEc>
    2f88:	6c e3       	ldi	r22, 0x3C	; 60
    2f8a:	f8 01       	movw	r30, r16
    2f8c:	80 81       	ld	r24, Z
    2f8e:	91 81       	ldd	r25, Z+1	; 0x01
    2f90:	0e 94 5d 09 	call	0x12ba	; 0x12ba <_ZN5Print5printEc>
    2f94:	ec 81       	ldd	r30, Y+4	; 0x04
    2f96:	fd 81       	ldd	r31, Y+5	; 0x05
    2f98:	30 97       	sbiw	r30, 0x00	; 0
    2f9a:	a1 f0       	breq	.+40     	; 0x2fc4 <_ZN14SerialCommands12printCommandERK7Command+0xe0>
    2f9c:	09 95       	icall
    2f9e:	bc 01       	movw	r22, r24
    2fa0:	f8 01       	movw	r30, r16
    2fa2:	80 81       	ld	r24, Z
    2fa4:	91 81       	ldd	r25, Z+1	; 0x01
    2fa6:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    2faa:	6e e3       	ldi	r22, 0x3E	; 62
    2fac:	f8 01       	movw	r30, r16
    2fae:	80 81       	ld	r24, Z
    2fb0:	91 81       	ldd	r25, Z+1	; 0x01
    2fb2:	0e 94 5d 09 	call	0x12ba	; 0x12ba <_ZN5Print5printEc>
    2fb6:	ff ef       	ldi	r31, 0xFF	; 255
    2fb8:	cf 1a       	sub	r12, r31
    2fba:	df 0a       	sbc	r13, r31
    2fbc:	85 e0       	ldi	r24, 0x05	; 5
    2fbe:	e8 0e       	add	r14, r24
    2fc0:	f1 1c       	adc	r15, r1
    2fc2:	d0 cf       	rjmp	.-96     	; 0x2f64 <_ZN14SerialCommands12printCommandERK7Command+0x80>
    2fc4:	e9 81       	ldd	r30, Y+1	; 0x01
    2fc6:	f0 e0       	ldi	r31, 0x00	; 0
    2fc8:	ee 0f       	add	r30, r30
    2fca:	ff 1f       	adc	r31, r31
    2fcc:	e9 52       	subi	r30, 0x29	; 41
    2fce:	f6 4f       	sbci	r31, 0xF6	; 246
    2fd0:	85 91       	lpm	r24, Z+
    2fd2:	94 91       	lpm	r25, Z
    2fd4:	e4 cf       	rjmp	.-56     	; 0x2f9e <_ZN14SerialCommands12printCommandERK7Command+0xba>
    2fd6:	26 96       	adiw	r28, 0x06	; 6
    2fd8:	e8 e0       	ldi	r30, 0x08	; 8
    2fda:	0c 94 be 34 	jmp	0x697c	; 0x697c <__epilogue_restores__+0x14>

00002fde <_Z11commandHelpR14SerialCommandsR4Args>:
    2fde:	b0 e0       	ldi	r27, 0x00	; 0
    2fe0:	a0 e0       	ldi	r26, 0x00	; 0
    2fe2:	e5 ef       	ldi	r30, 0xF5	; 245
    2fe4:	f7 e1       	ldi	r31, 0x17	; 23
    2fe6:	0c 94 a2 34 	jmp	0x6944	; 0x6944 <__prologue_saves__+0x14>
    2fea:	ec 01       	movw	r28, r24
    2fec:	c8 84       	ldd	r12, Y+8	; 0x08
    2fee:	d9 84       	ldd	r13, Y+9	; 0x09
    2ff0:	0e 81       	ldd	r16, Y+6	; 0x06
    2ff2:	1f 81       	ldd	r17, Y+7	; 0x07
    2ff4:	f1 2c       	mov	r15, r1
    2ff6:	e1 2c       	mov	r14, r1
    2ff8:	ce 14       	cp	r12, r14
    2ffa:	df 04       	cpc	r13, r15
    2ffc:	11 f1       	breq	.+68     	; 0x3042 <_Z11commandHelpR14SerialCommandsR4Args+0x64>
    2ffe:	b8 01       	movw	r22, r16
    3000:	ce 01       	movw	r24, r28
    3002:	0e 94 72 17 	call	0x2ee4	; 0x2ee4 <_ZN14SerialCommands12printCommandERK7Command>
    3006:	64 ed       	ldi	r22, 0xD4	; 212
    3008:	71 e0       	ldi	r23, 0x01	; 1
    300a:	88 81       	ld	r24, Y
    300c:	99 81       	ldd	r25, Y+1	; 0x01
    300e:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    3012:	f8 01       	movw	r30, r16
    3014:	80 81       	ld	r24, Z
    3016:	91 81       	ldd	r25, Z+1	; 0x01
    3018:	fc 01       	movw	r30, r24
    301a:	32 96       	adiw	r30, 0x02	; 2
    301c:	25 91       	lpm	r18, Z+
    301e:	34 91       	lpm	r19, Z
    3020:	f9 01       	movw	r30, r18
    3022:	09 95       	icall
    3024:	bc 01       	movw	r22, r24
    3026:	88 81       	ld	r24, Y
    3028:	99 81       	ldd	r25, Y+1	; 0x01
    302a:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    302e:	88 81       	ld	r24, Y
    3030:	99 81       	ldd	r25, Y+1	; 0x01
    3032:	0e 94 57 10 	call	0x20ae	; 0x20ae <_ZN5Print7printlnEv>
    3036:	ff ef       	ldi	r31, 0xFF	; 255
    3038:	ef 1a       	sub	r14, r31
    303a:	ff 0a       	sbc	r15, r31
    303c:	0c 5f       	subi	r16, 0xFC	; 252
    303e:	1f 4f       	sbci	r17, 0xFF	; 255
    3040:	db cf       	rjmp	.-74     	; 0x2ff8 <_Z11commandHelpR14SerialCommandsR4Args+0x1a>
    3042:	ce 01       	movw	r24, r28
    3044:	0e 94 d9 14 	call	0x29b2	; 0x29b2 <_ZL7printOKR14SerialCommands>
    3048:	cd b7       	in	r28, 0x3d	; 61
    304a:	de b7       	in	r29, 0x3e	; 62
    304c:	e8 e0       	ldi	r30, 0x08	; 8
    304e:	0c 94 be 34 	jmp	0x697c	; 0x697c <__epilogue_restores__+0x14>

00003052 <_ZN14SerialCommands10readSerialEv>:
    3052:	ac e7       	ldi	r26, 0x7C	; 124
    3054:	b0 e0       	ldi	r27, 0x00	; 0
    3056:	ef e2       	ldi	r30, 0x2F	; 47
    3058:	f8 e1       	ldi	r31, 0x18	; 24
    305a:	0c 94 98 34 	jmp	0x6930	; 0x6930 <__prologue_saves__>
    305e:	1c 01       	movw	r2, r24
    3060:	80 91 05 02 	lds	r24, 0x0205	; 0x800205 <_ZGVZN14SerialCommands10readSerialEvE8lastTime>
    3064:	81 11       	cpse	r24, r1
    3066:	17 c0       	rjmp	.+46     	; 0x3096 <_ZN14SerialCommands10readSerialEv+0x44>
    3068:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    306c:	8b 01       	movw	r16, r22
    306e:	9c 01       	movw	r18, r24
    3070:	60 93 fd 01 	sts	0x01FD, r22	; 0x8001fd <_ZZN14SerialCommands10readSerialEvE8lastTime>
    3074:	10 93 fe 01 	sts	0x01FE, r17	; 0x8001fe <_ZZN14SerialCommands10readSerialEvE8lastTime+0x1>
    3078:	80 93 ff 01 	sts	0x01FF, r24	; 0x8001ff <_ZZN14SerialCommands10readSerialEvE8lastTime+0x2>
    307c:	30 93 00 02 	sts	0x0200, r19	; 0x800200 <_ZZN14SerialCommands10readSerialEvE8lastTime+0x3>
    3080:	10 92 01 02 	sts	0x0201, r1	; 0x800201 <_ZZN14SerialCommands10readSerialEvE8lastTime+0x4>
    3084:	10 92 02 02 	sts	0x0202, r1	; 0x800202 <_ZZN14SerialCommands10readSerialEvE8lastTime+0x5>
    3088:	10 92 03 02 	sts	0x0203, r1	; 0x800203 <_ZZN14SerialCommands10readSerialEvE8lastTime+0x6>
    308c:	10 92 04 02 	sts	0x0204, r1	; 0x800204 <_ZZN14SerialCommands10readSerialEvE8lastTime+0x7>
    3090:	81 e0       	ldi	r24, 0x01	; 1
    3092:	80 93 05 02 	sts	0x0205, r24	; 0x800205 <_ZGVZN14SerialCommands10readSerialEvE8lastTime>
    3096:	d1 01       	movw	r26, r2
    3098:	1a 96       	adiw	r26, 0x0a	; 10
    309a:	8d 90       	ld	r8, X+
    309c:	9c 90       	ld	r9, X
    309e:	81 14       	cp	r8, r1
    30a0:	91 04       	cpc	r9, r1
    30a2:	09 f4       	brne	.+2      	; 0x30a6 <_ZN14SerialCommands10readSerialEv+0x54>
    30a4:	57 c0       	rjmp	.+174    	; 0x3154 <_ZN14SerialCommands10readSerialEv+0x102>
    30a6:	94 01       	movw	r18, r8
    30a8:	40 e0       	ldi	r20, 0x00	; 0
    30aa:	50 e0       	ldi	r21, 0x00	; 0
    30ac:	60 e0       	ldi	r22, 0x00	; 0
    30ae:	70 e0       	ldi	r23, 0x00	; 0
    30b0:	80 e0       	ldi	r24, 0x00	; 0
    30b2:	90 e0       	ldi	r25, 0x00	; 0
    30b4:	a0 90 fd 01 	lds	r10, 0x01FD	; 0x8001fd <_ZZN14SerialCommands10readSerialEvE8lastTime>
    30b8:	b0 90 fe 01 	lds	r11, 0x01FE	; 0x8001fe <_ZZN14SerialCommands10readSerialEvE8lastTime+0x1>
    30bc:	c0 90 ff 01 	lds	r12, 0x01FF	; 0x8001ff <_ZZN14SerialCommands10readSerialEvE8lastTime+0x2>
    30c0:	d0 90 00 02 	lds	r13, 0x0200	; 0x800200 <_ZZN14SerialCommands10readSerialEvE8lastTime+0x3>
    30c4:	e0 90 01 02 	lds	r14, 0x0201	; 0x800201 <_ZZN14SerialCommands10readSerialEvE8lastTime+0x4>
    30c8:	f0 90 02 02 	lds	r15, 0x0202	; 0x800202 <_ZZN14SerialCommands10readSerialEvE8lastTime+0x5>
    30cc:	00 91 03 02 	lds	r16, 0x0203	; 0x800203 <_ZZN14SerialCommands10readSerialEvE8lastTime+0x6>
    30d0:	10 91 04 02 	lds	r17, 0x0204	; 0x800204 <_ZZN14SerialCommands10readSerialEvE8lastTime+0x7>
    30d4:	0e 94 4a 35 	call	0x6a94	; 0x6a94 <__adddi3>
    30d8:	e7 96       	adiw	r28, 0x37	; 55
    30da:	2f af       	std	Y+63, r18	; 0x3f
    30dc:	e7 97       	sbiw	r28, 0x37	; 55
    30de:	e9 96       	adiw	r28, 0x39	; 57
    30e0:	3f af       	std	Y+63, r19	; 0x3f
    30e2:	e9 97       	sbiw	r28, 0x39	; 57
    30e4:	6a 01       	movw	r12, r20
    30e6:	7b 01       	movw	r14, r22
    30e8:	8c 01       	movw	r16, r24
    30ea:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    30ee:	2b 01       	movw	r4, r22
    30f0:	3c 01       	movw	r6, r24
    30f2:	81 2c       	mov	r8, r1
    30f4:	91 2c       	mov	r9, r1
    30f6:	54 01       	movw	r10, r8
    30f8:	af 96       	adiw	r28, 0x2f	; 47
    30fa:	6f af       	std	Y+63, r22	; 0x3f
    30fc:	af 97       	sbiw	r28, 0x2f	; 47
    30fe:	e0 96       	adiw	r28, 0x30	; 48
    3100:	5f ae       	std	Y+63, r5	; 0x3f
    3102:	e0 97       	sbiw	r28, 0x30	; 48
    3104:	e1 96       	adiw	r28, 0x31	; 49
    3106:	8f af       	std	Y+63, r24	; 0x3f
    3108:	e1 97       	sbiw	r28, 0x31	; 49
    310a:	e2 96       	adiw	r28, 0x32	; 50
    310c:	7f ae       	std	Y+63, r7	; 0x3f
    310e:	e2 97       	sbiw	r28, 0x32	; 50
    3110:	e3 96       	adiw	r28, 0x33	; 51
    3112:	8f ae       	std	Y+63, r8	; 0x3f
    3114:	e3 97       	sbiw	r28, 0x33	; 51
    3116:	e4 96       	adiw	r28, 0x34	; 52
    3118:	9f ae       	std	Y+63, r9	; 0x3f
    311a:	e4 97       	sbiw	r28, 0x34	; 52
    311c:	e5 96       	adiw	r28, 0x35	; 53
    311e:	af ae       	std	Y+63, r10	; 0x3f
    3120:	e5 97       	sbiw	r28, 0x35	; 53
    3122:	e6 96       	adiw	r28, 0x36	; 54
    3124:	bf ae       	std	Y+63, r11	; 0x3f
    3126:	e6 97       	sbiw	r28, 0x36	; 54
    3128:	e7 96       	adiw	r28, 0x37	; 55
    312a:	2f ad       	ldd	r18, Y+63	; 0x3f
    312c:	e7 97       	sbiw	r28, 0x37	; 55
    312e:	e9 96       	adiw	r28, 0x39	; 57
    3130:	3f ad       	ldd	r19, Y+63	; 0x3f
    3132:	e9 97       	sbiw	r28, 0x39	; 57
    3134:	a6 01       	movw	r20, r12
    3136:	b7 01       	movw	r22, r14
    3138:	c8 01       	movw	r24, r16
    313a:	52 01       	movw	r10, r4
    313c:	63 01       	movw	r12, r6
    313e:	e1 2c       	mov	r14, r1
    3140:	f1 2c       	mov	r15, r1
    3142:	00 e0       	ldi	r16, 0x00	; 0
    3144:	10 e0       	ldi	r17, 0x00	; 0
    3146:	0e 94 53 35 	call	0x6aa6	; 0x6aa6 <__cmpdi2>
    314a:	20 f4       	brcc	.+8      	; 0x3154 <_ZN14SerialCommands10readSerialEv+0x102>
    314c:	10 92 fc 01 	sts	0x01FC, r1	; 0x8001fc <_ZZN14SerialCommands10readSerialEvE5index+0x1>
    3150:	10 92 fb 01 	sts	0x01FB, r1	; 0x8001fb <_ZZN14SerialCommands10readSerialEvE5index>
    3154:	d1 01       	movw	r26, r2
    3156:	8d 91       	ld	r24, X+
    3158:	9c 91       	ld	r25, X
    315a:	dc 01       	movw	r26, r24
    315c:	ed 91       	ld	r30, X+
    315e:	fc 91       	ld	r31, X
    3160:	00 84       	ldd	r0, Z+8	; 0x08
    3162:	f1 85       	ldd	r31, Z+9	; 0x09
    3164:	e0 2d       	mov	r30, r0
    3166:	09 95       	icall
    3168:	18 16       	cp	r1, r24
    316a:	19 06       	cpc	r1, r25
    316c:	0c f0       	brlt	.+2      	; 0x3170 <_ZN14SerialCommands10readSerialEv+0x11e>
    316e:	14 c3       	rjmp	.+1576   	; 0x3798 <_ZN14SerialCommands10readSerialEv+0x746>
    3170:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    3174:	8b 01       	movw	r16, r22
    3176:	9c 01       	movw	r18, r24
    3178:	60 93 fd 01 	sts	0x01FD, r22	; 0x8001fd <_ZZN14SerialCommands10readSerialEvE8lastTime>
    317c:	10 93 fe 01 	sts	0x01FE, r17	; 0x8001fe <_ZZN14SerialCommands10readSerialEvE8lastTime+0x1>
    3180:	80 93 ff 01 	sts	0x01FF, r24	; 0x8001ff <_ZZN14SerialCommands10readSerialEvE8lastTime+0x2>
    3184:	30 93 00 02 	sts	0x0200, r19	; 0x800200 <_ZZN14SerialCommands10readSerialEvE8lastTime+0x3>
    3188:	10 92 01 02 	sts	0x0201, r1	; 0x800201 <_ZZN14SerialCommands10readSerialEvE8lastTime+0x4>
    318c:	10 92 02 02 	sts	0x0202, r1	; 0x800202 <_ZZN14SerialCommands10readSerialEvE8lastTime+0x5>
    3190:	10 92 03 02 	sts	0x0203, r1	; 0x800203 <_ZZN14SerialCommands10readSerialEvE8lastTime+0x6>
    3194:	10 92 04 02 	sts	0x0204, r1	; 0x800204 <_ZZN14SerialCommands10readSerialEvE8lastTime+0x7>
    3198:	f1 01       	movw	r30, r2
    319a:	80 81       	ld	r24, Z
    319c:	91 81       	ldd	r25, Z+1	; 0x01
    319e:	dc 01       	movw	r26, r24
    31a0:	ed 91       	ld	r30, X+
    31a2:	fc 91       	ld	r31, X
    31a4:	02 84       	ldd	r0, Z+10	; 0x0a
    31a6:	f3 85       	ldd	r31, Z+11	; 0x0b
    31a8:	e0 2d       	mov	r30, r0
    31aa:	09 95       	icall
    31ac:	18 2f       	mov	r17, r24
    31ae:	d1 01       	movw	r26, r2
    31b0:	50 96       	adiw	r26, 0x10	; 16
    31b2:	ed 91       	ld	r30, X+
    31b4:	fc 91       	ld	r31, X
    31b6:	09 95       	icall
    31b8:	20 91 fb 01 	lds	r18, 0x01FB	; 0x8001fb <_ZZN14SerialCommands10readSerialEvE5index>
    31bc:	30 91 fc 01 	lds	r19, 0x01FC	; 0x8001fc <_ZZN14SerialCommands10readSerialEvE5index+0x1>
    31c0:	88 23       	and	r24, r24
    31c2:	09 f4       	brne	.+2      	; 0x31c6 <_ZN14SerialCommands10readSerialEv+0x174>
    31c4:	cf c2       	rjmp	.+1438   	; 0x3764 <_ZN14SerialCommands10readSerialEv+0x712>
    31c6:	21 15       	cp	r18, r1
    31c8:	31 05       	cpc	r19, r1
    31ca:	21 f2       	breq	.-120    	; 0x3154 <_ZN14SerialCommands10readSerialEv+0x102>
    31cc:	f1 01       	movw	r30, r2
    31ce:	82 81       	ldd	r24, Z+2	; 0x02
    31d0:	93 81       	ldd	r25, Z+3	; 0x03
    31d2:	28 0f       	add	r18, r24
    31d4:	39 1f       	adc	r19, r25
    31d6:	d9 01       	movw	r26, r18
    31d8:	1c 92       	st	X, r1
    31da:	82 81       	ldd	r24, Z+2	; 0x02
    31dc:	93 81       	ldd	r25, Z+3	; 0x03
    31de:	ad 96       	adiw	r28, 0x2d	; 45
    31e0:	9f af       	std	Y+63, r25	; 0x3f
    31e2:	8e af       	std	Y+62, r24	; 0x3e
    31e4:	ad 97       	sbiw	r28, 0x2d	; 45
    31e6:	80 e5       	ldi	r24, 0x50	; 80
    31e8:	fe 01       	movw	r30, r28
    31ea:	31 96       	adiw	r30, 0x01	; 1
    31ec:	df 01       	movw	r26, r30
    31ee:	1d 92       	st	X+, r1
    31f0:	8a 95       	dec	r24
    31f2:	e9 f7       	brne	.-6      	; 0x31ee <_ZN14SerialCommands10readSerialEv+0x19c>
    31f4:	f1 01       	movw	r30, r2
    31f6:	e6 80       	ldd	r14, Z+6	; 0x06
    31f8:	f7 80       	ldd	r15, Z+7	; 0x07
    31fa:	40 84       	ldd	r4, Z+8	; 0x08
    31fc:	51 84       	ldd	r5, Z+9	; 0x09
    31fe:	e8 96       	adiw	r28, 0x38	; 56
    3200:	5f ae       	std	Y+63, r5	; 0x3f
    3202:	4e ae       	std	Y+62, r4	; 0x3e
    3204:	e8 97       	sbiw	r28, 0x38	; 56
    3206:	be 01       	movw	r22, r28
    3208:	65 59       	subi	r22, 0x95	; 149
    320a:	7f 4f       	sbci	r23, 0xFF	; 255
    320c:	c1 01       	movw	r24, r2
    320e:	0e 94 98 0b 	call	0x1730	; 0x1730 <_ZN14SerialCommands8getTokenEPPc>
    3212:	8c 01       	movw	r16, r24
    3214:	e9 96       	adiw	r28, 0x39	; 57
    3216:	1f ae       	std	Y+63, r1	; 0x3f
    3218:	e9 97       	sbiw	r28, 0x39	; 57
    321a:	01 15       	cp	r16, r1
    321c:	11 05       	cpc	r17, r1
    321e:	09 f4       	brne	.+2      	; 0x3222 <_ZN14SerialCommands10readSerialEv+0x1d0>
    3220:	95 cf       	rjmp	.-214    	; 0x314c <_ZN14SerialCommands10readSerialEv+0xfa>
    3222:	f8 01       	movw	r30, r16
    3224:	01 90       	ld	r0, Z+
    3226:	00 20       	and	r0, r0
    3228:	e9 f7       	brne	.-6      	; 0x3224 <_ZN14SerialCommands10readSerialEv+0x1d2>
    322a:	31 97       	sbiw	r30, 0x01	; 1
    322c:	5f 01       	movw	r10, r30
    322e:	a0 1a       	sub	r10, r16
    3230:	b1 0a       	sbc	r11, r17
    3232:	47 01       	movw	r8, r14
    3234:	71 2c       	mov	r7, r1
    3236:	61 2c       	mov	r6, r1
    3238:	d1 2c       	mov	r13, r1
    323a:	c1 2c       	mov	r12, r1
    323c:	95 01       	movw	r18, r10
    323e:	2f 5f       	subi	r18, 0xFF	; 255
    3240:	3f 4f       	sbci	r19, 0xFF	; 255
    3242:	eb 96       	adiw	r28, 0x3b	; 59
    3244:	3f af       	std	Y+63, r19	; 0x3f
    3246:	2e af       	std	Y+62, r18	; 0x3e
    3248:	eb 97       	sbiw	r28, 0x3b	; 59
    324a:	e8 96       	adiw	r28, 0x38	; 56
    324c:	4e ac       	ldd	r4, Y+62	; 0x3e
    324e:	5f ac       	ldd	r5, Y+63	; 0x3f
    3250:	e8 97       	sbiw	r28, 0x38	; 56
    3252:	64 14       	cp	r6, r4
    3254:	75 04       	cpc	r7, r5
    3256:	81 f1       	breq	.+96     	; 0x32b8 <_ZN14SerialCommands10readSerialEv+0x266>
    3258:	e0 96       	adiw	r28, 0x30	; 48
    325a:	9f ae       	std	Y+63, r9	; 0x3f
    325c:	8e ae       	std	Y+62, r8	; 0x3e
    325e:	e0 97       	sbiw	r28, 0x30	; 48
    3260:	d4 01       	movw	r26, r8
    3262:	8d 91       	ld	r24, X+
    3264:	9c 91       	ld	r25, X
    3266:	fc 01       	movw	r30, r24
    3268:	25 91       	lpm	r18, Z+
    326a:	34 91       	lpm	r19, Z
    326c:	f9 01       	movw	r30, r18
    326e:	09 95       	icall
    3270:	2c 01       	movw	r4, r24
    3272:	eb 96       	adiw	r28, 0x3b	; 59
    3274:	4e ad       	ldd	r20, Y+62	; 0x3e
    3276:	5f ad       	ldd	r21, Y+63	; 0x3f
    3278:	eb 97       	sbiw	r28, 0x3b	; 59
    327a:	bc 01       	movw	r22, r24
    327c:	c8 01       	movw	r24, r16
    327e:	0e 94 f0 32 	call	0x65e0	; 0x65e0 <memcmp_P>
    3282:	89 2b       	or	r24, r25
    3284:	69 f1       	breq	.+90     	; 0x32e0 <_ZN14SerialCommands10readSerialEv+0x28e>
    3286:	a5 01       	movw	r20, r10
    3288:	b2 01       	movw	r22, r4
    328a:	c8 01       	movw	r24, r16
    328c:	0e 94 f0 32 	call	0x65e0	; 0x65e0 <memcmp_P>
    3290:	89 2b       	or	r24, r25
    3292:	39 f4       	brne	.+14     	; 0x32a2 <_ZN14SerialCommands10readSerialEv+0x250>
    3294:	ff ef       	ldi	r31, 0xFF	; 255
    3296:	cf 1a       	sub	r12, r31
    3298:	df 0a       	sbc	r13, r31
    329a:	ed 96       	adiw	r28, 0x3d	; 61
    329c:	7f ae       	std	Y+63, r7	; 0x3f
    329e:	6e ae       	std	Y+62, r6	; 0x3e
    32a0:	ed 97       	sbiw	r28, 0x3d	; 61
    32a2:	2f ef       	ldi	r18, 0xFF	; 255
    32a4:	62 1a       	sub	r6, r18
    32a6:	72 0a       	sbc	r7, r18
    32a8:	34 e0       	ldi	r19, 0x04	; 4
    32aa:	83 0e       	add	r8, r19
    32ac:	91 1c       	adc	r9, r1
    32ae:	cd cf       	rjmp	.-102    	; 0x324a <_ZN14SerialCommands10readSerialEv+0x1f8>
    32b0:	e9 96       	adiw	r28, 0x39	; 57
    32b2:	df ae       	std	Y+63, r13	; 0x3f
    32b4:	e9 97       	sbiw	r28, 0x39	; 57
    32b6:	b1 cf       	rjmp	.-158    	; 0x321a <_ZN14SerialCommands10readSerialEv+0x1c8>
    32b8:	81 e0       	ldi	r24, 0x01	; 1
    32ba:	c8 16       	cp	r12, r24
    32bc:	d1 04       	cpc	r13, r1
    32be:	09 f0       	breq	.+2      	; 0x32c2 <_ZN14SerialCommands10readSerialEv+0x270>
    32c0:	3b c2       	rjmp	.+1142   	; 0x3738 <_ZN14SerialCommands10readSerialEv+0x6e6>
    32c2:	ed 96       	adiw	r28, 0x3d	; 61
    32c4:	8e ad       	ldd	r24, Y+62	; 0x3e
    32c6:	9f ad       	ldd	r25, Y+63	; 0x3f
    32c8:	ed 97       	sbiw	r28, 0x3d	; 61
    32ca:	88 0f       	add	r24, r24
    32cc:	99 1f       	adc	r25, r25
    32ce:	88 0f       	add	r24, r24
    32d0:	99 1f       	adc	r25, r25
    32d2:	27 01       	movw	r4, r14
    32d4:	48 0e       	add	r4, r24
    32d6:	59 1e       	adc	r5, r25
    32d8:	e0 96       	adiw	r28, 0x30	; 48
    32da:	5f ae       	std	Y+63, r5	; 0x3f
    32dc:	4e ae       	std	Y+62, r4	; 0x3e
    32de:	e0 97       	sbiw	r28, 0x30	; 48
    32e0:	e0 96       	adiw	r28, 0x30	; 48
    32e2:	6e ac       	ldd	r6, Y+62	; 0x3e
    32e4:	7f ac       	ldd	r7, Y+63	; 0x3f
    32e6:	e0 97       	sbiw	r28, 0x30	; 48
    32e8:	61 14       	cp	r6, r1
    32ea:	71 04       	cpc	r7, r1
    32ec:	09 f4       	brne	.+2      	; 0x32f0 <_ZN14SerialCommands10readSerialEv+0x29e>
    32ee:	24 c2       	rjmp	.+1096   	; 0x3738 <_ZN14SerialCommands10readSerialEv+0x6e6>
    32f0:	d3 01       	movw	r26, r6
    32f2:	8d 91       	ld	r24, X+
    32f4:	9c 91       	ld	r25, X
    32f6:	fc 01       	movw	r30, r24
    32f8:	34 96       	adiw	r30, 0x04	; 4
    32fa:	25 91       	lpm	r18, Z+
    32fc:	34 91       	lpm	r19, Z
    32fe:	be 01       	movw	r22, r28
    3300:	63 59       	subi	r22, 0x93	; 147
    3302:	7f 4f       	sbci	r23, 0xFF	; 255
    3304:	f9 01       	movw	r30, r18
    3306:	09 95       	icall
    3308:	eb 96       	adiw	r28, 0x3b	; 59
    330a:	9f af       	std	Y+63, r25	; 0x3f
    330c:	8e af       	std	Y+62, r24	; 0x3e
    330e:	eb 97       	sbiw	r28, 0x3b	; 59
    3310:	a7 96       	adiw	r28, 0x27	; 39
    3312:	1f ae       	std	Y+63, r1	; 0x3f
    3314:	a7 97       	sbiw	r28, 0x27	; 39
    3316:	a9 96       	adiw	r28, 0x29	; 41
    3318:	1f ae       	std	Y+63, r1	; 0x3f
    331a:	1e ae       	std	Y+62, r1	; 0x3e
    331c:	a9 97       	sbiw	r28, 0x29	; 41
    331e:	ab 96       	adiw	r28, 0x2b	; 43
    3320:	1f ae       	std	Y+63, r1	; 0x3f
    3322:	1e ae       	std	Y+62, r1	; 0x3e
    3324:	ab 97       	sbiw	r28, 0x2b	; 43
    3326:	e9 96       	adiw	r28, 0x39	; 57
    3328:	df ac       	ldd	r13, Y+63	; 0x3f
    332a:	e9 97       	sbiw	r28, 0x39	; 57
    332c:	f2 e0       	ldi	r31, 0x02	; 2
    332e:	cf 2e       	mov	r12, r31
    3330:	8d 2d       	mov	r24, r13
    3332:	e9 96       	adiw	r28, 0x39	; 57
    3334:	4f ac       	ldd	r4, Y+63	; 0x3f
    3336:	e9 97       	sbiw	r28, 0x39	; 57
    3338:	84 19       	sub	r24, r4
    333a:	ae 96       	adiw	r28, 0x2e	; 46
    333c:	9f ad       	ldd	r25, Y+63	; 0x3f
    333e:	ae 97       	sbiw	r28, 0x2e	; 46
    3340:	89 17       	cp	r24, r25
    3342:	08 f0       	brcs	.+2      	; 0x3346 <_ZN14SerialCommands10readSerialEv+0x2f4>
    3344:	c1 c1       	rjmp	.+898    	; 0x36c8 <_ZN14SerialCommands10readSerialEv+0x676>
    3346:	eb 96       	adiw	r28, 0x3b	; 59
    3348:	6e ad       	ldd	r22, Y+62	; 0x3e
    334a:	7f ad       	ldd	r23, Y+63	; 0x3f
    334c:	eb 97       	sbiw	r28, 0x3b	; 59
    334e:	e5 e0       	ldi	r30, 0x05	; 5
    3350:	5e 2e       	mov	r5, r30
    3352:	85 9d       	mul	r24, r5
    3354:	60 0d       	add	r22, r0
    3356:	71 1d       	adc	r23, r1
    3358:	11 24       	eor	r1, r1
    335a:	45 e0       	ldi	r20, 0x05	; 5
    335c:	50 e0       	ldi	r21, 0x00	; 0
    335e:	ce 01       	movw	r24, r28
    3360:	8a 59       	subi	r24, 0x9A	; 154
    3362:	9f 4f       	sbci	r25, 0xFF	; 255
    3364:	0e 94 fd 32 	call	0x65fa	; 0x65fa <memcpy_P>
    3368:	be 01       	movw	r22, r28
    336a:	65 59       	subi	r22, 0x95	; 149
    336c:	7f 4f       	sbci	r23, 0xFF	; 255
    336e:	c1 01       	movw	r24, r2
    3370:	0e 94 98 0b 	call	0x1730	; 0x1730 <_ZN14SerialCommands8getTokenEPPc>
    3374:	8c 01       	movw	r16, r24
    3376:	89 2b       	or	r24, r25
    3378:	41 f4       	brne	.+16     	; 0x338a <_ZN14SerialCommands10readSerialEv+0x338>
    337a:	66 e1       	ldi	r22, 0x16	; 22
    337c:	72 e0       	ldi	r23, 0x02	; 2
    337e:	d1 01       	movw	r26, r2
    3380:	8d 91       	ld	r24, X+
    3382:	9c 91       	ld	r25, X
    3384:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    3388:	fd c0       	rjmp	.+506    	; 0x3584 <_ZN14SerialCommands10readSerialEv+0x532>
    338a:	ed 2c       	mov	r14, r13
    338c:	f1 2c       	mov	r15, r1
    338e:	44 24       	eor	r4, r4
    3390:	43 94       	inc	r4
    3392:	51 2c       	mov	r5, r1
    3394:	4c 0e       	add	r4, r28
    3396:	5d 1e       	adc	r5, r29
    3398:	75 e0       	ldi	r23, 0x05	; 5
    339a:	67 2e       	mov	r6, r23
    339c:	d6 9c       	mul	r13, r6
    339e:	40 0c       	add	r4, r0
    33a0:	51 1c       	adc	r5, r1
    33a2:	11 24       	eor	r1, r1
    33a4:	e8 96       	adiw	r28, 0x38	; 56
    33a6:	5f ae       	std	Y+63, r5	; 0x3f
    33a8:	4e ae       	std	Y+62, r4	; 0x3e
    33aa:	e8 97       	sbiw	r28, 0x38	; 56
    33ac:	a7 96       	adiw	r28, 0x27	; 39
    33ae:	8f ad       	ldd	r24, Y+63	; 0x3f
    33b0:	a7 97       	sbiw	r28, 0x27	; 39
    33b2:	82 30       	cpi	r24, 0x02	; 2
    33b4:	09 f4       	brne	.+2      	; 0x33b8 <_ZN14SerialCommands10readSerialEv+0x366>
    33b6:	b1 c0       	rjmp	.+354    	; 0x351a <_ZN14SerialCommands10readSerialEv+0x4c8>
    33b8:	83 30       	cpi	r24, 0x03	; 3
    33ba:	b9 f1       	breq	.+110    	; 0x342a <_ZN14SerialCommands10readSerialEv+0x3d8>
    33bc:	81 30       	cpi	r24, 0x01	; 1
    33be:	09 f0       	breq	.+2      	; 0x33c2 <_ZN14SerialCommands10readSerialEv+0x370>
    33c0:	d2 c0       	rjmp	.+420    	; 0x3566 <_ZN14SerialCommands10readSerialEv+0x514>
    33c2:	d8 01       	movw	r26, r16
    33c4:	8c 91       	ld	r24, X
    33c6:	8d 32       	cpi	r24, 0x2D	; 45
    33c8:	09 f4       	brne	.+2      	; 0x33cc <_ZN14SerialCommands10readSerialEv+0x37a>
    33ca:	8e c0       	rjmp	.+284    	; 0x34e8 <_ZN14SerialCommands10readSerialEv+0x496>
    33cc:	31 e0       	ldi	r19, 0x01	; 1
    33ce:	20 e0       	ldi	r18, 0x00	; 0
    33d0:	8b 32       	cpi	r24, 0x2B	; 43
    33d2:	09 f0       	breq	.+2      	; 0x33d6 <_ZN14SerialCommands10readSerialEv+0x384>
    33d4:	30 e0       	ldi	r19, 0x00	; 0
    33d6:	83 2f       	mov	r24, r19
    33d8:	92 2f       	mov	r25, r18
    33da:	81 2c       	mov	r8, r1
    33dc:	91 2c       	mov	r9, r1
    33de:	54 01       	movw	r10, r8
    33e0:	83 94       	inc	r8
    33e2:	08 0f       	add	r16, r24
    33e4:	19 1f       	adc	r17, r25
    33e6:	41 2c       	mov	r4, r1
    33e8:	51 2c       	mov	r5, r1
    33ea:	32 01       	movw	r6, r4
    33ec:	d8 01       	movw	r26, r16
    33ee:	ed 91       	ld	r30, X+
    33f0:	8d 01       	movw	r16, r26
    33f2:	ee 23       	and	r30, r30
    33f4:	09 f4       	brne	.+2      	; 0x33f8 <_ZN14SerialCommands10readSerialEv+0x3a6>
    33f6:	7f c0       	rjmp	.+254    	; 0x34f6 <_ZN14SerialCommands10readSerialEv+0x4a4>
    33f8:	e0 53       	subi	r30, 0x30	; 48
    33fa:	ea 30       	cpi	r30, 0x0A	; 10
    33fc:	08 f0       	brcs	.+2      	; 0x3400 <_ZN14SerialCommands10readSerialEv+0x3ae>
    33fe:	b3 c0       	rjmp	.+358    	; 0x3566 <_ZN14SerialCommands10readSerialEv+0x514>
    3400:	aa e0       	ldi	r26, 0x0A	; 10
    3402:	b0 e0       	ldi	r27, 0x00	; 0
    3404:	a3 01       	movw	r20, r6
    3406:	92 01       	movw	r18, r4
    3408:	0e 94 85 34 	call	0x690a	; 0x690a <__muluhisi3>
    340c:	dc 01       	movw	r26, r24
    340e:	cb 01       	movw	r24, r22
    3410:	8e 0f       	add	r24, r30
    3412:	91 1d       	adc	r25, r1
    3414:	a1 1d       	adc	r26, r1
    3416:	b1 1d       	adc	r27, r1
    3418:	84 15       	cp	r24, r4
    341a:	95 05       	cpc	r25, r5
    341c:	a6 05       	cpc	r26, r6
    341e:	b7 05       	cpc	r27, r7
    3420:	0c f4       	brge	.+2      	; 0x3424 <_ZN14SerialCommands10readSerialEv+0x3d2>
    3422:	a1 c0       	rjmp	.+322    	; 0x3566 <_ZN14SerialCommands10readSerialEv+0x514>
    3424:	2c 01       	movw	r4, r24
    3426:	3d 01       	movw	r6, r26
    3428:	e1 cf       	rjmp	.-62     	; 0x33ec <_ZN14SerialCommands10readSerialEv+0x39a>
    342a:	a5 96       	adiw	r28, 0x25	; 37
    342c:	1f ae       	std	Y+63, r1	; 0x3f
    342e:	1e ae       	std	Y+62, r1	; 0x3e
    3430:	a5 97       	sbiw	r28, 0x25	; 37
    3432:	a3 96       	adiw	r28, 0x23	; 35
    3434:	1f af       	std	Y+63, r17	; 0x3f
    3436:	0e af       	std	Y+62, r16	; 0x3e
    3438:	a3 97       	sbiw	r28, 0x23	; 35
    343a:	a6 96       	adiw	r28, 0x26	; 38
    343c:	8f af       	std	Y+63, r24	; 0x3f
    343e:	a6 97       	sbiw	r28, 0x26	; 38
    3440:	45 e0       	ldi	r20, 0x05	; 5
    3442:	74 2e       	mov	r7, r20
    3444:	7e 9c       	mul	r7, r14
    3446:	d0 01       	movw	r26, r0
    3448:	7f 9c       	mul	r7, r15
    344a:	b0 0d       	add	r27, r0
    344c:	11 24       	eor	r1, r1
    344e:	88 24       	eor	r8, r8
    3450:	83 94       	inc	r8
    3452:	91 2c       	mov	r9, r1
    3454:	8c 0e       	add	r8, r28
    3456:	9d 1e       	adc	r9, r29
    3458:	a8 0d       	add	r26, r8
    345a:	b9 1d       	adc	r27, r9
    345c:	85 e0       	ldi	r24, 0x05	; 5
    345e:	fe 01       	movw	r30, r28
    3460:	ef 59       	subi	r30, 0x9F	; 159
    3462:	ff 4f       	sbci	r31, 0xFF	; 255
    3464:	01 90       	ld	r0, Z+
    3466:	0d 92       	st	X+, r0
    3468:	8a 95       	dec	r24
    346a:	e1 f7       	brne	.-8      	; 0x3464 <_ZN14SerialCommands10readSerialEv+0x412>
    346c:	e8 96       	adiw	r28, 0x38	; 56
    346e:	ae ad       	ldd	r26, Y+62	; 0x3e
    3470:	bf ad       	ldd	r27, Y+63	; 0x3f
    3472:	e8 97       	sbiw	r28, 0x38	; 56
    3474:	8d 90       	ld	r8, X+
    3476:	9d 90       	ld	r9, X+
    3478:	ad 90       	ld	r10, X+
    347a:	bc 90       	ld	r11, X
    347c:	13 97       	sbiw	r26, 0x03	; 3
    347e:	14 96       	adiw	r26, 0x04	; 4
    3480:	1c 91       	ld	r17, X
    3482:	a9 96       	adiw	r28, 0x29	; 41
    3484:	ee ad       	ldd	r30, Y+62	; 0x3e
    3486:	ff ad       	ldd	r31, Y+63	; 0x3f
    3488:	a9 97       	sbiw	r28, 0x29	; 41
    348a:	30 97       	sbiw	r30, 0x00	; 0
    348c:	59 f1       	breq	.+86     	; 0x34e4 <_ZN14SerialCommands10readSerialEv+0x492>
    348e:	09 95       	icall
    3490:	6a 96       	adiw	r28, 0x1a	; 26
    3492:	2f af       	std	Y+63, r18	; 0x3f
    3494:	6a 97       	sbiw	r28, 0x1a	; 26
    3496:	6b 96       	adiw	r28, 0x1b	; 27
    3498:	3f af       	std	Y+63, r19	; 0x3f
    349a:	6b 97       	sbiw	r28, 0x1b	; 27
    349c:	6c 96       	adiw	r28, 0x1c	; 28
    349e:	4f af       	std	Y+63, r20	; 0x3f
    34a0:	6c 97       	sbiw	r28, 0x1c	; 28
    34a2:	6d 96       	adiw	r28, 0x1d	; 29
    34a4:	5f af       	std	Y+63, r21	; 0x3f
    34a6:	6d 97       	sbiw	r28, 0x1d	; 29
    34a8:	6e 96       	adiw	r28, 0x1e	; 30
    34aa:	6f af       	std	Y+63, r22	; 0x3f
    34ac:	6e 97       	sbiw	r28, 0x1e	; 30
    34ae:	6f 96       	adiw	r28, 0x1f	; 31
    34b0:	7f af       	std	Y+63, r23	; 0x3f
    34b2:	6f 97       	sbiw	r28, 0x1f	; 31
    34b4:	a0 96       	adiw	r28, 0x20	; 32
    34b6:	8f af       	std	Y+63, r24	; 0x3f
    34b8:	a0 97       	sbiw	r28, 0x20	; 32
    34ba:	a1 96       	adiw	r28, 0x21	; 33
    34bc:	9f af       	std	Y+63, r25	; 0x3f
    34be:	a1 97       	sbiw	r28, 0x21	; 33
    34c0:	6d 96       	adiw	r28, 0x1d	; 29
    34c2:	6c ad       	ldd	r22, Y+60	; 0x3c
    34c4:	7d ad       	ldd	r23, Y+61	; 0x3d
    34c6:	8e ad       	ldd	r24, Y+62	; 0x3e
    34c8:	9f ad       	ldd	r25, Y+63	; 0x3f
    34ca:	6d 97       	sbiw	r28, 0x1d	; 29
    34cc:	a1 96       	adiw	r28, 0x21	; 33
    34ce:	4c ac       	ldd	r4, Y+60	; 0x3c
    34d0:	5d ac       	ldd	r5, Y+61	; 0x3d
    34d2:	6e ac       	ldd	r6, Y+62	; 0x3e
    34d4:	7f ac       	ldd	r7, Y+63	; 0x3f
    34d6:	a1 97       	sbiw	r28, 0x21	; 33
    34d8:	11 30       	cpi	r17, 0x01	; 1
    34da:	09 f4       	brne	.+2      	; 0x34de <_ZN14SerialCommands10readSerialEv+0x48c>
    34dc:	60 c0       	rjmp	.+192    	; 0x359e <_ZN14SerialCommands10readSerialEv+0x54c>
    34de:	12 30       	cpi	r17, 0x02	; 2
    34e0:	09 f4       	brne	.+2      	; 0x34e4 <_ZN14SerialCommands10readSerialEv+0x492>
    34e2:	de c0       	rjmp	.+444    	; 0x36a0 <_ZN14SerialCommands10readSerialEv+0x64e>
    34e4:	d3 94       	inc	r13
    34e6:	24 cf       	rjmp	.-440    	; 0x3330 <_ZN14SerialCommands10readSerialEv+0x2de>
    34e8:	88 24       	eor	r8, r8
    34ea:	8a 94       	dec	r8
    34ec:	98 2c       	mov	r9, r8
    34ee:	54 01       	movw	r10, r8
    34f0:	81 e0       	ldi	r24, 0x01	; 1
    34f2:	90 e0       	ldi	r25, 0x00	; 0
    34f4:	76 cf       	rjmp	.-276    	; 0x33e2 <_ZN14SerialCommands10readSerialEv+0x390>
    34f6:	a3 01       	movw	r20, r6
    34f8:	92 01       	movw	r18, r4
    34fa:	c5 01       	movw	r24, r10
    34fc:	b4 01       	movw	r22, r8
    34fe:	0e 94 00 35 	call	0x6a00	; 0x6a00 <__mulsi3>
    3502:	e8 96       	adiw	r28, 0x38	; 56
    3504:	ee ad       	ldd	r30, Y+62	; 0x3e
    3506:	ff ad       	ldd	r31, Y+63	; 0x3f
    3508:	e8 97       	sbiw	r28, 0x38	; 56
    350a:	60 83       	st	Z, r22
    350c:	71 83       	std	Z+1, r23	; 0x01
    350e:	82 83       	std	Z+2, r24	; 0x02
    3510:	93 83       	std	Z+3, r25	; 0x03
    3512:	44 24       	eor	r4, r4
    3514:	43 94       	inc	r4
    3516:	44 82       	std	Z+4, r4	; 0x04
    3518:	a9 cf       	rjmp	.-174    	; 0x346c <_ZN14SerialCommands10readSerialEv+0x41a>
    351a:	a3 96       	adiw	r28, 0x23	; 35
    351c:	1f ae       	std	Y+63, r1	; 0x3f
    351e:	1e ae       	std	Y+62, r1	; 0x3e
    3520:	a3 97       	sbiw	r28, 0x23	; 35
    3522:	be 01       	movw	r22, r28
    3524:	6f 59       	subi	r22, 0x9F	; 159
    3526:	7f 4f       	sbci	r23, 0xFF	; 255
    3528:	c8 01       	movw	r24, r16
    352a:	0e 94 97 31 	call	0x632e	; 0x632e <strtod>
    352e:	4b 01       	movw	r8, r22
    3530:	5c 01       	movw	r10, r24
    3532:	20 e0       	ldi	r18, 0x00	; 0
    3534:	30 e0       	ldi	r19, 0x00	; 0
    3536:	a9 01       	movw	r20, r18
    3538:	0e 94 29 33 	call	0x6652	; 0x6652 <__cmpsf2>
    353c:	81 11       	cpse	r24, r1
    353e:	07 c0       	rjmp	.+14     	; 0x354e <_ZN14SerialCommands10readSerialEv+0x4fc>
    3540:	a3 96       	adiw	r28, 0x23	; 35
    3542:	8e ad       	ldd	r24, Y+62	; 0x3e
    3544:	9f ad       	ldd	r25, Y+63	; 0x3f
    3546:	a3 97       	sbiw	r28, 0x23	; 35
    3548:	08 17       	cp	r16, r24
    354a:	19 07       	cpc	r17, r25
    354c:	61 f0       	breq	.+24     	; 0x3566 <_ZN14SerialCommands10readSerialEv+0x514>
    354e:	e8 96       	adiw	r28, 0x38	; 56
    3550:	ae ad       	ldd	r26, Y+62	; 0x3e
    3552:	bf ad       	ldd	r27, Y+63	; 0x3f
    3554:	e8 97       	sbiw	r28, 0x38	; 56
    3556:	8d 92       	st	X+, r8
    3558:	9d 92       	st	X+, r9
    355a:	ad 92       	st	X+, r10
    355c:	bc 92       	st	X, r11
    355e:	13 97       	sbiw	r26, 0x03	; 3
    3560:	14 96       	adiw	r26, 0x04	; 4
    3562:	cc 92       	st	X, r12
    3564:	83 cf       	rjmp	.-250    	; 0x346c <_ZN14SerialCommands10readSerialEv+0x41a>
    3566:	69 ef       	ldi	r22, 0xF9	; 249
    3568:	71 e0       	ldi	r23, 0x01	; 1
    356a:	f1 01       	movw	r30, r2
    356c:	80 81       	ld	r24, Z
    356e:	91 81       	ldd	r25, Z+1	; 0x01
    3570:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    3574:	b7 01       	movw	r22, r14
    3576:	6f 5f       	subi	r22, 0xFF	; 255
    3578:	7f 4f       	sbci	r23, 0xFF	; 255
    357a:	d1 01       	movw	r26, r2
    357c:	8d 91       	ld	r24, X+
    357e:	9c 91       	ld	r25, X
    3580:	0e 94 73 10 	call	0x20e6	; 0x20e6 <_ZN5Print7printlnEii.constprop.129>
    3584:	e0 96       	adiw	r28, 0x30	; 48
    3586:	6e ad       	ldd	r22, Y+62	; 0x3e
    3588:	7f ad       	ldd	r23, Y+63	; 0x3f
    358a:	e0 97       	sbiw	r28, 0x30	; 48
    358c:	c1 01       	movw	r24, r2
    358e:	0e 94 72 17 	call	0x2ee4	; 0x2ee4 <_ZN14SerialCommands12printCommandERK7Command>
    3592:	f1 01       	movw	r30, r2
    3594:	80 81       	ld	r24, Z
    3596:	91 81       	ldd	r25, Z+1	; 0x01
    3598:	0e 94 57 10 	call	0x20ae	; 0x20ae <_ZN5Print7printlnEv>
    359c:	d7 cd       	rjmp	.-1106   	; 0x314c <_ZN14SerialCommands10readSerialEv+0xfa>
    359e:	86 16       	cp	r8, r22
    35a0:	97 06       	cpc	r9, r23
    35a2:	a8 06       	cpc	r10, r24
    35a4:	b9 06       	cpc	r11, r25
    35a6:	34 f0       	brlt	.+12     	; 0x35b4 <_ZN14SerialCommands10readSerialEv+0x562>
    35a8:	48 14       	cp	r4, r8
    35aa:	59 04       	cpc	r5, r9
    35ac:	6a 04       	cpc	r6, r10
    35ae:	7b 04       	cpc	r7, r11
    35b0:	0c f0       	brlt	.+2      	; 0x35b4 <_ZN14SerialCommands10readSerialEv+0x562>
    35b2:	98 cf       	rjmp	.-208    	; 0x34e4 <_ZN14SerialCommands10readSerialEv+0x492>
    35b4:	6b ed       	ldi	r22, 0xDB	; 219
    35b6:	71 e0       	ldi	r23, 0x01	; 1
    35b8:	f1 01       	movw	r30, r2
    35ba:	80 81       	ld	r24, Z
    35bc:	91 81       	ldd	r25, Z+1	; 0x01
    35be:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    35c2:	b7 01       	movw	r22, r14
    35c4:	6f 5f       	subi	r22, 0xFF	; 255
    35c6:	7f 4f       	sbci	r23, 0xFF	; 255
    35c8:	d1 01       	movw	r26, r2
    35ca:	8d 91       	ld	r24, X+
    35cc:	9c 91       	ld	r25, X
    35ce:	0e 94 50 10 	call	0x20a0	; 0x20a0 <_ZN5Print5printEii.constprop.130>
    35d2:	a9 96       	adiw	r28, 0x29	; 41
    35d4:	ee ad       	ldd	r30, Y+62	; 0x3e
    35d6:	ff ad       	ldd	r31, Y+63	; 0x3f
    35d8:	a9 97       	sbiw	r28, 0x29	; 41
    35da:	cc 24       	eor	r12, r12
    35dc:	ca 94       	dec	r12
    35de:	dc 2c       	mov	r13, r12
    35e0:	ec 2c       	mov	r14, r12
    35e2:	8f e7       	ldi	r24, 0x7F	; 127
    35e4:	f8 2e       	mov	r15, r24
    35e6:	81 2c       	mov	r8, r1
    35e8:	91 2c       	mov	r9, r1
    35ea:	a1 2c       	mov	r10, r1
    35ec:	90 e8       	ldi	r25, 0x80	; 128
    35ee:	b9 2e       	mov	r11, r25
    35f0:	30 97       	sbiw	r30, 0x00	; 0
    35f2:	29 f1       	breq	.+74     	; 0x363e <_ZN14SerialCommands10readSerialEv+0x5ec>
    35f4:	09 95       	icall
    35f6:	62 96       	adiw	r28, 0x12	; 18
    35f8:	2f af       	std	Y+63, r18	; 0x3f
    35fa:	62 97       	sbiw	r28, 0x12	; 18
    35fc:	63 96       	adiw	r28, 0x13	; 19
    35fe:	3f af       	std	Y+63, r19	; 0x3f
    3600:	63 97       	sbiw	r28, 0x13	; 19
    3602:	64 96       	adiw	r28, 0x14	; 20
    3604:	4f af       	std	Y+63, r20	; 0x3f
    3606:	64 97       	sbiw	r28, 0x14	; 20
    3608:	65 96       	adiw	r28, 0x15	; 21
    360a:	5f af       	std	Y+63, r21	; 0x3f
    360c:	65 97       	sbiw	r28, 0x15	; 21
    360e:	66 96       	adiw	r28, 0x16	; 22
    3610:	6f af       	std	Y+63, r22	; 0x3f
    3612:	66 97       	sbiw	r28, 0x16	; 22
    3614:	67 96       	adiw	r28, 0x17	; 23
    3616:	7f af       	std	Y+63, r23	; 0x3f
    3618:	67 97       	sbiw	r28, 0x17	; 23
    361a:	68 96       	adiw	r28, 0x18	; 24
    361c:	8f af       	std	Y+63, r24	; 0x3f
    361e:	68 97       	sbiw	r28, 0x18	; 24
    3620:	69 96       	adiw	r28, 0x19	; 25
    3622:	9f af       	std	Y+63, r25	; 0x3f
    3624:	69 97       	sbiw	r28, 0x19	; 25
    3626:	65 96       	adiw	r28, 0x15	; 21
    3628:	8c ac       	ldd	r8, Y+60	; 0x3c
    362a:	9d ac       	ldd	r9, Y+61	; 0x3d
    362c:	ae ac       	ldd	r10, Y+62	; 0x3e
    362e:	bf ac       	ldd	r11, Y+63	; 0x3f
    3630:	65 97       	sbiw	r28, 0x15	; 21
    3632:	69 96       	adiw	r28, 0x19	; 25
    3634:	cc ac       	ldd	r12, Y+60	; 0x3c
    3636:	dd ac       	ldd	r13, Y+61	; 0x3d
    3638:	ee ac       	ldd	r14, Y+62	; 0x3e
    363a:	ff ac       	ldd	r15, Y+63	; 0x3f
    363c:	69 97       	sbiw	r28, 0x19	; 25
    363e:	68 ed       	ldi	r22, 0xD8	; 216
    3640:	71 e0       	ldi	r23, 0x01	; 1
    3642:	f1 01       	movw	r30, r2
    3644:	80 81       	ld	r24, Z
    3646:	91 81       	ldd	r25, Z+1	; 0x01
    3648:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    364c:	b5 01       	movw	r22, r10
    364e:	a4 01       	movw	r20, r8
    3650:	d1 01       	movw	r26, r2
    3652:	8d 91       	ld	r24, X+
    3654:	9c 91       	ld	r25, X
    3656:	0e 94 2b 10 	call	0x2056	; 0x2056 <_ZN5Print5printEli.constprop.131>
    365a:	64 ed       	ldi	r22, 0xD4	; 212
    365c:	71 e0       	ldi	r23, 0x01	; 1
    365e:	f1 01       	movw	r30, r2
    3660:	80 81       	ld	r24, Z
    3662:	91 81       	ldd	r25, Z+1	; 0x01
    3664:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    3668:	b7 01       	movw	r22, r14
    366a:	a6 01       	movw	r20, r12
    366c:	d1 01       	movw	r26, r2
    366e:	8d 91       	ld	r24, X+
    3670:	9c 91       	ld	r25, X
    3672:	0e 94 2b 10 	call	0x2056	; 0x2056 <_ZN5Print5printEli.constprop.131>
    3676:	f1 01       	movw	r30, r2
    3678:	00 81       	ld	r16, Z
    367a:	11 81       	ldd	r17, Z+1	; 0x01
    367c:	69 e2       	ldi	r22, 0x29	; 41
    367e:	c8 01       	movw	r24, r16
    3680:	0e 94 5d 09 	call	0x12ba	; 0x12ba <_ZN5Print5printEc>
    3684:	c8 01       	movw	r24, r16
    3686:	0e 94 57 10 	call	0x20ae	; 0x20ae <_ZN5Print7printlnEv>
    368a:	e0 96       	adiw	r28, 0x30	; 48
    368c:	6e ad       	ldd	r22, Y+62	; 0x3e
    368e:	7f ad       	ldd	r23, Y+63	; 0x3f
    3690:	e0 97       	sbiw	r28, 0x30	; 48
    3692:	c1 01       	movw	r24, r2
    3694:	0e 94 72 17 	call	0x2ee4	; 0x2ee4 <_ZN14SerialCommands12printCommandERK7Command>
    3698:	d1 01       	movw	r26, r2
    369a:	8d 91       	ld	r24, X+
    369c:	9c 91       	ld	r25, X
    369e:	7c cf       	rjmp	.-264    	; 0x3598 <_ZN14SerialCommands10readSerialEv+0x546>
    36a0:	0e 94 30 33 	call	0x6660	; 0x6660 <__floatsisf>
    36a4:	a5 01       	movw	r20, r10
    36a6:	94 01       	movw	r18, r8
    36a8:	0e 94 29 33 	call	0x6652	; 0x6652 <__cmpsf2>
    36ac:	18 16       	cp	r1, r24
    36ae:	0c f4       	brge	.+2      	; 0x36b2 <_ZN14SerialCommands10readSerialEv+0x660>
    36b0:	81 cf       	rjmp	.-254    	; 0x35b4 <_ZN14SerialCommands10readSerialEv+0x562>
    36b2:	c3 01       	movw	r24, r6
    36b4:	b2 01       	movw	r22, r4
    36b6:	0e 94 30 33 	call	0x6660	; 0x6660 <__floatsisf>
    36ba:	a5 01       	movw	r20, r10
    36bc:	94 01       	movw	r18, r8
    36be:	0e 94 5c 35 	call	0x6ab8	; 0x6ab8 <__gesf2>
    36c2:	87 ff       	sbrs	r24, 7
    36c4:	0f cf       	rjmp	.-482    	; 0x34e4 <_ZN14SerialCommands10readSerialEv+0x492>
    36c6:	76 cf       	rjmp	.-276    	; 0x35b4 <_ZN14SerialCommands10readSerialEv+0x562>
    36c8:	e0 96       	adiw	r28, 0x30	; 48
    36ca:	ee ad       	ldd	r30, Y+62	; 0x3e
    36cc:	ff ad       	ldd	r31, Y+63	; 0x3f
    36ce:	e0 97       	sbiw	r28, 0x30	; 48
    36d0:	80 81       	ld	r24, Z
    36d2:	91 81       	ldd	r25, Z+1	; 0x01
    36d4:	fc 01       	movw	r30, r24
    36d6:	38 96       	adiw	r30, 0x08	; 8
    36d8:	e5 90       	lpm	r14, Z+
    36da:	f4 90       	lpm	r15, Z
    36dc:	fc 01       	movw	r30, r24
    36de:	3a 96       	adiw	r30, 0x0a	; 10
    36e0:	85 91       	lpm	r24, Z+
    36e2:	94 91       	lpm	r25, Z
    36e4:	e8 96       	adiw	r28, 0x38	; 56
    36e6:	9f af       	std	Y+63, r25	; 0x3f
    36e8:	8e af       	std	Y+62, r24	; 0x3e
    36ea:	e8 97       	sbiw	r28, 0x38	; 56
    36ec:	be 01       	movw	r22, r28
    36ee:	65 59       	subi	r22, 0x95	; 149
    36f0:	7f 4f       	sbci	r23, 0xFF	; 255
    36f2:	c1 01       	movw	r24, r2
    36f4:	0e 94 98 0b 	call	0x1730	; 0x1730 <_ZN14SerialCommands8getTokenEPPc>
    36f8:	8c 01       	movw	r16, r24
    36fa:	e1 14       	cp	r14, r1
    36fc:	f1 04       	cpc	r15, r1
    36fe:	29 f4       	brne	.+10     	; 0x370a <_ZN14SerialCommands10readSerialEv+0x6b8>
    3700:	89 2b       	or	r24, r25
    3702:	31 f0       	breq	.+12     	; 0x3710 <_ZN14SerialCommands10readSerialEv+0x6be>
    3704:	62 e5       	ldi	r22, 0x52	; 82
    3706:	72 e0       	ldi	r23, 0x02	; 2
    3708:	3a ce       	rjmp	.-908    	; 0x337e <_ZN14SerialCommands10readSerialEv+0x32c>
    370a:	89 2b       	or	r24, r25
    370c:	09 f0       	breq	.+2      	; 0x3710 <_ZN14SerialCommands10readSerialEv+0x6be>
    370e:	d0 cd       	rjmp	.-1120   	; 0x32b0 <_ZN14SerialCommands10readSerialEv+0x25e>
    3710:	e0 96       	adiw	r28, 0x30	; 48
    3712:	ae ad       	ldd	r26, Y+62	; 0x3e
    3714:	bf ad       	ldd	r27, Y+63	; 0x3f
    3716:	e0 97       	sbiw	r28, 0x30	; 48
    3718:	ed 91       	ld	r30, X+
    371a:	fc 91       	ld	r31, X
    371c:	36 96       	adiw	r30, 0x06	; 6
    371e:	25 91       	lpm	r18, Z+
    3720:	34 91       	lpm	r19, Z
    3722:	21 15       	cp	r18, r1
    3724:	31 05       	cpc	r19, r1
    3726:	09 f4       	brne	.+2      	; 0x372a <_ZN14SerialCommands10readSerialEv+0x6d8>
    3728:	11 cd       	rjmp	.-1502   	; 0x314c <_ZN14SerialCommands10readSerialEv+0xfa>
    372a:	be 01       	movw	r22, r28
    372c:	6f 5f       	subi	r22, 0xFF	; 255
    372e:	7f 4f       	sbci	r23, 0xFF	; 255
    3730:	c1 01       	movw	r24, r2
    3732:	f9 01       	movw	r30, r18
    3734:	09 95       	icall
    3736:	0a cd       	rjmp	.-1516   	; 0x314c <_ZN14SerialCommands10readSerialEv+0xfa>
    3738:	62 e3       	ldi	r22, 0x32	; 50
    373a:	72 e0       	ldi	r23, 0x02	; 2
    373c:	d1 01       	movw	r26, r2
    373e:	8d 91       	ld	r24, X+
    3740:	9c 91       	ld	r25, X
    3742:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    3746:	b8 01       	movw	r22, r16
    3748:	f1 01       	movw	r30, r2
    374a:	80 81       	ld	r24, Z
    374c:	91 81       	ldd	r25, Z+1	; 0x01
    374e:	0e 94 cf 0f 	call	0x1f9e	; 0x1f9e <_ZN5Print5writeEPKc.part.2>
    3752:	d1 01       	movw	r26, r2
    3754:	0d 91       	ld	r16, X+
    3756:	1c 91       	ld	r17, X
    3758:	62 e2       	ldi	r22, 0x22	; 34
    375a:	c8 01       	movw	r24, r16
    375c:	0e 94 5d 09 	call	0x12ba	; 0x12ba <_ZN5Print5printEc>
    3760:	c8 01       	movw	r24, r16
    3762:	1a cf       	rjmp	.-460    	; 0x3598 <_ZN14SerialCommands10readSerialEv+0x546>
    3764:	f1 01       	movw	r30, r2
    3766:	84 81       	ldd	r24, Z+4	; 0x04
    3768:	95 81       	ldd	r25, Z+5	; 0x05
    376a:	28 17       	cp	r18, r24
    376c:	39 07       	cpc	r19, r25
    376e:	68 f4       	brcc	.+26     	; 0x378a <_ZN14SerialCommands10readSerialEv+0x738>
    3770:	02 80       	ldd	r0, Z+2	; 0x02
    3772:	f3 81       	ldd	r31, Z+3	; 0x03
    3774:	e0 2d       	mov	r30, r0
    3776:	e2 0f       	add	r30, r18
    3778:	f3 1f       	adc	r31, r19
    377a:	10 83       	st	Z, r17
    377c:	2f 5f       	subi	r18, 0xFF	; 255
    377e:	3f 4f       	sbci	r19, 0xFF	; 255
    3780:	30 93 fc 01 	sts	0x01FC, r19	; 0x8001fc <_ZZN14SerialCommands10readSerialEvE5index+0x1>
    3784:	20 93 fb 01 	sts	0x01FB, r18	; 0x8001fb <_ZZN14SerialCommands10readSerialEvE5index>
    3788:	e5 cc       	rjmp	.-1590   	; 0x3154 <_ZN14SerialCommands10readSerialEv+0x102>
    378a:	6c e6       	ldi	r22, 0x6C	; 108
    378c:	72 e0       	ldi	r23, 0x02	; 2
    378e:	80 81       	ld	r24, Z
    3790:	91 81       	ldd	r25, Z+1	; 0x01
    3792:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    3796:	da cc       	rjmp	.-1612   	; 0x314c <_ZN14SerialCommands10readSerialEv+0xfa>
    3798:	c4 58       	subi	r28, 0x84	; 132
    379a:	df 4f       	sbci	r29, 0xFF	; 255
    379c:	e2 e1       	ldi	r30, 0x12	; 18
    379e:	0c 94 b4 34 	jmp	0x6968	; 0x6968 <__epilogue_restores__>

000037a2 <twi_stop>:
    37a2:	85 ed       	ldi	r24, 0xD5	; 213
    37a4:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    37a8:	80 91 6d 02 	lds	r24, 0x026D	; 0x80026d <twi_timeout_us>
    37ac:	90 91 6e 02 	lds	r25, 0x026E	; 0x80026e <twi_timeout_us+0x1>
    37b0:	a0 91 6f 02 	lds	r26, 0x026F	; 0x80026f <twi_timeout_us+0x2>
    37b4:	b0 91 70 02 	lds	r27, 0x0270	; 0x800270 <twi_timeout_us+0x3>
    37b8:	07 96       	adiw	r24, 0x07	; 7
    37ba:	a1 1d       	adc	r26, r1
    37bc:	b1 1d       	adc	r27, r1
    37be:	23 e0       	ldi	r18, 0x03	; 3
    37c0:	b6 95       	lsr	r27
    37c2:	a7 95       	ror	r26
    37c4:	97 95       	ror	r25
    37c6:	87 95       	ror	r24
    37c8:	2a 95       	dec	r18
    37ca:	d1 f7       	brne	.-12     	; 0x37c0 <twi_stop+0x1e>
    37cc:	20 91 bc 00 	lds	r18, 0x00BC	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    37d0:	24 fd       	sbrc	r18, 4
    37d2:	03 c0       	rjmp	.+6      	; 0x37da <twi_stop+0x38>
    37d4:	10 92 6b 02 	sts	0x026B, r1	; 0x80026b <twi_state>
    37d8:	08 95       	ret
    37da:	40 91 6d 02 	lds	r20, 0x026D	; 0x80026d <twi_timeout_us>
    37de:	50 91 6e 02 	lds	r21, 0x026E	; 0x80026e <twi_timeout_us+0x1>
    37e2:	60 91 6f 02 	lds	r22, 0x026F	; 0x80026f <twi_timeout_us+0x2>
    37e6:	70 91 70 02 	lds	r23, 0x0270	; 0x800270 <twi_timeout_us+0x3>
    37ea:	45 2b       	or	r20, r21
    37ec:	46 2b       	or	r20, r22
    37ee:	47 2b       	or	r20, r23
    37f0:	69 f3       	breq	.-38     	; 0x37cc <twi_stop+0x2a>
    37f2:	00 97       	sbiw	r24, 0x00	; 0
    37f4:	a1 05       	cpc	r26, r1
    37f6:	b1 05       	cpc	r27, r1
    37f8:	41 f0       	breq	.+16     	; 0x380a <twi_stop+0x68>
    37fa:	2a e2       	ldi	r18, 0x2A	; 42
    37fc:	2a 95       	dec	r18
    37fe:	f1 f7       	brne	.-4      	; 0x37fc <twi_stop+0x5a>
    3800:	00 c0       	rjmp	.+0      	; 0x3802 <twi_stop+0x60>
    3802:	01 97       	sbiw	r24, 0x01	; 1
    3804:	a1 09       	sbc	r26, r1
    3806:	b1 09       	sbc	r27, r1
    3808:	e1 cf       	rjmp	.-62     	; 0x37cc <twi_stop+0x2a>
    380a:	80 91 6c 02 	lds	r24, 0x026C	; 0x80026c <twi_do_reset_on_timeout>
    380e:	0e 94 36 0c 	call	0x186c	; 0x186c <twi_handleTimeout>
    3812:	08 95       	ret

00003814 <_ZN5EERef6updateEh>:
    3814:	ff 92       	push	r15
    3816:	0f 93       	push	r16
    3818:	1f 93       	push	r17
    381a:	cf 93       	push	r28
    381c:	df 93       	push	r29
    381e:	ec 01       	movw	r28, r24
    3820:	f6 2e       	mov	r15, r22
    3822:	08 81       	ld	r16, Y
    3824:	19 81       	ldd	r17, Y+1	; 0x01
    3826:	c8 01       	movw	r24, r16
    3828:	0e 94 50 34 	call	0x68a0	; 0x68a0 <eeprom_read_byte>
    382c:	f8 16       	cp	r15, r24
    382e:	21 f0       	breq	.+8      	; 0x3838 <_ZN5EERef6updateEh+0x24>
    3830:	6f 2d       	mov	r22, r15
    3832:	c8 01       	movw	r24, r16
    3834:	0e 94 58 34 	call	0x68b0	; 0x68b0 <eeprom_write_byte>
    3838:	ce 01       	movw	r24, r28
    383a:	cd b7       	in	r28, 0x3d	; 61
    383c:	de b7       	in	r29, 0x3e	; 62
    383e:	e5 e0       	ldi	r30, 0x05	; 5
    3840:	0c 94 c1 34 	jmp	0x6982	; 0x6982 <__epilogue_restores__+0x1a>

00003844 <_ZN18KeyboardController12generateSaltEv>:
    3844:	a2 e0       	ldi	r26, 0x02	; 2
    3846:	b0 e0       	ldi	r27, 0x00	; 0
    3848:	e8 e2       	ldi	r30, 0x28	; 40
    384a:	fc e1       	ldi	r31, 0x1C	; 28
    384c:	0c 94 a7 34 	jmp	0x694e	; 0x694e <__prologue_saves__+0x1e>
    3850:	90 e0       	ldi	r25, 0x00	; 0
    3852:	80 e0       	ldi	r24, 0x00	; 0
    3854:	0e 94 50 34 	call	0x68a0	; 0x68a0 <eeprom_read_byte>
    3858:	18 2f       	mov	r17, r24
    385a:	81 11       	cpse	r24, r1
    385c:	14 c0       	rjmp	.+40     	; 0x3886 <_ZN18KeyboardController12generateSaltEv+0x42>
    385e:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    3862:	cb 01       	movw	r24, r22
    3864:	0e 94 8c 31 	call	0x6318	; 0x6318 <srand>
    3868:	0e 94 87 31 	call	0x630e	; 0x630e <rand>
    386c:	6e ef       	ldi	r22, 0xFE	; 254
    386e:	70 e0       	ldi	r23, 0x00	; 0
    3870:	0e 94 24 35 	call	0x6a48	; 0x6a48 <__divmodhi4>
    3874:	11 e0       	ldi	r17, 0x01	; 1
    3876:	18 0f       	add	r17, r24
    3878:	1a 82       	std	Y+2, r1	; 0x02
    387a:	19 82       	std	Y+1, r1	; 0x01
    387c:	61 2f       	mov	r22, r17
    387e:	ce 01       	movw	r24, r28
    3880:	01 96       	adiw	r24, 0x01	; 1
    3882:	0e 94 0a 1c 	call	0x3814	; 0x3814 <_ZN5EERef6updateEh>
    3886:	81 2f       	mov	r24, r17
    3888:	22 96       	adiw	r28, 0x02	; 2
    388a:	e3 e0       	ldi	r30, 0x03	; 3
    388c:	0c 94 c3 34 	jmp	0x6986	; 0x6986 <__epilogue_restores__+0x1e>

00003890 <_Z14commandGenSaltR14SerialCommandsR4Args>:
    3890:	cf 93       	push	r28
    3892:	df 93       	push	r29
    3894:	ec 01       	movw	r28, r24
    3896:	0e 94 44 0f 	call	0x1e88	; 0x1e88 <_ZN18KeyboardController13isSeedCheckedEv>
    389a:	81 11       	cpse	r24, r1
    389c:	0c c0       	rjmp	.+24     	; 0x38b6 <_Z14commandGenSaltR14SerialCommandsR4Args+0x26>
    389e:	0e 94 22 1c 	call	0x3844	; 0x3844 <_ZN18KeyboardController12generateSaltEv>
    38a2:	68 2f       	mov	r22, r24
    38a4:	ce 01       	movw	r24, r28
    38a6:	0e 94 e4 0e 	call	0x1dc8	; 0x1dc8 <_ZL12printHexByteR14SerialCommandsh>
    38aa:	ce 01       	movw	r24, r28
    38ac:	0e 94 d9 14 	call	0x29b2	; 0x29b2 <_ZL7printOKR14SerialCommands>
    38b0:	df 91       	pop	r29
    38b2:	cf 91       	pop	r28
    38b4:	08 95       	ret
    38b6:	66 e6       	ldi	r22, 0x66	; 102
    38b8:	71 e0       	ldi	r23, 0x01	; 1
    38ba:	ce 01       	movw	r24, r28
    38bc:	0e 94 c3 14 	call	0x2986	; 0x2986 <_ZL10printErrorR14SerialCommandsPK19__FlashStringHelper>
    38c0:	f7 cf       	rjmp	.-18     	; 0x38b0 <_Z14commandGenSaltR14SerialCommandsR4Args+0x20>

000038c2 <_ZN18KeyboardController12generateSeedEPhh.constprop.145>:
    38c2:	a2 e0       	ldi	r26, 0x02	; 2
    38c4:	b0 e0       	ldi	r27, 0x00	; 0
    38c6:	e7 e6       	ldi	r30, 0x67	; 103
    38c8:	fc e1       	ldi	r31, 0x1C	; 28
    38ca:	0c 94 a2 34 	jmp	0x6944	; 0x6944 <__prologue_saves__+0x14>
    38ce:	8c 01       	movw	r16, r24
    38d0:	82 e0       	ldi	r24, 0x02	; 2
    38d2:	90 e0       	ldi	r25, 0x00	; 0
    38d4:	0e 94 50 34 	call	0x68a0	; 0x68a0 <eeprom_read_byte>
    38d8:	88 23       	and	r24, r24
    38da:	91 f0       	breq	.+36     	; 0x3900 <_ZN18KeyboardController12generateSeedEPhh.constprop.145+0x3e>
    38dc:	78 01       	movw	r14, r16
    38de:	02 e0       	ldi	r16, 0x02	; 2
    38e0:	10 e0       	ldi	r17, 0x00	; 0
    38e2:	c8 01       	movw	r24, r16
    38e4:	0e 94 50 34 	call	0x68a0	; 0x68a0 <eeprom_read_byte>
    38e8:	f7 01       	movw	r30, r14
    38ea:	81 93       	st	Z+, r24
    38ec:	7f 01       	movw	r14, r30
    38ee:	0f 5f       	subi	r16, 0xFF	; 255
    38f0:	1f 4f       	sbci	r17, 0xFF	; 255
    38f2:	02 31       	cpi	r16, 0x12	; 18
    38f4:	11 05       	cpc	r17, r1
    38f6:	a9 f7       	brne	.-22     	; 0x38e2 <_ZN18KeyboardController12generateSeedEPhh.constprop.145+0x20>
    38f8:	22 96       	adiw	r28, 0x02	; 2
    38fa:	e8 e0       	ldi	r30, 0x08	; 8
    38fc:	0c 94 be 34 	jmp	0x697c	; 0x697c <__epilogue_restores__+0x14>
    3900:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    3904:	cb 01       	movw	r24, r22
    3906:	0e 94 8c 31 	call	0x6318	; 0x6318 <srand>
    390a:	78 01       	movw	r14, r16
    390c:	02 e0       	ldi	r16, 0x02	; 2
    390e:	10 e0       	ldi	r17, 0x00	; 0
    3910:	8e ef       	ldi	r24, 0xFE	; 254
    3912:	c8 2e       	mov	r12, r24
    3914:	d1 2c       	mov	r13, r1
    3916:	0e 94 87 31 	call	0x630e	; 0x630e <rand>
    391a:	b6 01       	movw	r22, r12
    391c:	0e 94 24 35 	call	0x6a48	; 0x6a48 <__divmodhi4>
    3920:	61 e0       	ldi	r22, 0x01	; 1
    3922:	68 0f       	add	r22, r24
    3924:	f7 01       	movw	r30, r14
    3926:	61 93       	st	Z+, r22
    3928:	7f 01       	movw	r14, r30
    392a:	1a 83       	std	Y+2, r17	; 0x02
    392c:	09 83       	std	Y+1, r16	; 0x01
    392e:	ce 01       	movw	r24, r28
    3930:	01 96       	adiw	r24, 0x01	; 1
    3932:	0e 94 0a 1c 	call	0x3814	; 0x3814 <_ZN5EERef6updateEh>
    3936:	0f 5f       	subi	r16, 0xFF	; 255
    3938:	1f 4f       	sbci	r17, 0xFF	; 255
    393a:	02 31       	cpi	r16, 0x12	; 18
    393c:	11 05       	cpc	r17, r1
    393e:	59 f7       	brne	.-42     	; 0x3916 <_ZN18KeyboardController12generateSeedEPhh.constprop.145+0x54>
    3940:	db cf       	rjmp	.-74     	; 0x38f8 <_ZN18KeyboardController12generateSeedEPhh.constprop.145+0x36>

00003942 <_Z9seedCheckR14SerialCommandsR4Args.part.2>:
    3942:	8f 92       	push	r8
    3944:	9f 92       	push	r9
    3946:	af 92       	push	r10
    3948:	bf 92       	push	r11
    394a:	cf 92       	push	r12
    394c:	df 92       	push	r13
    394e:	ff 92       	push	r15
    3950:	0f 93       	push	r16
    3952:	1f 93       	push	r17
    3954:	cf 93       	push	r28
    3956:	df 93       	push	r29
    3958:	cd b7       	in	r28, 0x3d	; 61
    395a:	de b7       	in	r29, 0x3e	; 62
    395c:	a1 97       	sbiw	r28, 0x21	; 33
    395e:	0f b6       	in	r0, 0x3f	; 63
    3960:	f8 94       	cli
    3962:	de bf       	out	0x3e, r29	; 62
    3964:	0f be       	out	0x3f, r0	; 63
    3966:	cd bf       	out	0x3d, r28	; 61
    3968:	6c 01       	movw	r12, r24
    396a:	fb 01       	movw	r30, r22
    396c:	00 81       	ld	r16, Z
    396e:	11 81       	ldd	r17, Z+1	; 0x01
    3970:	48 01       	movw	r8, r16
    3972:	f0 e2       	ldi	r31, 0x20	; 32
    3974:	8f 0e       	add	r8, r31
    3976:	91 1c       	adc	r9, r1
    3978:	be 01       	movw	r22, r28
    397a:	6f 5f       	subi	r22, 0xFF	; 255
    397c:	7f 4f       	sbci	r23, 0xFF	; 255
    397e:	5b 01       	movw	r10, r22
    3980:	be 01       	movw	r22, r28
    3982:	6f 5d       	subi	r22, 0xDF	; 223
    3984:	7f 4f       	sbci	r23, 0xFF	; 255
    3986:	f8 01       	movw	r30, r16
    3988:	80 81       	ld	r24, Z
    398a:	0e 94 ce 0e 	call	0x1d9c	; 0x1d9c <_ZL13hexCharToBytecRh>
    398e:	81 11       	cpse	r24, r1
    3990:	19 c0       	rjmp	.+50     	; 0x39c4 <_Z9seedCheckR14SerialCommandsR4Args.part.2+0x82>
    3992:	68 e9       	ldi	r22, 0x98	; 152
    3994:	71 e0       	ldi	r23, 0x01	; 1
    3996:	c6 01       	movw	r24, r12
    3998:	0e 94 c3 14 	call	0x2986	; 0x2986 <_ZL10printErrorR14SerialCommandsPK19__FlashStringHelper>
    399c:	f1 2c       	mov	r15, r1
    399e:	8f 2d       	mov	r24, r15
    39a0:	a1 96       	adiw	r28, 0x21	; 33
    39a2:	0f b6       	in	r0, 0x3f	; 63
    39a4:	f8 94       	cli
    39a6:	de bf       	out	0x3e, r29	; 62
    39a8:	0f be       	out	0x3f, r0	; 63
    39aa:	cd bf       	out	0x3d, r28	; 61
    39ac:	df 91       	pop	r29
    39ae:	cf 91       	pop	r28
    39b0:	1f 91       	pop	r17
    39b2:	0f 91       	pop	r16
    39b4:	ff 90       	pop	r15
    39b6:	df 90       	pop	r13
    39b8:	cf 90       	pop	r12
    39ba:	bf 90       	pop	r11
    39bc:	af 90       	pop	r10
    39be:	9f 90       	pop	r9
    39c0:	8f 90       	pop	r8
    39c2:	08 95       	ret
    39c4:	be 01       	movw	r22, r28
    39c6:	6f 5e       	subi	r22, 0xEF	; 239
    39c8:	7f 4f       	sbci	r23, 0xFF	; 255
    39ca:	f8 01       	movw	r30, r16
    39cc:	81 81       	ldd	r24, Z+1	; 0x01
    39ce:	0e 94 ce 0e 	call	0x1d9c	; 0x1d9c <_ZL13hexCharToBytecRh>
    39d2:	f8 2e       	mov	r15, r24
    39d4:	88 23       	and	r24, r24
    39d6:	e9 f2       	breq	.-70     	; 0x3992 <_Z9seedCheckR14SerialCommandsR4Args.part.2+0x50>
    39d8:	89 a1       	ldd	r24, Y+33	; 0x21
    39da:	f0 e1       	ldi	r31, 0x10	; 16
    39dc:	8f 9f       	mul	r24, r31
    39de:	90 01       	movw	r18, r0
    39e0:	11 24       	eor	r1, r1
    39e2:	89 89       	ldd	r24, Y+17	; 0x11
    39e4:	82 2b       	or	r24, r18
    39e6:	f5 01       	movw	r30, r10
    39e8:	81 93       	st	Z+, r24
    39ea:	5f 01       	movw	r10, r30
    39ec:	0e 5f       	subi	r16, 0xFE	; 254
    39ee:	1f 4f       	sbci	r17, 0xFF	; 255
    39f0:	08 15       	cp	r16, r8
    39f2:	19 05       	cpc	r17, r9
    39f4:	29 f6       	brne	.-118    	; 0x3980 <_Z9seedCheckR14SerialCommandsR4Args.part.2+0x3e>
    39f6:	ce 01       	movw	r24, r28
    39f8:	41 96       	adiw	r24, 0x11	; 17
    39fa:	0e 94 61 1c 	call	0x38c2	; 0x38c2 <_ZN18KeyboardController12generateSeedEPhh.constprop.145>
    39fe:	0e 94 22 1c 	call	0x3844	; 0x3844 <_ZN18KeyboardController12generateSaltEv>
    3a02:	8f 70       	andi	r24, 0x0F	; 15
    3a04:	e1 e1       	ldi	r30, 0x11	; 17
    3a06:	f0 e0       	ldi	r31, 0x00	; 0
    3a08:	ec 0f       	add	r30, r28
    3a0a:	fd 1f       	adc	r31, r29
    3a0c:	e8 0f       	add	r30, r24
    3a0e:	f1 1d       	adc	r31, r1
    3a10:	90 81       	ld	r25, Z
    3a12:	29 81       	ldd	r18, Y+1	; 0x01
    3a14:	92 27       	eor	r25, r18
    3a16:	99 83       	std	Y+1, r25	; 0x01
    3a18:	de 01       	movw	r26, r28
    3a1a:	12 96       	adiw	r26, 0x02	; 2
    3a1c:	ad 01       	movw	r20, r26
    3a1e:	21 e0       	ldi	r18, 0x01	; 1
    3a20:	fa 01       	movw	r30, r20
    3a22:	31 91       	ld	r19, Z+
    3a24:	af 01       	movw	r20, r30
    3a26:	e8 2f       	mov	r30, r24
    3a28:	e2 0f       	add	r30, r18
    3a2a:	ef 70       	andi	r30, 0x0F	; 15
    3a2c:	61 e1       	ldi	r22, 0x11	; 17
    3a2e:	70 e0       	ldi	r23, 0x00	; 0
    3a30:	6c 0f       	add	r22, r28
    3a32:	7d 1f       	adc	r23, r29
    3a34:	6e 0f       	add	r22, r30
    3a36:	71 1d       	adc	r23, r1
    3a38:	fb 01       	movw	r30, r22
    3a3a:	60 81       	ld	r22, Z
    3a3c:	36 27       	eor	r19, r22
    3a3e:	93 27       	eor	r25, r19
    3a40:	fa 01       	movw	r30, r20
    3a42:	31 97       	sbiw	r30, 0x01	; 1
    3a44:	90 83       	st	Z, r25
    3a46:	2f 5f       	subi	r18, 0xFF	; 255
    3a48:	20 31       	cpi	r18, 0x10	; 16
    3a4a:	51 f7       	brne	.-44     	; 0x3a20 <_Z9seedCheckR14SerialCommandsR4Args.part.2+0xde>
    3a4c:	99 81       	ldd	r25, Y+1	; 0x01
    3a4e:	89 89       	ldd	r24, Y+17	; 0x11
    3a50:	67 e8       	ldi	r22, 0x87	; 135
    3a52:	71 e0       	ldi	r23, 0x01	; 1
    3a54:	98 13       	cpse	r25, r24
    3a56:	9f cf       	rjmp	.-194    	; 0x3996 <_Z9seedCheckR14SerialCommandsR4Args.part.2+0x54>
    3a58:	fe 01       	movw	r30, r28
    3a5a:	72 96       	adiw	r30, 0x12	; 18
    3a5c:	81 e0       	ldi	r24, 0x01	; 1
    3a5e:	90 e0       	ldi	r25, 0x00	; 0
    3a60:	8c 0f       	add	r24, r28
    3a62:	9d 1f       	adc	r25, r29
    3a64:	40 96       	adiw	r24, 0x10	; 16
    3a66:	3d 91       	ld	r19, X+
    3a68:	21 91       	ld	r18, Z+
    3a6a:	32 17       	cp	r19, r18
    3a6c:	19 f0       	breq	.+6      	; 0x3a74 <_Z9seedCheckR14SerialCommandsR4Args.part.2+0x132>
    3a6e:	67 e8       	ldi	r22, 0x87	; 135
    3a70:	71 e0       	ldi	r23, 0x01	; 1
    3a72:	91 cf       	rjmp	.-222    	; 0x3996 <_Z9seedCheckR14SerialCommandsR4Args.part.2+0x54>
    3a74:	8a 17       	cp	r24, r26
    3a76:	9b 07       	cpc	r25, r27
    3a78:	b1 f7       	brne	.-20     	; 0x3a66 <_Z9seedCheckR14SerialCommandsR4Args.part.2+0x124>
    3a7a:	91 cf       	rjmp	.-222    	; 0x399e <_Z9seedCheckR14SerialCommandsR4Args.part.2+0x5c>

00003a7c <_Z13commandUnlockR14SerialCommandsR4Args>:
    3a7c:	0f 93       	push	r16
    3a7e:	1f 93       	push	r17
    3a80:	cf 93       	push	r28
    3a82:	df 93       	push	r29
    3a84:	ec 01       	movw	r28, r24
    3a86:	8b 01       	movw	r16, r22
    3a88:	0e 94 44 0f 	call	0x1e88	; 0x1e88 <_ZN18KeyboardController13isSeedCheckedEv>
    3a8c:	81 11       	cpse	r24, r1
    3a8e:	0a c0       	rjmp	.+20     	; 0x3aa4 <_Z13commandUnlockR14SerialCommandsR4Args+0x28>
    3a90:	66 e7       	ldi	r22, 0x76	; 118
    3a92:	71 e0       	ldi	r23, 0x01	; 1
    3a94:	ce 01       	movw	r24, r28
    3a96:	0e 94 c3 14 	call	0x2986	; 0x2986 <_ZL10printErrorR14SerialCommandsPK19__FlashStringHelper>
    3a9a:	df 91       	pop	r29
    3a9c:	cf 91       	pop	r28
    3a9e:	1f 91       	pop	r17
    3aa0:	0f 91       	pop	r16
    3aa2:	08 95       	ret
    3aa4:	b8 01       	movw	r22, r16
    3aa6:	ce 01       	movw	r24, r28
    3aa8:	0e 94 a1 1c 	call	0x3942	; 0x3942 <_Z9seedCheckR14SerialCommandsR4Args.part.2>
    3aac:	88 23       	and	r24, r24
    3aae:	a9 f3       	breq	.-22     	; 0x3a9a <_Z13commandUnlockR14SerialCommandsR4Args+0x1e>
    3ab0:	0e 94 af 10 	call	0x215e	; 0x215e <_ZN18KeyboardController6unlockEv.constprop.135>
    3ab4:	ce 01       	movw	r24, r28
    3ab6:	0e 94 d9 14 	call	0x29b2	; 0x29b2 <_ZL7printOKR14SerialCommands>
    3aba:	ef cf       	rjmp	.-34     	; 0x3a9a <_Z13commandUnlockR14SerialCommandsR4Args+0x1e>

00003abc <_Z11commandLockR14SerialCommandsR4Args>:
    3abc:	0f 93       	push	r16
    3abe:	1f 93       	push	r17
    3ac0:	cf 93       	push	r28
    3ac2:	df 93       	push	r29
    3ac4:	ec 01       	movw	r28, r24
    3ac6:	8b 01       	movw	r16, r22
    3ac8:	0e 94 44 0f 	call	0x1e88	; 0x1e88 <_ZN18KeyboardController13isSeedCheckedEv>
    3acc:	81 11       	cpse	r24, r1
    3ace:	0a c0       	rjmp	.+20     	; 0x3ae4 <_Z11commandLockR14SerialCommandsR4Args+0x28>
    3ad0:	66 e7       	ldi	r22, 0x76	; 118
    3ad2:	71 e0       	ldi	r23, 0x01	; 1
    3ad4:	ce 01       	movw	r24, r28
    3ad6:	0e 94 c3 14 	call	0x2986	; 0x2986 <_ZL10printErrorR14SerialCommandsPK19__FlashStringHelper>
    3ada:	df 91       	pop	r29
    3adc:	cf 91       	pop	r28
    3ade:	1f 91       	pop	r17
    3ae0:	0f 91       	pop	r16
    3ae2:	08 95       	ret
    3ae4:	b8 01       	movw	r22, r16
    3ae6:	ce 01       	movw	r24, r28
    3ae8:	0e 94 a1 1c 	call	0x3942	; 0x3942 <_Z9seedCheckR14SerialCommandsR4Args.part.2>
    3aec:	88 23       	and	r24, r24
    3aee:	a9 f3       	breq	.-22     	; 0x3ada <_Z11commandLockR14SerialCommandsR4Args+0x1e>
    3af0:	0e 94 97 10 	call	0x212e	; 0x212e <_ZN18KeyboardController4lockEv.constprop.138>
    3af4:	ce 01       	movw	r24, r28
    3af6:	0e 94 d9 14 	call	0x29b2	; 0x29b2 <_ZL7printOKR14SerialCommands>
    3afa:	ef cf       	rjmp	.-34     	; 0x3ada <_Z11commandLockR14SerialCommandsR4Args+0x1e>

00003afc <_Z14commandGenSeedR14SerialCommandsR4Args>:
    3afc:	a0 e1       	ldi	r26, 0x10	; 16
    3afe:	b0 e0       	ldi	r27, 0x00	; 0
    3b00:	e4 e8       	ldi	r30, 0x84	; 132
    3b02:	fd e1       	ldi	r31, 0x1D	; 29
    3b04:	0c 94 a2 34 	jmp	0x6944	; 0x6944 <__prologue_saves__+0x14>
    3b08:	7c 01       	movw	r14, r24
    3b0a:	0e 94 44 0f 	call	0x1e88	; 0x1e88 <_ZN18KeyboardController13isSeedCheckedEv>
    3b0e:	81 11       	cpse	r24, r1
    3b10:	2f c0       	rjmp	.+94     	; 0x3b70 <_Z14commandGenSeedR14SerialCommandsR4Args+0x74>
    3b12:	0e 94 22 1c 	call	0x3844	; 0x3844 <_ZN18KeyboardController12generateSaltEv>
    3b16:	18 2f       	mov	r17, r24
    3b18:	ce 01       	movw	r24, r28
    3b1a:	01 96       	adiw	r24, 0x01	; 1
    3b1c:	0e 94 61 1c 	call	0x38c2	; 0x38c2 <_ZN18KeyboardController12generateSeedEPhh.constprop.145>
    3b20:	89 81       	ldd	r24, Y+1	; 0x01
    3b22:	81 27       	eor	r24, r17
    3b24:	89 83       	std	Y+1, r24	; 0x01
    3b26:	ce 01       	movw	r24, r28
    3b28:	01 96       	adiw	r24, 0x01	; 1
    3b2a:	6c 01       	movw	r12, r24
    3b2c:	9e 01       	movw	r18, r28
    3b2e:	20 5f       	subi	r18, 0xF0	; 240
    3b30:	3f 4f       	sbci	r19, 0xFF	; 255
    3b32:	fc 01       	movw	r30, r24
    3b34:	df 01       	movw	r26, r30
    3b36:	31 96       	adiw	r30, 0x01	; 1
    3b38:	11 96       	adiw	r26, 0x01	; 1
    3b3a:	8c 91       	ld	r24, X
    3b3c:	11 97       	sbiw	r26, 0x01	; 1
    3b3e:	9c 91       	ld	r25, X
    3b40:	89 27       	eor	r24, r25
    3b42:	80 83       	st	Z, r24
    3b44:	e2 17       	cp	r30, r18
    3b46:	f3 07       	cpc	r31, r19
    3b48:	a9 f7       	brne	.-22     	; 0x3b34 <_Z14commandGenSeedR14SerialCommandsR4Args+0x38>
    3b4a:	01 e0       	ldi	r16, 0x01	; 1
    3b4c:	10 e0       	ldi	r17, 0x00	; 0
    3b4e:	0c 0f       	add	r16, r28
    3b50:	1d 1f       	adc	r17, r29
    3b52:	00 5f       	subi	r16, 0xF0	; 240
    3b54:	1f 4f       	sbci	r17, 0xFF	; 255
    3b56:	f6 01       	movw	r30, r12
    3b58:	61 91       	ld	r22, Z+
    3b5a:	6f 01       	movw	r12, r30
    3b5c:	c7 01       	movw	r24, r14
    3b5e:	0e 94 e4 0e 	call	0x1dc8	; 0x1dc8 <_ZL12printHexByteR14SerialCommandsh>
    3b62:	0c 15       	cp	r16, r12
    3b64:	1d 05       	cpc	r17, r13
    3b66:	b9 f7       	brne	.-18     	; 0x3b56 <_Z14commandGenSeedR14SerialCommandsR4Args+0x5a>
    3b68:	c7 01       	movw	r24, r14
    3b6a:	0e 94 d9 14 	call	0x29b2	; 0x29b2 <_ZL7printOKR14SerialCommands>
    3b6e:	05 c0       	rjmp	.+10     	; 0x3b7a <_Z14commandGenSeedR14SerialCommandsR4Args+0x7e>
    3b70:	66 e6       	ldi	r22, 0x66	; 102
    3b72:	71 e0       	ldi	r23, 0x01	; 1
    3b74:	c7 01       	movw	r24, r14
    3b76:	0e 94 c3 14 	call	0x2986	; 0x2986 <_ZL10printErrorR14SerialCommandsPK19__FlashStringHelper>
    3b7a:	60 96       	adiw	r28, 0x10	; 16
    3b7c:	e8 e0       	ldi	r30, 0x08	; 8
    3b7e:	0c 94 be 34 	jmp	0x697c	; 0x697c <__epilogue_restores__+0x14>

00003b82 <_Z12commandCheckR14SerialCommandsR4Args>:
    3b82:	a2 e0       	ldi	r26, 0x02	; 2
    3b84:	b0 e0       	ldi	r27, 0x00	; 0
    3b86:	e7 ec       	ldi	r30, 0xC7	; 199
    3b88:	fd e1       	ldi	r31, 0x1D	; 29
    3b8a:	0c 94 a6 34 	jmp	0x694c	; 0x694c <__prologue_saves__+0x1c>
    3b8e:	8c 01       	movw	r16, r24
    3b90:	0e 94 44 0f 	call	0x1e88	; 0x1e88 <_ZN18KeyboardController13isSeedCheckedEv>
    3b94:	88 23       	and	r24, r24
    3b96:	49 f0       	breq	.+18     	; 0x3baa <_Z12commandCheckR14SerialCommandsR4Args+0x28>
    3b98:	66 e6       	ldi	r22, 0x66	; 102
    3b9a:	71 e0       	ldi	r23, 0x01	; 1
    3b9c:	c8 01       	movw	r24, r16
    3b9e:	0e 94 c3 14 	call	0x2986	; 0x2986 <_ZL10printErrorR14SerialCommandsPK19__FlashStringHelper>
    3ba2:	22 96       	adiw	r28, 0x02	; 2
    3ba4:	e4 e0       	ldi	r30, 0x04	; 4
    3ba6:	0c 94 c2 34 	jmp	0x6984	; 0x6984 <__epilogue_restores__+0x1c>
    3baa:	81 e0       	ldi	r24, 0x01	; 1
    3bac:	90 e0       	ldi	r25, 0x00	; 0
    3bae:	9a 83       	std	Y+2, r25	; 0x02
    3bb0:	89 83       	std	Y+1, r24	; 0x01
    3bb2:	61 e0       	ldi	r22, 0x01	; 1
    3bb4:	ce 01       	movw	r24, r28
    3bb6:	01 96       	adiw	r24, 0x01	; 1
    3bb8:	0e 94 0a 1c 	call	0x3814	; 0x3814 <_ZN5EERef6updateEh>
    3bbc:	c8 01       	movw	r24, r16
    3bbe:	0e 94 d9 14 	call	0x29b2	; 0x29b2 <_ZL7printOKR14SerialCommands>
    3bc2:	ef cf       	rjmp	.-34     	; 0x3ba2 <_Z12commandCheckR14SerialCommandsR4Args+0x20>

00003bc4 <__vector_23>:
    3bc4:	1f 92       	push	r1
    3bc6:	0f 92       	push	r0
    3bc8:	0f b6       	in	r0, 0x3f	; 63
    3bca:	0f 92       	push	r0
    3bcc:	11 24       	eor	r1, r1
    3bce:	2f 93       	push	r18
    3bd0:	3f 93       	push	r19
    3bd2:	8f 93       	push	r24
    3bd4:	9f 93       	push	r25
    3bd6:	af 93       	push	r26
    3bd8:	bf 93       	push	r27
    3bda:	80 91 2f 02 	lds	r24, 0x022F	; 0x80022f <timer0_millis>
    3bde:	90 91 30 02 	lds	r25, 0x0230	; 0x800230 <timer0_millis+0x1>
    3be2:	a0 91 31 02 	lds	r26, 0x0231	; 0x800231 <timer0_millis+0x2>
    3be6:	b0 91 32 02 	lds	r27, 0x0232	; 0x800232 <timer0_millis+0x3>
    3bea:	30 91 2e 02 	lds	r19, 0x022E	; 0x80022e <timer0_fract>
    3bee:	23 e0       	ldi	r18, 0x03	; 3
    3bf0:	23 0f       	add	r18, r19
    3bf2:	2d 37       	cpi	r18, 0x7D	; 125
    3bf4:	58 f5       	brcc	.+86     	; 0x3c4c <__vector_23+0x88>
    3bf6:	01 96       	adiw	r24, 0x01	; 1
    3bf8:	a1 1d       	adc	r26, r1
    3bfa:	b1 1d       	adc	r27, r1
    3bfc:	20 93 2e 02 	sts	0x022E, r18	; 0x80022e <timer0_fract>
    3c00:	80 93 2f 02 	sts	0x022F, r24	; 0x80022f <timer0_millis>
    3c04:	90 93 30 02 	sts	0x0230, r25	; 0x800230 <timer0_millis+0x1>
    3c08:	a0 93 31 02 	sts	0x0231, r26	; 0x800231 <timer0_millis+0x2>
    3c0c:	b0 93 32 02 	sts	0x0232, r27	; 0x800232 <timer0_millis+0x3>
    3c10:	80 91 33 02 	lds	r24, 0x0233	; 0x800233 <timer0_overflow_count>
    3c14:	90 91 34 02 	lds	r25, 0x0234	; 0x800234 <timer0_overflow_count+0x1>
    3c18:	a0 91 35 02 	lds	r26, 0x0235	; 0x800235 <timer0_overflow_count+0x2>
    3c1c:	b0 91 36 02 	lds	r27, 0x0236	; 0x800236 <timer0_overflow_count+0x3>
    3c20:	01 96       	adiw	r24, 0x01	; 1
    3c22:	a1 1d       	adc	r26, r1
    3c24:	b1 1d       	adc	r27, r1
    3c26:	80 93 33 02 	sts	0x0233, r24	; 0x800233 <timer0_overflow_count>
    3c2a:	90 93 34 02 	sts	0x0234, r25	; 0x800234 <timer0_overflow_count+0x1>
    3c2e:	a0 93 35 02 	sts	0x0235, r26	; 0x800235 <timer0_overflow_count+0x2>
    3c32:	b0 93 36 02 	sts	0x0236, r27	; 0x800236 <timer0_overflow_count+0x3>
    3c36:	bf 91       	pop	r27
    3c38:	af 91       	pop	r26
    3c3a:	9f 91       	pop	r25
    3c3c:	8f 91       	pop	r24
    3c3e:	3f 91       	pop	r19
    3c40:	2f 91       	pop	r18
    3c42:	0f 90       	pop	r0
    3c44:	0f be       	out	0x3f, r0	; 63
    3c46:	0f 90       	pop	r0
    3c48:	1f 90       	pop	r1
    3c4a:	18 95       	reti
    3c4c:	26 e8       	ldi	r18, 0x86	; 134
    3c4e:	23 0f       	add	r18, r19
    3c50:	02 96       	adiw	r24, 0x02	; 2
    3c52:	a1 1d       	adc	r26, r1
    3c54:	b1 1d       	adc	r27, r1
    3c56:	d2 cf       	rjmp	.-92     	; 0x3bfc <__vector_23+0x38>

00003c58 <__vector_10>:
    3c58:	1f 92       	push	r1
    3c5a:	0f 92       	push	r0
    3c5c:	0f b6       	in	r0, 0x3f	; 63
    3c5e:	0f 92       	push	r0
    3c60:	11 24       	eor	r1, r1
    3c62:	2f 93       	push	r18
    3c64:	3f 93       	push	r19
    3c66:	4f 93       	push	r20
    3c68:	5f 93       	push	r21
    3c6a:	6f 93       	push	r22
    3c6c:	7f 93       	push	r23
    3c6e:	8f 93       	push	r24
    3c70:	9f 93       	push	r25
    3c72:	af 93       	push	r26
    3c74:	bf 93       	push	r27
    3c76:	cf 93       	push	r28
    3c78:	ef 93       	push	r30
    3c7a:	ff 93       	push	r31
    3c7c:	c0 91 e1 00 	lds	r28, 0x00E1	; 0x8000e1 <__TEXT_REGION_LENGTH__+0x7e00e1>
    3c80:	80 91 e1 00 	lds	r24, 0x00E1	; 0x8000e1 <__TEXT_REGION_LENGTH__+0x7e00e1>
    3c84:	83 7f       	andi	r24, 0xF3	; 243
    3c86:	80 93 e1 00 	sts	0x00E1, r24	; 0x8000e1 <__TEXT_REGION_LENGTH__+0x7e00e1>
    3c8a:	c3 ff       	sbrs	r28, 3
    3c8c:	0f c0       	rjmp	.+30     	; 0x3cac <__vector_10+0x54>
    3c8e:	10 92 e9 00 	sts	0x00E9, r1	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
    3c92:	81 e0       	ldi	r24, 0x01	; 1
    3c94:	80 93 eb 00 	sts	0x00EB, r24	; 0x8000eb <__TEXT_REGION_LENGTH__+0x7e00eb>
    3c98:	10 92 ec 00 	sts	0x00EC, r1	; 0x8000ec <__TEXT_REGION_LENGTH__+0x7e00ec>
    3c9c:	82 e3       	ldi	r24, 0x32	; 50
    3c9e:	80 93 ed 00 	sts	0x00ED, r24	; 0x8000ed <__TEXT_REGION_LENGTH__+0x7e00ed>
    3ca2:	10 92 44 02 	sts	0x0244, r1	; 0x800244 <_usbConfiguration>
    3ca6:	88 e0       	ldi	r24, 0x08	; 8
    3ca8:	80 93 f0 00 	sts	0x00F0, r24	; 0x8000f0 <__TEXT_REGION_LENGTH__+0x7e00f0>
    3cac:	c2 ff       	sbrs	r28, 2
    3cae:	1a c0       	rjmp	.+52     	; 0x3ce4 <__vector_10+0x8c>
    3cb0:	0e 94 95 06 	call	0xd2a	; 0xd2a <_Z9USB_Flushh.constprop.46>
    3cb4:	80 91 12 02 	lds	r24, 0x0212	; 0x800212 <TxLEDPulse>
    3cb8:	88 23       	and	r24, r24
    3cba:	41 f0       	breq	.+16     	; 0x3ccc <__vector_10+0x74>
    3cbc:	80 91 12 02 	lds	r24, 0x0212	; 0x800212 <TxLEDPulse>
    3cc0:	81 50       	subi	r24, 0x01	; 1
    3cc2:	80 93 12 02 	sts	0x0212, r24	; 0x800212 <TxLEDPulse>
    3cc6:	81 11       	cpse	r24, r1
    3cc8:	01 c0       	rjmp	.+2      	; 0x3ccc <__vector_10+0x74>
    3cca:	5d 9a       	sbi	0x0b, 5	; 11
    3ccc:	80 91 43 02 	lds	r24, 0x0243	; 0x800243 <RxLEDPulse>
    3cd0:	88 23       	and	r24, r24
    3cd2:	41 f0       	breq	.+16     	; 0x3ce4 <__vector_10+0x8c>
    3cd4:	80 91 43 02 	lds	r24, 0x0243	; 0x800243 <RxLEDPulse>
    3cd8:	81 50       	subi	r24, 0x01	; 1
    3cda:	80 93 43 02 	sts	0x0243, r24	; 0x800243 <RxLEDPulse>
    3cde:	81 11       	cpse	r24, r1
    3ce0:	01 c0       	rjmp	.+2      	; 0x3ce4 <__vector_10+0x8c>
    3ce2:	28 9a       	sbi	0x05, 0	; 5
    3ce4:	c4 ff       	sbrs	r28, 4
    3ce6:	23 c0       	rjmp	.+70     	; 0x3d2e <__vector_10+0xd6>
    3ce8:	80 91 e2 00 	lds	r24, 0x00E2	; 0x8000e2 <__TEXT_REGION_LENGTH__+0x7e00e2>
    3cec:	8e 7e       	andi	r24, 0xEE	; 238
    3cee:	81 60       	ori	r24, 0x01	; 1
    3cf0:	80 93 e2 00 	sts	0x00E2, r24	; 0x8000e2 <__TEXT_REGION_LENGTH__+0x7e00e2>
    3cf4:	80 91 e1 00 	lds	r24, 0x00E1	; 0x8000e1 <__TEXT_REGION_LENGTH__+0x7e00e1>
    3cf8:	8f 7e       	andi	r24, 0xEF	; 239
    3cfa:	80 93 e1 00 	sts	0x00E1, r24	; 0x8000e1 <__TEXT_REGION_LENGTH__+0x7e00e1>
    3cfe:	80 91 13 02 	lds	r24, 0x0213	; 0x800213 <_usbSuspendState>
    3d02:	8e 7e       	andi	r24, 0xEE	; 238
    3d04:	80 61       	ori	r24, 0x10	; 16
    3d06:	80 93 13 02 	sts	0x0213, r24	; 0x800213 <_usbSuspendState>
    3d0a:	ff 91       	pop	r31
    3d0c:	ef 91       	pop	r30
    3d0e:	cf 91       	pop	r28
    3d10:	bf 91       	pop	r27
    3d12:	af 91       	pop	r26
    3d14:	9f 91       	pop	r25
    3d16:	8f 91       	pop	r24
    3d18:	7f 91       	pop	r23
    3d1a:	6f 91       	pop	r22
    3d1c:	5f 91       	pop	r21
    3d1e:	4f 91       	pop	r20
    3d20:	3f 91       	pop	r19
    3d22:	2f 91       	pop	r18
    3d24:	0f 90       	pop	r0
    3d26:	0f be       	out	0x3f, r0	; 63
    3d28:	0f 90       	pop	r0
    3d2a:	1f 90       	pop	r1
    3d2c:	18 95       	reti
    3d2e:	c0 ff       	sbrs	r28, 0
    3d30:	ec cf       	rjmp	.-40     	; 0x3d0a <__vector_10+0xb2>
    3d32:	80 91 e2 00 	lds	r24, 0x00E2	; 0x8000e2 <__TEXT_REGION_LENGTH__+0x7e00e2>
    3d36:	8e 7e       	andi	r24, 0xEE	; 238
    3d38:	80 61       	ori	r24, 0x10	; 16
    3d3a:	80 93 e2 00 	sts	0x00E2, r24	; 0x8000e2 <__TEXT_REGION_LENGTH__+0x7e00e2>
    3d3e:	80 91 e1 00 	lds	r24, 0x00E1	; 0x8000e1 <__TEXT_REGION_LENGTH__+0x7e00e1>
    3d42:	8e 7e       	andi	r24, 0xEE	; 238
    3d44:	80 93 e1 00 	sts	0x00E1, r24	; 0x8000e1 <__TEXT_REGION_LENGTH__+0x7e00e1>
    3d48:	80 91 13 02 	lds	r24, 0x0213	; 0x800213 <_usbSuspendState>
    3d4c:	8e 7e       	andi	r24, 0xEE	; 238
    3d4e:	81 60       	ori	r24, 0x01	; 1
    3d50:	da cf       	rjmp	.-76     	; 0x3d06 <__vector_10+0xae>

00003d52 <__vector_11>:
    3d52:	1f 92       	push	r1
    3d54:	0f 92       	push	r0
    3d56:	0f b6       	in	r0, 0x3f	; 63
    3d58:	0f 92       	push	r0
    3d5a:	11 24       	eor	r1, r1
    3d5c:	cf 92       	push	r12
    3d5e:	df 92       	push	r13
    3d60:	ef 92       	push	r14
    3d62:	ff 92       	push	r15
    3d64:	0f 93       	push	r16
    3d66:	1f 93       	push	r17
    3d68:	2f 93       	push	r18
    3d6a:	3f 93       	push	r19
    3d6c:	4f 93       	push	r20
    3d6e:	5f 93       	push	r21
    3d70:	6f 93       	push	r22
    3d72:	7f 93       	push	r23
    3d74:	8f 93       	push	r24
    3d76:	9f 93       	push	r25
    3d78:	af 93       	push	r26
    3d7a:	bf 93       	push	r27
    3d7c:	ef 93       	push	r30
    3d7e:	ff 93       	push	r31
    3d80:	cf 93       	push	r28
    3d82:	df 93       	push	r29
    3d84:	cd b7       	in	r28, 0x3d	; 61
    3d86:	de b7       	in	r29, 0x3e	; 62
    3d88:	6c 97       	sbiw	r28, 0x1c	; 28
    3d8a:	de bf       	out	0x3e, r29	; 62
    3d8c:	cd bf       	out	0x3d, r28	; 61
    3d8e:	10 92 e9 00 	sts	0x00E9, r1	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
    3d92:	80 91 e8 00 	lds	r24, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    3d96:	83 ff       	sbrs	r24, 3
    3d98:	25 c0       	rjmp	.+74     	; 0x3de4 <__vector_11+0x92>
    3d9a:	68 e0       	ldi	r22, 0x08	; 8
    3d9c:	ce 01       	movw	r24, r28
    3d9e:	45 96       	adiw	r24, 0x15	; 21
    3da0:	0e 94 50 09 	call	0x12a0	; 0x12a0 <_ZL4RecvPVhh>
    3da4:	82 ef       	ldi	r24, 0xF2	; 242
    3da6:	80 93 e8 00 	sts	0x00E8, r24	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    3daa:	8d 89       	ldd	r24, Y+21	; 0x15
    3dac:	87 ff       	sbrs	r24, 7
    3dae:	39 c0       	rjmp	.+114    	; 0x3e22 <__vector_11+0xd0>
    3db0:	90 91 e8 00 	lds	r25, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    3db4:	90 ff       	sbrs	r25, 0
    3db6:	fc cf       	rjmp	.-8      	; 0x3db0 <__vector_11+0x5e>
    3db8:	98 2f       	mov	r25, r24
    3dba:	90 76       	andi	r25, 0x60	; 96
    3dbc:	09 f0       	breq	.+2      	; 0x3dc0 <__vector_11+0x6e>
    3dbe:	34 c1       	rjmp	.+616    	; 0x4028 <__vector_11+0x2d6>
    3dc0:	9e 89       	ldd	r25, Y+22	; 0x16
    3dc2:	4f 89       	ldd	r20, Y+23	; 0x17
    3dc4:	58 8d       	ldd	r21, Y+24	; 0x18
    3dc6:	2f 89       	ldd	r18, Y+23	; 0x17
    3dc8:	f8 8c       	ldd	r15, Y+24	; 0x18
    3dca:	91 11       	cpse	r25, r1
    3dcc:	31 c0       	rjmp	.+98     	; 0x3e30 <__vector_11+0xde>
    3dce:	80 38       	cpi	r24, 0x80	; 128
    3dd0:	61 f5       	brne	.+88     	; 0x3e2a <__vector_11+0xd8>
    3dd2:	80 91 14 02 	lds	r24, 0x0214	; 0x800214 <_usbCurrentStatus>
    3dd6:	80 93 f1 00 	sts	0x00F1, r24	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    3dda:	10 92 f1 00 	sts	0x00F1, r1	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    3dde:	8e ef       	ldi	r24, 0xFE	; 254
    3de0:	80 93 e8 00 	sts	0x00E8, r24	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    3de4:	6c 96       	adiw	r28, 0x1c	; 28
    3de6:	0f b6       	in	r0, 0x3f	; 63
    3de8:	f8 94       	cli
    3dea:	de bf       	out	0x3e, r29	; 62
    3dec:	0f be       	out	0x3f, r0	; 63
    3dee:	cd bf       	out	0x3d, r28	; 61
    3df0:	df 91       	pop	r29
    3df2:	cf 91       	pop	r28
    3df4:	ff 91       	pop	r31
    3df6:	ef 91       	pop	r30
    3df8:	bf 91       	pop	r27
    3dfa:	af 91       	pop	r26
    3dfc:	9f 91       	pop	r25
    3dfe:	8f 91       	pop	r24
    3e00:	7f 91       	pop	r23
    3e02:	6f 91       	pop	r22
    3e04:	5f 91       	pop	r21
    3e06:	4f 91       	pop	r20
    3e08:	3f 91       	pop	r19
    3e0a:	2f 91       	pop	r18
    3e0c:	1f 91       	pop	r17
    3e0e:	0f 91       	pop	r16
    3e10:	ff 90       	pop	r15
    3e12:	ef 90       	pop	r14
    3e14:	df 90       	pop	r13
    3e16:	cf 90       	pop	r12
    3e18:	0f 90       	pop	r0
    3e1a:	0f be       	out	0x3f, r0	; 63
    3e1c:	0f 90       	pop	r0
    3e1e:	1f 90       	pop	r1
    3e20:	18 95       	reti
    3e22:	9e ef       	ldi	r25, 0xFE	; 254
    3e24:	90 93 e8 00 	sts	0x00E8, r25	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    3e28:	c7 cf       	rjmp	.-114    	; 0x3db8 <__vector_11+0x66>
    3e2a:	10 92 f1 00 	sts	0x00F1, r1	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    3e2e:	d5 cf       	rjmp	.-86     	; 0x3dda <__vector_11+0x88>
    3e30:	91 30       	cpi	r25, 0x01	; 1
    3e32:	59 f4       	brne	.+22     	; 0x3e4a <__vector_11+0xf8>
    3e34:	81 11       	cpse	r24, r1
    3e36:	d3 cf       	rjmp	.-90     	; 0x3dde <__vector_11+0x8c>
    3e38:	41 30       	cpi	r20, 0x01	; 1
    3e3a:	51 05       	cpc	r21, r1
    3e3c:	81 f6       	brne	.-96     	; 0x3dde <__vector_11+0x8c>
    3e3e:	80 91 14 02 	lds	r24, 0x0214	; 0x800214 <_usbCurrentStatus>
    3e42:	8d 7f       	andi	r24, 0xFD	; 253
    3e44:	80 93 14 02 	sts	0x0214, r24	; 0x800214 <_usbCurrentStatus>
    3e48:	ca cf       	rjmp	.-108    	; 0x3dde <__vector_11+0x8c>
    3e4a:	93 30       	cpi	r25, 0x03	; 3
    3e4c:	49 f4       	brne	.+18     	; 0x3e60 <__vector_11+0x10e>
    3e4e:	81 11       	cpse	r24, r1
    3e50:	c6 cf       	rjmp	.-116    	; 0x3dde <__vector_11+0x8c>
    3e52:	41 30       	cpi	r20, 0x01	; 1
    3e54:	51 05       	cpc	r21, r1
    3e56:	19 f6       	brne	.-122    	; 0x3dde <__vector_11+0x8c>
    3e58:	80 91 14 02 	lds	r24, 0x0214	; 0x800214 <_usbCurrentStatus>
    3e5c:	82 60       	ori	r24, 0x02	; 2
    3e5e:	f2 cf       	rjmp	.-28     	; 0x3e44 <__vector_11+0xf2>
    3e60:	95 30       	cpi	r25, 0x05	; 5
    3e62:	41 f4       	brne	.+16     	; 0x3e74 <__vector_11+0x122>
    3e64:	80 91 e8 00 	lds	r24, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    3e68:	80 ff       	sbrs	r24, 0
    3e6a:	fc cf       	rjmp	.-8      	; 0x3e64 <__vector_11+0x112>
    3e6c:	20 68       	ori	r18, 0x80	; 128
    3e6e:	20 93 e3 00 	sts	0x00E3, r18	; 0x8000e3 <__TEXT_REGION_LENGTH__+0x7e00e3>
    3e72:	b5 cf       	rjmp	.-150    	; 0x3dde <__vector_11+0x8c>
    3e74:	96 30       	cpi	r25, 0x06	; 6
    3e76:	09 f0       	breq	.+2      	; 0x3e7a <__vector_11+0x128>
    3e78:	a9 c0       	rjmp	.+338    	; 0x3fcc <__vector_11+0x27a>
    3e7a:	0b 8d       	ldd	r16, Y+27	; 0x1b
    3e7c:	1c 8d       	ldd	r17, Y+28	; 0x1c
    3e7e:	22 e0       	ldi	r18, 0x02	; 2
    3e80:	10 92 e9 00 	sts	0x00E9, r1	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
    3e84:	10 92 10 02 	sts	0x0210, r1	; 0x800210 <_ZL6_cmark+0x1>
    3e88:	10 92 0f 02 	sts	0x020F, r1	; 0x80020f <_ZL6_cmark>
    3e8c:	f2 12       	cpse	r15, r18
    3e8e:	2e c0       	rjmp	.+92     	; 0x3eec <__vector_11+0x19a>
    3e90:	10 92 0e 02 	sts	0x020E, r1	; 0x80020e <_ZL5_cend+0x1>
    3e94:	10 92 0d 02 	sts	0x020D, r1	; 0x80020d <_ZL5_cend>
    3e98:	0e 94 22 09 	call	0x1244	; 0x1244 <_ZL14SendInterfacesv>
    3e9c:	1f 82       	std	Y+7, r1	; 0x07
    3e9e:	99 e0       	ldi	r25, 0x09	; 9
    3ea0:	99 83       	std	Y+1, r25	; 0x01
    3ea2:	fa 82       	std	Y+2, r15	; 0x02
    3ea4:	91 e0       	ldi	r25, 0x01	; 1
    3ea6:	9e 83       	std	Y+6, r25	; 0x06
    3ea8:	90 ea       	ldi	r25, 0xA0	; 160
    3eaa:	98 87       	std	Y+8, r25	; 0x08
    3eac:	9a ef       	ldi	r25, 0xFA	; 250
    3eae:	99 87       	std	Y+9, r25	; 0x09
    3eb0:	20 91 0f 02 	lds	r18, 0x020F	; 0x80020f <_ZL6_cmark>
    3eb4:	30 91 10 02 	lds	r19, 0x0210	; 0x800210 <_ZL6_cmark+0x1>
    3eb8:	27 5f       	subi	r18, 0xF7	; 247
    3eba:	3f 4f       	sbci	r19, 0xFF	; 255
    3ebc:	3c 83       	std	Y+4, r19	; 0x04
    3ebe:	2b 83       	std	Y+3, r18	; 0x03
    3ec0:	8d 83       	std	Y+5, r24	; 0x05
    3ec2:	10 92 e9 00 	sts	0x00E9, r1	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
    3ec6:	10 92 10 02 	sts	0x0210, r1	; 0x800210 <_ZL6_cmark+0x1>
    3eca:	10 92 0f 02 	sts	0x020F, r1	; 0x80020f <_ZL6_cmark>
    3ece:	10 93 0e 02 	sts	0x020E, r17	; 0x80020e <_ZL5_cend+0x1>
    3ed2:	00 93 0d 02 	sts	0x020D, r16	; 0x80020d <_ZL5_cend>
    3ed6:	49 e0       	ldi	r20, 0x09	; 9
    3ed8:	50 e0       	ldi	r21, 0x00	; 0
    3eda:	be 01       	movw	r22, r28
    3edc:	6f 5f       	subi	r22, 0xFF	; 255
    3ede:	7f 4f       	sbci	r23, 0xFF	; 255
    3ee0:	80 e0       	ldi	r24, 0x00	; 0
    3ee2:	0e 94 00 09 	call	0x1200	; 0x1200 <_Z15USB_SendControlhPKvi>
    3ee6:	0e 94 22 09 	call	0x1244	; 0x1244 <_ZL14SendInterfacesv>
    3eea:	79 cf       	rjmp	.-270    	; 0x3dde <__vector_11+0x8c>
    3eec:	10 93 0e 02 	sts	0x020E, r17	; 0x80020e <_ZL5_cend+0x1>
    3ef0:	00 93 0d 02 	sts	0x020D, r16	; 0x80020d <_ZL5_cend>
    3ef4:	0e 94 49 07 	call	0xe92	; 0xe92 <_Z12PluggableUSBv>
    3ef8:	dc 01       	movw	r26, r24
    3efa:	12 96       	adiw	r26, 0x02	; 2
    3efc:	0d 91       	ld	r16, X+
    3efe:	1c 91       	ld	r17, X
    3f00:	01 15       	cp	r16, r1
    3f02:	11 05       	cpc	r17, r1
    3f04:	09 f4       	brne	.+2      	; 0x3f08 <__vector_11+0x1b6>
    3f06:	51 c1       	rjmp	.+674    	; 0x41aa <__vector_11+0x458>
    3f08:	d8 01       	movw	r26, r16
    3f0a:	ed 91       	ld	r30, X+
    3f0c:	fc 91       	ld	r31, X
    3f0e:	04 80       	ldd	r0, Z+4	; 0x04
    3f10:	f5 81       	ldd	r31, Z+5	; 0x05
    3f12:	e0 2d       	mov	r30, r0
    3f14:	be 01       	movw	r22, r28
    3f16:	6b 5e       	subi	r22, 0xEB	; 235
    3f18:	7f 4f       	sbci	r23, 0xFF	; 255
    3f1a:	c8 01       	movw	r24, r16
    3f1c:	09 95       	icall
    3f1e:	00 97       	sbiw	r24, 0x00	; 0
    3f20:	09 f0       	breq	.+2      	; 0x3f24 <__vector_11+0x1d2>
    3f22:	3e c1       	rjmp	.+636    	; 0x41a0 <__vector_11+0x44e>
    3f24:	f8 01       	movw	r30, r16
    3f26:	00 85       	ldd	r16, Z+8	; 0x08
    3f28:	11 85       	ldd	r17, Z+9	; 0x09
    3f2a:	ea cf       	rjmp	.-44     	; 0x3f00 <__vector_11+0x1ae>
    3f2c:	f3 e0       	ldi	r31, 0x03	; 3
    3f2e:	ff 12       	cpse	r15, r31
    3f30:	0e c0       	rjmp	.+28     	; 0x3f4e <__vector_11+0x1fc>
    3f32:	8f 89       	ldd	r24, Y+23	; 0x17
    3f34:	88 23       	and	r24, r24
    3f36:	09 f4       	brne	.+2      	; 0x3f3a <__vector_11+0x1e8>
    3f38:	40 c0       	rjmp	.+128    	; 0x3fba <__vector_11+0x268>
    3f3a:	82 30       	cpi	r24, 0x02	; 2
    3f3c:	61 f4       	brne	.+24     	; 0x3f56 <__vector_11+0x204>
    3f3e:	40 e8       	ldi	r20, 0x80	; 128
    3f40:	62 e1       	ldi	r22, 0x12	; 18
    3f42:	86 e2       	ldi	r24, 0x26	; 38
    3f44:	94 e0       	ldi	r25, 0x04	; 4
    3f46:	0e 94 ca 2f 	call	0x5f94	; 0x5f94 <_ZL24USB_SendStringDescriptorPKhhh>
    3f4a:	81 11       	cpse	r24, r1
    3f4c:	48 cf       	rjmp	.-368    	; 0x3dde <__vector_11+0x8c>
    3f4e:	81 e2       	ldi	r24, 0x21	; 33
    3f50:	80 93 eb 00 	sts	0x00EB, r24	; 0x8000eb <__TEXT_REGION_LENGTH__+0x7e00eb>
    3f54:	47 cf       	rjmp	.-370    	; 0x3de4 <__vector_11+0x92>
    3f56:	81 30       	cpi	r24, 0x01	; 1
    3f58:	29 f4       	brne	.+10     	; 0x3f64 <__vector_11+0x212>
    3f5a:	40 e8       	ldi	r20, 0x80	; 128
    3f5c:	68 e0       	ldi	r22, 0x08	; 8
    3f5e:	8d e1       	ldi	r24, 0x1D	; 29
    3f60:	94 e0       	ldi	r25, 0x04	; 4
    3f62:	f1 cf       	rjmp	.-30     	; 0x3f46 <__vector_11+0x1f4>
    3f64:	83 30       	cpi	r24, 0x03	; 3
    3f66:	99 f7       	brne	.-26     	; 0x3f4e <__vector_11+0x1fc>
    3f68:	0e 94 49 07 	call	0xe92	; 0xe92 <_Z12PluggableUSBv>
    3f6c:	dc 01       	movw	r26, r24
    3f6e:	12 96       	adiw	r26, 0x02	; 2
    3f70:	ed 90       	ld	r14, X+
    3f72:	fc 90       	ld	r15, X
    3f74:	8e 01       	movw	r16, r28
    3f76:	0f 5f       	subi	r16, 0xFF	; 255
    3f78:	1f 4f       	sbci	r17, 0xFF	; 255
    3f7a:	68 01       	movw	r12, r16
    3f7c:	e1 14       	cp	r14, r1
    3f7e:	f1 04       	cpc	r15, r1
    3f80:	79 f0       	breq	.+30     	; 0x3fa0 <__vector_11+0x24e>
    3f82:	d7 01       	movw	r26, r14
    3f84:	ed 91       	ld	r30, X+
    3f86:	fc 91       	ld	r31, X
    3f88:	06 80       	ldd	r0, Z+6	; 0x06
    3f8a:	f7 81       	ldd	r31, Z+7	; 0x07
    3f8c:	e0 2d       	mov	r30, r0
    3f8e:	b8 01       	movw	r22, r16
    3f90:	c7 01       	movw	r24, r14
    3f92:	09 95       	icall
    3f94:	08 0f       	add	r16, r24
    3f96:	11 1d       	adc	r17, r1
    3f98:	f7 01       	movw	r30, r14
    3f9a:	e0 84       	ldd	r14, Z+8	; 0x08
    3f9c:	f1 84       	ldd	r15, Z+9	; 0x09
    3f9e:	ee cf       	rjmp	.-36     	; 0x3f7c <__vector_11+0x22a>
    3fa0:	d8 01       	movw	r26, r16
    3fa2:	1c 92       	st	X, r1
    3fa4:	f6 01       	movw	r30, r12
    3fa6:	01 90       	ld	r0, Z+
    3fa8:	00 20       	and	r0, r0
    3faa:	e9 f7       	brne	.-6      	; 0x3fa6 <__vector_11+0x254>
    3fac:	31 97       	sbiw	r30, 0x01	; 1
    3fae:	bf 01       	movw	r22, r30
    3fb0:	6c 19       	sub	r22, r12
    3fb2:	7d 09       	sbc	r23, r13
    3fb4:	40 e0       	ldi	r20, 0x00	; 0
    3fb6:	c6 01       	movw	r24, r12
    3fb8:	c6 cf       	rjmp	.-116    	; 0x3f46 <__vector_11+0x1f4>
    3fba:	61 e2       	ldi	r22, 0x21	; 33
    3fbc:	7a e0       	ldi	r23, 0x0A	; 10
    3fbe:	fb 01       	movw	r30, r22
    3fc0:	44 91       	lpm	r20, Z
    3fc2:	50 e0       	ldi	r21, 0x00	; 0
    3fc4:	80 e8       	ldi	r24, 0x80	; 128
    3fc6:	0e 94 00 09 	call	0x1200	; 0x1200 <_Z15USB_SendControlhPKvi>
    3fca:	09 cf       	rjmp	.-494    	; 0x3dde <__vector_11+0x8c>
    3fcc:	97 30       	cpi	r25, 0x07	; 7
    3fce:	09 f4       	brne	.+2      	; 0x3fd2 <__vector_11+0x280>
    3fd0:	be cf       	rjmp	.-132    	; 0x3f4e <__vector_11+0x1fc>
    3fd2:	98 30       	cpi	r25, 0x08	; 8
    3fd4:	21 f4       	brne	.+8      	; 0x3fde <__vector_11+0x28c>
    3fd6:	81 e0       	ldi	r24, 0x01	; 1
    3fd8:	80 93 f1 00 	sts	0x00F1, r24	; 0x8000f1 <__TEXT_REGION_LENGTH__+0x7e00f1>
    3fdc:	00 cf       	rjmp	.-512    	; 0x3dde <__vector_11+0x8c>
    3fde:	99 30       	cpi	r25, 0x09	; 9
    3fe0:	09 f0       	breq	.+2      	; 0x3fe4 <__vector_11+0x292>
    3fe2:	fd ce       	rjmp	.-518    	; 0x3dde <__vector_11+0x8c>
    3fe4:	83 70       	andi	r24, 0x03	; 3
    3fe6:	09 f0       	breq	.+2      	; 0x3fea <__vector_11+0x298>
    3fe8:	b2 cf       	rjmp	.-156    	; 0x3f4e <__vector_11+0x1fc>
    3fea:	e0 e3       	ldi	r30, 0x30	; 48
    3fec:	f1 e0       	ldi	r31, 0x01	; 1
    3fee:	81 e0       	ldi	r24, 0x01	; 1
    3ff0:	31 e0       	ldi	r19, 0x01	; 1
    3ff2:	96 e3       	ldi	r25, 0x36	; 54
    3ff4:	21 91       	ld	r18, Z+
    3ff6:	22 23       	and	r18, r18
    3ff8:	71 f0       	breq	.+28     	; 0x4016 <__vector_11+0x2c4>
    3ffa:	80 93 e9 00 	sts	0x00E9, r24	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
    3ffe:	30 93 eb 00 	sts	0x00EB, r19	; 0x8000eb <__TEXT_REGION_LENGTH__+0x7e00eb>
    4002:	df 01       	movw	r26, r30
    4004:	11 97       	sbiw	r26, 0x01	; 1
    4006:	2c 91       	ld	r18, X
    4008:	20 93 ec 00 	sts	0x00EC, r18	; 0x8000ec <__TEXT_REGION_LENGTH__+0x7e00ec>
    400c:	90 93 ed 00 	sts	0x00ED, r25	; 0x8000ed <__TEXT_REGION_LENGTH__+0x7e00ed>
    4010:	8f 5f       	subi	r24, 0xFF	; 255
    4012:	87 30       	cpi	r24, 0x07	; 7
    4014:	79 f7       	brne	.-34     	; 0x3ff4 <__vector_11+0x2a2>
    4016:	8e e7       	ldi	r24, 0x7E	; 126
    4018:	80 93 ea 00 	sts	0x00EA, r24	; 0x8000ea <__TEXT_REGION_LENGTH__+0x7e00ea>
    401c:	10 92 ea 00 	sts	0x00EA, r1	; 0x8000ea <__TEXT_REGION_LENGTH__+0x7e00ea>
    4020:	8f 89       	ldd	r24, Y+23	; 0x17
    4022:	80 93 44 02 	sts	0x0244, r24	; 0x800244 <_usbConfiguration>
    4026:	db ce       	rjmp	.-586    	; 0x3dde <__vector_11+0x8c>
    4028:	8b 8d       	ldd	r24, Y+27	; 0x1b
    402a:	9c 8d       	ldd	r25, Y+28	; 0x1c
    402c:	10 92 e9 00 	sts	0x00E9, r1	; 0x8000e9 <__TEXT_REGION_LENGTH__+0x7e00e9>
    4030:	10 92 10 02 	sts	0x0210, r1	; 0x800210 <_ZL6_cmark+0x1>
    4034:	10 92 0f 02 	sts	0x020F, r1	; 0x80020f <_ZL6_cmark>
    4038:	90 93 0e 02 	sts	0x020E, r25	; 0x80020e <_ZL5_cend+0x1>
    403c:	80 93 0d 02 	sts	0x020D, r24	; 0x80020d <_ZL5_cend>
    4040:	89 8d       	ldd	r24, Y+25	; 0x19
    4042:	81 11       	cpse	r24, r1
    4044:	92 c0       	rjmp	.+292    	; 0x416a <__vector_11+0x418>
    4046:	8e 89       	ldd	r24, Y+22	; 0x16
    4048:	9d 89       	ldd	r25, Y+21	; 0x15
    404a:	91 3a       	cpi	r25, 0xA1	; 161
    404c:	49 f4       	brne	.+18     	; 0x4060 <__vector_11+0x30e>
    404e:	81 32       	cpi	r24, 0x21	; 33
    4050:	09 f0       	breq	.+2      	; 0x4054 <__vector_11+0x302>
    4052:	7d cf       	rjmp	.-262    	; 0x3f4e <__vector_11+0x1fc>
    4054:	47 e0       	ldi	r20, 0x07	; 7
    4056:	50 e0       	ldi	r21, 0x00	; 0
    4058:	64 e0       	ldi	r22, 0x04	; 4
    405a:	71 e0       	ldi	r23, 0x01	; 1
    405c:	80 e0       	ldi	r24, 0x00	; 0
    405e:	b3 cf       	rjmp	.-154    	; 0x3fc6 <__vector_11+0x274>
    4060:	91 32       	cpi	r25, 0x21	; 33
    4062:	09 f0       	breq	.+2      	; 0x4066 <__vector_11+0x314>
    4064:	74 cf       	rjmp	.-280    	; 0x3f4e <__vector_11+0x1fc>
    4066:	83 32       	cpi	r24, 0x23	; 35
    4068:	69 f4       	brne	.+26     	; 0x4084 <__vector_11+0x332>
    406a:	8f 89       	ldd	r24, Y+23	; 0x17
    406c:	98 8d       	ldd	r25, Y+24	; 0x18
    406e:	b0 e0       	ldi	r27, 0x00	; 0
    4070:	a0 e0       	ldi	r26, 0x00	; 0
    4072:	80 93 00 01 	sts	0x0100, r24	; 0x800100 <__data_start>
    4076:	90 93 01 01 	sts	0x0101, r25	; 0x800101 <__data_start+0x1>
    407a:	a0 93 02 01 	sts	0x0102, r26	; 0x800102 <__data_start+0x2>
    407e:	b0 93 03 01 	sts	0x0103, r27	; 0x800103 <__data_start+0x3>
    4082:	ad ce       	rjmp	.-678    	; 0x3dde <__vector_11+0x8c>
    4084:	80 32       	cpi	r24, 0x20	; 32
    4086:	69 f4       	brne	.+26     	; 0x40a2 <__vector_11+0x350>
    4088:	80 91 e8 00 	lds	r24, 0x00E8	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    408c:	82 ff       	sbrs	r24, 2
    408e:	fc cf       	rjmp	.-8      	; 0x4088 <__vector_11+0x336>
    4090:	67 e0       	ldi	r22, 0x07	; 7
    4092:	84 e0       	ldi	r24, 0x04	; 4
    4094:	91 e0       	ldi	r25, 0x01	; 1
    4096:	0e 94 50 09 	call	0x12a0	; 0x12a0 <_ZL4RecvPVhh>
    409a:	8b ef       	ldi	r24, 0xFB	; 251
    409c:	80 93 e8 00 	sts	0x00E8, r24	; 0x8000e8 <__TEXT_REGION_LENGTH__+0x7e00e8>
    40a0:	9e ce       	rjmp	.-708    	; 0x3dde <__vector_11+0x8c>
    40a2:	82 32       	cpi	r24, 0x22	; 34
    40a4:	09 f0       	breq	.+2      	; 0x40a8 <__vector_11+0x356>
    40a6:	9b ce       	rjmp	.-714    	; 0x3dde <__vector_11+0x8c>
    40a8:	8f 89       	ldd	r24, Y+23	; 0x17
    40aa:	80 93 0b 01 	sts	0x010B, r24	; 0x80010b <_ZL12_usbLineInfo+0x7>
    40ae:	ee ef       	ldi	r30, 0xFE	; 254
    40b0:	ff e7       	ldi	r31, 0x7F	; 127
    40b2:	85 91       	lpm	r24, Z+
    40b4:	94 91       	lpm	r25, Z
    40b6:	8b 3f       	cpi	r24, 0xFB	; 251
    40b8:	9c 4d       	sbci	r25, 0xDC	; 220
    40ba:	51 f1       	breq	.+84     	; 0x4110 <__vector_11+0x3be>
    40bc:	e0 e0       	ldi	r30, 0x00	; 0
    40be:	f8 e0       	ldi	r31, 0x08	; 8
    40c0:	80 91 04 01 	lds	r24, 0x0104	; 0x800104 <_ZL12_usbLineInfo>
    40c4:	90 91 05 01 	lds	r25, 0x0105	; 0x800105 <_ZL12_usbLineInfo+0x1>
    40c8:	a0 91 06 01 	lds	r26, 0x0106	; 0x800106 <_ZL12_usbLineInfo+0x2>
    40cc:	b0 91 07 01 	lds	r27, 0x0107	; 0x800107 <_ZL12_usbLineInfo+0x3>
    40d0:	80 3b       	cpi	r24, 0xB0	; 176
    40d2:	94 40       	sbci	r25, 0x04	; 4
    40d4:	a1 05       	cpc	r26, r1
    40d6:	b1 05       	cpc	r27, r1
    40d8:	f1 f4       	brne	.+60     	; 0x4116 <__vector_11+0x3c4>
    40da:	80 91 0b 01 	lds	r24, 0x010B	; 0x80010b <_ZL12_usbLineInfo+0x7>
    40de:	80 fd       	sbrc	r24, 0
    40e0:	1a c0       	rjmp	.+52     	; 0x4116 <__vector_11+0x3c4>
    40e2:	ee 3f       	cpi	r30, 0xFE	; 254
    40e4:	8a e0       	ldi	r24, 0x0A	; 10
    40e6:	f8 07       	cpc	r31, r24
    40e8:	89 f5       	brne	.+98     	; 0x414c <__vector_11+0x3fa>
    40ea:	87 e7       	ldi	r24, 0x77	; 119
    40ec:	97 e7       	ldi	r25, 0x77	; 119
    40ee:	91 83       	std	Z+1, r25	; 0x01
    40f0:	80 83       	st	Z, r24
    40f2:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    40f6:	80 93 11 02 	sts	0x0211, r24	; 0x800211 <_ZL11wdtcsr_save>
    40fa:	88 e1       	ldi	r24, 0x18	; 24
    40fc:	9b e0       	ldi	r25, 0x0B	; 11
    40fe:	0f b6       	in	r0, 0x3f	; 63
    4100:	f8 94       	cli
    4102:	a8 95       	wdr
    4104:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    4108:	0f be       	out	0x3f, r0	; 63
    410a:	90 93 60 00 	sts	0x0060, r25	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    410e:	67 ce       	rjmp	.-818    	; 0x3dde <__vector_11+0x8c>
    4110:	ee ef       	ldi	r30, 0xFE	; 254
    4112:	fa e0       	ldi	r31, 0x0A	; 10
    4114:	d5 cf       	rjmp	.-86     	; 0x40c0 <__vector_11+0x36e>
    4116:	80 81       	ld	r24, Z
    4118:	91 81       	ldd	r25, Z+1	; 0x01
    411a:	87 37       	cpi	r24, 0x77	; 119
    411c:	97 47       	sbci	r25, 0x77	; 119
    411e:	09 f0       	breq	.+2      	; 0x4122 <__vector_11+0x3d0>
    4120:	5e ce       	rjmp	.-836    	; 0x3dde <__vector_11+0x8c>
    4122:	a8 95       	wdr
    4124:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    4128:	88 61       	ori	r24, 0x18	; 24
    412a:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    412e:	80 91 11 02 	lds	r24, 0x0211	; 0x800211 <_ZL11wdtcsr_save>
    4132:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    4136:	ee 3f       	cpi	r30, 0xFE	; 254
    4138:	2a e0       	ldi	r18, 0x0A	; 10
    413a:	f2 07       	cpc	r31, r18
    413c:	89 f0       	breq	.+34     	; 0x4160 <__vector_11+0x40e>
    413e:	80 91 fe 0a 	lds	r24, 0x0AFE	; 0x800afe <__bss_end+0x4cd>
    4142:	90 91 ff 0a 	lds	r25, 0x0AFF	; 0x800aff <__bss_end+0x4ce>
    4146:	91 83       	std	Z+1, r25	; 0x01
    4148:	80 83       	st	Z, r24
    414a:	49 ce       	rjmp	.-878    	; 0x3dde <__vector_11+0x8c>
    414c:	80 81       	ld	r24, Z
    414e:	91 81       	ldd	r25, Z+1	; 0x01
    4150:	87 37       	cpi	r24, 0x77	; 119
    4152:	98 07       	cpc	r25, r24
    4154:	51 f2       	breq	.-108    	; 0x40ea <__vector_11+0x398>
    4156:	90 93 ff 0a 	sts	0x0AFF, r25	; 0x800aff <__bss_end+0x4ce>
    415a:	80 93 fe 0a 	sts	0x0AFE, r24	; 0x800afe <__bss_end+0x4cd>
    415e:	c5 cf       	rjmp	.-118    	; 0x40ea <__vector_11+0x398>
    4160:	10 92 ff 0a 	sts	0x0AFF, r1	; 0x800aff <__bss_end+0x4ce>
    4164:	10 92 fe 0a 	sts	0x0AFE, r1	; 0x800afe <__bss_end+0x4cd>
    4168:	3a ce       	rjmp	.-908    	; 0x3dde <__vector_11+0x8c>
    416a:	0e 94 49 07 	call	0xe92	; 0xe92 <_Z12PluggableUSBv>
    416e:	dc 01       	movw	r26, r24
    4170:	12 96       	adiw	r26, 0x02	; 2
    4172:	0d 91       	ld	r16, X+
    4174:	1c 91       	ld	r17, X
    4176:	01 15       	cp	r16, r1
    4178:	11 05       	cpc	r17, r1
    417a:	09 f4       	brne	.+2      	; 0x417e <__vector_11+0x42c>
    417c:	e8 ce       	rjmp	.-560    	; 0x3f4e <__vector_11+0x1fc>
    417e:	d8 01       	movw	r26, r16
    4180:	ed 91       	ld	r30, X+
    4182:	fc 91       	ld	r31, X
    4184:	01 90       	ld	r0, Z+
    4186:	f0 81       	ld	r31, Z
    4188:	e0 2d       	mov	r30, r0
    418a:	be 01       	movw	r22, r28
    418c:	6b 5e       	subi	r22, 0xEB	; 235
    418e:	7f 4f       	sbci	r23, 0xFF	; 255
    4190:	c8 01       	movw	r24, r16
    4192:	09 95       	icall
    4194:	81 11       	cpse	r24, r1
    4196:	23 ce       	rjmp	.-954    	; 0x3dde <__vector_11+0x8c>
    4198:	f8 01       	movw	r30, r16
    419a:	00 85       	ldd	r16, Z+8	; 0x08
    419c:	11 85       	ldd	r17, Z+9	; 0x09
    419e:	eb cf       	rjmp	.-42     	; 0x4176 <__vector_11+0x424>
    41a0:	18 16       	cp	r1, r24
    41a2:	19 06       	cpc	r1, r25
    41a4:	0c f4       	brge	.+2      	; 0x41a8 <__vector_11+0x456>
    41a6:	1b ce       	rjmp	.-970    	; 0x3dde <__vector_11+0x8c>
    41a8:	d2 ce       	rjmp	.-604    	; 0x3f4e <__vector_11+0x1fc>
    41aa:	f1 e0       	ldi	r31, 0x01	; 1
    41ac:	ff 12       	cpse	r15, r31
    41ae:	be ce       	rjmp	.-644    	; 0x3f2c <__vector_11+0x1da>
    41b0:	65 e2       	ldi	r22, 0x25	; 37
    41b2:	7a e0       	ldi	r23, 0x0A	; 10
    41b4:	04 cf       	rjmp	.-504    	; 0x3fbe <__vector_11+0x26c>

000041b6 <__vector_36>:
    41b6:	1f 92       	push	r1
    41b8:	0f 92       	push	r0
    41ba:	0f b6       	in	r0, 0x3f	; 63
    41bc:	0f 92       	push	r0
    41be:	11 24       	eor	r1, r1
    41c0:	2f 93       	push	r18
    41c2:	3f 93       	push	r19
    41c4:	4f 93       	push	r20
    41c6:	5f 93       	push	r21
    41c8:	6f 93       	push	r22
    41ca:	7f 93       	push	r23
    41cc:	8f 93       	push	r24
    41ce:	9f 93       	push	r25
    41d0:	af 93       	push	r26
    41d2:	bf 93       	push	r27
    41d4:	ef 93       	push	r30
    41d6:	ff 93       	push	r31
    41d8:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__TEXT_REGION_LENGTH__+0x7e00b9>
    41dc:	88 7f       	andi	r24, 0xF8	; 248
    41de:	80 36       	cpi	r24, 0x60	; 96
    41e0:	09 f4       	brne	.+2      	; 0x41e4 <__vector_36+0x2e>
    41e2:	4a c0       	rjmp	.+148    	; 0x4278 <__vector_36+0xc2>
    41e4:	f0 f5       	brcc	.+124    	; 0x4262 <__vector_36+0xac>
    41e6:	88 32       	cpi	r24, 0x28	; 40
    41e8:	09 f4       	brne	.+2      	; 0x41ec <__vector_36+0x36>
    41ea:	a7 c0       	rjmp	.+334    	; 0x433a <__vector_36+0x184>
    41ec:	18 f5       	brcc	.+70     	; 0x4234 <__vector_36+0x7e>
    41ee:	80 31       	cpi	r24, 0x10	; 16
    41f0:	09 f4       	brne	.+2      	; 0x41f4 <__vector_36+0x3e>
    41f2:	9b c0       	rjmp	.+310    	; 0x432a <__vector_36+0x174>
    41f4:	b8 f4       	brcc	.+46     	; 0x4224 <__vector_36+0x6e>
    41f6:	88 23       	and	r24, r24
    41f8:	09 f4       	brne	.+2      	; 0x41fc <__vector_36+0x46>
    41fa:	f9 c0       	rjmp	.+498    	; 0x43ee <__vector_36+0x238>
    41fc:	88 30       	cpi	r24, 0x08	; 8
    41fe:	09 f4       	brne	.+2      	; 0x4202 <__vector_36+0x4c>
    4200:	94 c0       	rjmp	.+296    	; 0x432a <__vector_36+0x174>
    4202:	ff 91       	pop	r31
    4204:	ef 91       	pop	r30
    4206:	bf 91       	pop	r27
    4208:	af 91       	pop	r26
    420a:	9f 91       	pop	r25
    420c:	8f 91       	pop	r24
    420e:	7f 91       	pop	r23
    4210:	6f 91       	pop	r22
    4212:	5f 91       	pop	r21
    4214:	4f 91       	pop	r20
    4216:	3f 91       	pop	r19
    4218:	2f 91       	pop	r18
    421a:	0f 90       	pop	r0
    421c:	0f be       	out	0x3f, r0	; 63
    421e:	0f 90       	pop	r0
    4220:	1f 90       	pop	r1
    4222:	18 95       	reti
    4224:	88 31       	cpi	r24, 0x18	; 24
    4226:	09 f4       	brne	.+2      	; 0x422a <__vector_36+0x74>
    4228:	88 c0       	rjmp	.+272    	; 0x433a <__vector_36+0x184>
    422a:	80 32       	cpi	r24, 0x20	; 32
    422c:	51 f7       	brne	.-44     	; 0x4202 <__vector_36+0x4c>
    422e:	80 93 69 02 	sts	0x0269, r24	; 0x800269 <twi_error>
    4232:	14 c0       	rjmp	.+40     	; 0x425c <__vector_36+0xa6>
    4234:	80 34       	cpi	r24, 0x40	; 64
    4236:	09 f4       	brne	.+2      	; 0x423a <__vector_36+0x84>
    4238:	9d c0       	rjmp	.+314    	; 0x4374 <__vector_36+0x1be>
    423a:	40 f4       	brcc	.+16     	; 0x424c <__vector_36+0x96>
    423c:	80 33       	cpi	r24, 0x30	; 48
    423e:	b9 f3       	breq	.-18     	; 0x422e <__vector_36+0x78>
    4240:	88 33       	cpi	r24, 0x38	; 56
    4242:	f9 f6       	brne	.-66     	; 0x4202 <__vector_36+0x4c>
    4244:	80 93 69 02 	sts	0x0269, r24	; 0x800269 <twi_error>
    4248:	85 ec       	ldi	r24, 0xC5	; 197
    424a:	b0 c0       	rjmp	.+352    	; 0x43ac <__vector_36+0x1f6>
    424c:	80 35       	cpi	r24, 0x50	; 80
    424e:	09 f4       	brne	.+2      	; 0x4252 <__vector_36+0x9c>
    4250:	85 c0       	rjmp	.+266    	; 0x435c <__vector_36+0x1a6>
    4252:	88 35       	cpi	r24, 0x58	; 88
    4254:	09 f4       	brne	.+2      	; 0x4258 <__vector_36+0xa2>
    4256:	96 c0       	rjmp	.+300    	; 0x4384 <__vector_36+0x1ce>
    4258:	88 34       	cpi	r24, 0x48	; 72
    425a:	99 f6       	brne	.-90     	; 0x4202 <__vector_36+0x4c>
    425c:	0e 94 d1 1b 	call	0x37a2	; 0x37a2 <twi_stop>
    4260:	d0 cf       	rjmp	.-96     	; 0x4202 <__vector_36+0x4c>
    4262:	88 39       	cpi	r24, 0x98	; 152
    4264:	09 f4       	brne	.+2      	; 0x4268 <__vector_36+0xb2>
    4266:	8c c0       	rjmp	.+280    	; 0x4380 <__vector_36+0x1ca>
    4268:	38 f5       	brcc	.+78     	; 0x42b8 <__vector_36+0x102>
    426a:	88 37       	cpi	r24, 0x78	; 120
    426c:	29 f0       	breq	.+10     	; 0x4278 <__vector_36+0xc2>
    426e:	50 f4       	brcc	.+20     	; 0x4284 <__vector_36+0xce>
    4270:	88 36       	cpi	r24, 0x68	; 104
    4272:	11 f0       	breq	.+4      	; 0x4278 <__vector_36+0xc2>
    4274:	80 37       	cpi	r24, 0x70	; 112
    4276:	29 f6       	brne	.-118    	; 0x4202 <__vector_36+0x4c>
    4278:	83 e0       	ldi	r24, 0x03	; 3
    427a:	80 93 6b 02 	sts	0x026B, r24	; 0x80026b <twi_state>
    427e:	10 92 fa 01 	sts	0x01FA, r1	; 0x8001fa <twi_rxBufferIndex>
    4282:	57 c0       	rjmp	.+174    	; 0x4332 <__vector_36+0x17c>
    4284:	88 38       	cpi	r24, 0x88	; 136
    4286:	09 f4       	brne	.+2      	; 0x428a <__vector_36+0xd4>
    4288:	7b c0       	rjmp	.+246    	; 0x4380 <__vector_36+0x1ca>
    428a:	80 39       	cpi	r24, 0x90	; 144
    428c:	19 f0       	breq	.+6      	; 0x4294 <__vector_36+0xde>
    428e:	80 38       	cpi	r24, 0x80	; 128
    4290:	09 f0       	breq	.+2      	; 0x4294 <__vector_36+0xde>
    4292:	b7 cf       	rjmp	.-146    	; 0x4202 <__vector_36+0x4c>
    4294:	80 91 fa 01 	lds	r24, 0x01FA	; 0x8001fa <twi_rxBufferIndex>
    4298:	80 32       	cpi	r24, 0x20	; 32
    429a:	08 f0       	brcs	.+2      	; 0x429e <__vector_36+0xe8>
    429c:	71 c0       	rjmp	.+226    	; 0x4380 <__vector_36+0x1ca>
    429e:	e0 91 fa 01 	lds	r30, 0x01FA	; 0x8001fa <twi_rxBufferIndex>
    42a2:	81 e0       	ldi	r24, 0x01	; 1
    42a4:	8e 0f       	add	r24, r30
    42a6:	80 93 fa 01 	sts	0x01FA, r24	; 0x8001fa <twi_rxBufferIndex>
    42aa:	80 91 bb 00 	lds	r24, 0x00BB	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
    42ae:	f0 e0       	ldi	r31, 0x00	; 0
    42b0:	e6 52       	subi	r30, 0x26	; 38
    42b2:	fe 4f       	sbci	r31, 0xFE	; 254
    42b4:	80 83       	st	Z, r24
    42b6:	3d c0       	rjmp	.+122    	; 0x4332 <__vector_36+0x17c>
    42b8:	80 3b       	cpi	r24, 0xB0	; 176
    42ba:	39 f0       	breq	.+14     	; 0x42ca <__vector_36+0x114>
    42bc:	e0 f4       	brcc	.+56     	; 0x42f6 <__vector_36+0x140>
    42be:	80 3a       	cpi	r24, 0xA0	; 160
    42c0:	09 f4       	brne	.+2      	; 0x42c4 <__vector_36+0x10e>
    42c2:	79 c0       	rjmp	.+242    	; 0x43b6 <__vector_36+0x200>
    42c4:	88 3a       	cpi	r24, 0xA8	; 168
    42c6:	09 f0       	breq	.+2      	; 0x42ca <__vector_36+0x114>
    42c8:	9c cf       	rjmp	.-200    	; 0x4202 <__vector_36+0x4c>
    42ca:	84 e0       	ldi	r24, 0x04	; 4
    42cc:	80 93 6b 02 	sts	0x026B, r24	; 0x80026b <twi_state>
    42d0:	10 92 d9 01 	sts	0x01D9, r1	; 0x8001d9 <twi_txBufferIndex>
    42d4:	10 92 d8 01 	sts	0x01D8, r1	; 0x8001d8 <twi_txBufferLength>
    42d8:	e0 91 17 02 	lds	r30, 0x0217	; 0x800217 <twi_onSlaveTransmit>
    42dc:	f0 91 18 02 	lds	r31, 0x0218	; 0x800218 <twi_onSlaveTransmit+0x1>
    42e0:	09 95       	icall
    42e2:	80 91 d8 01 	lds	r24, 0x01D8	; 0x8001d8 <twi_txBufferLength>
    42e6:	81 11       	cpse	r24, r1
    42e8:	0f c0       	rjmp	.+30     	; 0x4308 <__vector_36+0x152>
    42ea:	81 e0       	ldi	r24, 0x01	; 1
    42ec:	80 93 d8 01 	sts	0x01D8, r24	; 0x8001d8 <twi_txBufferLength>
    42f0:	10 92 b8 01 	sts	0x01B8, r1	; 0x8001b8 <twi_txBuffer>
    42f4:	09 c0       	rjmp	.+18     	; 0x4308 <__vector_36+0x152>
    42f6:	80 3c       	cpi	r24, 0xC0	; 192
    42f8:	09 f4       	brne	.+2      	; 0x42fc <__vector_36+0x146>
    42fa:	a6 cf       	rjmp	.-180    	; 0x4248 <__vector_36+0x92>
    42fc:	88 3c       	cpi	r24, 0xC8	; 200
    42fe:	09 f4       	brne	.+2      	; 0x4302 <__vector_36+0x14c>
    4300:	a3 cf       	rjmp	.-186    	; 0x4248 <__vector_36+0x92>
    4302:	88 3b       	cpi	r24, 0xB8	; 184
    4304:	09 f0       	breq	.+2      	; 0x4308 <__vector_36+0x152>
    4306:	7d cf       	rjmp	.-262    	; 0x4202 <__vector_36+0x4c>
    4308:	e0 91 d9 01 	lds	r30, 0x01D9	; 0x8001d9 <twi_txBufferIndex>
    430c:	81 e0       	ldi	r24, 0x01	; 1
    430e:	8e 0f       	add	r24, r30
    4310:	80 93 d9 01 	sts	0x01D9, r24	; 0x8001d9 <twi_txBufferIndex>
    4314:	f0 e0       	ldi	r31, 0x00	; 0
    4316:	e8 54       	subi	r30, 0x48	; 72
    4318:	fe 4f       	sbci	r31, 0xFE	; 254
    431a:	80 81       	ld	r24, Z
    431c:	80 93 bb 00 	sts	0x00BB, r24	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
    4320:	90 91 d9 01 	lds	r25, 0x01D9	; 0x8001d9 <twi_txBufferIndex>
    4324:	80 91 d8 01 	lds	r24, 0x01D8	; 0x8001d8 <twi_txBufferLength>
    4328:	29 c0       	rjmp	.+82     	; 0x437c <__vector_36+0x1c6>
    432a:	80 91 46 02 	lds	r24, 0x0246	; 0x800246 <twi_slarw>
    432e:	80 93 bb 00 	sts	0x00BB, r24	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
    4332:	85 ec       	ldi	r24, 0xC5	; 197
    4334:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    4338:	64 cf       	rjmp	.-312    	; 0x4202 <__vector_36+0x4c>
    433a:	90 91 68 02 	lds	r25, 0x0268	; 0x800268 <twi_masterBufferIndex>
    433e:	80 91 67 02 	lds	r24, 0x0267	; 0x800267 <twi_masterBufferLength>
    4342:	98 17       	cp	r25, r24
    4344:	58 f5       	brcc	.+86     	; 0x439c <__vector_36+0x1e6>
    4346:	e0 91 68 02 	lds	r30, 0x0268	; 0x800268 <twi_masterBufferIndex>
    434a:	81 e0       	ldi	r24, 0x01	; 1
    434c:	8e 0f       	add	r24, r30
    434e:	80 93 68 02 	sts	0x0268, r24	; 0x800268 <twi_masterBufferIndex>
    4352:	f0 e0       	ldi	r31, 0x00	; 0
    4354:	e9 5b       	subi	r30, 0xB9	; 185
    4356:	fd 4f       	sbci	r31, 0xFD	; 253
    4358:	80 81       	ld	r24, Z
    435a:	e9 cf       	rjmp	.-46     	; 0x432e <__vector_36+0x178>
    435c:	e0 91 68 02 	lds	r30, 0x0268	; 0x800268 <twi_masterBufferIndex>
    4360:	81 e0       	ldi	r24, 0x01	; 1
    4362:	8e 0f       	add	r24, r30
    4364:	80 93 68 02 	sts	0x0268, r24	; 0x800268 <twi_masterBufferIndex>
    4368:	80 91 bb 00 	lds	r24, 0x00BB	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
    436c:	f0 e0       	ldi	r31, 0x00	; 0
    436e:	e9 5b       	subi	r30, 0xB9	; 185
    4370:	fd 4f       	sbci	r31, 0xFD	; 253
    4372:	80 83       	st	Z, r24
    4374:	90 91 68 02 	lds	r25, 0x0268	; 0x800268 <twi_masterBufferIndex>
    4378:	80 91 67 02 	lds	r24, 0x0267	; 0x800267 <twi_masterBufferLength>
    437c:	98 17       	cp	r25, r24
    437e:	c8 f2       	brcs	.-78     	; 0x4332 <__vector_36+0x17c>
    4380:	85 e8       	ldi	r24, 0x85	; 133
    4382:	d8 cf       	rjmp	.-80     	; 0x4334 <__vector_36+0x17e>
    4384:	e0 91 68 02 	lds	r30, 0x0268	; 0x800268 <twi_masterBufferIndex>
    4388:	81 e0       	ldi	r24, 0x01	; 1
    438a:	8e 0f       	add	r24, r30
    438c:	80 93 68 02 	sts	0x0268, r24	; 0x800268 <twi_masterBufferIndex>
    4390:	80 91 bb 00 	lds	r24, 0x00BB	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
    4394:	f0 e0       	ldi	r31, 0x00	; 0
    4396:	e9 5b       	subi	r30, 0xB9	; 185
    4398:	fd 4f       	sbci	r31, 0xFD	; 253
    439a:	80 83       	st	Z, r24
    439c:	80 91 6a 02 	lds	r24, 0x026A	; 0x80026a <twi_sendStop>
    43a0:	81 11       	cpse	r24, r1
    43a2:	5c cf       	rjmp	.-328    	; 0x425c <__vector_36+0xa6>
    43a4:	81 e0       	ldi	r24, 0x01	; 1
    43a6:	80 93 45 02 	sts	0x0245, r24	; 0x800245 <twi_inRepStart>
    43aa:	84 ea       	ldi	r24, 0xA4	; 164
    43ac:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    43b0:	10 92 6b 02 	sts	0x026B, r1	; 0x80026b <twi_state>
    43b4:	26 cf       	rjmp	.-436    	; 0x4202 <__vector_36+0x4c>
    43b6:	85 ec       	ldi	r24, 0xC5	; 197
    43b8:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    43bc:	10 92 6b 02 	sts	0x026B, r1	; 0x80026b <twi_state>
    43c0:	80 91 fa 01 	lds	r24, 0x01FA	; 0x8001fa <twi_rxBufferIndex>
    43c4:	80 32       	cpi	r24, 0x20	; 32
    43c6:	30 f4       	brcc	.+12     	; 0x43d4 <__vector_36+0x21e>
    43c8:	e0 91 fa 01 	lds	r30, 0x01FA	; 0x8001fa <twi_rxBufferIndex>
    43cc:	f0 e0       	ldi	r31, 0x00	; 0
    43ce:	e6 52       	subi	r30, 0x26	; 38
    43d0:	fe 4f       	sbci	r31, 0xFE	; 254
    43d2:	10 82       	st	Z, r1
    43d4:	60 91 fa 01 	lds	r22, 0x01FA	; 0x8001fa <twi_rxBufferIndex>
    43d8:	70 e0       	ldi	r23, 0x00	; 0
    43da:	e0 91 15 02 	lds	r30, 0x0215	; 0x800215 <twi_onSlaveReceive>
    43de:	f0 91 16 02 	lds	r31, 0x0216	; 0x800216 <twi_onSlaveReceive+0x1>
    43e2:	8a ed       	ldi	r24, 0xDA	; 218
    43e4:	91 e0       	ldi	r25, 0x01	; 1
    43e6:	09 95       	icall
    43e8:	10 92 fa 01 	sts	0x01FA, r1	; 0x8001fa <twi_rxBufferIndex>
    43ec:	0a cf       	rjmp	.-492    	; 0x4202 <__vector_36+0x4c>
    43ee:	10 92 69 02 	sts	0x0269, r1	; 0x800269 <twi_error>
    43f2:	34 cf       	rjmp	.-408    	; 0x425c <__vector_36+0xa6>

000043f4 <__vector_17>:
    43f4:	1f 92       	push	r1
    43f6:	0f 92       	push	r0
    43f8:	0f b6       	in	r0, 0x3f	; 63
    43fa:	0f 92       	push	r0
    43fc:	11 24       	eor	r1, r1
    43fe:	2f 93       	push	r18
    4400:	3f 93       	push	r19
    4402:	4f 93       	push	r20
    4404:	5f 93       	push	r21
    4406:	6f 93       	push	r22
    4408:	7f 93       	push	r23
    440a:	8f 93       	push	r24
    440c:	9f 93       	push	r25
    440e:	ef 93       	push	r30
    4410:	ff 93       	push	r31
    4412:	20 91 88 00 	lds	r18, 0x0088	; 0x800088 <__TEXT_REGION_LENGTH__+0x7e0088>
    4416:	30 91 89 00 	lds	r19, 0x0089	; 0x800089 <__TEXT_REGION_LENGTH__+0x7e0089>
    441a:	40 91 84 00 	lds	r20, 0x0084	; 0x800084 <__TEXT_REGION_LENGTH__+0x7e0084>
    441e:	50 91 85 00 	lds	r21, 0x0085	; 0x800085 <__TEXT_REGION_LENGTH__+0x7e0085>
    4422:	40 91 5a 05 	lds	r20, 0x055A	; 0x80055a <softwareSerial+0xa8>
    4426:	4f 3f       	cpi	r20, 0xFF	; 255
    4428:	09 f4       	brne	.+2      	; 0x442c <__vector_17+0x38>
    442a:	85 c0       	rjmp	.+266    	; 0x4536 <__vector_17+0x142>
    442c:	40 91 5d 05 	lds	r20, 0x055D	; 0x80055d <softwareSerial+0xab>
    4430:	50 91 5e 05 	lds	r21, 0x055E	; 0x80055e <softwareSerial+0xac>
    4434:	42 0f       	add	r20, r18
    4436:	53 1f       	adc	r21, r19
    4438:	50 93 5e 05 	sts	0x055E, r21	; 0x80055e <softwareSerial+0xac>
    443c:	40 93 5d 05 	sts	0x055D, r20	; 0x80055d <softwareSerial+0xab>
    4440:	60 91 5d 05 	lds	r22, 0x055D	; 0x80055d <softwareSerial+0xab>
    4444:	70 91 5e 05 	lds	r23, 0x055E	; 0x80055e <softwareSerial+0xac>
    4448:	40 91 5f 05 	lds	r20, 0x055F	; 0x80055f <softwareSerial+0xad>
    444c:	50 91 60 05 	lds	r21, 0x0560	; 0x800560 <softwareSerial+0xae>
    4450:	64 17       	cp	r22, r20
    4452:	75 07       	cpc	r23, r21
    4454:	50 f1       	brcs	.+84     	; 0x44aa <__vector_17+0xb6>
    4456:	40 91 5a 05 	lds	r20, 0x055A	; 0x80055a <softwareSerial+0xa8>
    445a:	4e 3f       	cpi	r20, 0xFE	; 254
    445c:	09 f0       	breq	.+2      	; 0x4460 <__vector_17+0x6c>
    445e:	89 c0       	rjmp	.+274    	; 0x4572 <__vector_17+0x17e>
    4460:	e0 91 c0 04 	lds	r30, 0x04C0	; 0x8004c0 <softwareSerial+0xe>
    4464:	f0 91 c1 04 	lds	r31, 0x04C1	; 0x8004c1 <softwareSerial+0xf>
    4468:	80 81       	ld	r24, Z
    446a:	90 91 c2 04 	lds	r25, 0x04C2	; 0x8004c2 <softwareSerial+0x10>
    446e:	89 23       	and	r24, r25
    4470:	31 f4       	brne	.+12     	; 0x447e <__vector_17+0x8a>
    4472:	10 92 5a 05 	sts	0x055A, r1	; 0x80055a <softwareSerial+0xa8>
    4476:	10 92 5c 05 	sts	0x055C, r1	; 0x80055c <softwareSerial+0xaa>
    447a:	10 92 5b 05 	sts	0x055B, r1	; 0x80055b <softwareSerial+0xa9>
    447e:	80 91 58 05 	lds	r24, 0x0558	; 0x800558 <softwareSerial+0xa6>
    4482:	90 91 59 05 	lds	r25, 0x0559	; 0x800559 <softwareSerial+0xa7>
    4486:	60 91 5f 05 	lds	r22, 0x055F	; 0x80055f <softwareSerial+0xad>
    448a:	70 91 60 05 	lds	r23, 0x0560	; 0x800560 <softwareSerial+0xae>
    448e:	40 91 5d 05 	lds	r20, 0x055D	; 0x80055d <softwareSerial+0xab>
    4492:	50 91 5e 05 	lds	r21, 0x055E	; 0x80055e <softwareSerial+0xac>
    4496:	46 1b       	sub	r20, r22
    4498:	57 0b       	sbc	r21, r23
    449a:	50 93 5e 05 	sts	0x055E, r21	; 0x80055e <softwareSerial+0xac>
    449e:	40 93 5d 05 	sts	0x055D, r20	; 0x80055d <softwareSerial+0xab>
    44a2:	90 93 60 05 	sts	0x0560, r25	; 0x800560 <softwareSerial+0xae>
    44a6:	80 93 5f 05 	sts	0x055F, r24	; 0x80055f <softwareSerial+0xad>
    44aa:	80 91 61 05 	lds	r24, 0x0561	; 0x800561 <softwareSerial+0xaf>
    44ae:	8f 3f       	cpi	r24, 0xFF	; 255
    44b0:	09 f4       	brne	.+2      	; 0x44b4 <__vector_17+0xc0>
    44b2:	41 c0       	rjmp	.+130    	; 0x4536 <__vector_17+0x142>
    44b4:	80 91 6e 05 	lds	r24, 0x056E	; 0x80056e <softwareSerial+0xbc>
    44b8:	90 91 6f 05 	lds	r25, 0x056F	; 0x80056f <softwareSerial+0xbd>
    44bc:	28 0f       	add	r18, r24
    44be:	39 1f       	adc	r19, r25
    44c0:	30 93 6f 05 	sts	0x056F, r19	; 0x80056f <softwareSerial+0xbd>
    44c4:	20 93 6e 05 	sts	0x056E, r18	; 0x80056e <softwareSerial+0xbc>
    44c8:	20 91 6e 05 	lds	r18, 0x056E	; 0x80056e <softwareSerial+0xbc>
    44cc:	30 91 6f 05 	lds	r19, 0x056F	; 0x80056f <softwareSerial+0xbd>
    44d0:	80 91 56 05 	lds	r24, 0x0556	; 0x800556 <softwareSerial+0xa4>
    44d4:	90 91 57 05 	lds	r25, 0x0557	; 0x800557 <softwareSerial+0xa5>
    44d8:	28 17       	cp	r18, r24
    44da:	39 07       	cpc	r19, r25
    44dc:	60 f1       	brcs	.+88     	; 0x4536 <__vector_17+0x142>
    44de:	e0 91 61 05 	lds	r30, 0x0561	; 0x800561 <softwareSerial+0xaf>
    44e2:	81 e0       	ldi	r24, 0x01	; 1
    44e4:	8e 0f       	add	r24, r30
    44e6:	80 93 61 05 	sts	0x0561, r24	; 0x800561 <softwareSerial+0xaf>
    44ea:	f0 e0       	ldi	r31, 0x00	; 0
    44ec:	ee 59       	subi	r30, 0x9E	; 158
    44ee:	fa 4f       	sbci	r31, 0xFA	; 250
    44f0:	80 81       	ld	r24, Z
    44f2:	88 23       	and	r24, r24
    44f4:	49 f0       	breq	.+18     	; 0x4508 <__vector_17+0x114>
    44f6:	e0 91 c3 04 	lds	r30, 0x04C3	; 0x8004c3 <softwareSerial+0x11>
    44fa:	f0 91 c4 04 	lds	r31, 0x04C4	; 0x8004c4 <softwareSerial+0x12>
    44fe:	80 81       	ld	r24, Z
    4500:	90 91 c7 04 	lds	r25, 0x04C7	; 0x8004c7 <softwareSerial+0x15>
    4504:	89 27       	eor	r24, r25
    4506:	80 83       	st	Z, r24
    4508:	90 91 61 05 	lds	r25, 0x0561	; 0x800561 <softwareSerial+0xaf>
    450c:	80 91 55 05 	lds	r24, 0x0555	; 0x800555 <softwareSerial+0xa3>
    4510:	98 17       	cp	r25, r24
    4512:	18 f0       	brcs	.+6      	; 0x451a <__vector_17+0x126>
    4514:	8f ef       	ldi	r24, 0xFF	; 255
    4516:	80 93 61 05 	sts	0x0561, r24	; 0x800561 <softwareSerial+0xaf>
    451a:	20 91 56 05 	lds	r18, 0x0556	; 0x800556 <softwareSerial+0xa4>
    451e:	30 91 57 05 	lds	r19, 0x0557	; 0x800557 <softwareSerial+0xa5>
    4522:	80 91 6e 05 	lds	r24, 0x056E	; 0x80056e <softwareSerial+0xbc>
    4526:	90 91 6f 05 	lds	r25, 0x056F	; 0x80056f <softwareSerial+0xbd>
    452a:	82 1b       	sub	r24, r18
    452c:	93 0b       	sbc	r25, r19
    452e:	90 93 6f 05 	sts	0x056F, r25	; 0x80056f <softwareSerial+0xbd>
    4532:	80 93 6e 05 	sts	0x056E, r24	; 0x80056e <softwareSerial+0xbc>
    4536:	20 91 84 00 	lds	r18, 0x0084	; 0x800084 <__TEXT_REGION_LENGTH__+0x7e0084>
    453a:	30 91 85 00 	lds	r19, 0x0085	; 0x800085 <__TEXT_REGION_LENGTH__+0x7e0085>
    453e:	80 91 88 00 	lds	r24, 0x0088	; 0x800088 <__TEXT_REGION_LENGTH__+0x7e0088>
    4542:	90 91 89 00 	lds	r25, 0x0089	; 0x800089 <__TEXT_REGION_LENGTH__+0x7e0089>
    4546:	88 96       	adiw	r24, 0x28	; 40
    4548:	82 17       	cp	r24, r18
    454a:	93 07       	cpc	r25, r19
    454c:	18 f4       	brcc	.+6      	; 0x4554 <__vector_17+0x160>
    454e:	81 e0       	ldi	r24, 0x01	; 1
    4550:	80 93 2d 02 	sts	0x022D, r24	; 0x80022d <timer1CompAOverloaded>
    4554:	ff 91       	pop	r31
    4556:	ef 91       	pop	r30
    4558:	9f 91       	pop	r25
    455a:	8f 91       	pop	r24
    455c:	7f 91       	pop	r23
    455e:	6f 91       	pop	r22
    4560:	5f 91       	pop	r21
    4562:	4f 91       	pop	r20
    4564:	3f 91       	pop	r19
    4566:	2f 91       	pop	r18
    4568:	0f 90       	pop	r0
    456a:	0f be       	out	0x3f, r0	; 63
    456c:	0f 90       	pop	r0
    456e:	1f 90       	pop	r1
    4570:	18 95       	reti
    4572:	50 91 5a 05 	lds	r21, 0x055A	; 0x80055a <softwareSerial+0xa8>
    4576:	40 91 55 05 	lds	r20, 0x0555	; 0x800555 <softwareSerial+0xa3>
    457a:	54 17       	cp	r21, r20
    457c:	08 f0       	brcs	.+2      	; 0x4580 <__vector_17+0x18c>
    457e:	83 cf       	rjmp	.-250    	; 0x4486 <__vector_17+0x92>
    4580:	e0 91 c0 04 	lds	r30, 0x04C0	; 0x8004c0 <softwareSerial+0xe>
    4584:	f0 91 c1 04 	lds	r31, 0x04C1	; 0x8004c1 <softwareSerial+0xf>
    4588:	40 81       	ld	r20, Z
    458a:	80 91 c2 04 	lds	r24, 0x04C2	; 0x8004c2 <softwareSerial+0x10>
    458e:	48 23       	and	r20, r24
    4590:	81 e0       	ldi	r24, 0x01	; 1
    4592:	90 e0       	ldi	r25, 0x00	; 0
    4594:	11 f4       	brne	.+4      	; 0x459a <__vector_17+0x1a6>
    4596:	90 e0       	ldi	r25, 0x00	; 0
    4598:	80 e0       	ldi	r24, 0x00	; 0
    459a:	40 91 5a 05 	lds	r20, 0x055A	; 0x80055a <softwareSerial+0xa8>
    459e:	51 e0       	ldi	r21, 0x01	; 1
    45a0:	54 0f       	add	r21, r20
    45a2:	50 93 5a 05 	sts	0x055A, r21	; 0x80055a <softwareSerial+0xa8>
    45a6:	60 91 5b 05 	lds	r22, 0x055B	; 0x80055b <softwareSerial+0xa9>
    45aa:	70 91 5c 05 	lds	r23, 0x055C	; 0x80055c <softwareSerial+0xaa>
    45ae:	02 c0       	rjmp	.+4      	; 0x45b4 <__vector_17+0x1c0>
    45b0:	88 0f       	add	r24, r24
    45b2:	99 1f       	adc	r25, r25
    45b4:	4a 95       	dec	r20
    45b6:	e2 f7       	brpl	.-8      	; 0x45b0 <__vector_17+0x1bc>
    45b8:	86 2b       	or	r24, r22
    45ba:	97 2b       	or	r25, r23
    45bc:	90 93 5c 05 	sts	0x055C, r25	; 0x80055c <softwareSerial+0xaa>
    45c0:	80 93 5b 05 	sts	0x055B, r24	; 0x80055b <softwareSerial+0xa9>
    45c4:	90 91 5a 05 	lds	r25, 0x055A	; 0x80055a <softwareSerial+0xa8>
    45c8:	80 91 55 05 	lds	r24, 0x0555	; 0x800555 <softwareSerial+0xa3>
    45cc:	98 17       	cp	r25, r24
    45ce:	d0 f0       	brcs	.+52     	; 0x4604 <__vector_17+0x210>
    45d0:	40 91 5b 05 	lds	r20, 0x055B	; 0x80055b <softwareSerial+0xa9>
    45d4:	50 91 5c 05 	lds	r21, 0x055C	; 0x80055c <softwareSerial+0xaa>
    45d8:	e0 91 4c 05 	lds	r30, 0x054C	; 0x80054c <softwareSerial+0x9a>
    45dc:	81 e0       	ldi	r24, 0x01	; 1
    45de:	8e 0f       	add	r24, r30
    45e0:	8f 71       	andi	r24, 0x1F	; 31
    45e2:	90 91 4d 05 	lds	r25, 0x054D	; 0x80054d <softwareSerial+0x9b>
    45e6:	89 17       	cp	r24, r25
    45e8:	49 f0       	breq	.+18     	; 0x45fc <__vector_17+0x208>
    45ea:	f0 e0       	ldi	r31, 0x00	; 0
    45ec:	ee 0f       	add	r30, r30
    45ee:	ff 1f       	adc	r31, r31
    45f0:	e4 5f       	subi	r30, 0xF4	; 244
    45f2:	fa 4f       	sbci	r31, 0xFA	; 250
    45f4:	51 83       	std	Z+1, r21	; 0x01
    45f6:	40 83       	st	Z, r20
    45f8:	80 93 4c 05 	sts	0x054C, r24	; 0x80054c <softwareSerial+0x9a>
    45fc:	8e ef       	ldi	r24, 0xFE	; 254
    45fe:	80 93 5a 05 	sts	0x055A, r24	; 0x80055a <softwareSerial+0xa8>
    4602:	3d cf       	rjmp	.-390    	; 0x447e <__vector_17+0x8a>
    4604:	80 91 56 05 	lds	r24, 0x0556	; 0x800556 <softwareSerial+0xa4>
    4608:	90 91 57 05 	lds	r25, 0x0557	; 0x800557 <softwareSerial+0xa5>
    460c:	3c cf       	rjmp	.-392    	; 0x4486 <__vector_17+0x92>

0000460e <_ZN5ezLEDC2Eii.constprop.97>:
    460e:	cf 93       	push	r28
    4610:	df 93       	push	r29
    4612:	fc 01       	movw	r30, r24
    4614:	86 2f       	mov	r24, r22
    4616:	60 83       	st	Z, r22
    4618:	12 82       	std	Z+2, r1	; 0x02
    461a:	11 82       	std	Z+1, r1	; 0x01
    461c:	13 82       	std	Z+3, r1	; 0x03
    461e:	14 82       	std	Z+4, r1	; 0x04
    4620:	15 82       	std	Z+5, r1	; 0x05
    4622:	16 82       	std	Z+6, r1	; 0x06
    4624:	17 82       	std	Z+7, r1	; 0x07
    4626:	10 86       	std	Z+8, r1	; 0x08
    4628:	df 01       	movw	r26, r30
    462a:	19 96       	adiw	r26, 0x09	; 9
    462c:	94 e1       	ldi	r25, 0x14	; 20
    462e:	ed 01       	movw	r28, r26
    4630:	19 92       	st	Y+, r1
    4632:	9a 95       	dec	r25
    4634:	e9 f7       	brne	.-6      	; 0x4630 <_ZN5ezLEDC2Eii.constprop.97+0x22>
    4636:	11 a2       	std	Z+33, r1	; 0x21
    4638:	12 a2       	std	Z+34, r1	; 0x22
    463a:	13 a2       	std	Z+35, r1	; 0x23
    463c:	14 a2       	std	Z+36, r1	; 0x24
    463e:	15 8e       	std	Z+29, r1	; 0x1d
    4640:	16 8e       	std	Z+30, r1	; 0x1e
    4642:	17 8e       	std	Z+31, r1	; 0x1f
    4644:	10 a2       	std	Z+32, r1	; 0x20
    4646:	61 e0       	ldi	r22, 0x01	; 1
    4648:	0e 94 00 08 	call	0x1000	; 0x1000 <pinMode>
    464c:	df 91       	pop	r29
    464e:	cf 91       	pop	r28
    4650:	08 95       	ret

00004652 <_ZN9Statistic5resetEv>:
    4652:	fc 01       	movw	r30, r24
    4654:	11 82       	std	Z+1, r1	; 0x01
    4656:	10 82       	st	Z, r1
    4658:	13 82       	std	Z+3, r1	; 0x03
    465a:	12 82       	std	Z+2, r1	; 0x02
    465c:	8f ef       	ldi	r24, 0xFF	; 255
    465e:	9f ef       	ldi	r25, 0xFF	; 255
    4660:	95 83       	std	Z+5, r25	; 0x05
    4662:	84 83       	std	Z+4, r24	; 0x04
    4664:	17 82       	std	Z+7, r1	; 0x07
    4666:	16 82       	std	Z+6, r1	; 0x06
    4668:	11 86       	std	Z+9, r1	; 0x09
    466a:	10 86       	std	Z+8, r1	; 0x08
    466c:	08 95       	ret

0000466e <_GLOBAL__I_65535_0_ButtonController.cpp.o.4959>:
    466e:	b0 e0       	ldi	r27, 0x00	; 0
    4670:	a0 e0       	ldi	r26, 0x00	; 0
    4672:	ed e3       	ldi	r30, 0x3D	; 61
    4674:	f3 e2       	ldi	r31, 0x23	; 35
    4676:	0c 94 9b 34 	jmp	0x6936	; 0x6936 <__prologue_saves__+0x6>
    467a:	87 e0       	ldi	r24, 0x07	; 7
    467c:	e8 2e       	mov	r14, r24
    467e:	83 e0       	ldi	r24, 0x03	; 3
    4680:	f8 2e       	mov	r15, r24
    4682:	f7 01       	movw	r30, r14
    4684:	13 82       	std	Z+3, r1	; 0x03
    4686:	12 82       	std	Z+2, r1	; 0x02
    4688:	98 ee       	ldi	r25, 0xE8	; 232
    468a:	89 2e       	mov	r8, r25
    468c:	93 e0       	ldi	r25, 0x03	; 3
    468e:	99 2e       	mov	r9, r25
    4690:	a1 2c       	mov	r10, r1
    4692:	b1 2c       	mov	r11, r1
    4694:	84 82       	std	Z+4, r8	; 0x04
    4696:	95 82       	std	Z+5, r9	; 0x05
    4698:	a6 82       	std	Z+6, r10	; 0x06
    469a:	b7 82       	std	Z+7, r11	; 0x07
    469c:	8a e3       	ldi	r24, 0x3A	; 58
    469e:	91 e0       	ldi	r25, 0x01	; 1
    46a0:	91 83       	std	Z+1, r25	; 0x01
    46a2:	80 83       	st	Z, r24
    46a4:	66 24       	eor	r6, r6
    46a6:	6a 94       	dec	r6
    46a8:	76 2c       	mov	r7, r6
    46aa:	75 86       	std	Z+13, r7	; 0x0d
    46ac:	64 86       	std	Z+12, r6	; 0x0c
    46ae:	35 e4       	ldi	r19, 0x45	; 69
    46b0:	c3 2e       	mov	r12, r19
    46b2:	34 e0       	ldi	r19, 0x04	; 4
    46b4:	d3 2e       	mov	r13, r19
    46b6:	f6 01       	movw	r30, r12
    46b8:	13 82       	std	Z+3, r1	; 0x03
    46ba:	12 82       	std	Z+2, r1	; 0x02
    46bc:	84 82       	std	Z+4, r8	; 0x04
    46be:	95 82       	std	Z+5, r9	; 0x05
    46c0:	a6 82       	std	Z+6, r10	; 0x06
    46c2:	b7 82       	std	Z+7, r11	; 0x07
    46c4:	8c e4       	ldi	r24, 0x4C	; 76
    46c6:	91 e0       	ldi	r25, 0x01	; 1
    46c8:	91 83       	std	Z+1, r25	; 0x01
    46ca:	80 83       	st	Z, r24
    46cc:	68 e0       	ldi	r22, 0x08	; 8
    46ce:	70 e0       	ldi	r23, 0x00	; 0
    46d0:	80 ee       	ldi	r24, 0xE0	; 224
    46d2:	95 e0       	ldi	r25, 0x05	; 5
    46d4:	0e 94 07 23 	call	0x460e	; 0x460e <_ZN5ezLEDC2Eii.constprop.97>
    46d8:	69 e0       	ldi	r22, 0x09	; 9
    46da:	70 e0       	ldi	r23, 0x00	; 0
    46dc:	85 e0       	ldi	r24, 0x05	; 5
    46de:	96 e0       	ldi	r25, 0x06	; 6
    46e0:	0e 94 07 23 	call	0x460e	; 0x460e <_ZN5ezLEDC2Eii.constprop.97>
    46e4:	10 92 2a 06 	sts	0x062A, r1	; 0x80062a <ledController+0x4a>
    46e8:	10 92 fd 05 	sts	0x05FD, r1	; 0x8005fd <ledController+0x1d>
    46ec:	10 92 fe 05 	sts	0x05FE, r1	; 0x8005fe <ledController+0x1e>
    46f0:	10 92 ff 05 	sts	0x05FF, r1	; 0x8005ff <ledController+0x1f>
    46f4:	10 92 00 06 	sts	0x0600, r1	; 0x800600 <ledController+0x20>
    46f8:	e2 ee       	ldi	r30, 0xE2	; 226
    46fa:	f5 e0       	ldi	r31, 0x05	; 5
    46fc:	80 81       	ld	r24, Z
    46fe:	81 78       	andi	r24, 0x81	; 129
    4700:	80 62       	ori	r24, 0x20	; 32
    4702:	80 83       	st	Z, r24
    4704:	80 ee       	ldi	r24, 0xE0	; 224
    4706:	95 e0       	ldi	r25, 0x05	; 5
    4708:	0e 94 be 11 	call	0x237c	; 0x237c <_ZN5ezLED4loopEv>
    470c:	10 92 22 06 	sts	0x0622, r1	; 0x800622 <ledController+0x42>
    4710:	10 92 23 06 	sts	0x0623, r1	; 0x800623 <ledController+0x43>
    4714:	10 92 24 06 	sts	0x0624, r1	; 0x800624 <ledController+0x44>
    4718:	10 92 25 06 	sts	0x0625, r1	; 0x800625 <ledController+0x45>
    471c:	e7 e0       	ldi	r30, 0x07	; 7
    471e:	f6 e0       	ldi	r31, 0x06	; 6
    4720:	80 81       	ld	r24, Z
    4722:	81 78       	andi	r24, 0x81	; 129
    4724:	82 62       	ori	r24, 0x22	; 34
    4726:	80 83       	st	Z, r24
    4728:	85 e0       	ldi	r24, 0x05	; 5
    472a:	96 e0       	ldi	r25, 0x06	; 6
    472c:	0e 94 be 11 	call	0x237c	; 0x237c <_ZN5ezLED4loopEv>
    4730:	61 e1       	ldi	r22, 0x11	; 17
    4732:	70 e0       	ldi	r23, 0x00	; 0
    4734:	8b eb       	ldi	r24, 0xBB	; 187
    4736:	95 e0       	ldi	r25, 0x05	; 5
    4738:	0e 94 07 23 	call	0x460e	; 0x460e <_ZN5ezLEDC2Eii.constprop.97>
    473c:	6e e1       	ldi	r22, 0x1E	; 30
    473e:	70 e0       	ldi	r23, 0x00	; 0
    4740:	86 e9       	ldi	r24, 0x96	; 150
    4742:	95 e0       	ldi	r25, 0x05	; 5
    4744:	0e 94 07 23 	call	0x460e	; 0x460e <_ZN5ezLEDC2Eii.constprop.97>
    4748:	c5 e8       	ldi	r28, 0x85	; 133
    474a:	d5 e0       	ldi	r29, 0x05	; 5
    474c:	8a e0       	ldi	r24, 0x0A	; 10
    474e:	88 83       	st	Y, r24
    4750:	1a 82       	std	Y+2, r1	; 0x02
    4752:	1b 82       	std	Y+3, r1	; 0x03
    4754:	1c 82       	std	Y+4, r1	; 0x04
    4756:	1d 82       	std	Y+5, r1	; 0x05
    4758:	1e 82       	std	Y+6, r1	; 0x06
    475a:	1f 82       	std	Y+7, r1	; 0x07
    475c:	18 86       	std	Y+8, r1	; 0x08
    475e:	19 86       	std	Y+9, r1	; 0x09
    4760:	06 e8       	ldi	r16, 0x86	; 134
    4762:	15 e0       	ldi	r17, 0x05	; 5
    4764:	f8 01       	movw	r30, r16
    4766:	80 81       	ld	r24, Z
    4768:	8c 7f       	andi	r24, 0xFC	; 252
    476a:	80 83       	st	Z, r24
    476c:	62 e0       	ldi	r22, 0x02	; 2
    476e:	8a e0       	ldi	r24, 0x0A	; 10
    4770:	0e 94 00 08 	call	0x1000	; 0x1000 <pinMode>
    4774:	f8 01       	movw	r30, r16
    4776:	80 81       	ld	r24, Z
    4778:	8b 7f       	andi	r24, 0xFB	; 251
    477a:	55 24       	eor	r5, r5
    477c:	53 94       	inc	r5
    477e:	82 fb       	bst	r24, 2
    4780:	99 27       	eor	r25, r25
    4782:	90 f9       	bld	r25, 0
    4784:	95 25       	eor	r25, r5
    4786:	90 fb       	bst	r25, 0
    4788:	83 f9       	bld	r24, 3
    478a:	80 83       	st	Z, r24
    478c:	88 81       	ld	r24, Y
    478e:	0e 94 a9 07 	call	0xf52	; 0xf52 <digitalRead>
    4792:	81 70       	andi	r24, 0x01	; 1
    4794:	f8 01       	movw	r30, r16
    4796:	90 81       	ld	r25, Z
    4798:	80 fb       	bst	r24, 0
    479a:	94 f9       	bld	r25, 4
    479c:	80 fb       	bst	r24, 0
    479e:	95 f9       	bld	r25, 5
    47a0:	80 fb       	bst	r24, 0
    47a2:	96 f9       	bld	r25, 6
    47a4:	90 83       	st	Z, r25
    47a6:	1a 86       	std	Y+10, r1	; 0x0a
    47a8:	1b 86       	std	Y+11, r1	; 0x0b
    47aa:	1c 86       	std	Y+12, r1	; 0x0c
    47ac:	1d 86       	std	Y+13, r1	; 0x0d
    47ae:	1f 86       	std	Y+15, r1	; 0x0f
    47b0:	1e 86       	std	Y+14, r1	; 0x0e
    47b2:	18 8a       	std	Y+16, r1	; 0x10
    47b4:	8e e1       	ldi	r24, 0x1E	; 30
    47b6:	90 e0       	ldi	r25, 0x00	; 0
    47b8:	a0 e0       	ldi	r26, 0x00	; 0
    47ba:	b0 e0       	ldi	r27, 0x00	; 0
    47bc:	8a 83       	std	Y+2, r24	; 0x02
    47be:	9b 83       	std	Y+3, r25	; 0x03
    47c0:	ac 83       	std	Y+4, r26	; 0x04
    47c2:	bd 83       	std	Y+5, r27	; 0x05
    47c4:	c0 e7       	ldi	r28, 0x70	; 112
    47c6:	d5 e0       	ldi	r29, 0x05	; 5
    47c8:	83 e1       	ldi	r24, 0x13	; 19
    47ca:	88 83       	st	Y, r24
    47cc:	01 e7       	ldi	r16, 0x71	; 113
    47ce:	15 e0       	ldi	r17, 0x05	; 5
    47d0:	f8 01       	movw	r30, r16
    47d2:	10 82       	st	Z, r1
    47d4:	1a 82       	std	Y+2, r1	; 0x02
    47d6:	1b 82       	std	Y+3, r1	; 0x03
    47d8:	1c 82       	std	Y+4, r1	; 0x04
    47da:	1d 82       	std	Y+5, r1	; 0x05
    47dc:	1e 82       	std	Y+6, r1	; 0x06
    47de:	1f 82       	std	Y+7, r1	; 0x07
    47e0:	18 86       	std	Y+8, r1	; 0x08
    47e2:	19 86       	std	Y+9, r1	; 0x09
    47e4:	7f 86       	std	Y+15, r7	; 0x0f
    47e6:	6e 86       	std	Y+14, r6	; 0x0e
    47e8:	18 8a       	std	Y+16, r1	; 0x10
    47ea:	19 8a       	std	Y+17, r1	; 0x11
    47ec:	1a 8a       	std	Y+18, r1	; 0x12
    47ee:	1b 8a       	std	Y+19, r1	; 0x13
    47f0:	61 e0       	ldi	r22, 0x01	; 1
    47f2:	0e 94 00 08 	call	0x1000	; 0x1000 <pinMode>
    47f6:	1c 8a       	std	Y+20, r1	; 0x14
    47f8:	f8 01       	movw	r30, r16
    47fa:	80 81       	ld	r24, Z
    47fc:	89 7f       	andi	r24, 0xF9	; 249
    47fe:	8e 7f       	andi	r24, 0xFE	; 254
    4800:	80 83       	st	Z, r24
    4802:	60 e0       	ldi	r22, 0x00	; 0
    4804:	88 81       	ld	r24, Y
    4806:	0e 94 d2 07 	call	0xfa4	; 0xfa4 <digitalWrite>
    480a:	a2 eb       	ldi	r26, 0xB2	; 178
    480c:	b4 e0       	ldi	r27, 0x04	; 4
    480e:	13 96       	adiw	r26, 0x03	; 3
    4810:	1c 92       	st	X, r1
    4812:	1e 92       	st	-X, r1
    4814:	12 97       	sbiw	r26, 0x02	; 2
    4816:	14 96       	adiw	r26, 0x04	; 4
    4818:	8d 92       	st	X+, r8
    481a:	9d 92       	st	X+, r9
    481c:	ad 92       	st	X+, r10
    481e:	bc 92       	st	X, r11
    4820:	17 97       	sbiw	r26, 0x07	; 7
    4822:	84 e8       	ldi	r24, 0x84	; 132
    4824:	91 e0       	ldi	r25, 0x01	; 1
    4826:	11 96       	adiw	r26, 0x01	; 1
    4828:	9c 93       	st	X, r25
    482a:	8e 93       	st	-X, r24
    482c:	e4 ea       	ldi	r30, 0xA4	; 164
    482e:	fa e0       	ldi	r31, 0x0A	; 10
    4830:	84 91       	lpm	r24, Z
    4832:	e5 e8       	ldi	r30, 0x85	; 133
    4834:	fa e0       	ldi	r31, 0x0A	; 10
    4836:	24 91       	lpm	r18, Z
    4838:	50 96       	adiw	r26, 0x10	; 16
    483a:	2c 93       	st	X, r18
    483c:	50 97       	sbiw	r26, 0x10	; 16
    483e:	90 e0       	ldi	r25, 0x00	; 0
    4840:	88 0f       	add	r24, r24
    4842:	99 1f       	adc	r25, r25
    4844:	fc 01       	movw	r30, r24
    4846:	ef 58       	subi	r30, 0x8F	; 143
    4848:	f5 4f       	sbci	r31, 0xF5	; 245
    484a:	45 91       	lpm	r20, Z+
    484c:	54 91       	lpm	r21, Z
    484e:	1d 96       	adiw	r26, 0x0d	; 13
    4850:	5c 93       	st	X, r21
    4852:	4e 93       	st	-X, r20
    4854:	1c 97       	sbiw	r26, 0x0c	; 12
    4856:	fc 01       	movw	r30, r24
    4858:	ed 59       	subi	r30, 0x9D	; 157
    485a:	f5 4f       	sbci	r31, 0xF5	; 245
    485c:	45 91       	lpm	r20, Z+
    485e:	54 91       	lpm	r21, Z
    4860:	1f 96       	adiw	r26, 0x0f	; 15
    4862:	5c 93       	st	X, r21
    4864:	4e 93       	st	-X, r20
    4866:	1e 97       	sbiw	r26, 0x0e	; 14
    4868:	fc 01       	movw	r30, r24
    486a:	eb 5a       	subi	r30, 0xAB	; 171
    486c:	f5 4f       	sbci	r31, 0xF5	; 245
    486e:	c5 91       	lpm	r28, Z+
    4870:	d4 91       	lpm	r29, Z
    4872:	e8 81       	ld	r30, Y
    4874:	20 95       	com	r18
    4876:	2e 23       	and	r18, r30
    4878:	28 83       	st	Y, r18
    487a:	1c 96       	adiw	r26, 0x0c	; 12
    487c:	ed 91       	ld	r30, X+
    487e:	fc 91       	ld	r31, X
    4880:	1d 97       	sbiw	r26, 0x0d	; 13
    4882:	80 81       	ld	r24, Z
    4884:	50 96       	adiw	r26, 0x10	; 16
    4886:	9c 91       	ld	r25, X
    4888:	50 97       	sbiw	r26, 0x10	; 16
    488a:	89 2b       	or	r24, r25
    488c:	80 83       	st	Z, r24
    488e:	e5 ea       	ldi	r30, 0xA5	; 165
    4890:	fa e0       	ldi	r31, 0x0A	; 10
    4892:	84 91       	lpm	r24, Z
    4894:	e6 e8       	ldi	r30, 0x86	; 134
    4896:	fa e0       	ldi	r31, 0x0A	; 10
    4898:	24 91       	lpm	r18, Z
    489a:	55 96       	adiw	r26, 0x15	; 21
    489c:	2c 93       	st	X, r18
    489e:	55 97       	sbiw	r26, 0x15	; 21
    48a0:	90 e0       	ldi	r25, 0x00	; 0
    48a2:	88 0f       	add	r24, r24
    48a4:	99 1f       	adc	r25, r25
    48a6:	fc 01       	movw	r30, r24
    48a8:	ef 58       	subi	r30, 0x8F	; 143
    48aa:	f5 4f       	sbci	r31, 0xF5	; 245
    48ac:	45 91       	lpm	r20, Z+
    48ae:	54 91       	lpm	r21, Z
    48b0:	52 96       	adiw	r26, 0x12	; 18
    48b2:	5c 93       	st	X, r21
    48b4:	4e 93       	st	-X, r20
    48b6:	51 97       	sbiw	r26, 0x11	; 17
    48b8:	fc 01       	movw	r30, r24
    48ba:	ed 59       	subi	r30, 0x9D	; 157
    48bc:	f5 4f       	sbci	r31, 0xF5	; 245
    48be:	45 91       	lpm	r20, Z+
    48c0:	54 91       	lpm	r21, Z
    48c2:	54 96       	adiw	r26, 0x14	; 20
    48c4:	5c 93       	st	X, r21
    48c6:	4e 93       	st	-X, r20
    48c8:	53 97       	sbiw	r26, 0x13	; 19
    48ca:	fc 01       	movw	r30, r24
    48cc:	eb 5a       	subi	r30, 0xAB	; 171
    48ce:	f5 4f       	sbci	r31, 0xF5	; 245
    48d0:	c5 91       	lpm	r28, Z+
    48d2:	d4 91       	lpm	r29, Z
    48d4:	e8 81       	ld	r30, Y
    48d6:	2e 2b       	or	r18, r30
    48d8:	28 83       	st	Y, r18
    48da:	d6 96       	adiw	r26, 0x36	; 54
    48dc:	1c 92       	st	X, r1
    48de:	d6 97       	sbiw	r26, 0x36	; 54
    48e0:	d7 96       	adiw	r26, 0x37	; 55
    48e2:	1c 92       	st	X, r1
    48e4:	d7 97       	sbiw	r26, 0x37	; 55
    48e6:	10 92 0a 05 	sts	0x050A, r1	; 0x80050a <softwareSerial+0x58>
    48ea:	10 92 0b 05 	sts	0x050B, r1	; 0x80050b <softwareSerial+0x59>
    48ee:	10 92 4c 05 	sts	0x054C, r1	; 0x80054c <softwareSerial+0x9a>
    48f2:	10 92 4d 05 	sts	0x054D, r1	; 0x80054d <softwareSerial+0x9b>
    48f6:	40 e8       	ldi	r20, 0x80	; 128
    48f8:	55 e2       	ldi	r21, 0x25	; 37
    48fa:	60 e0       	ldi	r22, 0x00	; 0
    48fc:	70 e0       	ldi	r23, 0x00	; 0
    48fe:	40 93 4e 05 	sts	0x054E, r20	; 0x80054e <softwareSerial+0x9c>
    4902:	50 93 4f 05 	sts	0x054F, r21	; 0x80054f <softwareSerial+0x9d>
    4906:	60 93 50 05 	sts	0x0550, r22	; 0x800550 <softwareSerial+0x9e>
    490a:	70 93 51 05 	sts	0x0551, r23	; 0x800551 <softwareSerial+0x9f>
    490e:	50 92 52 05 	sts	0x0552, r5	; 0x800552 <softwareSerial+0xa0>
    4912:	10 92 54 05 	sts	0x0554, r1	; 0x800554 <softwareSerial+0xa2>
    4916:	10 92 53 05 	sts	0x0553, r1	; 0x800553 <softwareSerial+0xa1>
    491a:	10 92 55 05 	sts	0x0555, r1	; 0x800555 <softwareSerial+0xa3>
    491e:	10 92 57 05 	sts	0x0557, r1	; 0x800557 <softwareSerial+0xa5>
    4922:	10 92 56 05 	sts	0x0556, r1	; 0x800556 <softwareSerial+0xa4>
    4926:	10 92 59 05 	sts	0x0559, r1	; 0x800559 <softwareSerial+0xa7>
    492a:	10 92 58 05 	sts	0x0558, r1	; 0x800558 <softwareSerial+0xa6>
    492e:	8f ef       	ldi	r24, 0xFF	; 255
    4930:	80 93 5a 05 	sts	0x055A, r24	; 0x80055a <softwareSerial+0xa8>
    4934:	10 92 5c 05 	sts	0x055C, r1	; 0x80055c <softwareSerial+0xaa>
    4938:	10 92 5b 05 	sts	0x055B, r1	; 0x80055b <softwareSerial+0xa9>
    493c:	10 92 5e 05 	sts	0x055E, r1	; 0x80055e <softwareSerial+0xac>
    4940:	10 92 5d 05 	sts	0x055D, r1	; 0x80055d <softwareSerial+0xab>
    4944:	10 92 60 05 	sts	0x0560, r1	; 0x800560 <softwareSerial+0xae>
    4948:	10 92 5f 05 	sts	0x055F, r1	; 0x80055f <softwareSerial+0xad>
    494c:	80 93 61 05 	sts	0x0561, r24	; 0x800561 <softwareSerial+0xaf>
    4950:	10 92 6f 05 	sts	0x056F, r1	; 0x80056f <softwareSerial+0xbd>
    4954:	10 92 6e 05 	sts	0x056E, r1	; 0x80056e <softwareSerial+0xbc>
    4958:	e6 e5       	ldi	r30, 0x56	; 86
    495a:	f4 e0       	ldi	r31, 0x04	; 4
    495c:	b1 83       	std	Z+1, r27	; 0x01
    495e:	a0 83       	st	Z, r26
    4960:	12 82       	std	Z+2, r1	; 0x02
    4962:	53 82       	std	Z+3, r5	; 0x03
    4964:	80 e1       	ldi	r24, 0x10	; 16
    4966:	84 83       	std	Z+4, r24	; 0x04
    4968:	16 82       	std	Z+6, r1	; 0x06
    496a:	15 82       	std	Z+5, r1	; 0x05
    496c:	10 86       	std	Z+8, r1	; 0x08
    496e:	17 82       	std	Z+7, r1	; 0x07
    4970:	16 86       	std	Z+14, r1	; 0x0e
    4972:	15 86       	std	Z+13, r1	; 0x0d
    4974:	74 86       	std	Z+12, r7	; 0x0c
    4976:	63 86       	std	Z+11, r6	; 0x0b
    4978:	8f ef       	ldi	r24, 0xFF	; 255
    497a:	9f e3       	ldi	r25, 0x3F	; 63
    497c:	92 87       	std	Z+10, r25	; 0x0a
    497e:	81 87       	std	Z+9, r24	; 0x09
    4980:	10 92 a5 04 	sts	0x04A5, r1	; 0x8004a5 <hc05+0x4f>
    4984:	10 92 a6 04 	sts	0x04A6, r1	; 0x8004a6 <hc05+0x50>
    4988:	0e 94 7f 06 	call	0xcfe	; 0xcfe <_ZN12StringBufferILh64EE5clearEv.constprop.102>
    498c:	86 e1       	ldi	r24, 0x16	; 22
    498e:	80 93 a7 04 	sts	0x04A7, r24	; 0x8004a7 <hc05+0x51>
    4992:	10 92 a8 04 	sts	0x04A8, r1	; 0x8004a8 <hc05+0x52>
    4996:	10 92 a9 04 	sts	0x04A9, r1	; 0x8004a9 <hc05+0x53>
    499a:	10 92 aa 04 	sts	0x04AA, r1	; 0x8004aa <hc05+0x54>
    499e:	10 92 ab 04 	sts	0x04AB, r1	; 0x8004ab <hc05+0x55>
    49a2:	10 92 ad 04 	sts	0x04AD, r1	; 0x8004ad <hc05+0x57>
    49a6:	10 92 ac 04 	sts	0x04AC, r1	; 0x8004ac <hc05+0x56>
    49aa:	10 92 b1 04 	sts	0x04B1, r1	; 0x8004b1 <hc05+0x5b>
    49ae:	10 92 b0 04 	sts	0x04B0, r1	; 0x8004b0 <hc05+0x5a>
    49b2:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    49b6:	70 93 af 04 	sts	0x04AF, r23	; 0x8004af <hc05+0x59>
    49ba:	60 93 ae 04 	sts	0x04AE, r22	; 0x8004ae <hc05+0x58>
    49be:	e1 e5       	ldi	r30, 0x51	; 81
    49c0:	f4 e0       	ldi	r31, 0x04	; 4
    49c2:	d1 82       	std	Z+1, r13	; 0x01
    49c4:	c0 82       	st	Z, r12
    49c6:	12 82       	std	Z+2, r1	; 0x02
    49c8:	14 82       	std	Z+4, r1	; 0x04
    49ca:	13 82       	std	Z+3, r1	; 0x03
    49cc:	cd ef       	ldi	r28, 0xFD	; 253
    49ce:	d3 e0       	ldi	r29, 0x03	; 3
    49d0:	1b 82       	std	Y+3, r1	; 0x03
    49d2:	1a 82       	std	Y+2, r1	; 0x02
    49d4:	8c 82       	std	Y+4, r8	; 0x04
    49d6:	9d 82       	std	Y+5, r9	; 0x05
    49d8:	ae 82       	std	Y+6, r10	; 0x06
    49da:	bf 82       	std	Y+7, r11	; 0x07
    49dc:	0e e5       	ldi	r16, 0x5E	; 94
    49de:	11 e0       	ldi	r17, 0x01	; 1
    49e0:	19 83       	std	Y+1, r17	; 0x01
    49e2:	08 83       	st	Y, r16
    49e4:	80 e0       	ldi	r24, 0x00	; 0
    49e6:	91 e0       	ldi	r25, 0x01	; 1
    49e8:	0e 94 16 30 	call	0x602c	; 0x602c <malloc>
    49ec:	9d 87       	std	Y+13, r25	; 0x0d
    49ee:	8c 87       	std	Y+12, r24	; 0x0c
    49f0:	c1 2c       	mov	r12, r1
    49f2:	dd 24       	eor	r13, r13
    49f4:	d3 94       	inc	r13
    49f6:	df 86       	std	Y+15, r13	; 0x0f
    49f8:	ce 86       	std	Y+14, r12	; 0x0e
    49fa:	19 8a       	std	Y+17, r1	; 0x11
    49fc:	18 8a       	std	Y+16, r1	; 0x10
    49fe:	1b 8a       	std	Y+19, r1	; 0x13
    4a00:	1a 8a       	std	Y+18, r1	; 0x12
    4a02:	1f 8a       	std	Y+23, r1	; 0x17
    4a04:	1e 8a       	std	Y+22, r1	; 0x16
    4a06:	88 8e       	std	Y+24, r8	; 0x18
    4a08:	99 8e       	std	Y+25, r9	; 0x19
    4a0a:	aa 8e       	std	Y+26, r10	; 0x1a
    4a0c:	bb 8e       	std	Y+27, r11	; 0x1b
    4a0e:	1d 8b       	std	Y+21, r17	; 0x15
    4a10:	0c 8b       	std	Y+20, r16	; 0x14
    4a12:	80 e0       	ldi	r24, 0x00	; 0
    4a14:	91 e0       	ldi	r25, 0x01	; 1
    4a16:	0e 94 16 30 	call	0x602c	; 0x602c <malloc>
    4a1a:	99 a3       	std	Y+33, r25	; 0x21
    4a1c:	88 a3       	std	Y+32, r24	; 0x20
    4a1e:	db a2       	std	Y+35, r13	; 0x23
    4a20:	ca a2       	std	Y+34, r12	; 0x22
    4a22:	1d a2       	std	Y+37, r1	; 0x25
    4a24:	1c a2       	std	Y+36, r1	; 0x24
    4a26:	1f a2       	std	Y+39, r1	; 0x27
    4a28:	1e a2       	std	Y+38, r1	; 0x26
    4a2a:	1b a6       	std	Y+43, r1	; 0x2b
    4a2c:	1a a6       	std	Y+42, r1	; 0x2a
    4a2e:	8c a6       	std	Y+44, r8	; 0x2c
    4a30:	9d a6       	std	Y+45, r9	; 0x2d
    4a32:	ae a6       	std	Y+46, r10	; 0x2e
    4a34:	bf a6       	std	Y+47, r11	; 0x2f
    4a36:	22 e7       	ldi	r18, 0x72	; 114
    4a38:	31 e0       	ldi	r19, 0x01	; 1
    4a3a:	39 a7       	std	Y+41, r19	; 0x29
    4a3c:	28 a7       	std	Y+40, r18	; 0x28
    4a3e:	dd ab       	std	Y+53, r29	; 0x35
    4a40:	cc ab       	std	Y+52, r28	; 0x34
    4a42:	81 e1       	ldi	r24, 0x11	; 17
    4a44:	94 e0       	ldi	r25, 0x04	; 4
    4a46:	9f ab       	std	Y+55, r25	; 0x37
    4a48:	8e ab       	std	Y+54, r24	; 0x36
    4a4a:	1b ae       	std	Y+59, r1	; 0x3b
    4a4c:	1a ae       	std	Y+58, r1	; 0x3a
    4a4e:	8c ae       	std	Y+60, r8	; 0x3c
    4a50:	9d ae       	std	Y+61, r9	; 0x3d
    4a52:	ae ae       	std	Y+62, r10	; 0x3e
    4a54:	bf ae       	std	Y+63, r11	; 0x3f
    4a56:	39 af       	std	Y+57, r19	; 0x39
    4a58:	28 af       	std	Y+56, r18	; 0x38
    4a5a:	90 93 42 04 	sts	0x0442, r25	; 0x800442 <commandPipes+0x45>
    4a5e:	80 93 41 04 	sts	0x0441, r24	; 0x800441 <commandPipes+0x44>
    4a62:	d0 93 44 04 	sts	0x0444, r29	; 0x800444 <commandPipes+0x47>
    4a66:	c0 93 43 04 	sts	0x0443, r28	; 0x800443 <commandPipes+0x46>
    4a6a:	83 ef       	ldi	r24, 0xF3	; 243
    4a6c:	93 e0       	ldi	r25, 0x03	; 3
    4a6e:	0e 94 29 23 	call	0x4652	; 0x4652 <_ZN9Statistic5resetEv>
    4a72:	89 ee       	ldi	r24, 0xE9	; 233
    4a74:	93 e0       	ldi	r25, 0x03	; 3
    4a76:	0e 94 29 23 	call	0x4652	; 0x4652 <_ZN9Statistic5resetEv>
    4a7a:	8f ed       	ldi	r24, 0xDF	; 223
    4a7c:	93 e0       	ldi	r25, 0x03	; 3
    4a7e:	0e 94 29 23 	call	0x4652	; 0x4652 <_ZN9Statistic5resetEv>
    4a82:	85 ed       	ldi	r24, 0xD5	; 213
    4a84:	93 e0       	ldi	r25, 0x03	; 3
    4a86:	0e 94 29 23 	call	0x4652	; 0x4652 <_ZN9Statistic5resetEv>
    4a8a:	8b ec       	ldi	r24, 0xCB	; 203
    4a8c:	93 e0       	ldi	r25, 0x03	; 3
    4a8e:	0e 94 29 23 	call	0x4652	; 0x4652 <_ZN9Statistic5resetEv>
    4a92:	81 ec       	ldi	r24, 0xC1	; 193
    4a94:	93 e0       	ldi	r25, 0x03	; 3
    4a96:	0e 94 29 23 	call	0x4652	; 0x4652 <_ZN9Statistic5resetEv>
    4a9a:	87 eb       	ldi	r24, 0xB7	; 183
    4a9c:	93 e0       	ldi	r25, 0x03	; 3
    4a9e:	0e 94 29 23 	call	0x4652	; 0x4652 <_ZN9Statistic5resetEv>
    4aa2:	8d ea       	ldi	r24, 0xAD	; 173
    4aa4:	93 e0       	ldi	r25, 0x03	; 3
    4aa6:	0e 94 29 23 	call	0x4652	; 0x4652 <_ZN9Statistic5resetEv>
    4aaa:	83 ea       	ldi	r24, 0xA3	; 163
    4aac:	93 e0       	ldi	r25, 0x03	; 3
    4aae:	0e 94 29 23 	call	0x4652	; 0x4652 <_ZN9Statistic5resetEv>
    4ab2:	89 e9       	ldi	r24, 0x99	; 153
    4ab4:	93 e0       	ldi	r25, 0x03	; 3
    4ab6:	0e 94 29 23 	call	0x4652	; 0x4652 <_ZN9Statistic5resetEv>
    4aba:	8f e8       	ldi	r24, 0x8F	; 143
    4abc:	93 e0       	ldi	r25, 0x03	; 3
    4abe:	0e 94 29 23 	call	0x4652	; 0x4652 <_ZN9Statistic5resetEv>
    4ac2:	85 e8       	ldi	r24, 0x85	; 133
    4ac4:	93 e0       	ldi	r25, 0x03	; 3
    4ac6:	0e 94 29 23 	call	0x4652	; 0x4652 <_ZN9Statistic5resetEv>
    4aca:	e9 e6       	ldi	r30, 0x69	; 105
    4acc:	f3 e0       	ldi	r31, 0x03	; 3
    4ace:	8e e6       	ldi	r24, 0x6E	; 110
    4ad0:	9c e0       	ldi	r25, 0x0C	; 12
    4ad2:	91 83       	std	Z+1, r25	; 0x01
    4ad4:	80 83       	st	Z, r24
    4ad6:	13 82       	std	Z+3, r1	; 0x03
    4ad8:	12 82       	std	Z+2, r1	; 0x02
    4ada:	88 e5       	ldi	r24, 0x58	; 88
    4adc:	9c e0       	ldi	r25, 0x0C	; 12
    4ade:	95 83       	std	Z+5, r25	; 0x05
    4ae0:	84 83       	std	Z+4, r24	; 0x04
    4ae2:	17 82       	std	Z+7, r1	; 0x07
    4ae4:	16 82       	std	Z+6, r1	; 0x06
    4ae6:	85 e3       	ldi	r24, 0x35	; 53
    4ae8:	9c e0       	ldi	r25, 0x0C	; 12
    4aea:	91 87       	std	Z+9, r25	; 0x09
    4aec:	80 87       	std	Z+8, r24	; 0x08
    4aee:	13 86       	std	Z+11, r1	; 0x0b
    4af0:	12 86       	std	Z+10, r1	; 0x0a
    4af2:	83 e1       	ldi	r24, 0x13	; 19
    4af4:	9c e0       	ldi	r25, 0x0C	; 12
    4af6:	95 87       	std	Z+13, r25	; 0x0d
    4af8:	84 87       	std	Z+12, r24	; 0x0c
    4afa:	17 86       	std	Z+15, r1	; 0x0f
    4afc:	16 86       	std	Z+14, r1	; 0x0e
    4afe:	8c ee       	ldi	r24, 0xEC	; 236
    4b00:	9b e0       	ldi	r25, 0x0B	; 11
    4b02:	91 8b       	std	Z+17, r25	; 0x11
    4b04:	80 8b       	std	Z+16, r24	; 0x10
    4b06:	13 8a       	std	Z+19, r1	; 0x13
    4b08:	12 8a       	std	Z+18, r1	; 0x12
    4b0a:	89 ec       	ldi	r24, 0xC9	; 201
    4b0c:	9b e0       	ldi	r25, 0x0B	; 11
    4b0e:	95 8b       	std	Z+21, r25	; 0x15
    4b10:	84 8b       	std	Z+20, r24	; 0x14
    4b12:	17 8a       	std	Z+23, r1	; 0x17
    4b14:	16 8a       	std	Z+22, r1	; 0x16
    4b16:	8f e8       	ldi	r24, 0x8F	; 143
    4b18:	9b e0       	ldi	r25, 0x0B	; 11
    4b1a:	91 8f       	std	Z+25, r25	; 0x19
    4b1c:	80 8f       	std	Z+24, r24	; 0x18
    4b1e:	13 8e       	std	Z+27, r1	; 0x1b
    4b20:	12 8e       	std	Z+26, r1	; 0x1a
    4b22:	a7 e5       	ldi	r26, 0x57	; 87
    4b24:	b3 e0       	ldi	r27, 0x03	; 3
    4b26:	11 96       	adiw	r26, 0x01	; 1
    4b28:	fc 92       	st	X, r15
    4b2a:	ee 92       	st	-X, r14
    4b2c:	87 ef       	ldi	r24, 0xF7	; 247
    4b2e:	92 e0       	ldi	r25, 0x02	; 2
    4b30:	13 96       	adiw	r26, 0x03	; 3
    4b32:	9c 93       	st	X, r25
    4b34:	8e 93       	st	-X, r24
    4b36:	12 97       	sbiw	r26, 0x02	; 2
    4b38:	80 e1       	ldi	r24, 0x10	; 16
    4b3a:	90 e0       	ldi	r25, 0x00	; 0
    4b3c:	15 96       	adiw	r26, 0x05	; 5
    4b3e:	9c 93       	st	X, r25
    4b40:	8e 93       	st	-X, r24
    4b42:	14 97       	sbiw	r26, 0x04	; 4
    4b44:	17 96       	adiw	r26, 0x07	; 7
    4b46:	fc 93       	st	X, r31
    4b48:	ee 93       	st	-X, r30
    4b4a:	16 97       	sbiw	r26, 0x06	; 6
    4b4c:	87 e0       	ldi	r24, 0x07	; 7
    4b4e:	90 e0       	ldi	r25, 0x00	; 0
    4b50:	19 96       	adiw	r26, 0x09	; 9
    4b52:	9c 93       	st	X, r25
    4b54:	8e 93       	st	-X, r24
    4b56:	18 97       	sbiw	r26, 0x08	; 8
    4b58:	88 eb       	ldi	r24, 0xB8	; 184
    4b5a:	9b e0       	ldi	r25, 0x0B	; 11
    4b5c:	1b 96       	adiw	r26, 0x0b	; 11
    4b5e:	9c 93       	st	X, r25
    4b60:	8e 93       	st	-X, r24
    4b62:	1a 97       	sbiw	r26, 0x0a	; 10
    4b64:	43 e7       	ldi	r20, 0x73	; 115
    4b66:	56 e0       	ldi	r21, 0x06	; 6
    4b68:	1d 96       	adiw	r26, 0x0d	; 13
    4b6a:	5c 93       	st	X, r21
    4b6c:	4e 93       	st	-X, r20
    4b6e:	1c 97       	sbiw	r26, 0x0c	; 12
    4b70:	29 e7       	ldi	r18, 0x79	; 121
    4b72:	36 e0       	ldi	r19, 0x06	; 6
    4b74:	1f 96       	adiw	r26, 0x0f	; 15
    4b76:	3c 93       	st	X, r19
    4b78:	2e 93       	st	-X, r18
    4b7a:	1e 97       	sbiw	r26, 0x0e	; 14
    4b7c:	8b e1       	ldi	r24, 0x1B	; 27
    4b7e:	9e e0       	ldi	r25, 0x0E	; 14
    4b80:	51 96       	adiw	r26, 0x11	; 17
    4b82:	9c 93       	st	X, r25
    4b84:	8e 93       	st	-X, r24
    4b86:	50 97       	sbiw	r26, 0x10	; 16
    4b88:	e7 ed       	ldi	r30, 0xD7	; 215
    4b8a:	f2 e0       	ldi	r31, 0x02	; 2
    4b8c:	6e e6       	ldi	r22, 0x6E	; 110
    4b8e:	7c e0       	ldi	r23, 0x0C	; 12
    4b90:	71 83       	std	Z+1, r23	; 0x01
    4b92:	60 83       	st	Z, r22
    4b94:	13 82       	std	Z+3, r1	; 0x03
    4b96:	12 82       	std	Z+2, r1	; 0x02
    4b98:	68 e5       	ldi	r22, 0x58	; 88
    4b9a:	7c e0       	ldi	r23, 0x0C	; 12
    4b9c:	75 83       	std	Z+5, r23	; 0x05
    4b9e:	64 83       	std	Z+4, r22	; 0x04
    4ba0:	17 82       	std	Z+7, r1	; 0x07
    4ba2:	16 82       	std	Z+6, r1	; 0x06
    4ba4:	6d e6       	ldi	r22, 0x6D	; 109
    4ba6:	7b e0       	ldi	r23, 0x0B	; 11
    4ba8:	71 87       	std	Z+9, r23	; 0x09
    4baa:	60 87       	std	Z+8, r22	; 0x08
    4bac:	13 86       	std	Z+11, r1	; 0x0b
    4bae:	12 86       	std	Z+10, r1	; 0x0a
    4bb0:	6b e4       	ldi	r22, 0x4B	; 75
    4bb2:	7b e0       	ldi	r23, 0x0B	; 11
    4bb4:	75 87       	std	Z+13, r23	; 0x0d
    4bb6:	64 87       	std	Z+12, r22	; 0x0c
    4bb8:	17 86       	std	Z+15, r1	; 0x0f
    4bba:	16 86       	std	Z+14, r1	; 0x0e
    4bbc:	63 e3       	ldi	r22, 0x33	; 51
    4bbe:	7b e0       	ldi	r23, 0x0B	; 11
    4bc0:	71 8b       	std	Z+17, r23	; 0x11
    4bc2:	60 8b       	std	Z+16, r22	; 0x10
    4bc4:	13 8a       	std	Z+19, r1	; 0x13
    4bc6:	12 8a       	std	Z+18, r1	; 0x12
    4bc8:	6d e0       	ldi	r22, 0x0D	; 13
    4bca:	7b e0       	ldi	r23, 0x0B	; 11
    4bcc:	75 8b       	std	Z+21, r23	; 0x15
    4bce:	64 8b       	std	Z+20, r22	; 0x14
    4bd0:	17 8a       	std	Z+23, r1	; 0x17
    4bd2:	16 8a       	std	Z+22, r1	; 0x16
    4bd4:	67 ee       	ldi	r22, 0xE7	; 231
    4bd6:	7a e0       	ldi	r23, 0x0A	; 10
    4bd8:	71 8f       	std	Z+25, r23	; 0x19
    4bda:	60 8f       	std	Z+24, r22	; 0x18
    4bdc:	13 8e       	std	Z+27, r1	; 0x1b
    4bde:	12 8e       	std	Z+26, r1	; 0x1a
    4be0:	6d eb       	ldi	r22, 0xBD	; 189
    4be2:	7a e0       	ldi	r23, 0x0A	; 10
    4be4:	75 8f       	std	Z+29, r23	; 0x1d
    4be6:	64 8f       	std	Z+28, r22	; 0x1c
    4be8:	17 8e       	std	Z+31, r1	; 0x1f
    4bea:	16 8e       	std	Z+30, r1	; 0x1e
    4bec:	a5 ec       	ldi	r26, 0xC5	; 197
    4bee:	b2 e0       	ldi	r27, 0x02	; 2
    4bf0:	65 e3       	ldi	r22, 0x35	; 53
    4bf2:	74 e0       	ldi	r23, 0x04	; 4
    4bf4:	11 96       	adiw	r26, 0x01	; 1
    4bf6:	7c 93       	st	X, r23
    4bf8:	6e 93       	st	-X, r22
    4bfa:	65 e9       	ldi	r22, 0x95	; 149
    4bfc:	72 e0       	ldi	r23, 0x02	; 2
    4bfe:	13 96       	adiw	r26, 0x03	; 3
    4c00:	7c 93       	st	X, r23
    4c02:	6e 93       	st	-X, r22
    4c04:	12 97       	sbiw	r26, 0x02	; 2
    4c06:	60 e3       	ldi	r22, 0x30	; 48
    4c08:	70 e0       	ldi	r23, 0x00	; 0
    4c0a:	15 96       	adiw	r26, 0x05	; 5
    4c0c:	7c 93       	st	X, r23
    4c0e:	6e 93       	st	-X, r22
    4c10:	14 97       	sbiw	r26, 0x04	; 4
    4c12:	17 96       	adiw	r26, 0x07	; 7
    4c14:	fc 93       	st	X, r31
    4c16:	ee 93       	st	-X, r30
    4c18:	16 97       	sbiw	r26, 0x06	; 6
    4c1a:	68 e0       	ldi	r22, 0x08	; 8
    4c1c:	70 e0       	ldi	r23, 0x00	; 0
    4c1e:	19 96       	adiw	r26, 0x09	; 9
    4c20:	7c 93       	st	X, r23
    4c22:	6e 93       	st	-X, r22
    4c24:	18 97       	sbiw	r26, 0x08	; 8
    4c26:	68 ee       	ldi	r22, 0xE8	; 232
    4c28:	73 e0       	ldi	r23, 0x03	; 3
    4c2a:	1b 96       	adiw	r26, 0x0b	; 11
    4c2c:	7c 93       	st	X, r23
    4c2e:	6e 93       	st	-X, r22
    4c30:	1a 97       	sbiw	r26, 0x0a	; 10
    4c32:	1d 96       	adiw	r26, 0x0d	; 13
    4c34:	5c 93       	st	X, r21
    4c36:	4e 93       	st	-X, r20
    4c38:	1c 97       	sbiw	r26, 0x0c	; 12
    4c3a:	1f 96       	adiw	r26, 0x0f	; 15
    4c3c:	3c 93       	st	X, r19
    4c3e:	2e 93       	st	-X, r18
    4c40:	1e 97       	sbiw	r26, 0x0e	; 14
    4c42:	51 96       	adiw	r26, 0x11	; 17
    4c44:	9c 93       	st	X, r25
    4c46:	8e 93       	st	-X, r24
    4c48:	50 97       	sbiw	r26, 0x10	; 16
    4c4a:	cd b7       	in	r28, 0x3d	; 61
    4c4c:	de b7       	in	r29, 0x3e	; 62
    4c4e:	ef e0       	ldi	r30, 0x0F	; 15
    4c50:	0c 94 b7 34 	jmp	0x696e	; 0x696e <__epilogue_restores__+0x6>

00004c54 <main>:
    4c54:	a9 e4       	ldi	r26, 0x49	; 73
    4c56:	b0 e0       	ldi	r27, 0x00	; 0
    4c58:	e0 e3       	ldi	r30, 0x30	; 48
    4c5a:	f6 e2       	ldi	r31, 0x26	; 38
    4c5c:	0c 94 99 34 	jmp	0x6932	; 0x6932 <__prologue_saves__+0x2>
    4c60:	78 94       	sei
    4c62:	84 b5       	in	r24, 0x24	; 36
    4c64:	82 60       	ori	r24, 0x02	; 2
    4c66:	84 bd       	out	0x24, r24	; 36
    4c68:	84 b5       	in	r24, 0x24	; 36
    4c6a:	81 60       	ori	r24, 0x01	; 1
    4c6c:	84 bd       	out	0x24, r24	; 36
    4c6e:	85 b5       	in	r24, 0x25	; 37
    4c70:	82 60       	ori	r24, 0x02	; 2
    4c72:	85 bd       	out	0x25, r24	; 37
    4c74:	85 b5       	in	r24, 0x25	; 37
    4c76:	81 60       	ori	r24, 0x01	; 1
    4c78:	85 bd       	out	0x25, r24	; 37
    4c7a:	80 91 6e 00 	lds	r24, 0x006E	; 0x80006e <__TEXT_REGION_LENGTH__+0x7e006e>
    4c7e:	81 60       	ori	r24, 0x01	; 1
    4c80:	80 93 6e 00 	sts	0x006E, r24	; 0x80006e <__TEXT_REGION_LENGTH__+0x7e006e>
    4c84:	10 92 81 00 	sts	0x0081, r1	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
    4c88:	80 91 81 00 	lds	r24, 0x0081	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
    4c8c:	82 60       	ori	r24, 0x02	; 2
    4c8e:	80 93 81 00 	sts	0x0081, r24	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
    4c92:	80 91 81 00 	lds	r24, 0x0081	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
    4c96:	81 60       	ori	r24, 0x01	; 1
    4c98:	80 93 81 00 	sts	0x0081, r24	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
    4c9c:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    4ca0:	81 60       	ori	r24, 0x01	; 1
    4ca2:	80 93 80 00 	sts	0x0080, r24	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    4ca6:	80 91 91 00 	lds	r24, 0x0091	; 0x800091 <__TEXT_REGION_LENGTH__+0x7e0091>
    4caa:	82 60       	ori	r24, 0x02	; 2
    4cac:	80 93 91 00 	sts	0x0091, r24	; 0x800091 <__TEXT_REGION_LENGTH__+0x7e0091>
    4cb0:	80 91 91 00 	lds	r24, 0x0091	; 0x800091 <__TEXT_REGION_LENGTH__+0x7e0091>
    4cb4:	81 60       	ori	r24, 0x01	; 1
    4cb6:	80 93 91 00 	sts	0x0091, r24	; 0x800091 <__TEXT_REGION_LENGTH__+0x7e0091>
    4cba:	80 91 90 00 	lds	r24, 0x0090	; 0x800090 <__TEXT_REGION_LENGTH__+0x7e0090>
    4cbe:	81 60       	ori	r24, 0x01	; 1
    4cc0:	80 93 90 00 	sts	0x0090, r24	; 0x800090 <__TEXT_REGION_LENGTH__+0x7e0090>
    4cc4:	80 91 c1 00 	lds	r24, 0x00C1	; 0x8000c1 <__TEXT_REGION_LENGTH__+0x7e00c1>
    4cc8:	84 60       	ori	r24, 0x04	; 4
    4cca:	80 93 c1 00 	sts	0x00C1, r24	; 0x8000c1 <__TEXT_REGION_LENGTH__+0x7e00c1>
    4cce:	80 91 c1 00 	lds	r24, 0x00C1	; 0x8000c1 <__TEXT_REGION_LENGTH__+0x7e00c1>
    4cd2:	82 60       	ori	r24, 0x02	; 2
    4cd4:	80 93 c1 00 	sts	0x00C1, r24	; 0x8000c1 <__TEXT_REGION_LENGTH__+0x7e00c1>
    4cd8:	80 91 c1 00 	lds	r24, 0x00C1	; 0x8000c1 <__TEXT_REGION_LENGTH__+0x7e00c1>
    4cdc:	81 60       	ori	r24, 0x01	; 1
    4cde:	80 93 c1 00 	sts	0x00C1, r24	; 0x8000c1 <__TEXT_REGION_LENGTH__+0x7e00c1>
    4ce2:	80 91 c3 00 	lds	r24, 0x00C3	; 0x8000c3 <__TEXT_REGION_LENGTH__+0x7e00c3>
    4ce6:	81 60       	ori	r24, 0x01	; 1
    4ce8:	80 93 c3 00 	sts	0x00C3, r24	; 0x8000c3 <__TEXT_REGION_LENGTH__+0x7e00c3>
    4cec:	80 91 c0 00 	lds	r24, 0x00C0	; 0x8000c0 <__TEXT_REGION_LENGTH__+0x7e00c0>
    4cf0:	82 60       	ori	r24, 0x02	; 2
    4cf2:	80 93 c0 00 	sts	0x00C0, r24	; 0x8000c0 <__TEXT_REGION_LENGTH__+0x7e00c0>
    4cf6:	80 91 c2 00 	lds	r24, 0x00C2	; 0x8000c2 <__TEXT_REGION_LENGTH__+0x7e00c2>
    4cfa:	81 60       	ori	r24, 0x01	; 1
    4cfc:	80 93 c2 00 	sts	0x00C2, r24	; 0x8000c2 <__TEXT_REGION_LENGTH__+0x7e00c2>
    4d00:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4d04:	84 60       	ori	r24, 0x04	; 4
    4d06:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4d0a:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4d0e:	82 60       	ori	r24, 0x02	; 2
    4d10:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4d14:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4d18:	81 60       	ori	r24, 0x01	; 1
    4d1a:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4d1e:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4d22:	80 68       	ori	r24, 0x80	; 128
    4d24:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4d28:	10 92 44 02 	sts	0x0244, r1	; 0x800244 <_usbConfiguration>
    4d2c:	10 92 14 02 	sts	0x0214, r1	; 0x800214 <_usbCurrentStatus>
    4d30:	10 92 13 02 	sts	0x0213, r1	; 0x800213 <_usbSuspendState>
    4d34:	80 91 d7 00 	lds	r24, 0x00D7	; 0x8000d7 <__TEXT_REGION_LENGTH__+0x7e00d7>
    4d38:	81 60       	ori	r24, 0x01	; 1
    4d3a:	80 93 d7 00 	sts	0x00D7, r24	; 0x8000d7 <__TEXT_REGION_LENGTH__+0x7e00d7>
    4d3e:	80 ea       	ldi	r24, 0xA0	; 160
    4d40:	80 93 d8 00 	sts	0x00D8, r24	; 0x8000d8 <__TEXT_REGION_LENGTH__+0x7e00d8>
    4d44:	89 b5       	in	r24, 0x29	; 41
    4d46:	80 61       	ori	r24, 0x10	; 16
    4d48:	89 bd       	out	0x29, r24	; 41
    4d4a:	89 b5       	in	r24, 0x29	; 41
    4d4c:	82 60       	ori	r24, 0x02	; 2
    4d4e:	89 bd       	out	0x29, r24	; 41
    4d50:	09 b4       	in	r0, 0x29	; 41
    4d52:	00 fe       	sbrs	r0, 0
    4d54:	fd cf       	rjmp	.-6      	; 0x4d50 <main+0xfc>
    4d56:	61 e0       	ldi	r22, 0x01	; 1
    4d58:	70 e0       	ldi	r23, 0x00	; 0
    4d5a:	80 e0       	ldi	r24, 0x00	; 0
    4d5c:	90 e0       	ldi	r25, 0x00	; 0
    4d5e:	0e 94 61 08 	call	0x10c2	; 0x10c2 <delay>
    4d62:	80 91 d8 00 	lds	r24, 0x00D8	; 0x8000d8 <__TEXT_REGION_LENGTH__+0x7e00d8>
    4d66:	8f 7c       	andi	r24, 0xCF	; 207
    4d68:	80 61       	ori	r24, 0x10	; 16
    4d6a:	80 93 d8 00 	sts	0x00D8, r24	; 0x8000d8 <__TEXT_REGION_LENGTH__+0x7e00d8>
    4d6e:	80 91 e0 00 	lds	r24, 0x00E0	; 0x8000e0 <__TEXT_REGION_LENGTH__+0x7e00e0>
    4d72:	80 7f       	andi	r24, 0xF0	; 240
    4d74:	80 93 e0 00 	sts	0x00E0, r24	; 0x8000e0 <__TEXT_REGION_LENGTH__+0x7e00e0>
    4d78:	80 91 e1 00 	lds	r24, 0x00E1	; 0x8000e1 <__TEXT_REGION_LENGTH__+0x7e00e1>
    4d7c:	8e 7e       	andi	r24, 0xEE	; 238
    4d7e:	80 93 e1 00 	sts	0x00E1, r24	; 0x8000e1 <__TEXT_REGION_LENGTH__+0x7e00e1>
    4d82:	8d e0       	ldi	r24, 0x0D	; 13
    4d84:	80 93 e2 00 	sts	0x00E2, r24	; 0x8000e2 <__TEXT_REGION_LENGTH__+0x7e00e2>
    4d88:	55 9a       	sbi	0x0a, 5	; 10
    4d8a:	20 9a       	sbi	0x04, 0	; 4
    4d8c:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    4d90:	8b 01       	movw	r16, r22
    4d92:	8f ef       	ldi	r24, 0xFF	; 255
    4d94:	9f ef       	ldi	r25, 0xFF	; 255
    4d96:	90 93 14 03 	sts	0x0314, r25	; 0x800314 <Serial+0xd>
    4d9a:	80 93 13 03 	sts	0x0313, r24	; 0x800313 <Serial+0xc>
    4d9e:	f0 90 0b 01 	lds	r15, 0x010B	; 0x80010b <_ZL12_usbLineInfo+0x7>
    4da2:	6a e0       	ldi	r22, 0x0A	; 10
    4da4:	70 e0       	ldi	r23, 0x00	; 0
    4da6:	80 e0       	ldi	r24, 0x00	; 0
    4da8:	90 e0       	ldi	r25, 0x00	; 0
    4daa:	0e 94 61 08 	call	0x10c2	; 0x10c2 <delay>
    4dae:	f1 10       	cpse	r15, r1
    4db0:	07 c0       	rjmp	.+14     	; 0x4dc0 <main+0x16c>
    4db2:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    4db6:	60 1b       	sub	r22, r16
    4db8:	71 0b       	sbc	r23, r17
    4dba:	60 3d       	cpi	r22, 0xD0	; 208
    4dbc:	77 40       	sbci	r23, 0x07	; 7
    4dbe:	78 f3       	brcs	.-34     	; 0x4d9e <main+0x14a>
    4dc0:	14 b7       	in	r17, 0x34	; 52
    4dc2:	14 be       	out	0x34, r1	; 52
    4dc4:	87 e0       	ldi	r24, 0x07	; 7
    4dc6:	93 e0       	ldi	r25, 0x03	; 3
    4dc8:	0e 94 17 11 	call	0x222e	; 0x222e <_ZN11MemoryUsage10printStarsER5Print>
    4dcc:	62 e9       	ldi	r22, 0x92	; 146
    4dce:	74 e0       	ldi	r23, 0x04	; 4
    4dd0:	87 e0       	ldi	r24, 0x07	; 7
    4dd2:	93 e0       	ldi	r25, 0x03	; 3
    4dd4:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    4dd8:	10 ff       	sbrs	r17, 0
    4dda:	06 c0       	rjmp	.+12     	; 0x4de8 <main+0x194>
    4ddc:	63 e8       	ldi	r22, 0x83	; 131
    4dde:	74 e0       	ldi	r23, 0x04	; 4
    4de0:	87 e0       	ldi	r24, 0x07	; 7
    4de2:	93 e0       	ldi	r25, 0x03	; 3
    4de4:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    4de8:	11 ff       	sbrs	r17, 1
    4dea:	06 c0       	rjmp	.+12     	; 0x4df8 <main+0x1a4>
    4dec:	64 e7       	ldi	r22, 0x74	; 116
    4dee:	74 e0       	ldi	r23, 0x04	; 4
    4df0:	87 e0       	ldi	r24, 0x07	; 7
    4df2:	93 e0       	ldi	r25, 0x03	; 3
    4df4:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    4df8:	12 ff       	sbrs	r17, 2
    4dfa:	06 c0       	rjmp	.+12     	; 0x4e08 <main+0x1b4>
    4dfc:	64 e6       	ldi	r22, 0x64	; 100
    4dfe:	74 e0       	ldi	r23, 0x04	; 4
    4e00:	87 e0       	ldi	r24, 0x07	; 7
    4e02:	93 e0       	ldi	r25, 0x03	; 3
    4e04:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    4e08:	13 ff       	sbrs	r17, 3
    4e0a:	06 c0       	rjmp	.+12     	; 0x4e18 <main+0x1c4>
    4e0c:	65 e5       	ldi	r22, 0x55	; 85
    4e0e:	74 e0       	ldi	r23, 0x04	; 4
    4e10:	87 e0       	ldi	r24, 0x07	; 7
    4e12:	93 e0       	ldi	r25, 0x03	; 3
    4e14:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    4e18:	6a e4       	ldi	r22, 0x4A	; 74
    4e1a:	74 e0       	ldi	r23, 0x04	; 4
    4e1c:	14 fd       	sbrc	r17, 4
    4e1e:	04 c0       	rjmp	.+8      	; 0x4e28 <main+0x1d4>
    4e20:	11 11       	cpse	r17, r1
    4e22:	06 c0       	rjmp	.+12     	; 0x4e30 <main+0x1dc>
    4e24:	69 e3       	ldi	r22, 0x39	; 57
    4e26:	74 e0       	ldi	r23, 0x04	; 4
    4e28:	87 e0       	ldi	r24, 0x07	; 7
    4e2a:	93 e0       	ldi	r25, 0x03	; 3
    4e2c:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    4e30:	87 e0       	ldi	r24, 0x07	; 7
    4e32:	93 e0       	ldi	r25, 0x03	; 3
    4e34:	0e 94 17 11 	call	0x222e	; 0x222e <_ZN11MemoryUsage10printStarsER5Print>
    4e38:	80 91 85 05 	lds	r24, 0x0585	; 0x800585 <buttonController>
    4e3c:	0e 94 a9 07 	call	0xf52	; 0xf52 <digitalRead>
    4e40:	89 2b       	or	r24, r25
    4e42:	41 f4       	brne	.+16     	; 0x4e54 <main+0x200>
    4e44:	87 e7       	ldi	r24, 0x77	; 119
    4e46:	97 e7       	ldi	r25, 0x77	; 119
    4e48:	90 93 01 08 	sts	0x0801, r25	; 0x800801 <__bss_end+0x1d0>
    4e4c:	80 93 00 08 	sts	0x0800, r24	; 0x800800 <__bss_end+0x1cf>
    4e50:	0e 94 51 0e 	call	0x1ca2	; 0x1ca2 <_ZN18WatchdogController8resetMCUEv.constprop.124>
    4e54:	0e 94 3c 0e 	call	0x1c78	; 0x1c78 <_ZN14SafeInterrupts7disableEv>
    4e58:	80 e0       	ldi	r24, 0x00	; 0
    4e5a:	96 e9       	ldi	r25, 0x96	; 150
    4e5c:	a0 e0       	ldi	r26, 0x00	; 0
    4e5e:	b0 e0       	ldi	r27, 0x00	; 0
    4e60:	80 93 4e 05 	sts	0x054E, r24	; 0x80054e <softwareSerial+0x9c>
    4e64:	90 93 4f 05 	sts	0x054F, r25	; 0x80054f <softwareSerial+0x9d>
    4e68:	a0 93 50 05 	sts	0x0550, r26	; 0x800550 <softwareSerial+0x9e>
    4e6c:	b0 93 51 05 	sts	0x0551, r27	; 0x800551 <softwareSerial+0x9f>
    4e70:	81 e0       	ldi	r24, 0x01	; 1
    4e72:	80 93 52 05 	sts	0x0552, r24	; 0x800552 <softwareSerial+0xa0>
    4e76:	10 92 54 05 	sts	0x0554, r1	; 0x800554 <softwareSerial+0xa2>
    4e7a:	10 92 53 05 	sts	0x0553, r1	; 0x800553 <softwareSerial+0xa1>
    4e7e:	8a e0       	ldi	r24, 0x0A	; 10
    4e80:	80 93 55 05 	sts	0x0555, r24	; 0x800555 <softwareSerial+0xa3>
    4e84:	81 ea       	ldi	r24, 0xA1	; 161
    4e86:	91 e0       	ldi	r25, 0x01	; 1
    4e88:	90 93 57 05 	sts	0x0557, r25	; 0x800557 <softwareSerial+0xa5>
    4e8c:	80 93 56 05 	sts	0x0556, r24	; 0x800556 <softwareSerial+0xa4>
    4e90:	80 91 56 05 	lds	r24, 0x0556	; 0x800556 <softwareSerial+0xa4>
    4e94:	90 91 57 05 	lds	r25, 0x0557	; 0x800557 <softwareSerial+0xa5>
    4e98:	63 e0       	ldi	r22, 0x03	; 3
    4e9a:	70 e0       	ldi	r23, 0x00	; 0
    4e9c:	0e 94 10 35 	call	0x6a20	; 0x6a20 <__udivmodhi4>
    4ea0:	70 93 59 05 	sts	0x0559, r23	; 0x800559 <softwareSerial+0xa7>
    4ea4:	60 93 58 05 	sts	0x0558, r22	; 0x800558 <softwareSerial+0xa6>
    4ea8:	10 92 e9 04 	sts	0x04E9, r1	; 0x8004e9 <softwareSerial+0x37>
    4eac:	10 92 e8 04 	sts	0x04E8, r1	; 0x8004e8 <softwareSerial+0x36>
    4eb0:	10 92 0b 05 	sts	0x050B, r1	; 0x80050b <softwareSerial+0x59>
    4eb4:	10 92 0a 05 	sts	0x050A, r1	; 0x80050a <softwareSerial+0x58>
    4eb8:	10 92 4d 05 	sts	0x054D, r1	; 0x80054d <softwareSerial+0x9b>
    4ebc:	10 92 4c 05 	sts	0x054C, r1	; 0x80054c <softwareSerial+0x9a>
    4ec0:	e0 91 c3 04 	lds	r30, 0x04C3	; 0x8004c3 <softwareSerial+0x11>
    4ec4:	f0 91 c4 04 	lds	r31, 0x04C4	; 0x8004c4 <softwareSerial+0x12>
    4ec8:	80 81       	ld	r24, Z
    4eca:	90 91 c7 04 	lds	r25, 0x04C7	; 0x8004c7 <softwareSerial+0x15>
    4ece:	89 2b       	or	r24, r25
    4ed0:	80 83       	st	Z, r24
    4ed2:	10 92 5e 05 	sts	0x055E, r1	; 0x80055e <softwareSerial+0xac>
    4ed6:	10 92 5d 05 	sts	0x055D, r1	; 0x80055d <softwareSerial+0xab>
    4eda:	80 91 58 05 	lds	r24, 0x0558	; 0x800558 <softwareSerial+0xa6>
    4ede:	90 91 59 05 	lds	r25, 0x0559	; 0x800559 <softwareSerial+0xa7>
    4ee2:	90 93 60 05 	sts	0x0560, r25	; 0x800560 <softwareSerial+0xae>
    4ee6:	80 93 5f 05 	sts	0x055F, r24	; 0x80055f <softwareSerial+0xad>
    4eea:	10 92 6f 05 	sts	0x056F, r1	; 0x80056f <softwareSerial+0xbd>
    4eee:	10 92 6e 05 	sts	0x056E, r1	; 0x80056e <softwareSerial+0xbc>
    4ef2:	8e ef       	ldi	r24, 0xFE	; 254
    4ef4:	80 93 5a 05 	sts	0x055A, r24	; 0x80055a <softwareSerial+0xa8>
    4ef8:	00 91 58 05 	lds	r16, 0x0558	; 0x800558 <softwareSerial+0xa6>
    4efc:	10 91 59 05 	lds	r17, 0x0559	; 0x800559 <softwareSerial+0xa7>
    4f00:	0e 94 3c 0e 	call	0x1c78	; 0x1c78 <_ZN14SafeInterrupts7disableEv>
    4f04:	10 92 80 00 	sts	0x0080, r1	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    4f08:	10 92 81 00 	sts	0x0081, r1	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
    4f0c:	10 92 6f 00 	sts	0x006F, r1	; 0x80006f <__TEXT_REGION_LENGTH__+0x7e006f>
    4f10:	80 91 81 00 	lds	r24, 0x0081	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
    4f14:	88 60       	ori	r24, 0x08	; 8
    4f16:	80 93 81 00 	sts	0x0081, r24	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
    4f1a:	80 91 81 00 	lds	r24, 0x0081	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
    4f1e:	81 60       	ori	r24, 0x01	; 1
    4f20:	80 93 81 00 	sts	0x0081, r24	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
    4f24:	10 93 89 00 	sts	0x0089, r17	; 0x800089 <__TEXT_REGION_LENGTH__+0x7e0089>
    4f28:	00 93 88 00 	sts	0x0088, r16	; 0x800088 <__TEXT_REGION_LENGTH__+0x7e0088>
    4f2c:	80 91 6f 00 	lds	r24, 0x006F	; 0x80006f <__TEXT_REGION_LENGTH__+0x7e006f>
    4f30:	82 60       	ori	r24, 0x02	; 2
    4f32:	80 93 6f 00 	sts	0x006F, r24	; 0x80006f <__TEXT_REGION_LENGTH__+0x7e006f>
    4f36:	0e 94 24 0e 	call	0x1c48	; 0x1c48 <_ZN14SafeInterrupts6enableEv>
    4f3a:	0e 94 24 0e 	call	0x1c48	; 0x1c48 <_ZN14SafeInterrupts6enableEv>
    4f3e:	10 92 1a 02 	sts	0x021A, r1	; 0x80021a <_ZN7TwoWire13rxBufferIndexE>
    4f42:	10 92 19 02 	sts	0x0219, r1	; 0x800219 <_ZN7TwoWire14rxBufferLengthE>
    4f46:	10 92 72 02 	sts	0x0272, r1	; 0x800272 <_ZN7TwoWire13txBufferIndexE>
    4f4a:	10 92 94 02 	sts	0x0294, r1	; 0x800294 <_ZN7TwoWire14txBufferLengthE>
    4f4e:	0e 94 18 0c 	call	0x1830	; 0x1830 <twi_init>
    4f52:	8f ec       	ldi	r24, 0xCF	; 207
    4f54:	98 e0       	ldi	r25, 0x08	; 8
    4f56:	90 93 18 02 	sts	0x0218, r25	; 0x800218 <twi_onSlaveTransmit+0x1>
    4f5a:	80 93 17 02 	sts	0x0217, r24	; 0x800217 <twi_onSlaveTransmit>
    4f5e:	80 ed       	ldi	r24, 0xD0	; 208
    4f60:	98 e0       	ldi	r25, 0x08	; 8
    4f62:	90 93 16 02 	sts	0x0216, r25	; 0x800216 <twi_onSlaveReceive+0x1>
    4f66:	80 93 15 02 	sts	0x0215, r24	; 0x800215 <twi_onSlaveReceive>
    4f6a:	8c e0       	ldi	r24, 0x0C	; 12
    4f6c:	80 93 b8 00 	sts	0x00B8, r24	; 0x8000b8 <__TEXT_REGION_LENGTH__+0x7e00b8>
    4f70:	0f b6       	in	r0, 0x3f	; 63
    4f72:	f8 94       	cli
    4f74:	a8 95       	wdr
    4f76:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    4f7a:	88 61       	ori	r24, 0x18	; 24
    4f7c:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    4f80:	10 92 60 00 	sts	0x0060, r1	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    4f84:	0f be       	out	0x3f, r0	; 63
    4f86:	88 e1       	ldi	r24, 0x18	; 24
    4f88:	9d e0       	ldi	r25, 0x0D	; 13
    4f8a:	0f b6       	in	r0, 0x3f	; 63
    4f8c:	f8 94       	cli
    4f8e:	a8 95       	wdr
    4f90:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    4f94:	0f be       	out	0x3f, r0	; 63
    4f96:	90 93 60 00 	sts	0x0060, r25	; 0x800060 <__TEXT_REGION_LENGTH__+0x7e0060>
    4f9a:	e0 91 2b 06 	lds	r30, 0x062B	; 0x80062b <__brkval>
    4f9e:	f0 91 2c 06 	lds	r31, 0x062C	; 0x80062c <__brkval+0x1>
    4fa2:	30 97       	sbiw	r30, 0x00	; 0
    4fa4:	11 f4       	brne	.+4      	; 0x4faa <main+0x356>
    4fa6:	e1 e3       	ldi	r30, 0x31	; 49
    4fa8:	f6 e0       	ldi	r31, 0x06	; 6
    4faa:	85 ec       	ldi	r24, 0xC5	; 197
    4fac:	3a e0       	ldi	r19, 0x0A	; 10
    4fae:	ef 3f       	cpi	r30, 0xFF	; 255
    4fb0:	f3 07       	cpc	r31, r19
    4fb2:	10 f4       	brcc	.+4      	; 0x4fb8 <main+0x364>
    4fb4:	81 93       	st	Z+, r24
    4fb6:	fa cf       	rjmp	.-12     	; 0x4fac <main+0x358>
    4fb8:	c1 2c       	mov	r12, r1
    4fba:	d1 2c       	mov	r13, r1
    4fbc:	76 01       	movw	r14, r12
    4fbe:	08 ee       	ldi	r16, 0xE8	; 232
    4fc0:	13 e0       	ldi	r17, 0x03	; 3
    4fc2:	20 e0       	ldi	r18, 0x00	; 0
    4fc4:	30 e0       	ldi	r19, 0x00	; 0
    4fc6:	48 ee       	ldi	r20, 0xE8	; 232
    4fc8:	53 e0       	ldi	r21, 0x03	; 3
    4fca:	60 e0       	ldi	r22, 0x00	; 0
    4fcc:	70 e0       	ldi	r23, 0x00	; 0
    4fce:	8b eb       	ldi	r24, 0xBB	; 187
    4fd0:	95 e0       	ldi	r25, 0x05	; 5
    4fd2:	0e 94 8a 13 	call	0x2714	; 0x2714 <_ZN5ezLED5blinkEmmm>
    4fd6:	98 ee       	ldi	r25, 0xE8	; 232
    4fd8:	c9 2e       	mov	r12, r25
    4fda:	93 e0       	ldi	r25, 0x03	; 3
    4fdc:	d9 2e       	mov	r13, r25
    4fde:	e1 2c       	mov	r14, r1
    4fe0:	f1 2c       	mov	r15, r1
    4fe2:	08 ee       	ldi	r16, 0xE8	; 232
    4fe4:	13 e0       	ldi	r17, 0x03	; 3
    4fe6:	20 e0       	ldi	r18, 0x00	; 0
    4fe8:	30 e0       	ldi	r19, 0x00	; 0
    4fea:	48 ee       	ldi	r20, 0xE8	; 232
    4fec:	53 e0       	ldi	r21, 0x03	; 3
    4fee:	60 e0       	ldi	r22, 0x00	; 0
    4ff0:	70 e0       	ldi	r23, 0x00	; 0
    4ff2:	86 e9       	ldi	r24, 0x96	; 150
    4ff4:	95 e0       	ldi	r25, 0x05	; 5
    4ff6:	0e 94 8a 13 	call	0x2714	; 0x2714 <_ZN5ezLED5blinkEmmm>
    4ffa:	0e 94 44 0f 	call	0x1e88	; 0x1e88 <_ZN18KeyboardController13isSeedCheckedEv>
    4ffe:	18 2f       	mov	r17, r24
    5000:	60 e0       	ldi	r22, 0x00	; 0
    5002:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <hc05+0x3>
    5006:	0e 94 00 08 	call	0x1000	; 0x1000 <pinMode>
    500a:	61 e0       	ldi	r22, 0x01	; 1
    500c:	80 91 5a 04 	lds	r24, 0x045A	; 0x80045a <hc05+0x4>
    5010:	0e 94 00 08 	call	0x1000	; 0x1000 <pinMode>
    5014:	61 e0       	ldi	r22, 0x01	; 1
    5016:	80 91 58 04 	lds	r24, 0x0458	; 0x800458 <hc05+0x2>
    501a:	0e 94 00 08 	call	0x1000	; 0x1000 <pinMode>
    501e:	61 e0       	ldi	r22, 0x01	; 1
    5020:	80 91 5a 04 	lds	r24, 0x045A	; 0x80045a <hc05+0x4>
    5024:	0e 94 d2 07 	call	0xfa4	; 0xfa4 <digitalWrite>
    5028:	61 e0       	ldi	r22, 0x01	; 1
    502a:	80 91 58 04 	lds	r24, 0x0458	; 0x800458 <hc05+0x2>
    502e:	0e 94 d2 07 	call	0xfa4	; 0xfa4 <digitalWrite>
    5032:	86 e0       	ldi	r24, 0x06	; 6
    5034:	0e 94 9f 08 	call	0x113e	; 0x113e <_ZN4HC058setStateENS_5StateE.constprop.73>
    5038:	89 ec       	ldi	r24, 0xC9	; 201
    503a:	98 e0       	ldi	r25, 0x08	; 8
    503c:	90 93 ad 04 	sts	0x04AD, r25	; 0x8004ad <hc05+0x57>
    5040:	80 93 ac 04 	sts	0x04AC, r24	; 0x8004ac <hc05+0x56>
    5044:	11 11       	cpse	r17, r1
    5046:	38 c1       	rjmp	.+624    	; 0x52b8 <main+0x664>
    5048:	81 e0       	ldi	r24, 0x01	; 1
    504a:	0e 94 b8 08 	call	0x1170	; 0x1170 <_ZN4HC055resetEb.constprop.72>
    504e:	0e 94 af 10 	call	0x215e	; 0x215e <_ZN18KeyboardController6unlockEv.constprop.135>
    5052:	84 e0       	ldi	r24, 0x04	; 4
    5054:	0e 94 c4 13 	call	0x2788	; 0x2788 <_ZN13LEDController8setStateENS_5StateE.constprop.87>
    5058:	88 e3       	ldi	r24, 0x38	; 56
    505a:	95 e0       	ldi	r25, 0x05	; 5
    505c:	90 93 f4 03 	sts	0x03F4, r25	; 0x8003f4 <watchdogControllerStatistic+0x1>
    5060:	80 93 f3 03 	sts	0x03F3, r24	; 0x8003f3 <watchdogControllerStatistic>
    5064:	8e e2       	ldi	r24, 0x2E	; 46
    5066:	95 e0       	ldi	r25, 0x05	; 5
    5068:	90 93 ea 03 	sts	0x03EA, r25	; 0x8003ea <statisticControllerStatistic+0x1>
    506c:	80 93 e9 03 	sts	0x03E9, r24	; 0x8003e9 <statisticControllerStatistic>
    5070:	8a e2       	ldi	r24, 0x2A	; 42
    5072:	95 e0       	ldi	r25, 0x05	; 5
    5074:	90 93 e0 03 	sts	0x03E0, r25	; 0x8003e0 <ledControllerStatistic+0x1>
    5078:	80 93 df 03 	sts	0x03DF, r24	; 0x8003df <ledControllerStatistic>
    507c:	84 e2       	ldi	r24, 0x24	; 36
    507e:	95 e0       	ldi	r25, 0x05	; 5
    5080:	90 93 d6 03 	sts	0x03D6, r25	; 0x8003d6 <rxTxLedStatistic+0x1>
    5084:	80 93 d5 03 	sts	0x03D5, r24	; 0x8003d5 <rxTxLedStatistic>
    5088:	8d e1       	ldi	r24, 0x1D	; 29
    508a:	95 e0       	ldi	r25, 0x05	; 5
    508c:	90 93 cc 03 	sts	0x03CC, r25	; 0x8003cc <buttonControllerStatistic+0x1>
    5090:	80 93 cb 03 	sts	0x03CB, r24	; 0x8003cb <buttonControllerStatistic>
    5094:	84 e1       	ldi	r24, 0x14	; 20
    5096:	95 e0       	ldi	r25, 0x05	; 5
    5098:	90 93 c2 03 	sts	0x03C2, r25	; 0x8003c2 <keyboardControllerStatistic+0x1>
    509c:	80 93 c1 03 	sts	0x03C1, r24	; 0x8003c1 <keyboardControllerStatistic>
    50a0:	88 e0       	ldi	r24, 0x08	; 8
    50a2:	95 e0       	ldi	r25, 0x05	; 5
    50a4:	90 93 b8 03 	sts	0x03B8, r25	; 0x8003b8 <serialCommandsStatistic+0x1>
    50a8:	80 93 b7 03 	sts	0x03B7, r24	; 0x8003b7 <serialCommandsStatistic>
    50ac:	82 e0       	ldi	r24, 0x02	; 2
    50ae:	95 e0       	ldi	r25, 0x05	; 5
    50b0:	90 93 ae 03 	sts	0x03AE, r25	; 0x8003ae <hc05Statistic+0x1>
    50b4:	80 93 ad 03 	sts	0x03AD, r24	; 0x8003ad <hc05Statistic>
    50b8:	8b ef       	ldi	r24, 0xFB	; 251
    50ba:	94 e0       	ldi	r25, 0x04	; 4
    50bc:	90 93 9a 03 	sts	0x039A, r25	; 0x80039a <eepromControllerStatistic+0x1>
    50c0:	80 93 99 03 	sts	0x0399, r24	; 0x800399 <eepromControllerStatistic>
    50c4:	83 ef       	ldi	r24, 0xF3	; 243
    50c6:	94 e0       	ldi	r25, 0x04	; 4
    50c8:	90 93 a4 03 	sts	0x03A4, r25	; 0x8003a4 <bluetoothCommandsStatistic+0x1>
    50cc:	80 93 a3 03 	sts	0x03A3, r24	; 0x8003a3 <bluetoothCommandsStatistic>
    50d0:	84 ee       	ldi	r24, 0xE4	; 228
    50d2:	94 e0       	ldi	r25, 0x04	; 4
    50d4:	90 93 90 03 	sts	0x0390, r25	; 0x800390 <businessLogicStatistic+0x1>
    50d8:	80 93 8f 03 	sts	0x038F, r24	; 0x80038f <businessLogicStatistic>
    50dc:	8f ed       	ldi	r24, 0xDF	; 223
    50de:	94 e0       	ldi	r25, 0x04	; 4
    50e0:	90 93 86 03 	sts	0x0386, r25	; 0x800386 <loopStatistic+0x1>
    50e4:	80 93 85 03 	sts	0x0385, r24	; 0x800385 <loopStatistic>
    50e8:	67 ec       	ldi	r22, 0xC7	; 199
    50ea:	74 e0       	ldi	r23, 0x04	; 4
    50ec:	87 e0       	ldi	r24, 0x07	; 7
    50ee:	93 e0       	ldi	r25, 0x03	; 3
    50f0:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    50f4:	61 e4       	ldi	r22, 0x41	; 65
    50f6:	75 e0       	ldi	r23, 0x05	; 5
    50f8:	11 23       	and	r17, r17
    50fa:	11 f0       	breq	.+4      	; 0x5100 <main+0x4ac>
    50fc:	6f e7       	ldi	r22, 0x7F	; 127
    50fe:	71 e0       	ldi	r23, 0x01	; 1
    5100:	87 e0       	ldi	r24, 0x07	; 7
    5102:	93 e0       	ldi	r25, 0x03	; 3
    5104:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    5108:	8e 01       	movw	r16, r28
    510a:	0f 5f       	subi	r16, 0xFF	; 255
    510c:	1f 4f       	sbci	r17, 0xFF	; 255
    510e:	ce 01       	movw	r24, r28
    5110:	8b 96       	adiw	r24, 0x2b	; 43
    5112:	2a 96       	adiw	r28, 0x0a	; 10
    5114:	9f af       	std	Y+63, r25	; 0x3f
    5116:	8e af       	std	Y+62, r24	; 0x3e
    5118:	2a 97       	sbiw	r28, 0x0a	; 10
    511a:	80 ec       	ldi	r24, 0xC0	; 192
    511c:	48 2e       	mov	r4, r24
    511e:	84 ed       	ldi	r24, 0xD4	; 212
    5120:	58 2e       	mov	r5, r24
    5122:	66 24       	eor	r6, r6
    5124:	63 94       	inc	r6
    5126:	71 2c       	mov	r7, r1
    5128:	b7 e6       	ldi	r27, 0x67	; 103
    512a:	eb 2e       	mov	r14, r27
    512c:	b4 e1       	ldi	r27, 0x14	; 20
    512e:	fb 2e       	mov	r15, r27
    5130:	85 e8       	ldi	r24, 0x85	; 133
    5132:	93 e0       	ldi	r25, 0x03	; 3
    5134:	0e 94 c3 0a 	call	0x1586	; 0x1586 <_ZN9Statistic5startEv>
    5138:	83 ef       	ldi	r24, 0xF3	; 243
    513a:	93 e0       	ldi	r25, 0x03	; 3
    513c:	0e 94 c3 0a 	call	0x1586	; 0x1586 <_ZN9Statistic5startEv>
    5140:	a8 95       	wdr
    5142:	83 ef       	ldi	r24, 0xF3	; 243
    5144:	93 e0       	ldi	r25, 0x03	; 3
    5146:	0e 94 96 0a 	call	0x152c	; 0x152c <_ZN9Statistic3endEv>
    514a:	89 ee       	ldi	r24, 0xE9	; 233
    514c:	93 e0       	ldi	r25, 0x03	; 3
    514e:	0e 94 c3 0a 	call	0x1586	; 0x1586 <_ZN9Statistic5startEv>
    5152:	80 91 0c 01 	lds	r24, 0x010C	; 0x80010c <_ZZN19StatisticController4loopER5PrintPPK9StatistichE8firstRun>
    5156:	88 23       	and	r24, r24
    5158:	51 f0       	breq	.+20     	; 0x516e <main+0x51a>
    515a:	10 92 0c 01 	sts	0x010C, r1	; 0x80010c <_ZZN19StatisticController4loopER5PrintPPK9StatistichE8firstRun>
    515e:	87 e0       	ldi	r24, 0x07	; 7
    5160:	93 e0       	ldi	r25, 0x03	; 3
    5162:	0e 94 8f 15 	call	0x2b1e	; 0x2b1e <_ZN11MemoryUsage10ramDisplayER5Print>
    5166:	87 e0       	ldi	r24, 0x07	; 7
    5168:	93 e0       	ldi	r25, 0x03	; 3
    516a:	0e 94 1c 11 	call	0x2238	; 0x2238 <_ZNK19StatisticController19printInterruptTableER5Print.constprop.132>
    516e:	89 ee       	ldi	r24, 0xE9	; 233
    5170:	93 e0       	ldi	r25, 0x03	; 3
    5172:	0e 94 96 0a 	call	0x152c	; 0x152c <_ZN9Statistic3endEv>
    5176:	8f ed       	ldi	r24, 0xDF	; 223
    5178:	93 e0       	ldi	r25, 0x03	; 3
    517a:	0e 94 c3 0a 	call	0x1586	; 0x1586 <_ZN9Statistic5startEv>
    517e:	80 ee       	ldi	r24, 0xE0	; 224
    5180:	95 e0       	ldi	r25, 0x05	; 5
    5182:	0e 94 be 11 	call	0x237c	; 0x237c <_ZN5ezLED4loopEv>
    5186:	85 e0       	ldi	r24, 0x05	; 5
    5188:	96 e0       	ldi	r25, 0x06	; 6
    518a:	0e 94 be 11 	call	0x237c	; 0x237c <_ZN5ezLED4loopEv>
    518e:	8f ed       	ldi	r24, 0xDF	; 223
    5190:	93 e0       	ldi	r25, 0x03	; 3
    5192:	0e 94 96 0a 	call	0x152c	; 0x152c <_ZN9Statistic3endEv>
    5196:	85 ed       	ldi	r24, 0xD5	; 213
    5198:	93 e0       	ldi	r25, 0x03	; 3
    519a:	0e 94 c3 0a 	call	0x1586	; 0x1586 <_ZN9Statistic5startEv>
    519e:	8b eb       	ldi	r24, 0xBB	; 187
    51a0:	95 e0       	ldi	r25, 0x05	; 5
    51a2:	0e 94 be 11 	call	0x237c	; 0x237c <_ZN5ezLED4loopEv>
    51a6:	86 e9       	ldi	r24, 0x96	; 150
    51a8:	95 e0       	ldi	r25, 0x05	; 5
    51aa:	0e 94 be 11 	call	0x237c	; 0x237c <_ZN5ezLED4loopEv>
    51ae:	85 ed       	ldi	r24, 0xD5	; 213
    51b0:	93 e0       	ldi	r25, 0x03	; 3
    51b2:	0e 94 96 0a 	call	0x152c	; 0x152c <_ZN9Statistic3endEv>
    51b6:	8b ec       	ldi	r24, 0xCB	; 203
    51b8:	93 e0       	ldi	r25, 0x03	; 3
    51ba:	0e 94 c3 0a 	call	0x1586	; 0x1586 <_ZN9Statistic5startEv>
    51be:	80 91 85 05 	lds	r24, 0x0585	; 0x800585 <buttonController>
    51c2:	0e 94 a9 07 	call	0xf52	; 0xf52 <digitalRead>
    51c6:	d8 2e       	mov	r13, r24
    51c8:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    51cc:	20 91 86 05 	lds	r18, 0x0586	; 0x800586 <buttonController+0x1>
    51d0:	26 fb       	bst	r18, 6
    51d2:	33 27       	eor	r19, r19
    51d4:	30 f9       	bld	r19, 0
    51d6:	3d 15       	cp	r19, r13
    51d8:	61 f0       	breq	.+24     	; 0x51f2 <main+0x59e>
    51da:	60 93 8f 05 	sts	0x058F, r22	; 0x80058f <buttonController+0xa>
    51de:	70 93 90 05 	sts	0x0590, r23	; 0x800590 <buttonController+0xb>
    51e2:	80 93 91 05 	sts	0x0591, r24	; 0x800591 <buttonController+0xc>
    51e6:	90 93 92 05 	sts	0x0592, r25	; 0x800592 <buttonController+0xd>
    51ea:	d0 fa       	bst	r13, 0
    51ec:	26 f9       	bld	r18, 6
    51ee:	20 93 86 05 	sts	0x0586, r18	; 0x800586 <buttonController+0x1>
    51f2:	20 91 8f 05 	lds	r18, 0x058F	; 0x80058f <buttonController+0xa>
    51f6:	30 91 90 05 	lds	r19, 0x0590	; 0x800590 <buttonController+0xb>
    51fa:	40 91 91 05 	lds	r20, 0x0591	; 0x800591 <buttonController+0xc>
    51fe:	50 91 92 05 	lds	r21, 0x0592	; 0x800592 <buttonController+0xd>
    5202:	4b 01       	movw	r8, r22
    5204:	5c 01       	movw	r10, r24
    5206:	82 1a       	sub	r8, r18
    5208:	93 0a       	sbc	r9, r19
    520a:	a4 0a       	sbc	r10, r20
    520c:	b5 0a       	sbc	r11, r21
    520e:	b5 01       	movw	r22, r10
    5210:	a4 01       	movw	r20, r8
    5212:	80 91 87 05 	lds	r24, 0x0587	; 0x800587 <buttonController+0x2>
    5216:	90 91 88 05 	lds	r25, 0x0588	; 0x800588 <buttonController+0x3>
    521a:	a0 91 89 05 	lds	r26, 0x0589	; 0x800589 <buttonController+0x4>
    521e:	b0 91 8a 05 	lds	r27, 0x058A	; 0x80058a <buttonController+0x5>
    5222:	48 17       	cp	r20, r24
    5224:	59 07       	cpc	r21, r25
    5226:	6a 07       	cpc	r22, r26
    5228:	7b 07       	cpc	r23, r27
    522a:	58 f1       	brcs	.+86     	; 0x5282 <main+0x62e>
    522c:	90 91 86 05 	lds	r25, 0x0586	; 0x800586 <buttonController+0x1>
    5230:	95 fb       	bst	r25, 5
    5232:	22 27       	eor	r18, r18
    5234:	20 f9       	bld	r18, 0
    5236:	20 fb       	bst	r18, 0
    5238:	94 f9       	bld	r25, 4
    523a:	8d 2d       	mov	r24, r13
    523c:	81 70       	andi	r24, 0x01	; 1
    523e:	80 fb       	bst	r24, 0
    5240:	95 f9       	bld	r25, 5
    5242:	90 93 86 05 	sts	0x0586, r25	; 0x800586 <buttonController+0x1>
    5246:	28 17       	cp	r18, r24
    5248:	e1 f0       	breq	.+56     	; 0x5282 <main+0x62e>
    524a:	89 2f       	mov	r24, r25
    524c:	83 70       	andi	r24, 0x03	; 3
    524e:	82 30       	cpi	r24, 0x02	; 2
    5250:	29 f0       	breq	.+10     	; 0x525c <main+0x608>
    5252:	93 71       	andi	r25, 0x13	; 19
    5254:	90 31       	cpi	r25, 0x10	; 16
    5256:	11 f0       	breq	.+4      	; 0x525c <main+0x608>
    5258:	91 30       	cpi	r25, 0x01	; 1
    525a:	99 f4       	brne	.+38     	; 0x5282 <main+0x62e>
    525c:	80 91 8b 05 	lds	r24, 0x058B	; 0x80058b <buttonController+0x6>
    5260:	90 91 8c 05 	lds	r25, 0x058C	; 0x80058c <buttonController+0x7>
    5264:	a0 91 8d 05 	lds	r26, 0x058D	; 0x80058d <buttonController+0x8>
    5268:	b0 91 8e 05 	lds	r27, 0x058E	; 0x80058e <buttonController+0x9>
    526c:	01 96       	adiw	r24, 0x01	; 1
    526e:	a1 1d       	adc	r26, r1
    5270:	b1 1d       	adc	r27, r1
    5272:	80 93 8b 05 	sts	0x058B, r24	; 0x80058b <buttonController+0x6>
    5276:	90 93 8c 05 	sts	0x058C, r25	; 0x80058c <buttonController+0x7>
    527a:	a0 93 8d 05 	sts	0x058D, r26	; 0x80058d <buttonController+0x8>
    527e:	b0 93 8e 05 	sts	0x058E, r27	; 0x80058e <buttonController+0x9>
    5282:	80 91 86 05 	lds	r24, 0x0586	; 0x800586 <buttonController+0x1>
    5286:	84 fb       	bst	r24, 4
    5288:	22 27       	eor	r18, r18
    528a:	20 f9       	bld	r18, 0
    528c:	83 fb       	bst	r24, 3
    528e:	99 27       	eor	r25, r25
    5290:	90 f9       	bld	r25, 0
    5292:	29 13       	cpse	r18, r25
    5294:	4a c0       	rjmp	.+148    	; 0x532a <main+0x6d6>
    5296:	85 fb       	bst	r24, 5
    5298:	99 27       	eor	r25, r25
    529a:	90 f9       	bld	r25, 0
    529c:	82 fb       	bst	r24, 2
    529e:	22 27       	eor	r18, r18
    52a0:	20 f9       	bld	r18, 0
    52a2:	92 13       	cpse	r25, r18
    52a4:	42 c0       	rjmp	.+132    	; 0x532a <main+0x6d6>
    52a6:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    52aa:	70 93 94 05 	sts	0x0594, r23	; 0x800594 <buttonController+0xf>
    52ae:	60 93 93 05 	sts	0x0593, r22	; 0x800593 <buttonController+0xe>
    52b2:	10 92 95 05 	sts	0x0595, r1	; 0x800595 <buttonController+0x10>
    52b6:	55 c0       	rjmp	.+170    	; 0x5362 <main+0x70e>
    52b8:	87 e6       	ldi	r24, 0x67	; 103
    52ba:	94 e1       	ldi	r25, 0x14	; 20
    52bc:	9c 83       	std	Y+4, r25	; 0x04
    52be:	8b 83       	std	Y+3, r24	; 0x03
    52c0:	2c e2       	ldi	r18, 0x2C	; 44
    52c2:	31 e0       	ldi	r19, 0x01	; 1
    52c4:	3e 83       	std	Y+6, r19	; 0x06
    52c6:	2d 83       	std	Y+5, r18	; 0x05
    52c8:	9a 87       	std	Y+10, r25	; 0x0a
    52ca:	89 87       	std	Y+9, r24	; 0x09
    52cc:	3c 87       	std	Y+12, r19	; 0x0c
    52ce:	2b 87       	std	Y+11, r18	; 0x0b
    52d0:	98 8b       	std	Y+16, r25	; 0x10
    52d2:	8f 87       	std	Y+15, r24	; 0x0f
    52d4:	20 ed       	ldi	r18, 0xD0	; 208
    52d6:	37 e0       	ldi	r19, 0x07	; 7
    52d8:	3a 8b       	std	Y+18, r19	; 0x12
    52da:	29 8b       	std	Y+17, r18	; 0x11
    52dc:	9e 8b       	std	Y+22, r25	; 0x16
    52de:	8d 8b       	std	Y+21, r24	; 0x15
    52e0:	8c ed       	ldi	r24, 0xDC	; 220
    52e2:	95 e0       	ldi	r25, 0x05	; 5
    52e4:	98 8f       	std	Y+24, r25	; 0x18
    52e6:	8f 8b       	std	Y+23, r24	; 0x17
    52e8:	8d eb       	ldi	r24, 0xBD	; 189
    52ea:	94 e0       	ldi	r25, 0x04	; 4
    52ec:	9a 83       	std	Y+2, r25	; 0x02
    52ee:	89 83       	std	Y+1, r24	; 0x01
    52f0:	82 eb       	ldi	r24, 0xB2	; 178
    52f2:	94 e0       	ldi	r25, 0x04	; 4
    52f4:	98 87       	std	Y+8, r25	; 0x08
    52f6:	8f 83       	std	Y+7, r24	; 0x07
    52f8:	8a ea       	ldi	r24, 0xAA	; 170
    52fa:	94 e0       	ldi	r25, 0x04	; 4
    52fc:	9e 87       	std	Y+14, r25	; 0x0e
    52fe:	8d 87       	std	Y+13, r24	; 0x0d
    5300:	81 ea       	ldi	r24, 0xA1	; 161
    5302:	94 e0       	ldi	r25, 0x04	; 4
    5304:	9c 8b       	std	Y+20, r25	; 0x14
    5306:	8b 8b       	std	Y+19, r24	; 0x13
    5308:	ce 01       	movw	r24, r28
    530a:	01 96       	adiw	r24, 0x01	; 1
    530c:	0e 94 c8 10 	call	0x2190	; 0x2190 <_ZN4HC0511sendCommandERKNS_7CommandE.constprop.77>
    5310:	ce 01       	movw	r24, r28
    5312:	07 96       	adiw	r24, 0x07	; 7
    5314:	0e 94 c8 10 	call	0x2190	; 0x2190 <_ZN4HC0511sendCommandERKNS_7CommandE.constprop.77>
    5318:	ce 01       	movw	r24, r28
    531a:	0d 96       	adiw	r24, 0x0d	; 13
    531c:	0e 94 c8 10 	call	0x2190	; 0x2190 <_ZN4HC0511sendCommandERKNS_7CommandE.constprop.77>
    5320:	ce 01       	movw	r24, r28
    5322:	43 96       	adiw	r24, 0x13	; 19
    5324:	0e 94 c8 10 	call	0x2190	; 0x2190 <_ZN4HC0511sendCommandERKNS_7CommandE.constprop.77>
    5328:	97 ce       	rjmp	.-722    	; 0x5058 <main+0x404>
    532a:	98 2f       	mov	r25, r24
    532c:	92 95       	swap	r25
    532e:	93 70       	andi	r25, 0x03	; 3
    5330:	86 95       	lsr	r24
    5332:	86 95       	lsr	r24
    5334:	83 70       	andi	r24, 0x03	; 3
    5336:	98 13       	cpse	r25, r24
    5338:	bc cf       	rjmp	.-136    	; 0x52b2 <main+0x65e>
    533a:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    533e:	20 91 93 05 	lds	r18, 0x0593	; 0x800593 <buttonController+0xe>
    5342:	30 91 94 05 	lds	r19, 0x0594	; 0x800594 <buttonController+0xf>
    5346:	62 1b       	sub	r22, r18
    5348:	73 0b       	sbc	r23, r19
    534a:	83 e0       	ldi	r24, 0x03	; 3
    534c:	60 31       	cpi	r22, 0x10	; 16
    534e:	27 e2       	ldi	r18, 0x27	; 39
    5350:	72 07       	cpc	r23, r18
    5352:	28 f4       	brcc	.+10     	; 0x535e <main+0x70a>
    5354:	81 e0       	ldi	r24, 0x01	; 1
    5356:	68 3b       	cpi	r22, 0xB8	; 184
    5358:	7b 40       	sbci	r23, 0x0B	; 11
    535a:	08 f0       	brcs	.+2      	; 0x535e <main+0x70a>
    535c:	82 e0       	ldi	r24, 0x02	; 2
    535e:	80 93 95 05 	sts	0x0595, r24	; 0x800595 <buttonController+0x10>
    5362:	8b ec       	ldi	r24, 0xCB	; 203
    5364:	93 e0       	ldi	r25, 0x03	; 3
    5366:	0e 94 96 0a 	call	0x152c	; 0x152c <_ZN9Statistic3endEv>
    536a:	81 ec       	ldi	r24, 0xC1	; 193
    536c:	93 e0       	ldi	r25, 0x03	; 3
    536e:	0e 94 c3 0a 	call	0x1586	; 0x1586 <_ZN9Statistic5startEv>
    5372:	80 91 7e 05 	lds	r24, 0x057E	; 0x80057e <keyboardController+0xe>
    5376:	90 91 7f 05 	lds	r25, 0x057F	; 0x80057f <keyboardController+0xf>
    537a:	89 2b       	or	r24, r25
    537c:	09 f0       	breq	.+2      	; 0x5380 <main+0x72c>
    537e:	5c c0       	rjmp	.+184    	; 0x5438 <main+0x7e4>
    5380:	80 91 71 05 	lds	r24, 0x0571	; 0x800571 <keyboardController+0x1>
    5384:	89 7f       	andi	r24, 0xF9	; 249
    5386:	80 93 71 05 	sts	0x0571, r24	; 0x800571 <keyboardController+0x1>
    538a:	81 ec       	ldi	r24, 0xC1	; 193
    538c:	93 e0       	ldi	r25, 0x03	; 3
    538e:	0e 94 96 0a 	call	0x152c	; 0x152c <_ZN9Statistic3endEv>
    5392:	87 eb       	ldi	r24, 0xB7	; 183
    5394:	93 e0       	ldi	r25, 0x03	; 3
    5396:	0e 94 c3 0a 	call	0x1586	; 0x1586 <_ZN9Statistic5startEv>
    539a:	87 e5       	ldi	r24, 0x57	; 87
    539c:	93 e0       	ldi	r25, 0x03	; 3
    539e:	0e 94 29 18 	call	0x3052	; 0x3052 <_ZN14SerialCommands10readSerialEv>
    53a2:	87 eb       	ldi	r24, 0xB7	; 183
    53a4:	93 e0       	ldi	r25, 0x03	; 3
    53a6:	0e 94 96 0a 	call	0x152c	; 0x152c <_ZN9Statistic3endEv>
    53aa:	8d ea       	ldi	r24, 0xAD	; 173
    53ac:	93 e0       	ldi	r25, 0x03	; 3
    53ae:	0e 94 c3 0a 	call	0x1586	; 0x1586 <_ZN9Statistic5startEv>
    53b2:	0e 94 3c 0e 	call	0x1c78	; 0x1c78 <_ZN14SafeInterrupts7disableEv>
    53b6:	90 91 4c 05 	lds	r25, 0x054C	; 0x80054c <softwareSerial+0x9a>
    53ba:	80 91 4d 05 	lds	r24, 0x054D	; 0x80054d <softwareSerial+0x9b>
    53be:	98 17       	cp	r25, r24
    53c0:	09 f4       	brne	.+2      	; 0x53c4 <main+0x770>
    53c2:	ad c0       	rjmp	.+346    	; 0x551e <main+0x8ca>
    53c4:	90 91 4c 05 	lds	r25, 0x054C	; 0x80054c <softwareSerial+0x9a>
    53c8:	80 91 4d 05 	lds	r24, 0x054D	; 0x80054d <softwareSerial+0x9b>
    53cc:	98 17       	cp	r25, r24
    53ce:	99 f3       	breq	.-26     	; 0x53b6 <main+0x762>
    53d0:	e0 91 4d 05 	lds	r30, 0x054D	; 0x80054d <softwareSerial+0x9b>
    53d4:	f0 e0       	ldi	r31, 0x00	; 0
    53d6:	ee 0f       	add	r30, r30
    53d8:	ff 1f       	adc	r31, r31
    53da:	e4 5f       	subi	r30, 0xF4	; 244
    53dc:	fa 4f       	sbci	r31, 0xFA	; 250
    53de:	80 81       	ld	r24, Z
    53e0:	91 81       	ldd	r25, Z+1	; 0x01
    53e2:	20 91 4d 05 	lds	r18, 0x054D	; 0x80054d <softwareSerial+0x9b>
    53e6:	2f 5f       	subi	r18, 0xFF	; 255
    53e8:	2f 71       	andi	r18, 0x1F	; 31
    53ea:	20 93 4d 05 	sts	0x054D, r18	; 0x80054d <softwareSerial+0x9b>
    53ee:	60 91 53 05 	lds	r22, 0x0553	; 0x800553 <softwareSerial+0xa1>
    53f2:	70 91 54 05 	lds	r23, 0x0554	; 0x800554 <softwareSerial+0xa2>
    53f6:	49 e0       	ldi	r20, 0x09	; 9
    53f8:	a0 e0       	ldi	r26, 0x00	; 0
    53fa:	61 15       	cp	r22, r1
    53fc:	71 05       	cpc	r23, r1
    53fe:	11 f0       	breq	.+4      	; 0x5404 <main+0x7b0>
    5400:	4a e0       	ldi	r20, 0x0A	; 10
    5402:	a9 e0       	ldi	r26, 0x09	; 9
    5404:	80 fd       	sbrc	r24, 0
    5406:	84 c0       	rjmp	.+264    	; 0x5510 <main+0x8bc>
    5408:	b0 91 52 05 	lds	r27, 0x0552	; 0x800552 <softwareSerial+0xa0>
    540c:	30 e0       	ldi	r19, 0x00	; 0
    540e:	20 e0       	ldi	r18, 0x00	; 0
    5410:	50 e0       	ldi	r21, 0x00	; 0
    5412:	2b 17       	cp	r18, r27
    5414:	08 f0       	brcs	.+2      	; 0x5418 <main+0x7c4>
    5416:	93 c5       	rjmp	.+2854   	; 0x5f3e <main+0x12ea>
    5418:	fa 01       	movw	r30, r20
    541a:	e2 0f       	add	r30, r18
    541c:	f3 1f       	adc	r31, r19
    541e:	4c 01       	movw	r8, r24
    5420:	02 c0       	rjmp	.+4      	; 0x5426 <main+0x7d2>
    5422:	96 94       	lsr	r9
    5424:	87 94       	ror	r8
    5426:	ea 95       	dec	r30
    5428:	e2 f7       	brpl	.-8      	; 0x5422 <main+0x7ce>
    542a:	2f 5f       	subi	r18, 0xFF	; 255
    542c:	3f 4f       	sbci	r19, 0xFF	; 255
    542e:	80 fc       	sbrc	r8, 0
    5430:	f0 cf       	rjmp	.-32     	; 0x5412 <main+0x7be>
    5432:	64 e6       	ldi	r22, 0x64	; 100
    5434:	75 e0       	ldi	r23, 0x05	; 5
    5436:	6e c0       	rjmp	.+220    	; 0x5514 <main+0x8c0>
    5438:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    543c:	5b 01       	movw	r10, r22
    543e:	6c 01       	movw	r12, r24
    5440:	80 91 80 05 	lds	r24, 0x0580	; 0x800580 <keyboardController+0x10>
    5444:	90 91 81 05 	lds	r25, 0x0581	; 0x800581 <keyboardController+0x11>
    5448:	a0 91 82 05 	lds	r26, 0x0582	; 0x800582 <keyboardController+0x12>
    544c:	b0 91 83 05 	lds	r27, 0x0583	; 0x800583 <keyboardController+0x13>
    5450:	b6 01       	movw	r22, r12
    5452:	a5 01       	movw	r20, r10
    5454:	48 1b       	sub	r20, r24
    5456:	59 0b       	sbc	r21, r25
    5458:	6a 0b       	sbc	r22, r26
    545a:	7b 0b       	sbc	r23, r27
    545c:	20 91 71 05 	lds	r18, 0x0571	; 0x800571 <keyboardController+0x1>
    5460:	92 2f       	mov	r25, r18
    5462:	96 95       	lsr	r25
    5464:	93 70       	andi	r25, 0x03	; 3
    5466:	91 30       	cpi	r25, 0x01	; 1
    5468:	a1 f0       	breq	.+40     	; 0x5492 <main+0x83e>
    546a:	92 30       	cpi	r25, 0x02	; 2
    546c:	09 f0       	breq	.+2      	; 0x5470 <main+0x81c>
    546e:	8d cf       	rjmp	.-230    	; 0x538a <main+0x736>
    5470:	20 ff       	sbrs	r18, 0
    5472:	45 c0       	rjmp	.+138    	; 0x54fe <main+0x8aa>
    5474:	80 91 72 05 	lds	r24, 0x0572	; 0x800572 <keyboardController+0x2>
    5478:	90 91 73 05 	lds	r25, 0x0573	; 0x800573 <keyboardController+0x3>
    547c:	a0 91 74 05 	lds	r26, 0x0574	; 0x800574 <keyboardController+0x4>
    5480:	b0 91 75 05 	lds	r27, 0x0575	; 0x800575 <keyboardController+0x5>
    5484:	48 17       	cp	r20, r24
    5486:	59 07       	cpc	r21, r25
    5488:	6a 07       	cpc	r22, r26
    548a:	7b 07       	cpc	r23, r27
    548c:	08 f4       	brcc	.+2      	; 0x5490 <main+0x83c>
    548e:	7d cf       	rjmp	.-262    	; 0x538a <main+0x736>
    5490:	13 c0       	rjmp	.+38     	; 0x54b8 <main+0x864>
    5492:	80 91 7a 05 	lds	r24, 0x057A	; 0x80057a <keyboardController+0xa>
    5496:	90 91 7b 05 	lds	r25, 0x057B	; 0x80057b <keyboardController+0xb>
    549a:	a0 91 7c 05 	lds	r26, 0x057C	; 0x80057c <keyboardController+0xc>
    549e:	b0 91 7d 05 	lds	r27, 0x057D	; 0x80057d <keyboardController+0xd>
    54a2:	48 17       	cp	r20, r24
    54a4:	59 07       	cpc	r21, r25
    54a6:	6a 07       	cpc	r22, r26
    54a8:	7b 07       	cpc	r23, r27
    54aa:	08 f4       	brcc	.+2      	; 0x54ae <main+0x85a>
    54ac:	6e cf       	rjmp	.-292    	; 0x538a <main+0x736>
    54ae:	82 2f       	mov	r24, r18
    54b0:	89 7f       	andi	r24, 0xF9	; 249
    54b2:	84 60       	ori	r24, 0x04	; 4
    54b4:	80 93 71 05 	sts	0x0571, r24	; 0x800571 <keyboardController+0x1>
    54b8:	80 91 71 05 	lds	r24, 0x0571	; 0x800571 <keyboardController+0x1>
    54bc:	68 2f       	mov	r22, r24
    54be:	60 95       	com	r22
    54c0:	60 fb       	bst	r22, 0
    54c2:	80 f9       	bld	r24, 0
    54c4:	80 93 71 05 	sts	0x0571, r24	; 0x800571 <keyboardController+0x1>
    54c8:	61 70       	andi	r22, 0x01	; 1
    54ca:	80 91 70 05 	lds	r24, 0x0570	; 0x800570 <keyboardController>
    54ce:	0e 94 d2 07 	call	0xfa4	; 0xfa4 <digitalWrite>
    54d2:	a0 92 80 05 	sts	0x0580, r10	; 0x800580 <keyboardController+0x10>
    54d6:	b0 92 81 05 	sts	0x0581, r11	; 0x800581 <keyboardController+0x11>
    54da:	c0 92 82 05 	sts	0x0582, r12	; 0x800582 <keyboardController+0x12>
    54de:	d0 92 83 05 	sts	0x0583, r13	; 0x800583 <keyboardController+0x13>
    54e2:	80 91 7e 05 	lds	r24, 0x057E	; 0x80057e <keyboardController+0xe>
    54e6:	90 91 7f 05 	lds	r25, 0x057F	; 0x80057f <keyboardController+0xf>
    54ea:	18 16       	cp	r1, r24
    54ec:	19 06       	cpc	r1, r25
    54ee:	0c f0       	brlt	.+2      	; 0x54f2 <main+0x89e>
    54f0:	4c cf       	rjmp	.-360    	; 0x538a <main+0x736>
    54f2:	01 97       	sbiw	r24, 0x01	; 1
    54f4:	90 93 7f 05 	sts	0x057F, r25	; 0x80057f <keyboardController+0xf>
    54f8:	80 93 7e 05 	sts	0x057E, r24	; 0x80057e <keyboardController+0xe>
    54fc:	46 cf       	rjmp	.-372    	; 0x538a <main+0x736>
    54fe:	80 91 76 05 	lds	r24, 0x0576	; 0x800576 <keyboardController+0x6>
    5502:	90 91 77 05 	lds	r25, 0x0577	; 0x800577 <keyboardController+0x7>
    5506:	a0 91 78 05 	lds	r26, 0x0578	; 0x800578 <keyboardController+0x8>
    550a:	b0 91 79 05 	lds	r27, 0x0579	; 0x800579 <keyboardController+0x9>
    550e:	ba cf       	rjmp	.-140    	; 0x5484 <main+0x830>
    5510:	6f e7       	ldi	r22, 0x7F	; 127
    5512:	75 e0       	ldi	r23, 0x05	; 5
    5514:	87 e0       	ldi	r24, 0x07	; 7
    5516:	93 e0       	ldi	r25, 0x03	; 3
    5518:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    551c:	4c cf       	rjmp	.-360    	; 0x53b6 <main+0x762>
    551e:	80 91 61 05 	lds	r24, 0x0561	; 0x800561 <softwareSerial+0xaf>
    5522:	8f 3f       	cpi	r24, 0xFF	; 255
    5524:	09 f0       	breq	.+2      	; 0x5528 <main+0x8d4>
    5526:	59 c0       	rjmp	.+178    	; 0x55da <main+0x986>
    5528:	90 91 0a 05 	lds	r25, 0x050A	; 0x80050a <softwareSerial+0x58>
    552c:	80 91 0b 05 	lds	r24, 0x050B	; 0x80050b <softwareSerial+0x59>
    5530:	98 17       	cp	r25, r24
    5532:	09 f4       	brne	.+2      	; 0x5536 <main+0x8e2>
    5534:	52 c0       	rjmp	.+164    	; 0x55da <main+0x986>
    5536:	e0 91 0b 05 	lds	r30, 0x050B	; 0x80050b <softwareSerial+0x59>
    553a:	f0 e0       	ldi	r31, 0x00	; 0
    553c:	ee 54       	subi	r30, 0x4E	; 78
    553e:	fb 4f       	sbci	r31, 0xFB	; 251
    5540:	80 ad       	ldd	r24, Z+56	; 0x38
    5542:	90 91 0b 05 	lds	r25, 0x050B	; 0x80050b <softwareSerial+0x59>
    5546:	9f 5f       	subi	r25, 0xFF	; 255
    5548:	9f 71       	andi	r25, 0x1F	; 31
    554a:	90 93 0b 05 	sts	0x050B, r25	; 0x80050b <softwareSerial+0x59>
    554e:	91 e0       	ldi	r25, 0x01	; 1
    5550:	90 93 62 05 	sts	0x0562, r25	; 0x800562 <softwareSerial+0xb0>
    5554:	38 2f       	mov	r19, r24
    5556:	41 e0       	ldi	r20, 0x01	; 1
    5558:	50 e0       	ldi	r21, 0x00	; 0
    555a:	90 e0       	ldi	r25, 0x00	; 0
    555c:	23 2f       	mov	r18, r19
    555e:	21 70       	andi	r18, 0x01	; 1
    5560:	92 27       	eor	r25, r18
    5562:	fa 01       	movw	r30, r20
    5564:	ee 59       	subi	r30, 0x9E	; 158
    5566:	fa 4f       	sbci	r31, 0xFA	; 250
    5568:	90 83       	st	Z, r25
    556a:	36 95       	lsr	r19
    556c:	4f 5f       	subi	r20, 0xFF	; 255
    556e:	5f 4f       	sbci	r21, 0xFF	; 255
    5570:	92 2f       	mov	r25, r18
    5572:	49 30       	cpi	r20, 0x09	; 9
    5574:	51 05       	cpc	r21, r1
    5576:	91 f7       	brne	.-28     	; 0x555c <main+0x908>
    5578:	40 91 53 05 	lds	r20, 0x0553	; 0x800553 <softwareSerial+0xa1>
    557c:	50 91 54 05 	lds	r21, 0x0554	; 0x800554 <softwareSerial+0xa2>
    5580:	39 e0       	ldi	r19, 0x09	; 9
    5582:	41 15       	cp	r20, r1
    5584:	51 05       	cpc	r21, r1
    5586:	69 f0       	breq	.+26     	; 0x55a2 <main+0x94e>
    5588:	0e 94 3f 35 	call	0x6a7e	; 0x6a7e <__parityqi2>
    558c:	41 30       	cpi	r20, 0x01	; 1
    558e:	51 05       	cpc	r21, r1
    5590:	11 f4       	brne	.+4      	; 0x5596 <main+0x942>
    5592:	a1 e0       	ldi	r26, 0x01	; 1
    5594:	8a 27       	eor	r24, r26
    5596:	81 70       	andi	r24, 0x01	; 1
    5598:	28 27       	eor	r18, r24
    559a:	20 93 6b 05 	sts	0x056B, r18	; 0x80056b <softwareSerial+0xb9>
    559e:	28 2f       	mov	r18, r24
    55a0:	3a e0       	ldi	r19, 0x0A	; 10
    55a2:	40 91 52 05 	lds	r20, 0x0552	; 0x800552 <softwareSerial+0xa0>
    55a6:	43 0f       	add	r20, r19
    55a8:	61 e0       	ldi	r22, 0x01	; 1
    55aa:	83 2f       	mov	r24, r19
    55ac:	90 e0       	ldi	r25, 0x00	; 0
    55ae:	34 17       	cp	r19, r20
    55b0:	51 f0       	breq	.+20     	; 0x55c6 <main+0x972>
    55b2:	52 2f       	mov	r21, r18
    55b4:	56 27       	eor	r21, r22
    55b6:	8e 59       	subi	r24, 0x9E	; 158
    55b8:	9a 4f       	sbci	r25, 0xFA	; 250
    55ba:	fc 01       	movw	r30, r24
    55bc:	50 83       	st	Z, r21
    55be:	51 11       	cpse	r21, r1
    55c0:	25 2f       	mov	r18, r21
    55c2:	3f 5f       	subi	r19, 0xFF	; 255
    55c4:	f2 cf       	rjmp	.-28     	; 0x55aa <main+0x956>
    55c6:	8c 30       	cpi	r24, 0x0C	; 12
    55c8:	30 f4       	brcc	.+12     	; 0x55d6 <main+0x982>
    55ca:	fc 01       	movw	r30, r24
    55cc:	ee 59       	subi	r30, 0x9E	; 158
    55ce:	fa 4f       	sbci	r31, 0xFA	; 250
    55d0:	10 82       	st	Z, r1
    55d2:	01 96       	adiw	r24, 0x01	; 1
    55d4:	f8 cf       	rjmp	.-16     	; 0x55c6 <main+0x972>
    55d6:	10 92 61 05 	sts	0x0561, r1	; 0x800561 <softwareSerial+0xaf>
    55da:	0e 94 24 0e 	call	0x1c48	; 0x1c48 <_ZN14SafeInterrupts6enableEv>
    55de:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <hc05+0x3>
    55e2:	0e 94 a9 07 	call	0xf52	; 0xf52 <digitalRead>
    55e6:	21 e0       	ldi	r18, 0x01	; 1
    55e8:	01 97       	sbiw	r24, 0x01	; 1
    55ea:	09 f0       	breq	.+2      	; 0x55ee <main+0x99a>
    55ec:	20 e0       	ldi	r18, 0x00	; 0
    55ee:	80 91 a7 04 	lds	r24, 0x04A7	; 0x8004a7 <hc05+0x51>
    55f2:	85 fb       	bst	r24, 5
    55f4:	99 27       	eor	r25, r25
    55f6:	90 f9       	bld	r25, 0
    55f8:	29 17       	cp	r18, r25
    55fa:	71 f0       	breq	.+28     	; 0x5618 <main+0x9c4>
    55fc:	20 fb       	bst	r18, 0
    55fe:	85 f9       	bld	r24, 5
    5600:	80 93 a7 04 	sts	0x04A7, r24	; 0x8004a7 <hc05+0x51>
    5604:	6b e7       	ldi	r22, 0x7B	; 123
    5606:	76 e0       	ldi	r23, 0x06	; 6
    5608:	85 ff       	sbrs	r24, 5
    560a:	02 c0       	rjmp	.+4      	; 0x5610 <main+0x9bc>
    560c:	63 e9       	ldi	r22, 0x93	; 147
    560e:	76 e0       	ldi	r23, 0x06	; 6
    5610:	87 e0       	ldi	r24, 0x07	; 7
    5612:	93 e0       	ldi	r25, 0x03	; 3
    5614:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    5618:	e0 91 a7 04 	lds	r30, 0x04A7	; 0x8004a7 <hc05+0x51>
    561c:	ef 70       	andi	r30, 0x0F	; 15
    561e:	ec 30       	cpi	r30, 0x0C	; 12
    5620:	d0 f4       	brcc	.+52     	; 0x5656 <main+0xa02>
    5622:	f0 e0       	ldi	r31, 0x00	; 0
    5624:	ea 5e       	subi	r30, 0xEA	; 234
    5626:	f4 4d       	sbci	r31, 0xD4	; 212
    5628:	0c 94 38 35 	jmp	0x6a70	; 0x6a70 <__tablejump2__>
    562c:	9f 2d       	mov	r25, r15
    562e:	bc 2c       	mov	r11, r12
    5630:	60 2d       	mov	r22, r0
    5632:	72 2d       	mov	r23, r2
    5634:	ae 2b       	or	r26, r30
    5636:	2b 2b       	or	r18, r27
    5638:	22 2b       	or	r18, r18
    563a:	d0 2b       	or	r29, r16
    563c:	e6 2b       	or	r30, r22
    563e:	0b 2c       	mov	r0, r11
    5640:	74 2c       	mov	r7, r4
    5642:	98 2c       	mov	r9, r8
    5644:	65 e6       	ldi	r22, 0x65	; 101
    5646:	76 e0       	ldi	r23, 0x06	; 6
    5648:	87 e0       	ldi	r24, 0x07	; 7
    564a:	93 e0       	ldi	r25, 0x03	; 3
    564c:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    5650:	80 e0       	ldi	r24, 0x00	; 0
    5652:	0e 94 b8 08 	call	0x1170	; 0x1170 <_ZN4HC055resetEb.constprop.72>
    5656:	80 91 a7 04 	lds	r24, 0x04A7	; 0x8004a7 <hc05+0x51>
    565a:	8f 70       	andi	r24, 0x0F	; 15
    565c:	83 30       	cpi	r24, 0x03	; 3
    565e:	a1 f4       	brne	.+40     	; 0x5688 <main+0xa34>
    5660:	85 e2       	ldi	r24, 0x25	; 37
    5662:	94 e0       	ldi	r25, 0x04	; 4
    5664:	0e 94 f1 0a 	call	0x15e2	; 0x15e2 <_ZN11PipedStream9availableEv>
    5668:	89 2b       	or	r24, r25
    566a:	71 f0       	breq	.+28     	; 0x5688 <main+0xa34>
    566c:	85 e2       	ldi	r24, 0x25	; 37
    566e:	94 e0       	ldi	r25, 0x04	; 4
    5670:	0e 94 09 0b 	call	0x1612	; 0x1612 <_ZN11PipedStream4readEv>
    5674:	90 91 a7 04 	lds	r25, 0x04A7	; 0x8004a7 <hc05+0x51>
    5678:	94 ff       	sbrs	r25, 4
    567a:	a6 c2       	rjmp	.+1356   	; 0x5bc8 <main+0xf74>
    567c:	68 ea       	ldi	r22, 0xA8	; 168
    567e:	76 e0       	ldi	r23, 0x06	; 6
    5680:	87 e0       	ldi	r24, 0x07	; 7
    5682:	93 e0       	ldi	r25, 0x03	; 3
    5684:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    5688:	80 91 2d 02 	lds	r24, 0x022D	; 0x80022d <timer1CompAOverloaded>
    568c:	88 23       	and	r24, r24
    568e:	41 f0       	breq	.+16     	; 0x56a0 <main+0xa4c>
    5690:	6d ee       	ldi	r22, 0xED	; 237
    5692:	77 e0       	ldi	r23, 0x07	; 7
    5694:	87 e0       	ldi	r24, 0x07	; 7
    5696:	93 e0       	ldi	r25, 0x03	; 3
    5698:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    569c:	10 92 2d 02 	sts	0x022D, r1	; 0x80022d <timer1CompAOverloaded>
    56a0:	8d ea       	ldi	r24, 0xAD	; 173
    56a2:	93 e0       	ldi	r25, 0x03	; 3
    56a4:	0e 94 96 0a 	call	0x152c	; 0x152c <_ZN9Statistic3endEv>
    56a8:	83 ea       	ldi	r24, 0xA3	; 163
    56aa:	93 e0       	ldi	r25, 0x03	; 3
    56ac:	0e 94 c3 0a 	call	0x1586	; 0x1586 <_ZN9Statistic5startEv>
    56b0:	85 ec       	ldi	r24, 0xC5	; 197
    56b2:	92 e0       	ldi	r25, 0x02	; 2
    56b4:	0e 94 29 18 	call	0x3052	; 0x3052 <_ZN14SerialCommands10readSerialEv>
    56b8:	83 ea       	ldi	r24, 0xA3	; 163
    56ba:	93 e0       	ldi	r25, 0x03	; 3
    56bc:	0e 94 96 0a 	call	0x152c	; 0x152c <_ZN9Statistic3endEv>
    56c0:	89 e9       	ldi	r24, 0x99	; 153
    56c2:	93 e0       	ldi	r25, 0x03	; 3
    56c4:	0e 94 c3 0a 	call	0x1586	; 0x1586 <_ZN9Statistic5startEv>
    56c8:	b0 90 53 04 	lds	r11, 0x0453	; 0x800453 <eepromController+0x2>
    56cc:	b1 e0       	ldi	r27, 0x01	; 1
    56ce:	bb 16       	cp	r11, r27
    56d0:	09 f4       	brne	.+2      	; 0x56d4 <main+0xa80>
    56d2:	82 c2       	rjmp	.+1284   	; 0x5bd8 <main+0xf84>
    56d4:	e2 e0       	ldi	r30, 0x02	; 2
    56d6:	be 16       	cp	r11, r30
    56d8:	09 f4       	brne	.+2      	; 0x56dc <main+0xa88>
    56da:	f7 c2       	rjmp	.+1518   	; 0x5cca <main+0x1076>
    56dc:	89 e9       	ldi	r24, 0x99	; 153
    56de:	93 e0       	ldi	r25, 0x03	; 3
    56e0:	0e 94 96 0a 	call	0x152c	; 0x152c <_ZN9Statistic3endEv>
    56e4:	8f e8       	ldi	r24, 0x8F	; 143
    56e6:	93 e0       	ldi	r25, 0x03	; 3
    56e8:	0e 94 c3 0a 	call	0x1586	; 0x1586 <_ZN9Statistic5startEv>
    56ec:	80 91 25 02 	lds	r24, 0x0225	; 0x800225 <_ZGVZL19handleBusinessLogicvE26bluetoothConnectionTimeout>
    56f0:	81 11       	cpse	r24, r1
    56f2:	15 c0       	rjmp	.+42     	; 0x571e <main+0xaca>
    56f4:	40 92 21 02 	sts	0x0221, r4	; 0x800221 <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout+0x4>
    56f8:	50 92 22 02 	sts	0x0222, r5	; 0x800222 <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout+0x5>
    56fc:	60 92 23 02 	sts	0x0223, r6	; 0x800223 <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout+0x6>
    5700:	70 92 24 02 	sts	0x0224, r7	; 0x800224 <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout+0x7>
    5704:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    5708:	60 93 1d 02 	sts	0x021D, r22	; 0x80021d <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout>
    570c:	70 93 1e 02 	sts	0x021E, r23	; 0x80021e <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout+0x1>
    5710:	80 93 1f 02 	sts	0x021F, r24	; 0x80021f <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout+0x2>
    5714:	90 93 20 02 	sts	0x0220, r25	; 0x800220 <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout+0x3>
    5718:	81 e0       	ldi	r24, 0x01	; 1
    571a:	80 93 25 02 	sts	0x0225, r24	; 0x800225 <_ZGVZL19handleBusinessLogicvE26bluetoothConnectionTimeout>
    571e:	0e 94 44 0f 	call	0x1e88	; 0x1e88 <_ZN18KeyboardController13isSeedCheckedEv>
    5722:	90 91 1c 02 	lds	r25, 0x021C	; 0x80021c <_ZZL19handleBusinessLogicvE5state>
    5726:	91 30       	cpi	r25, 0x01	; 1
    5728:	09 f0       	breq	.+2      	; 0x572c <main+0xad8>
    572a:	3b c3       	rjmp	.+1654   	; 0x5da2 <main+0x114e>
    572c:	80 91 a7 04 	lds	r24, 0x04A7	; 0x8004a7 <hc05+0x51>
    5730:	85 ff       	sbrs	r24, 5
    5732:	11 c3       	rjmp	.+1570   	; 0x5d56 <main+0x1102>
    5734:	90 93 1b 02 	sts	0x021B, r25	; 0x80021b <_ZZL19handleBusinessLogicvE19lastConnectionState>
    5738:	10 92 1c 02 	sts	0x021C, r1	; 0x80021c <_ZZL19handleBusinessLogicvE5state>
    573c:	8f e8       	ldi	r24, 0x8F	; 143
    573e:	93 e0       	ldi	r25, 0x03	; 3
    5740:	0e 94 96 0a 	call	0x152c	; 0x152c <_ZN9Statistic3endEv>
    5744:	85 e8       	ldi	r24, 0x85	; 133
    5746:	93 e0       	ldi	r25, 0x03	; 3
    5748:	0e 94 96 0a 	call	0x152c	; 0x152c <_ZN9Statistic3endEv>
    574c:	80 e0       	ldi	r24, 0x00	; 0
    574e:	90 e0       	ldi	r25, 0x00	; 0
    5750:	89 2b       	or	r24, r25
    5752:	09 f4       	brne	.+2      	; 0x5756 <main+0xb02>
    5754:	ed cc       	rjmp	.-1574   	; 0x5130 <main+0x4dc>
    5756:	0e 94 00 00 	call	0	; 0x0 <__vectors>
    575a:	e6 cc       	rjmp	.-1588   	; 0x5128 <main+0x4d4>
    575c:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    5760:	20 91 a8 04 	lds	r18, 0x04A8	; 0x8004a8 <hc05+0x52>
    5764:	30 91 a9 04 	lds	r19, 0x04A9	; 0x8004a9 <hc05+0x53>
    5768:	40 91 aa 04 	lds	r20, 0x04AA	; 0x8004aa <hc05+0x54>
    576c:	50 91 ab 04 	lds	r21, 0x04AB	; 0x8004ab <hc05+0x55>
    5770:	62 1b       	sub	r22, r18
    5772:	73 0b       	sbc	r23, r19
    5774:	84 0b       	sbc	r24, r20
    5776:	95 0b       	sbc	r25, r21
    5778:	65 3f       	cpi	r22, 0xF5	; 245
    577a:	71 40       	sbci	r23, 0x01	; 1
    577c:	81 05       	cpc	r24, r1
    577e:	91 05       	cpc	r25, r1
    5780:	08 f4       	brcc	.+2      	; 0x5784 <main+0xb30>
    5782:	69 cf       	rjmp	.-302    	; 0x5656 <main+0xa02>
    5784:	61 e0       	ldi	r22, 0x01	; 1
    5786:	80 91 5a 04 	lds	r24, 0x045A	; 0x80045a <hc05+0x4>
    578a:	0e 94 d2 07 	call	0xfa4	; 0xfa4 <digitalWrite>
    578e:	61 e0       	ldi	r22, 0x01	; 1
    5790:	80 91 58 04 	lds	r24, 0x0458	; 0x800458 <hc05+0x2>
    5794:	0e 94 d2 07 	call	0xfa4	; 0xfa4 <digitalWrite>
    5798:	87 e0       	ldi	r24, 0x07	; 7
    579a:	0e 94 9f 08 	call	0x113e	; 0x113e <_ZN4HC058setStateENS_5StateE.constprop.73>
    579e:	5b cf       	rjmp	.-330    	; 0x5656 <main+0xa02>
    57a0:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    57a4:	20 91 a8 04 	lds	r18, 0x04A8	; 0x8004a8 <hc05+0x52>
    57a8:	30 91 a9 04 	lds	r19, 0x04A9	; 0x8004a9 <hc05+0x53>
    57ac:	40 91 aa 04 	lds	r20, 0x04AA	; 0x8004aa <hc05+0x54>
    57b0:	50 91 ab 04 	lds	r21, 0x04AB	; 0x8004ab <hc05+0x55>
    57b4:	62 1b       	sub	r22, r18
    57b6:	73 0b       	sbc	r23, r19
    57b8:	84 0b       	sbc	r24, r20
    57ba:	95 0b       	sbc	r25, r21
    57bc:	69 3b       	cpi	r22, 0xB9	; 185
    57be:	7b 40       	sbci	r23, 0x0B	; 11
    57c0:	81 05       	cpc	r24, r1
    57c2:	91 05       	cpc	r25, r1
    57c4:	08 f4       	brcc	.+2      	; 0x57c8 <main+0xb74>
    57c6:	47 cf       	rjmp	.-370    	; 0x5656 <main+0xa02>
    57c8:	88 e0       	ldi	r24, 0x08	; 8
    57ca:	e7 cf       	rjmp	.-50     	; 0x579a <main+0xb46>
    57cc:	80 91 56 04 	lds	r24, 0x0456	; 0x800456 <hc05>
    57d0:	90 91 57 04 	lds	r25, 0x0457	; 0x800457 <hc05+0x1>
    57d4:	dc 01       	movw	r26, r24
    57d6:	ed 91       	ld	r30, X+
    57d8:	fc 91       	ld	r31, X
    57da:	00 84       	ldd	r0, Z+8	; 0x08
    57dc:	f1 85       	ldd	r31, Z+9	; 0x09
    57de:	e0 2d       	mov	r30, r0
    57e0:	09 95       	icall
    57e2:	89 2b       	or	r24, r25
    57e4:	61 f0       	breq	.+24     	; 0x57fe <main+0xbaa>
    57e6:	80 91 56 04 	lds	r24, 0x0456	; 0x800456 <hc05>
    57ea:	90 91 57 04 	lds	r25, 0x0457	; 0x800457 <hc05+0x1>
    57ee:	dc 01       	movw	r26, r24
    57f0:	ed 91       	ld	r30, X+
    57f2:	fc 91       	ld	r31, X
    57f4:	02 84       	ldd	r0, Z+10	; 0x0a
    57f6:	f3 85       	ldd	r31, Z+11	; 0x0b
    57f8:	e0 2d       	mov	r30, r0
    57fa:	09 95       	icall
    57fc:	e7 cf       	rjmp	.-50     	; 0x57cc <main+0xb78>
    57fe:	0e 94 7f 06 	call	0xcfe	; 0xcfe <_ZN12StringBufferILh64EE5clearEv.constprop.102>
    5802:	60 e6       	ldi	r22, 0x60	; 96
    5804:	76 e0       	ldi	r23, 0x06	; 6
    5806:	80 91 56 04 	lds	r24, 0x0456	; 0x800456 <hc05>
    580a:	90 91 57 04 	lds	r25, 0x0457	; 0x800457 <hc05+0x1>
    580e:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    5812:	89 e0       	ldi	r24, 0x09	; 9
    5814:	c2 cf       	rjmp	.-124    	; 0x579a <main+0xb46>
    5816:	0e 94 df 06 	call	0xdbe	; 0xdbe <_ZN4HC0516appendStreamDataEv.constprop.25>
    581a:	8c ee       	ldi	r24, 0xEC	; 236
    581c:	95 e0       	ldi	r25, 0x05	; 5
    581e:	0e 94 94 0f 	call	0x1f28	; 0x1f28 <_ZNK12StringBufferILh64EE8endsWithEPK19__FlashStringHelper.constprop.29>
    5822:	88 23       	and	r24, r24
    5824:	81 f0       	breq	.+32     	; 0x5846 <main+0xbf2>
    5826:	e8 ec       	ldi	r30, 0xC8	; 200
    5828:	f0 e0       	ldi	r31, 0x00	; 0
    582a:	f0 93 b1 04 	sts	0x04B1, r31	; 0x8004b1 <hc05+0x5b>
    582e:	e0 93 b0 04 	sts	0x04B0, r30	; 0x8004b0 <hc05+0x5a>
    5832:	82 e0       	ldi	r24, 0x02	; 2
    5834:	0e 94 9f 08 	call	0x113e	; 0x113e <_ZN4HC058setStateENS_5StateE.constprop.73>
    5838:	60 e2       	ldi	r22, 0x20	; 32
    583a:	76 e0       	ldi	r23, 0x06	; 6
    583c:	87 e0       	ldi	r24, 0x07	; 7
    583e:	93 e0       	ldi	r25, 0x03	; 3
    5840:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    5844:	08 cf       	rjmp	.-496    	; 0x5656 <main+0xa02>
    5846:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    584a:	20 91 a8 04 	lds	r18, 0x04A8	; 0x8004a8 <hc05+0x52>
    584e:	30 91 a9 04 	lds	r19, 0x04A9	; 0x8004a9 <hc05+0x53>
    5852:	40 91 aa 04 	lds	r20, 0x04AA	; 0x8004aa <hc05+0x54>
    5856:	50 91 ab 04 	lds	r21, 0x04AB	; 0x8004ab <hc05+0x55>
    585a:	62 1b       	sub	r22, r18
    585c:	73 0b       	sbc	r23, r19
    585e:	84 0b       	sbc	r24, r20
    5860:	95 0b       	sbc	r25, r21
    5862:	61 3a       	cpi	r22, 0xA1	; 161
    5864:	7f 40       	sbci	r23, 0x0F	; 15
    5866:	81 05       	cpc	r24, r1
    5868:	91 05       	cpc	r25, r1
    586a:	08 f4       	brcc	.+2      	; 0x586e <main+0xc1a>
    586c:	f4 ce       	rjmp	.-536    	; 0x5656 <main+0xa02>
    586e:	65 e3       	ldi	r22, 0x35	; 53
    5870:	76 e0       	ldi	r23, 0x06	; 6
    5872:	87 e0       	ldi	r24, 0x07	; 7
    5874:	93 e0       	ldi	r25, 0x03	; 3
    5876:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    587a:	c8 01       	movw	r24, r16
    587c:	0e 94 b7 06 	call	0xd6e	; 0xd6e <_ZNK12StringBufferILh64EE9toCStringEPch.part.11.constprop.32>
    5880:	24 96       	adiw	r28, 0x04	; 4
    5882:	1f ae       	std	Y+63, r1	; 0x3f
    5884:	1e ae       	std	Y+62, r1	; 0x3e
    5886:	24 97       	sbiw	r28, 0x04	; 4
    5888:	26 96       	adiw	r28, 0x06	; 6
    588a:	1f ae       	std	Y+63, r1	; 0x3f
    588c:	1e ae       	std	Y+62, r1	; 0x3e
    588e:	26 97       	sbiw	r28, 0x06	; 6
    5890:	28 96       	adiw	r28, 0x08	; 8
    5892:	1f ae       	std	Y+63, r1	; 0x3f
    5894:	1e ae       	std	Y+62, r1	; 0x3e
    5896:	28 97       	sbiw	r28, 0x08	; 8
    5898:	f8 01       	movw	r30, r16
    589a:	01 90       	ld	r0, Z+
    589c:	00 20       	and	r0, r0
    589e:	e9 f7       	brne	.-6      	; 0x589a <main+0xc46>
    58a0:	31 97       	sbiw	r30, 0x01	; 1
    58a2:	af 01       	movw	r20, r30
    58a4:	40 1b       	sub	r20, r16
    58a6:	51 0b       	sbc	r21, r17
    58a8:	b8 01       	movw	r22, r16
    58aa:	ce 01       	movw	r24, r28
    58ac:	8e 5b       	subi	r24, 0xBE	; 190
    58ae:	9f 4f       	sbci	r25, 0xFF	; 255
    58b0:	0e 94 35 17 	call	0x2e6a	; 0x2e6a <_ZN6String4copyEPKcj>
    58b4:	28 96       	adiw	r28, 0x08	; 8
    58b6:	4e ad       	ldd	r20, Y+62	; 0x3e
    58b8:	5f ad       	ldd	r21, Y+63	; 0x3f
    58ba:	28 97       	sbiw	r28, 0x08	; 8
    58bc:	24 96       	adiw	r28, 0x04	; 4
    58be:	6e ad       	ldd	r22, Y+62	; 0x3e
    58c0:	7f ad       	ldd	r23, Y+63	; 0x3f
    58c2:	24 97       	sbiw	r28, 0x04	; 4
    58c4:	87 e0       	ldi	r24, 0x07	; 7
    58c6:	93 e0       	ldi	r25, 0x03	; 3
    58c8:	0e 94 aa 09 	call	0x1354	; 0x1354 <_ZN7Serial_5writeEPKhj>
    58cc:	87 e0       	ldi	r24, 0x07	; 7
    58ce:	93 e0       	ldi	r25, 0x03	; 3
    58d0:	0e 94 57 10 	call	0x20ae	; 0x20ae <_ZN5Print7printlnEv>
    58d4:	24 96       	adiw	r28, 0x04	; 4
    58d6:	8e ad       	ldd	r24, Y+62	; 0x3e
    58d8:	9f ad       	ldd	r25, Y+63	; 0x3f
    58da:	24 97       	sbiw	r28, 0x04	; 4
    58dc:	00 97       	sbiw	r24, 0x00	; 0
    58de:	11 f0       	breq	.+4      	; 0x58e4 <main+0xc90>
    58e0:	0e 94 b2 30 	call	0x6164	; 0x6164 <free>
    58e4:	84 e0       	ldi	r24, 0x04	; 4
    58e6:	59 cf       	rjmp	.-334    	; 0x579a <main+0xb46>
    58e8:	61 e0       	ldi	r22, 0x01	; 1
    58ea:	80 91 58 04 	lds	r24, 0x0458	; 0x800458 <hc05+0x2>
    58ee:	0e 94 d2 07 	call	0xfa4	; 0xfa4 <digitalWrite>
    58f2:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    58f6:	20 91 a8 04 	lds	r18, 0x04A8	; 0x8004a8 <hc05+0x52>
    58fa:	30 91 a9 04 	lds	r19, 0x04A9	; 0x8004a9 <hc05+0x53>
    58fe:	40 91 aa 04 	lds	r20, 0x04AA	; 0x8004aa <hc05+0x54>
    5902:	50 91 ab 04 	lds	r21, 0x04AB	; 0x8004ab <hc05+0x55>
    5906:	62 1b       	sub	r22, r18
    5908:	73 0b       	sbc	r23, r19
    590a:	84 0b       	sbc	r24, r20
    590c:	95 0b       	sbc	r25, r21
    590e:	69 3e       	cpi	r22, 0xE9	; 233
    5910:	73 40       	sbci	r23, 0x03	; 3
    5912:	81 05       	cpc	r24, r1
    5914:	91 05       	cpc	r25, r1
    5916:	08 f4       	brcc	.+2      	; 0x591a <main+0xcc6>
    5918:	9e ce       	rjmp	.-708    	; 0x5656 <main+0xa02>
    591a:	80 91 a7 04 	lds	r24, 0x04A7	; 0x8004a7 <hc05+0x51>
    591e:	80 61       	ori	r24, 0x10	; 16
    5920:	80 93 a7 04 	sts	0x04A7, r24	; 0x8004a7 <hc05+0x51>
    5924:	80 e0       	ldi	r24, 0x00	; 0
    5926:	0e 94 9f 08 	call	0x113e	; 0x113e <_ZN4HC058setStateENS_5StateE.constprop.73>
    592a:	67 e0       	ldi	r22, 0x07	; 7
    592c:	76 e0       	ldi	r23, 0x06	; 6
    592e:	86 cf       	rjmp	.-244    	; 0x583c <main+0xbe8>
    5930:	60 e0       	ldi	r22, 0x00	; 0
    5932:	80 91 58 04 	lds	r24, 0x0458	; 0x800458 <hc05+0x2>
    5936:	0e 94 d2 07 	call	0xfa4	; 0xfa4 <digitalWrite>
    593a:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    593e:	20 91 a8 04 	lds	r18, 0x04A8	; 0x8004a8 <hc05+0x52>
    5942:	30 91 a9 04 	lds	r19, 0x04A9	; 0x8004a9 <hc05+0x53>
    5946:	40 91 aa 04 	lds	r20, 0x04AA	; 0x8004aa <hc05+0x54>
    594a:	50 91 ab 04 	lds	r21, 0x04AB	; 0x8004ab <hc05+0x55>
    594e:	62 1b       	sub	r22, r18
    5950:	73 0b       	sbc	r23, r19
    5952:	84 0b       	sbc	r24, r20
    5954:	95 0b       	sbc	r25, r21
    5956:	65 3f       	cpi	r22, 0xF5	; 245
    5958:	71 40       	sbci	r23, 0x01	; 1
    595a:	81 05       	cpc	r24, r1
    595c:	91 05       	cpc	r25, r1
    595e:	08 f4       	brcc	.+2      	; 0x5962 <main+0xd0e>
    5960:	7a ce       	rjmp	.-780    	; 0x5656 <main+0xa02>
    5962:	80 91 a7 04 	lds	r24, 0x04A7	; 0x8004a7 <hc05+0x51>
    5966:	8f 7e       	andi	r24, 0xEF	; 239
    5968:	80 93 a7 04 	sts	0x04A7, r24	; 0x8004a7 <hc05+0x51>
    596c:	83 e0       	ldi	r24, 0x03	; 3
    596e:	0e 94 9f 08 	call	0x113e	; 0x113e <_ZN4HC058setStateENS_5StateE.constprop.73>
    5972:	61 ef       	ldi	r22, 0xF1	; 241
    5974:	75 e0       	ldi	r23, 0x05	; 5
    5976:	62 cf       	rjmp	.-316    	; 0x583c <main+0xbe8>
    5978:	0e 94 df 06 	call	0xdbe	; 0xdbe <_ZN4HC0516appendStreamDataEv.constprop.25>
    597c:	d1 2c       	mov	r13, r1
    597e:	80 91 a5 04 	lds	r24, 0x04A5	; 0x8004a5 <hc05+0x4f>
    5982:	90 91 a6 04 	lds	r25, 0x04A6	; 0x8004a6 <hc05+0x50>
    5986:	89 1b       	sub	r24, r25
    5988:	8f 73       	andi	r24, 0x3F	; 63
    598a:	d8 16       	cp	r13, r24
    598c:	08 f0       	brcs	.+2      	; 0x5990 <main+0xd3c>
    598e:	7d c0       	rjmp	.+250    	; 0x5a8a <main+0xe36>
    5990:	b8 01       	movw	r22, r16
    5992:	8d 2d       	mov	r24, r13
    5994:	0e 94 a0 06 	call	0xd40	; 0xd40 <_ZNK17FastCircularQueueIcLh64EE6peekAtEhRc.constprop.33>
    5998:	89 81       	ldd	r24, Y+1	; 0x01
    599a:	8a 30       	cpi	r24, 0x0A	; 10
    599c:	09 f0       	breq	.+2      	; 0x59a0 <main+0xd4c>
    599e:	71 c0       	rjmp	.+226    	; 0x5a82 <main+0xe2e>
    59a0:	8c ee       	ldi	r24, 0xEC	; 236
    59a2:	95 e0       	ldi	r25, 0x05	; 5
    59a4:	0e 94 94 0f 	call	0x1f28	; 0x1f28 <_ZNK12StringBufferILh64EE8endsWithEPK19__FlashStringHelper.constprop.29>
    59a8:	38 2e       	mov	r3, r24
    59aa:	81 11       	cpse	r24, r1
    59ac:	0d c0       	rjmp	.+26     	; 0x59c8 <main+0xd74>
    59ae:	85 ee       	ldi	r24, 0xE5	; 229
    59b0:	95 e0       	ldi	r25, 0x05	; 5
    59b2:	0e 94 4e 0f 	call	0x1e9c	; 0x1e9c <_ZNK12StringBufferILh64EE7indexOfEPK19__FlashStringHelper.constprop.30>
    59b6:	01 96       	adiw	r24, 0x01	; 1
    59b8:	39 f4       	brne	.+14     	; 0x59c8 <main+0xd74>
    59ba:	80 ee       	ldi	r24, 0xE0	; 224
    59bc:	95 e0       	ldi	r25, 0x05	; 5
    59be:	0e 94 4e 0f 	call	0x1e9c	; 0x1e9c <_ZNK12StringBufferILh64EE7indexOfEPK19__FlashStringHelper.constprop.30>
    59c2:	01 96       	adiw	r24, 0x01	; 1
    59c4:	09 f4       	brne	.+2      	; 0x59c8 <main+0xd74>
    59c6:	61 c0       	rjmp	.+194    	; 0x5a8a <main+0xe36>
    59c8:	80 91 5b 04 	lds	r24, 0x045B	; 0x80045b <hc05+0x5>
    59cc:	90 91 5c 04 	lds	r25, 0x045C	; 0x80045c <hc05+0x6>
    59d0:	89 2b       	or	r24, r25
    59d2:	09 f4       	brne	.+2      	; 0x59d6 <main+0xd82>
    59d4:	40 ce       	rjmp	.-896    	; 0x5656 <main+0xa02>
    59d6:	0e 94 11 0f 	call	0x1e22	; 0x1e22 <_ZN12ArduinoQueueIPKN4HC057CommandEE7dequeueEv.constprop.70>
    59da:	6c 01       	movw	r12, r24
    59dc:	00 97       	sbiw	r24, 0x00	; 0
    59de:	09 f4       	brne	.+2      	; 0x59e2 <main+0xd8e>
    59e0:	3a ce       	rjmp	.-908    	; 0x5656 <main+0xa02>
    59e2:	fc 01       	movw	r30, r24
    59e4:	a2 80       	ldd	r10, Z+2	; 0x02
    59e6:	b3 80       	ldd	r11, Z+3	; 0x03
    59e8:	a1 14       	cp	r10, r1
    59ea:	b1 04       	cpc	r11, r1
    59ec:	71 f1       	breq	.+92     	; 0x5a4a <main+0xdf6>
    59ee:	c8 01       	movw	r24, r16
    59f0:	0e 94 b7 06 	call	0xd6e	; 0xd6e <_ZNK12StringBufferILh64EE9toCStringEPch.part.11.constprop.32>
    59f4:	24 96       	adiw	r28, 0x04	; 4
    59f6:	1f ae       	std	Y+63, r1	; 0x3f
    59f8:	1e ae       	std	Y+62, r1	; 0x3e
    59fa:	24 97       	sbiw	r28, 0x04	; 4
    59fc:	26 96       	adiw	r28, 0x06	; 6
    59fe:	1f ae       	std	Y+63, r1	; 0x3f
    5a00:	1e ae       	std	Y+62, r1	; 0x3e
    5a02:	26 97       	sbiw	r28, 0x06	; 6
    5a04:	28 96       	adiw	r28, 0x08	; 8
    5a06:	1f ae       	std	Y+63, r1	; 0x3f
    5a08:	1e ae       	std	Y+62, r1	; 0x3e
    5a0a:	28 97       	sbiw	r28, 0x08	; 8
    5a0c:	f8 01       	movw	r30, r16
    5a0e:	01 90       	ld	r0, Z+
    5a10:	00 20       	and	r0, r0
    5a12:	e9 f7       	brne	.-6      	; 0x5a0e <main+0xdba>
    5a14:	31 97       	sbiw	r30, 0x01	; 1
    5a16:	af 01       	movw	r20, r30
    5a18:	40 1b       	sub	r20, r16
    5a1a:	51 0b       	sbc	r21, r17
    5a1c:	b8 01       	movw	r22, r16
    5a1e:	ce 01       	movw	r24, r28
    5a20:	8e 5b       	subi	r24, 0xBE	; 190
    5a22:	9f 4f       	sbci	r25, 0xFF	; 255
    5a24:	0e 94 35 17 	call	0x2e6a	; 0x2e6a <_ZN6String4copyEPKcj>
    5a28:	ae 01       	movw	r20, r28
    5a2a:	4e 5b       	subi	r20, 0xBE	; 190
    5a2c:	5f 4f       	sbci	r21, 0xFF	; 255
    5a2e:	63 2d       	mov	r22, r3
    5a30:	d6 01       	movw	r26, r12
    5a32:	8d 91       	ld	r24, X+
    5a34:	9c 91       	ld	r25, X
    5a36:	f5 01       	movw	r30, r10
    5a38:	09 95       	icall
    5a3a:	24 96       	adiw	r28, 0x04	; 4
    5a3c:	8e ad       	ldd	r24, Y+62	; 0x3e
    5a3e:	9f ad       	ldd	r25, Y+63	; 0x3f
    5a40:	24 97       	sbiw	r28, 0x04	; 4
    5a42:	00 97       	sbiw	r24, 0x00	; 0
    5a44:	11 f0       	breq	.+4      	; 0x5a4a <main+0xdf6>
    5a46:	0e 94 b2 30 	call	0x6164	; 0x6164 <free>
    5a4a:	33 20       	and	r3, r3
    5a4c:	e1 f0       	breq	.+56     	; 0x5a86 <main+0xe32>
    5a4e:	80 91 a7 04 	lds	r24, 0x04A7	; 0x8004a7 <hc05+0x51>
    5a52:	8f 70       	andi	r24, 0x0F	; 15
    5a54:	81 30       	cpi	r24, 0x01	; 1
    5a56:	b9 f4       	brne	.+46     	; 0x5a86 <main+0xe32>
    5a58:	d6 01       	movw	r26, r12
    5a5a:	14 96       	adiw	r26, 0x04	; 4
    5a5c:	8d 91       	ld	r24, X+
    5a5e:	9c 91       	ld	r25, X
    5a60:	90 93 b1 04 	sts	0x04B1, r25	; 0x8004b1 <hc05+0x5b>
    5a64:	80 93 b0 04 	sts	0x04B0, r24	; 0x8004b0 <hc05+0x5a>
    5a68:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    5a6c:	70 93 af 04 	sts	0x04AF, r23	; 0x8004af <hc05+0x59>
    5a70:	60 93 ae 04 	sts	0x04AE, r22	; 0x8004ae <hc05+0x58>
    5a74:	82 e0       	ldi	r24, 0x02	; 2
    5a76:	0e 94 9f 08 	call	0x113e	; 0x113e <_ZN4HC058setStateENS_5StateE.constprop.73>
    5a7a:	c6 01       	movw	r24, r12
    5a7c:	0e 94 b2 30 	call	0x6164	; 0x6164 <free>
    5a80:	ea cd       	rjmp	.-1068   	; 0x5656 <main+0xa02>
    5a82:	d3 94       	inc	r13
    5a84:	7c cf       	rjmp	.-264    	; 0x597e <main+0xd2a>
    5a86:	80 e0       	ldi	r24, 0x00	; 0
    5a88:	f6 cf       	rjmp	.-20     	; 0x5a76 <main+0xe22>
    5a8a:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    5a8e:	20 91 a8 04 	lds	r18, 0x04A8	; 0x8004a8 <hc05+0x52>
    5a92:	30 91 a9 04 	lds	r19, 0x04A9	; 0x8004a9 <hc05+0x53>
    5a96:	40 91 aa 04 	lds	r20, 0x04AA	; 0x8004aa <hc05+0x54>
    5a9a:	50 91 ab 04 	lds	r21, 0x04AB	; 0x8004ab <hc05+0x55>
    5a9e:	62 1b       	sub	r22, r18
    5aa0:	73 0b       	sbc	r23, r19
    5aa2:	84 0b       	sbc	r24, r20
    5aa4:	95 0b       	sbc	r25, r21
    5aa6:	61 3a       	cpi	r22, 0xA1	; 161
    5aa8:	7f 40       	sbci	r23, 0x0F	; 15
    5aaa:	81 05       	cpc	r24, r1
    5aac:	91 05       	cpc	r25, r1
    5aae:	08 f4       	brcc	.+2      	; 0x5ab2 <main+0xe5e>
    5ab0:	d2 cd       	rjmp	.-1116   	; 0x5656 <main+0xa02>
    5ab2:	63 eb       	ldi	r22, 0xB3	; 179
    5ab4:	75 e0       	ldi	r23, 0x05	; 5
    5ab6:	87 e0       	ldi	r24, 0x07	; 7
    5ab8:	93 e0       	ldi	r25, 0x03	; 3
    5aba:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    5abe:	12 cf       	rjmp	.-476    	; 0x58e4 <main+0xc90>
    5ac0:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    5ac4:	20 91 ae 04 	lds	r18, 0x04AE	; 0x8004ae <hc05+0x58>
    5ac8:	30 91 af 04 	lds	r19, 0x04AF	; 0x8004af <hc05+0x59>
    5acc:	62 1b       	sub	r22, r18
    5ace:	73 0b       	sbc	r23, r19
    5ad0:	80 91 b0 04 	lds	r24, 0x04B0	; 0x8004b0 <hc05+0x5a>
    5ad4:	90 91 b1 04 	lds	r25, 0x04B1	; 0x8004b1 <hc05+0x5b>
    5ad8:	68 17       	cp	r22, r24
    5ada:	79 07       	cpc	r23, r25
    5adc:	08 f4       	brcc	.+2      	; 0x5ae0 <main+0xe8c>
    5ade:	bb cd       	rjmp	.-1162   	; 0x5656 <main+0xa02>
    5ae0:	80 e0       	ldi	r24, 0x00	; 0
    5ae2:	5b ce       	rjmp	.-842    	; 0x579a <main+0xb46>
    5ae4:	80 91 56 04 	lds	r24, 0x0456	; 0x800456 <hc05>
    5ae8:	90 91 57 04 	lds	r25, 0x0457	; 0x800457 <hc05+0x1>
    5aec:	dc 01       	movw	r26, r24
    5aee:	ed 91       	ld	r30, X+
    5af0:	fc 91       	ld	r31, X
    5af2:	00 84       	ldd	r0, Z+8	; 0x08
    5af4:	f1 85       	ldd	r31, Z+9	; 0x09
    5af6:	e0 2d       	mov	r30, r0
    5af8:	09 95       	icall
    5afa:	89 2b       	or	r24, r25
    5afc:	b9 f0       	breq	.+46     	; 0x5b2c <main+0xed8>
    5afe:	80 91 56 04 	lds	r24, 0x0456	; 0x800456 <hc05>
    5b02:	90 91 57 04 	lds	r25, 0x0457	; 0x800457 <hc05+0x1>
    5b06:	dc 01       	movw	r26, r24
    5b08:	ed 91       	ld	r30, X+
    5b0a:	fc 91       	ld	r31, X
    5b0c:	02 84       	ldd	r0, Z+10	; 0x0a
    5b0e:	f3 85       	ldd	r31, Z+11	; 0x0b
    5b10:	e0 2d       	mov	r30, r0
    5b12:	09 95       	icall
    5b14:	90 91 a7 04 	lds	r25, 0x04A7	; 0x8004a7 <hc05+0x51>
    5b18:	95 ff       	sbrs	r25, 5
    5b1a:	e4 cf       	rjmp	.-56     	; 0x5ae4 <main+0xe90>
    5b1c:	e0 91 ac 04 	lds	r30, 0x04AC	; 0x8004ac <hc05+0x56>
    5b20:	f0 91 ad 04 	lds	r31, 0x04AD	; 0x8004ad <hc05+0x57>
    5b24:	30 97       	sbiw	r30, 0x00	; 0
    5b26:	f1 f2       	breq	.-68     	; 0x5ae4 <main+0xe90>
    5b28:	09 95       	icall
    5b2a:	dc cf       	rjmp	.-72     	; 0x5ae4 <main+0xe90>
    5b2c:	80 91 5b 04 	lds	r24, 0x045B	; 0x80045b <hc05+0x5>
    5b30:	90 91 5c 04 	lds	r25, 0x045C	; 0x80045c <hc05+0x6>
    5b34:	89 2b       	or	r24, r25
    5b36:	09 f4       	brne	.+2      	; 0x5b3a <main+0xee6>
    5b38:	8e cd       	rjmp	.-1252   	; 0x5656 <main+0xa02>
    5b3a:	8a e0       	ldi	r24, 0x0A	; 10
    5b3c:	2e ce       	rjmp	.-932    	; 0x579a <main+0xb46>
    5b3e:	e0 91 5b 04 	lds	r30, 0x045B	; 0x80045b <hc05+0x5>
    5b42:	f0 91 5c 04 	lds	r31, 0x045C	; 0x80045c <hc05+0x6>
    5b46:	8b e0       	ldi	r24, 0x0B	; 11
    5b48:	30 97       	sbiw	r30, 0x00	; 0
    5b4a:	09 f4       	brne	.+2      	; 0x5b4e <main+0xefa>
    5b4c:	26 ce       	rjmp	.-948    	; 0x579a <main+0xb46>
    5b4e:	80 91 63 04 	lds	r24, 0x0463	; 0x800463 <hc05+0xd>
    5b52:	90 91 64 04 	lds	r25, 0x0464	; 0x800464 <hc05+0xe>
    5b56:	d1 2c       	mov	r13, r1
    5b58:	c1 2c       	mov	r12, r1
    5b5a:	89 2b       	or	r24, r25
    5b5c:	11 f0       	breq	.+4      	; 0x5b62 <main+0xf0e>
    5b5e:	c0 80       	ld	r12, Z
    5b60:	d1 80       	ldd	r13, Z+1	; 0x01
    5b62:	80 91 56 04 	lds	r24, 0x0456	; 0x800456 <hc05>
    5b66:	90 91 57 04 	lds	r25, 0x0457	; 0x800457 <hc05+0x1>
    5b6a:	dc 01       	movw	r26, r24
    5b6c:	ed 91       	ld	r30, X+
    5b6e:	fc 91       	ld	r31, X
    5b70:	00 84       	ldd	r0, Z+8	; 0x08
    5b72:	f1 85       	ldd	r31, Z+9	; 0x09
    5b74:	e0 2d       	mov	r30, r0
    5b76:	09 95       	icall
    5b78:	89 2b       	or	r24, r25
    5b7a:	61 f0       	breq	.+24     	; 0x5b94 <main+0xf40>
    5b7c:	80 91 56 04 	lds	r24, 0x0456	; 0x800456 <hc05>
    5b80:	90 91 57 04 	lds	r25, 0x0457	; 0x800457 <hc05+0x1>
    5b84:	dc 01       	movw	r26, r24
    5b86:	ed 91       	ld	r30, X+
    5b88:	fc 91       	ld	r31, X
    5b8a:	02 84       	ldd	r0, Z+10	; 0x0a
    5b8c:	f3 85       	ldd	r31, Z+11	; 0x0b
    5b8e:	e0 2d       	mov	r30, r0
    5b90:	09 95       	icall
    5b92:	e7 cf       	rjmp	.-50     	; 0x5b62 <main+0xf0e>
    5b94:	0e 94 7f 06 	call	0xcfe	; 0xcfe <_ZN12StringBufferILh64EE5clearEv.constprop.102>
    5b98:	6b e9       	ldi	r22, 0x9B	; 155
    5b9a:	75 e0       	ldi	r23, 0x05	; 5
    5b9c:	87 e0       	ldi	r24, 0x07	; 7
    5b9e:	93 e0       	ldi	r25, 0x03	; 3
    5ba0:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    5ba4:	f6 01       	movw	r30, r12
    5ba6:	60 81       	ld	r22, Z
    5ba8:	71 81       	ldd	r23, Z+1	; 0x01
    5baa:	87 e0       	ldi	r24, 0x07	; 7
    5bac:	93 e0       	ldi	r25, 0x03	; 3
    5bae:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    5bb2:	d6 01       	movw	r26, r12
    5bb4:	6d 91       	ld	r22, X+
    5bb6:	7c 91       	ld	r23, X
    5bb8:	80 91 56 04 	lds	r24, 0x0456	; 0x800456 <hc05>
    5bbc:	90 91 57 04 	lds	r25, 0x0457	; 0x800457 <hc05+0x1>
    5bc0:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    5bc4:	81 e0       	ldi	r24, 0x01	; 1
    5bc6:	e9 cd       	rjmp	.-1070   	; 0x579a <main+0xb46>
    5bc8:	68 2f       	mov	r22, r24
    5bca:	80 91 56 04 	lds	r24, 0x0456	; 0x800456 <hc05>
    5bce:	90 91 57 04 	lds	r25, 0x0457	; 0x800457 <hc05+0x1>
    5bd2:	0e 94 5d 09 	call	0x12ba	; 0x12ba <_ZN5Print5printEc>
    5bd6:	58 cd       	rjmp	.-1360   	; 0x5688 <main+0xa34>
    5bd8:	b0 92 71 02 	sts	0x0271, r11	; 0x800271 <_ZN7TwoWire12transmittingE>
    5bdc:	80 e5       	ldi	r24, 0x50	; 80
    5bde:	80 93 93 02 	sts	0x0293, r24	; 0x800293 <_ZN7TwoWire9txAddressE>
    5be2:	10 92 72 02 	sts	0x0272, r1	; 0x800272 <_ZN7TwoWire13txBufferIndexE>
    5be6:	10 92 94 02 	sts	0x0294, r1	; 0x800294 <_ZN7TwoWire14txBufferLengthE>
    5bea:	0e 94 57 0c 	call	0x18ae	; 0x18ae <_ZN7TwoWire15endTransmissionEh.constprop.115>
    5bee:	81 11       	cpse	r24, r1
    5bf0:	75 cd       	rjmp	.-1302   	; 0x56dc <main+0xa88>
    5bf2:	c0 90 54 04 	lds	r12, 0x0454	; 0x800454 <eepromController+0x3>
    5bf6:	d0 90 55 04 	lds	r13, 0x0455	; 0x800455 <eepromController+0x4>
    5bfa:	ff ef       	ldi	r31, 0xFF	; 255
    5bfc:	cf 16       	cp	r12, r31
    5bfe:	d1 04       	cpc	r13, r1
    5c00:	79 f0       	breq	.+30     	; 0x5c20 <main+0xfcc>
    5c02:	70 f0       	brcs	.+28     	; 0x5c20 <main+0xfcc>
    5c04:	82 e0       	ldi	r24, 0x02	; 2
    5c06:	80 93 53 04 	sts	0x0453, r24	; 0x800453 <eepromController+0x2>
    5c0a:	10 92 55 04 	sts	0x0455, r1	; 0x800455 <eepromController+0x4>
    5c0e:	10 92 54 04 	sts	0x0454, r1	; 0x800454 <eepromController+0x3>
    5c12:	6d e1       	ldi	r22, 0x1D	; 29
    5c14:	77 e0       	ldi	r23, 0x07	; 7
    5c16:	87 e0       	ldi	r24, 0x07	; 7
    5c18:	93 e0       	ldi	r25, 0x03	; 3
    5c1a:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    5c1e:	5e cd       	rjmp	.-1348   	; 0x56dc <main+0xa88>
    5c20:	65 e0       	ldi	r22, 0x05	; 5
    5c22:	cc 0c       	add	r12, r12
    5c24:	dd 1c       	adc	r13, r13
    5c26:	6a 95       	dec	r22
    5c28:	e1 f7       	brne	.-8      	; 0x5c22 <main+0xfce>
    5c2a:	80 91 51 04 	lds	r24, 0x0451	; 0x800451 <eepromController>
    5c2e:	90 91 52 04 	lds	r25, 0x0452	; 0x800452 <eepromController+0x1>
    5c32:	b0 92 71 02 	sts	0x0271, r11	; 0x800271 <_ZN7TwoWire12transmittingE>
    5c36:	10 92 72 02 	sts	0x0272, r1	; 0x800272 <_ZN7TwoWire13txBufferIndexE>
    5c3a:	10 92 94 02 	sts	0x0294, r1	; 0x800294 <_ZN7TwoWire14txBufferLengthE>
    5c3e:	dc 01       	movw	r26, r24
    5c40:	ed 91       	ld	r30, X+
    5c42:	fc 91       	ld	r31, X
    5c44:	01 90       	ld	r0, Z+
    5c46:	f0 81       	ld	r31, Z
    5c48:	e0 2d       	mov	r30, r0
    5c4a:	6d 2d       	mov	r22, r13
    5c4c:	09 95       	icall
    5c4e:	80 91 51 04 	lds	r24, 0x0451	; 0x800451 <eepromController>
    5c52:	90 91 52 04 	lds	r25, 0x0452	; 0x800452 <eepromController+0x1>
    5c56:	dc 01       	movw	r26, r24
    5c58:	ed 91       	ld	r30, X+
    5c5a:	fc 91       	ld	r31, X
    5c5c:	01 90       	ld	r0, Z+
    5c5e:	f0 81       	ld	r31, Z
    5c60:	e0 2d       	mov	r30, r0
    5c62:	6c 2d       	mov	r22, r12
    5c64:	09 95       	icall
    5c66:	70 e2       	ldi	r23, 0x20	; 32
    5c68:	d7 2e       	mov	r13, r23
    5c6a:	80 91 51 04 	lds	r24, 0x0451	; 0x800451 <eepromController>
    5c6e:	90 91 52 04 	lds	r25, 0x0452	; 0x800452 <eepromController+0x1>
    5c72:	dc 01       	movw	r26, r24
    5c74:	ed 91       	ld	r30, X+
    5c76:	fc 91       	ld	r31, X
    5c78:	01 90       	ld	r0, Z+
    5c7a:	f0 81       	ld	r31, Z
    5c7c:	e0 2d       	mov	r30, r0
    5c7e:	60 e0       	ldi	r22, 0x00	; 0
    5c80:	09 95       	icall
    5c82:	da 94       	dec	r13
    5c84:	d1 10       	cpse	r13, r1
    5c86:	f1 cf       	rjmp	.-30     	; 0x5c6a <main+0x1016>
    5c88:	0e 94 57 0c 	call	0x18ae	; 0x18ae <_ZN7TwoWire15endTransmissionEh.constprop.115>
    5c8c:	66 ef       	ldi	r22, 0xF6	; 246
    5c8e:	76 e0       	ldi	r23, 0x06	; 6
    5c90:	87 e0       	ldi	r24, 0x07	; 7
    5c92:	93 e0       	ldi	r25, 0x03	; 3
    5c94:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    5c98:	40 91 54 04 	lds	r20, 0x0454	; 0x800454 <eepromController+0x3>
    5c9c:	50 91 55 04 	lds	r21, 0x0455	; 0x800455 <eepromController+0x4>
    5ca0:	70 e0       	ldi	r23, 0x00	; 0
    5ca2:	60 e0       	ldi	r22, 0x00	; 0
    5ca4:	2a e0       	ldi	r18, 0x0A	; 10
    5ca6:	87 e0       	ldi	r24, 0x07	; 7
    5ca8:	93 e0       	ldi	r25, 0x03	; 3
    5caa:	0e 94 df 0f 	call	0x1fbe	; 0x1fbe <_ZN5Print11printNumberEmh>
    5cae:	87 e0       	ldi	r24, 0x07	; 7
    5cb0:	93 e0       	ldi	r25, 0x03	; 3
    5cb2:	0e 94 57 10 	call	0x20ae	; 0x20ae <_ZN5Print7printlnEv>
    5cb6:	80 91 54 04 	lds	r24, 0x0454	; 0x800454 <eepromController+0x3>
    5cba:	90 91 55 04 	lds	r25, 0x0455	; 0x800455 <eepromController+0x4>
    5cbe:	01 96       	adiw	r24, 0x01	; 1
    5cc0:	90 93 55 04 	sts	0x0455, r25	; 0x800455 <eepromController+0x4>
    5cc4:	80 93 54 04 	sts	0x0454, r24	; 0x800454 <eepromController+0x3>
    5cc8:	09 cd       	rjmp	.-1518   	; 0x56dc <main+0xa88>
    5cca:	80 91 54 04 	lds	r24, 0x0454	; 0x800454 <eepromController+0x3>
    5cce:	90 91 55 04 	lds	r25, 0x0455	; 0x800455 <eepromController+0x4>
    5cd2:	50 e2       	ldi	r21, 0x20	; 32
    5cd4:	c5 2e       	mov	r12, r21
    5cd6:	d1 2c       	mov	r13, r1
    5cd8:	81 15       	cp	r24, r1
    5cda:	94 40       	sbci	r25, 0x04	; 4
    5cdc:	48 f0       	brcs	.+18     	; 0x5cf0 <main+0x109c>
    5cde:	10 92 53 04 	sts	0x0453, r1	; 0x800453 <eepromController+0x2>
    5ce2:	10 92 55 04 	sts	0x0455, r1	; 0x800455 <eepromController+0x4>
    5ce6:	10 92 54 04 	sts	0x0454, r1	; 0x800454 <eepromController+0x3>
    5cea:	63 e4       	ldi	r22, 0x43	; 67
    5cec:	77 e0       	ldi	r23, 0x07	; 7
    5cee:	93 cf       	rjmp	.-218    	; 0x5c16 <main+0xfc2>
    5cf0:	80 91 54 04 	lds	r24, 0x0454	; 0x800454 <eepromController+0x3>
    5cf4:	90 91 55 04 	lds	r25, 0x0455	; 0x800455 <eepromController+0x4>
    5cf8:	81 15       	cp	r24, r1
    5cfa:	e4 e0       	ldi	r30, 0x04	; 4
    5cfc:	9e 07       	cpc	r25, r30
    5cfe:	98 f4       	brcc	.+38     	; 0x5d26 <main+0x10d2>
    5d00:	9a 83       	std	Y+2, r25	; 0x02
    5d02:	89 83       	std	Y+1, r24	; 0x01
    5d04:	60 e0       	ldi	r22, 0x00	; 0
    5d06:	c8 01       	movw	r24, r16
    5d08:	0e 94 0a 1c 	call	0x3814	; 0x3814 <_ZN5EERef6updateEh>
    5d0c:	80 91 54 04 	lds	r24, 0x0454	; 0x800454 <eepromController+0x3>
    5d10:	90 91 55 04 	lds	r25, 0x0455	; 0x800455 <eepromController+0x4>
    5d14:	01 96       	adiw	r24, 0x01	; 1
    5d16:	90 93 55 04 	sts	0x0455, r25	; 0x800455 <eepromController+0x4>
    5d1a:	80 93 54 04 	sts	0x0454, r24	; 0x800454 <eepromController+0x3>
    5d1e:	f1 e0       	ldi	r31, 0x01	; 1
    5d20:	cf 1a       	sub	r12, r31
    5d22:	d1 08       	sbc	r13, r1
    5d24:	29 f7       	brne	.-54     	; 0x5cf0 <main+0x109c>
    5d26:	61 ed       	ldi	r22, 0xD1	; 209
    5d28:	76 e0       	ldi	r23, 0x06	; 6
    5d2a:	87 e0       	ldi	r24, 0x07	; 7
    5d2c:	93 e0       	ldi	r25, 0x03	; 3
    5d2e:	0e 94 65 09 	call	0x12ca	; 0x12ca <_ZN5Print5printEPK19__FlashStringHelper>
    5d32:	40 91 54 04 	lds	r20, 0x0454	; 0x800454 <eepromController+0x3>
    5d36:	50 91 55 04 	lds	r21, 0x0455	; 0x800455 <eepromController+0x4>
    5d3a:	41 50       	subi	r20, 0x01	; 1
    5d3c:	51 09       	sbc	r21, r1
    5d3e:	70 e0       	ldi	r23, 0x00	; 0
    5d40:	60 e0       	ldi	r22, 0x00	; 0
    5d42:	2a e0       	ldi	r18, 0x0A	; 10
    5d44:	87 e0       	ldi	r24, 0x07	; 7
    5d46:	93 e0       	ldi	r25, 0x03	; 3
    5d48:	0e 94 df 0f 	call	0x1fbe	; 0x1fbe <_ZN5Print11printNumberEmh>
    5d4c:	87 e0       	ldi	r24, 0x07	; 7
    5d4e:	93 e0       	ldi	r25, 0x03	; 3
    5d50:	0e 94 57 10 	call	0x20ae	; 0x20ae <_ZN5Print7printlnEv>
    5d54:	c3 cc       	rjmp	.-1658   	; 0x56dc <main+0xa88>
    5d56:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    5d5a:	20 91 1d 02 	lds	r18, 0x021D	; 0x80021d <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout>
    5d5e:	30 91 1e 02 	lds	r19, 0x021E	; 0x80021e <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout+0x1>
    5d62:	40 91 1f 02 	lds	r20, 0x021F	; 0x80021f <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout+0x2>
    5d66:	50 91 20 02 	lds	r21, 0x0220	; 0x800220 <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout+0x3>
    5d6a:	62 1b       	sub	r22, r18
    5d6c:	73 0b       	sbc	r23, r19
    5d6e:	84 0b       	sbc	r24, r20
    5d70:	95 0b       	sbc	r25, r21
    5d72:	20 91 21 02 	lds	r18, 0x0221	; 0x800221 <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout+0x4>
    5d76:	30 91 22 02 	lds	r19, 0x0222	; 0x800222 <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout+0x5>
    5d7a:	40 91 23 02 	lds	r20, 0x0223	; 0x800223 <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout+0x6>
    5d7e:	50 91 24 02 	lds	r21, 0x0224	; 0x800224 <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout+0x7>
    5d82:	62 17       	cp	r22, r18
    5d84:	73 07       	cpc	r23, r19
    5d86:	84 07       	cpc	r24, r20
    5d88:	95 07       	cpc	r25, r21
    5d8a:	08 f4       	brcc	.+2      	; 0x5d8e <main+0x113a>
    5d8c:	d7 cc       	rjmp	.-1618   	; 0x573c <main+0xae8>
    5d8e:	80 91 1b 02 	lds	r24, 0x021B	; 0x80021b <_ZZL19handleBusinessLogicvE19lastConnectionState>
    5d92:	81 11       	cpse	r24, r1
    5d94:	d3 cc       	rjmp	.-1626   	; 0x573c <main+0xae8>
    5d96:	81 e0       	ldi	r24, 0x01	; 1
    5d98:	0e 94 b8 08 	call	0x1170	; 0x1170 <_ZN4HC055resetEb.constprop.72>
    5d9c:	10 92 1b 02 	sts	0x021B, r1	; 0x80021b <_ZZL19handleBusinessLogicvE19lastConnectionState>
    5da0:	cb cc       	rjmp	.-1642   	; 0x5738 <main+0xae4>
    5da2:	92 30       	cpi	r25, 0x02	; 2
    5da4:	69 f4       	brne	.+26     	; 0x5dc0 <main+0x116c>
    5da6:	80 91 53 04 	lds	r24, 0x0453	; 0x800453 <eepromController+0x2>
    5daa:	81 11       	cpse	r24, r1
    5dac:	c7 cc       	rjmp	.-1650   	; 0x573c <main+0xae8>
    5dae:	6a ec       	ldi	r22, 0xCA	; 202
    5db0:	77 e0       	ldi	r23, 0x07	; 7
    5db2:	87 e0       	ldi	r24, 0x07	; 7
    5db4:	93 e0       	ldi	r25, 0x03	; 3
    5db6:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    5dba:	0e 94 95 06 	call	0xd2a	; 0xd2a <_Z9USB_Flushh.constprop.46>
    5dbe:	48 c8       	rjmp	.-3952   	; 0x4e50 <main+0x1fc>
    5dc0:	90 91 86 05 	lds	r25, 0x0586	; 0x800586 <buttonController+0x1>
    5dc4:	95 fd       	sbrc	r25, 5
    5dc6:	04 c0       	rjmp	.+8      	; 0x5dd0 <main+0x117c>
    5dc8:	83 e0       	ldi	r24, 0x03	; 3
    5dca:	0e 94 c4 13 	call	0x2788	; 0x2788 <_ZN13LEDController8setStateENS_5StateE.constprop.87>
    5dce:	b6 cc       	rjmp	.-1684   	; 0x573c <main+0xae8>
    5dd0:	90 91 95 05 	lds	r25, 0x0595	; 0x800595 <buttonController+0x10>
    5dd4:	91 30       	cpi	r25, 0x01	; 1
    5dd6:	09 f1       	breq	.+66     	; 0x5e1a <main+0x11c6>
    5dd8:	08 f4       	brcc	.+2      	; 0x5ddc <main+0x1188>
    5dda:	ab c0       	rjmp	.+342    	; 0x5f32 <main+0x12de>
    5ddc:	92 30       	cpi	r25, 0x02	; 2
    5dde:	59 f1       	breq	.+86     	; 0x5e36 <main+0x11e2>
    5de0:	93 30       	cpi	r25, 0x03	; 3
    5de2:	09 f0       	breq	.+2      	; 0x5de6 <main+0x1192>
    5de4:	ab cc       	rjmp	.-1706   	; 0x573c <main+0xae8>
    5de6:	6e e9       	ldi	r22, 0x9E	; 158
    5de8:	77 e0       	ldi	r23, 0x07	; 7
    5dea:	87 e0       	ldi	r24, 0x07	; 7
    5dec:	93 e0       	ldi	r25, 0x03	; 3
    5dee:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    5df2:	0e 94 af 10 	call	0x215e	; 0x215e <_ZN18KeyboardController6unlockEv.constprop.135>
    5df6:	82 e0       	ldi	r24, 0x02	; 2
    5df8:	80 93 1c 02 	sts	0x021C, r24	; 0x80021c <_ZZL19handleBusinessLogicvE5state>
    5dfc:	81 e0       	ldi	r24, 0x01	; 1
    5dfe:	0e 94 c4 13 	call	0x2788	; 0x2788 <_ZN13LEDController8setStateENS_5StateE.constprop.87>
    5e02:	80 91 53 04 	lds	r24, 0x0453	; 0x800453 <eepromController+0x2>
    5e06:	81 11       	cpse	r24, r1
    5e08:	99 cc       	rjmp	.-1742   	; 0x573c <main+0xae8>
    5e0a:	81 e0       	ldi	r24, 0x01	; 1
    5e0c:	80 93 53 04 	sts	0x0453, r24	; 0x800453 <eepromController+0x2>
    5e10:	10 92 55 04 	sts	0x0455, r1	; 0x800455 <eepromController+0x4>
    5e14:	10 92 54 04 	sts	0x0454, r1	; 0x800454 <eepromController+0x3>
    5e18:	91 cc       	rjmp	.-1758   	; 0x573c <main+0xae8>
    5e1a:	88 23       	and	r24, r24
    5e1c:	21 f0       	breq	.+8      	; 0x5e26 <main+0x11d2>
    5e1e:	0e 94 97 10 	call	0x212e	; 0x212e <_ZN18KeyboardController4lockEv.constprop.138>
    5e22:	80 e0       	ldi	r24, 0x00	; 0
    5e24:	d2 cf       	rjmp	.-92     	; 0x5dca <main+0x1176>
    5e26:	80 91 84 05 	lds	r24, 0x0584	; 0x800584 <keyboardController+0x14>
    5e2a:	81 11       	cpse	r24, r1
    5e2c:	f8 cf       	rjmp	.-16     	; 0x5e1e <main+0x11ca>
    5e2e:	0e 94 af 10 	call	0x215e	; 0x215e <_ZN18KeyboardController6unlockEv.constprop.135>
    5e32:	84 e0       	ldi	r24, 0x04	; 4
    5e34:	ca cf       	rjmp	.-108    	; 0x5dca <main+0x1176>
    5e36:	63 eb       	ldi	r22, 0xB3	; 179
    5e38:	77 e0       	ldi	r23, 0x07	; 7
    5e3a:	87 e0       	ldi	r24, 0x07	; 7
    5e3c:	93 e0       	ldi	r25, 0x03	; 3
    5e3e:	0e 94 85 10 	call	0x210a	; 0x210a <_ZN5Print7printlnEPK19__FlashStringHelper>
    5e42:	81 e0       	ldi	r24, 0x01	; 1
    5e44:	80 93 1c 02 	sts	0x021C, r24	; 0x80021c <_ZZL19handleBusinessLogicvE5state>
    5e48:	82 e0       	ldi	r24, 0x02	; 2
    5e4a:	0e 94 c4 13 	call	0x2788	; 0x2788 <_ZN13LEDController8setStateENS_5StateE.constprop.87>
    5e4e:	0e 94 93 08 	call	0x1126	; 0x1126 <millis>
    5e52:	60 93 1d 02 	sts	0x021D, r22	; 0x80021d <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout>
    5e56:	70 93 1e 02 	sts	0x021E, r23	; 0x80021e <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout+0x1>
    5e5a:	80 93 1f 02 	sts	0x021F, r24	; 0x80021f <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout+0x2>
    5e5e:	90 93 20 02 	sts	0x0220, r25	; 0x800220 <_ZZL19handleBusinessLogicvE26bluetoothConnectionTimeout+0x3>
    5e62:	fc 82       	std	Y+4, r15	; 0x04
    5e64:	eb 82       	std	Y+3, r14	; 0x03
    5e66:	8c ed       	ldi	r24, 0xDC	; 220
    5e68:	95 e0       	ldi	r25, 0x05	; 5
    5e6a:	9e 83       	std	Y+6, r25	; 0x06
    5e6c:	8d 83       	std	Y+5, r24	; 0x05
    5e6e:	fa 86       	std	Y+10, r15	; 0x0a
    5e70:	e9 86       	std	Y+9, r14	; 0x09
    5e72:	8c e2       	ldi	r24, 0x2C	; 44
    5e74:	91 e0       	ldi	r25, 0x01	; 1
    5e76:	9c 87       	std	Y+12, r25	; 0x0c
    5e78:	8b 87       	std	Y+11, r24	; 0x0b
    5e7a:	f8 8a       	std	Y+16, r15	; 0x10
    5e7c:	ef 86       	std	Y+15, r14	; 0x0f
    5e7e:	9a 8b       	std	Y+18, r25	; 0x12
    5e80:	89 8b       	std	Y+17, r24	; 0x11
    5e82:	fe 8a       	std	Y+22, r15	; 0x16
    5e84:	ed 8a       	std	Y+21, r14	; 0x15
    5e86:	98 8f       	std	Y+24, r25	; 0x18
    5e88:	8f 8b       	std	Y+23, r24	; 0x17
    5e8a:	fc 8e       	std	Y+28, r15	; 0x1c
    5e8c:	eb 8e       	std	Y+27, r14	; 0x1b
    5e8e:	9e 8f       	std	Y+30, r25	; 0x1e
    5e90:	8d 8f       	std	Y+29, r24	; 0x1d
    5e92:	fa a2       	std	Y+34, r15	; 0x22
    5e94:	e9 a2       	std	Y+33, r14	; 0x21
    5e96:	84 ef       	ldi	r24, 0xF4	; 244
    5e98:	91 e0       	ldi	r25, 0x01	; 1
    5e9a:	9c a3       	std	Y+36, r25	; 0x24
    5e9c:	8b a3       	std	Y+35, r24	; 0x23
    5e9e:	81 ea       	ldi	r24, 0xA1	; 161
    5ea0:	94 e1       	ldi	r25, 0x14	; 20
    5ea2:	98 a7       	std	Y+40, r25	; 0x28
    5ea4:	8f a3       	std	Y+39, r24	; 0x27
    5ea6:	88 eb       	ldi	r24, 0xB8	; 184
    5ea8:	9b e0       	ldi	r25, 0x0B	; 11
    5eaa:	9a a7       	std	Y+42, r25	; 0x2a
    5eac:	89 a7       	std	Y+41, r24	; 0x29
    5eae:	85 e9       	ldi	r24, 0x95	; 149
    5eb0:	97 e0       	ldi	r25, 0x07	; 7
    5eb2:	9a 83       	std	Y+2, r25	; 0x02
    5eb4:	89 83       	std	Y+1, r24	; 0x01
    5eb6:	8d eb       	ldi	r24, 0xBD	; 189
    5eb8:	94 e0       	ldi	r25, 0x04	; 4
    5eba:	98 87       	std	Y+8, r25	; 0x08
    5ebc:	8f 83       	std	Y+7, r24	; 0x07
    5ebe:	82 eb       	ldi	r24, 0xB2	; 178
    5ec0:	94 e0       	ldi	r25, 0x04	; 4
    5ec2:	9e 87       	std	Y+14, r25	; 0x0e
    5ec4:	8d 87       	std	Y+13, r24	; 0x0d
    5ec6:	88 e8       	ldi	r24, 0x88	; 136
    5ec8:	97 e0       	ldi	r25, 0x07	; 7
    5eca:	9c 8b       	std	Y+20, r25	; 0x14
    5ecc:	8b 8b       	std	Y+19, r24	; 0x13
    5ece:	8b e7       	ldi	r24, 0x7B	; 123
    5ed0:	97 e0       	ldi	r25, 0x07	; 7
    5ed2:	9a 8f       	std	Y+26, r25	; 0x1a
    5ed4:	89 8f       	std	Y+25, r24	; 0x19
    5ed6:	89 e6       	ldi	r24, 0x69	; 105
    5ed8:	97 e0       	ldi	r25, 0x07	; 7
    5eda:	98 a3       	std	Y+32, r25	; 0x20
    5edc:	8f 8f       	std	Y+31, r24	; 0x1f
    5ede:	81 ea       	ldi	r24, 0xA1	; 161
    5ee0:	94 e0       	ldi	r25, 0x04	; 4
    5ee2:	9e a3       	std	Y+38, r25	; 0x26
    5ee4:	8d a3       	std	Y+37, r24	; 0x25
    5ee6:	80 91 5b 04 	lds	r24, 0x045B	; 0x80045b <hc05+0x5>
    5eea:	90 91 5c 04 	lds	r25, 0x045C	; 0x80045c <hc05+0x6>
    5eee:	89 2b       	or	r24, r25
    5ef0:	29 f0       	breq	.+10     	; 0x5efc <main+0x12a8>
    5ef2:	0e 94 11 0f 	call	0x1e22	; 0x1e22 <_ZN12ArduinoQueueIPKN4HC057CommandEE7dequeueEv.constprop.70>
    5ef6:	0e 94 b2 30 	call	0x6164	; 0x6164 <free>
    5efa:	f5 cf       	rjmp	.-22     	; 0x5ee6 <main+0x1292>
    5efc:	9e 01       	movw	r18, r28
    5efe:	2f 5f       	subi	r18, 0xFF	; 255
    5f00:	3f 4f       	sbci	r19, 0xFF	; 255
    5f02:	69 01       	movw	r12, r18
    5f04:	c6 01       	movw	r24, r12
    5f06:	0e 94 c8 10 	call	0x2190	; 0x2190 <_ZN4HC0511sendCommandERKNS_7CommandE.constprop.77>
    5f0a:	36 e0       	ldi	r19, 0x06	; 6
    5f0c:	c3 0e       	add	r12, r19
    5f0e:	d1 1c       	adc	r13, r1
    5f10:	2a 96       	adiw	r28, 0x0a	; 10
    5f12:	8e ac       	ldd	r8, Y+62	; 0x3e
    5f14:	9f ac       	ldd	r9, Y+63	; 0x3f
    5f16:	2a 97       	sbiw	r28, 0x0a	; 10
    5f18:	8c 14       	cp	r8, r12
    5f1a:	9d 04       	cpc	r9, r13
    5f1c:	99 f7       	brne	.-26     	; 0x5f04 <main+0x12b0>
    5f1e:	80 91 a7 04 	lds	r24, 0x04A7	; 0x8004a7 <hc05+0x51>
    5f22:	8f 70       	andi	r24, 0x0F	; 15
    5f24:	85 30       	cpi	r24, 0x05	; 5
    5f26:	09 f0       	breq	.+2      	; 0x5f2a <main+0x12d6>
    5f28:	09 cc       	rjmp	.-2030   	; 0x573c <main+0xae8>
    5f2a:	80 e0       	ldi	r24, 0x00	; 0
    5f2c:	0e 94 b8 08 	call	0x1170	; 0x1170 <_ZN4HC055resetEb.constprop.72>
    5f30:	05 cc       	rjmp	.-2038   	; 0x573c <main+0xae8>
    5f32:	80 91 84 05 	lds	r24, 0x0584	; 0x800584 <keyboardController+0x14>
    5f36:	88 23       	and	r24, r24
    5f38:	09 f4       	brne	.+2      	; 0x5f3c <main+0x12e8>
    5f3a:	73 cf       	rjmp	.-282    	; 0x5e22 <main+0x11ce>
    5f3c:	7a cf       	rjmp	.-268    	; 0x5e32 <main+0x11de>
    5f3e:	9c 01       	movw	r18, r24
    5f40:	36 95       	lsr	r19
    5f42:	27 95       	ror	r18
    5f44:	61 15       	cp	r22, r1
    5f46:	71 05       	cpc	r23, r1
    5f48:	a1 f0       	breq	.+40     	; 0x5f72 <main+0x131e>
    5f4a:	02 c0       	rjmp	.+4      	; 0x5f50 <main+0x12fc>
    5f4c:	96 95       	lsr	r25
    5f4e:	87 95       	ror	r24
    5f50:	aa 95       	dec	r26
    5f52:	e2 f7       	brpl	.-8      	; 0x5f4c <main+0x12f8>
    5f54:	48 2f       	mov	r20, r24
    5f56:	41 70       	andi	r20, 0x01	; 1
    5f58:	c9 01       	movw	r24, r18
    5f5a:	99 27       	eor	r25, r25
    5f5c:	0e 94 3e 35 	call	0x6a7c	; 0x6a7c <__parityhi2>
    5f60:	61 30       	cpi	r22, 0x01	; 1
    5f62:	71 05       	cpc	r23, r1
    5f64:	11 f4       	brne	.+4      	; 0x5f6a <main+0x1316>
    5f66:	51 e0       	ldi	r21, 0x01	; 1
    5f68:	85 27       	eor	r24, r21
    5f6a:	6b e4       	ldi	r22, 0x4B	; 75
    5f6c:	75 e0       	ldi	r23, 0x05	; 5
    5f6e:	48 13       	cpse	r20, r24
    5f70:	d1 ca       	rjmp	.-2654   	; 0x5514 <main+0x8c0>
    5f72:	e0 91 e8 04 	lds	r30, 0x04E8	; 0x8004e8 <softwareSerial+0x36>
    5f76:	81 e0       	ldi	r24, 0x01	; 1
    5f78:	8e 0f       	add	r24, r30
    5f7a:	8f 71       	andi	r24, 0x1F	; 31
    5f7c:	90 91 e9 04 	lds	r25, 0x04E9	; 0x8004e9 <softwareSerial+0x37>
    5f80:	89 17       	cp	r24, r25
    5f82:	09 f4       	brne	.+2      	; 0x5f86 <main+0x1332>
    5f84:	18 ca       	rjmp	.-3024   	; 0x53b6 <main+0x762>
    5f86:	f0 e0       	ldi	r31, 0x00	; 0
    5f88:	ee 54       	subi	r30, 0x4E	; 78
    5f8a:	fb 4f       	sbci	r31, 0xFB	; 251
    5f8c:	26 8b       	std	Z+22, r18	; 0x16
    5f8e:	80 93 e8 04 	sts	0x04E8, r24	; 0x8004e8 <softwareSerial+0x36>
    5f92:	11 ca       	rjmp	.-3038   	; 0x53b6 <main+0x762>

00005f94 <_ZL24USB_SendStringDescriptorPKhhh>:
    5f94:	ef 92       	push	r14
    5f96:	ff 92       	push	r15
    5f98:	0f 93       	push	r16
    5f9a:	1f 93       	push	r17
    5f9c:	cf 93       	push	r28
    5f9e:	df 93       	push	r29
    5fa0:	f8 2e       	mov	r15, r24
    5fa2:	19 2f       	mov	r17, r25
    5fa4:	e6 2e       	mov	r14, r22
    5fa6:	04 2f       	mov	r16, r20
    5fa8:	81 e0       	ldi	r24, 0x01	; 1
    5faa:	86 0f       	add	r24, r22
    5fac:	88 0f       	add	r24, r24
    5fae:	0e 94 d2 08 	call	0x11a4	; 0x11a4 <_ZL11SendControlh>
    5fb2:	83 e0       	ldi	r24, 0x03	; 3
    5fb4:	0e 94 d2 08 	call	0x11a4	; 0x11a4 <_ZL11SendControlh>
    5fb8:	cf 2d       	mov	r28, r15
    5fba:	d1 2f       	mov	r29, r17
    5fbc:	ec 0e       	add	r14, r28
    5fbe:	fd 2e       	mov	r15, r29
    5fc0:	f1 1c       	adc	r15, r1
    5fc2:	ce 15       	cp	r28, r14
    5fc4:	df 05       	cpc	r29, r15
    5fc6:	a9 f0       	breq	.+42     	; 0x5ff2 <_ZL24USB_SendStringDescriptorPKhhh+0x5e>
    5fc8:	07 ff       	sbrs	r16, 7
    5fca:	11 c0       	rjmp	.+34     	; 0x5fee <_ZL24USB_SendStringDescriptorPKhhh+0x5a>
    5fcc:	fe 01       	movw	r30, r28
    5fce:	84 91       	lpm	r24, Z
    5fd0:	0e 94 d2 08 	call	0x11a4	; 0x11a4 <_ZL11SendControlh>
    5fd4:	18 2f       	mov	r17, r24
    5fd6:	80 e0       	ldi	r24, 0x00	; 0
    5fd8:	0e 94 d2 08 	call	0x11a4	; 0x11a4 <_ZL11SendControlh>
    5fdc:	81 23       	and	r24, r17
    5fde:	21 96       	adiw	r28, 0x01	; 1
    5fe0:	81 11       	cpse	r24, r1
    5fe2:	ef cf       	rjmp	.-34     	; 0x5fc2 <_ZL24USB_SendStringDescriptorPKhhh+0x2e>
    5fe4:	cd b7       	in	r28, 0x3d	; 61
    5fe6:	de b7       	in	r29, 0x3e	; 62
    5fe8:	e6 e0       	ldi	r30, 0x06	; 6
    5fea:	0c 94 c0 34 	jmp	0x6980	; 0x6980 <__epilogue_restores__+0x18>
    5fee:	88 81       	ld	r24, Y
    5ff0:	ef cf       	rjmp	.-34     	; 0x5fd0 <_ZL24USB_SendStringDescriptorPKhhh+0x3c>
    5ff2:	81 e0       	ldi	r24, 0x01	; 1
    5ff4:	f7 cf       	rjmp	.-18     	; 0x5fe4 <_ZL24USB_SendStringDescriptorPKhhh+0x50>

00005ff6 <_GLOBAL__sub_D_watchdogController>:
    5ff6:	80 91 1d 04 	lds	r24, 0x041D	; 0x80041d <commandPipes+0x20>
    5ffa:	90 91 1e 04 	lds	r25, 0x041E	; 0x80041e <commandPipes+0x21>
    5ffe:	0e 94 b2 30 	call	0x6164	; 0x6164 <free>
    6002:	80 91 09 04 	lds	r24, 0x0409	; 0x800409 <commandPipes+0xc>
    6006:	90 91 0a 04 	lds	r25, 0x040A	; 0x80040a <commandPipes+0xd>
    600a:	0e 94 b2 30 	call	0x6164	; 0x6164 <free>
    600e:	80 91 5b 04 	lds	r24, 0x045B	; 0x80045b <hc05+0x5>
    6012:	90 91 5c 04 	lds	r25, 0x045C	; 0x80045c <hc05+0x6>
    6016:	00 97       	sbiw	r24, 0x00	; 0
    6018:	41 f0       	breq	.+16     	; 0x602a <_GLOBAL__sub_D_watchdogController+0x34>
    601a:	fc 01       	movw	r30, r24
    601c:	22 81       	ldd	r18, Z+2	; 0x02
    601e:	33 81       	ldd	r19, Z+3	; 0x03
    6020:	30 93 5c 04 	sts	0x045C, r19	; 0x80045c <hc05+0x6>
    6024:	20 93 5b 04 	sts	0x045B, r18	; 0x80045b <hc05+0x5>
    6028:	f0 cf       	rjmp	.-32     	; 0x600a <_GLOBAL__sub_D_watchdogController+0x14>
    602a:	08 95       	ret

0000602c <malloc>:
    602c:	0f 93       	push	r16
    602e:	1f 93       	push	r17
    6030:	cf 93       	push	r28
    6032:	df 93       	push	r29
    6034:	82 30       	cpi	r24, 0x02	; 2
    6036:	91 05       	cpc	r25, r1
    6038:	10 f4       	brcc	.+4      	; 0x603e <malloc+0x12>
    603a:	82 e0       	ldi	r24, 0x02	; 2
    603c:	90 e0       	ldi	r25, 0x00	; 0
    603e:	e0 91 2d 06 	lds	r30, 0x062D	; 0x80062d <__flp>
    6042:	f0 91 2e 06 	lds	r31, 0x062E	; 0x80062e <__flp+0x1>
    6046:	30 e0       	ldi	r19, 0x00	; 0
    6048:	20 e0       	ldi	r18, 0x00	; 0
    604a:	b0 e0       	ldi	r27, 0x00	; 0
    604c:	a0 e0       	ldi	r26, 0x00	; 0
    604e:	30 97       	sbiw	r30, 0x00	; 0
    6050:	99 f4       	brne	.+38     	; 0x6078 <malloc+0x4c>
    6052:	21 15       	cp	r18, r1
    6054:	31 05       	cpc	r19, r1
    6056:	09 f4       	brne	.+2      	; 0x605a <malloc+0x2e>
    6058:	4a c0       	rjmp	.+148    	; 0x60ee <malloc+0xc2>
    605a:	28 1b       	sub	r18, r24
    605c:	39 0b       	sbc	r19, r25
    605e:	24 30       	cpi	r18, 0x04	; 4
    6060:	31 05       	cpc	r19, r1
    6062:	d8 f5       	brcc	.+118    	; 0x60da <malloc+0xae>
    6064:	8a 81       	ldd	r24, Y+2	; 0x02
    6066:	9b 81       	ldd	r25, Y+3	; 0x03
    6068:	61 15       	cp	r22, r1
    606a:	71 05       	cpc	r23, r1
    606c:	89 f1       	breq	.+98     	; 0x60d0 <malloc+0xa4>
    606e:	fb 01       	movw	r30, r22
    6070:	93 83       	std	Z+3, r25	; 0x03
    6072:	82 83       	std	Z+2, r24	; 0x02
    6074:	fe 01       	movw	r30, r28
    6076:	11 c0       	rjmp	.+34     	; 0x609a <malloc+0x6e>
    6078:	40 81       	ld	r20, Z
    607a:	51 81       	ldd	r21, Z+1	; 0x01
    607c:	02 81       	ldd	r16, Z+2	; 0x02
    607e:	13 81       	ldd	r17, Z+3	; 0x03
    6080:	48 17       	cp	r20, r24
    6082:	59 07       	cpc	r21, r25
    6084:	e0 f0       	brcs	.+56     	; 0x60be <malloc+0x92>
    6086:	48 17       	cp	r20, r24
    6088:	59 07       	cpc	r21, r25
    608a:	99 f4       	brne	.+38     	; 0x60b2 <malloc+0x86>
    608c:	10 97       	sbiw	r26, 0x00	; 0
    608e:	61 f0       	breq	.+24     	; 0x60a8 <malloc+0x7c>
    6090:	12 96       	adiw	r26, 0x02	; 2
    6092:	0c 93       	st	X, r16
    6094:	12 97       	sbiw	r26, 0x02	; 2
    6096:	13 96       	adiw	r26, 0x03	; 3
    6098:	1c 93       	st	X, r17
    609a:	32 96       	adiw	r30, 0x02	; 2
    609c:	cf 01       	movw	r24, r30
    609e:	df 91       	pop	r29
    60a0:	cf 91       	pop	r28
    60a2:	1f 91       	pop	r17
    60a4:	0f 91       	pop	r16
    60a6:	08 95       	ret
    60a8:	00 93 2d 06 	sts	0x062D, r16	; 0x80062d <__flp>
    60ac:	10 93 2e 06 	sts	0x062E, r17	; 0x80062e <__flp+0x1>
    60b0:	f4 cf       	rjmp	.-24     	; 0x609a <malloc+0x6e>
    60b2:	21 15       	cp	r18, r1
    60b4:	31 05       	cpc	r19, r1
    60b6:	51 f0       	breq	.+20     	; 0x60cc <malloc+0xa0>
    60b8:	42 17       	cp	r20, r18
    60ba:	53 07       	cpc	r21, r19
    60bc:	38 f0       	brcs	.+14     	; 0x60cc <malloc+0xa0>
    60be:	a9 01       	movw	r20, r18
    60c0:	db 01       	movw	r26, r22
    60c2:	9a 01       	movw	r18, r20
    60c4:	bd 01       	movw	r22, r26
    60c6:	df 01       	movw	r26, r30
    60c8:	f8 01       	movw	r30, r16
    60ca:	c1 cf       	rjmp	.-126    	; 0x604e <malloc+0x22>
    60cc:	ef 01       	movw	r28, r30
    60ce:	f9 cf       	rjmp	.-14     	; 0x60c2 <malloc+0x96>
    60d0:	90 93 2e 06 	sts	0x062E, r25	; 0x80062e <__flp+0x1>
    60d4:	80 93 2d 06 	sts	0x062D, r24	; 0x80062d <__flp>
    60d8:	cd cf       	rjmp	.-102    	; 0x6074 <malloc+0x48>
    60da:	fe 01       	movw	r30, r28
    60dc:	e2 0f       	add	r30, r18
    60de:	f3 1f       	adc	r31, r19
    60e0:	81 93       	st	Z+, r24
    60e2:	91 93       	st	Z+, r25
    60e4:	22 50       	subi	r18, 0x02	; 2
    60e6:	31 09       	sbc	r19, r1
    60e8:	39 83       	std	Y+1, r19	; 0x01
    60ea:	28 83       	st	Y, r18
    60ec:	d7 cf       	rjmp	.-82     	; 0x609c <malloc+0x70>
    60ee:	20 91 2b 06 	lds	r18, 0x062B	; 0x80062b <__brkval>
    60f2:	30 91 2c 06 	lds	r19, 0x062C	; 0x80062c <__brkval+0x1>
    60f6:	23 2b       	or	r18, r19
    60f8:	41 f4       	brne	.+16     	; 0x610a <malloc+0xde>
    60fa:	20 91 27 01 	lds	r18, 0x0127	; 0x800127 <__malloc_heap_start>
    60fe:	30 91 28 01 	lds	r19, 0x0128	; 0x800128 <__malloc_heap_start+0x1>
    6102:	30 93 2c 06 	sts	0x062C, r19	; 0x80062c <__brkval+0x1>
    6106:	20 93 2b 06 	sts	0x062B, r18	; 0x80062b <__brkval>
    610a:	20 91 25 01 	lds	r18, 0x0125	; 0x800125 <__malloc_heap_end>
    610e:	30 91 26 01 	lds	r19, 0x0126	; 0x800126 <__malloc_heap_end+0x1>
    6112:	21 15       	cp	r18, r1
    6114:	31 05       	cpc	r19, r1
    6116:	41 f4       	brne	.+16     	; 0x6128 <malloc+0xfc>
    6118:	2d b7       	in	r18, 0x3d	; 61
    611a:	3e b7       	in	r19, 0x3e	; 62
    611c:	40 91 29 01 	lds	r20, 0x0129	; 0x800129 <__malloc_margin>
    6120:	50 91 2a 01 	lds	r21, 0x012A	; 0x80012a <__malloc_margin+0x1>
    6124:	24 1b       	sub	r18, r20
    6126:	35 0b       	sbc	r19, r21
    6128:	e0 91 2b 06 	lds	r30, 0x062B	; 0x80062b <__brkval>
    612c:	f0 91 2c 06 	lds	r31, 0x062C	; 0x80062c <__brkval+0x1>
    6130:	e2 17       	cp	r30, r18
    6132:	f3 07       	cpc	r31, r19
    6134:	a0 f4       	brcc	.+40     	; 0x615e <malloc+0x132>
    6136:	2e 1b       	sub	r18, r30
    6138:	3f 0b       	sbc	r19, r31
    613a:	28 17       	cp	r18, r24
    613c:	39 07       	cpc	r19, r25
    613e:	78 f0       	brcs	.+30     	; 0x615e <malloc+0x132>
    6140:	ac 01       	movw	r20, r24
    6142:	4e 5f       	subi	r20, 0xFE	; 254
    6144:	5f 4f       	sbci	r21, 0xFF	; 255
    6146:	24 17       	cp	r18, r20
    6148:	35 07       	cpc	r19, r21
    614a:	48 f0       	brcs	.+18     	; 0x615e <malloc+0x132>
    614c:	4e 0f       	add	r20, r30
    614e:	5f 1f       	adc	r21, r31
    6150:	50 93 2c 06 	sts	0x062C, r21	; 0x80062c <__brkval+0x1>
    6154:	40 93 2b 06 	sts	0x062B, r20	; 0x80062b <__brkval>
    6158:	81 93       	st	Z+, r24
    615a:	91 93       	st	Z+, r25
    615c:	9f cf       	rjmp	.-194    	; 0x609c <malloc+0x70>
    615e:	f0 e0       	ldi	r31, 0x00	; 0
    6160:	e0 e0       	ldi	r30, 0x00	; 0
    6162:	9c cf       	rjmp	.-200    	; 0x609c <malloc+0x70>

00006164 <free>:
    6164:	cf 93       	push	r28
    6166:	df 93       	push	r29
    6168:	00 97       	sbiw	r24, 0x00	; 0
    616a:	e9 f0       	breq	.+58     	; 0x61a6 <free+0x42>
    616c:	fc 01       	movw	r30, r24
    616e:	32 97       	sbiw	r30, 0x02	; 2
    6170:	13 82       	std	Z+3, r1	; 0x03
    6172:	12 82       	std	Z+2, r1	; 0x02
    6174:	a0 91 2d 06 	lds	r26, 0x062D	; 0x80062d <__flp>
    6178:	b0 91 2e 06 	lds	r27, 0x062E	; 0x80062e <__flp+0x1>
    617c:	ed 01       	movw	r28, r26
    617e:	30 e0       	ldi	r19, 0x00	; 0
    6180:	20 e0       	ldi	r18, 0x00	; 0
    6182:	10 97       	sbiw	r26, 0x00	; 0
    6184:	a1 f4       	brne	.+40     	; 0x61ae <free+0x4a>
    6186:	20 81       	ld	r18, Z
    6188:	31 81       	ldd	r19, Z+1	; 0x01
    618a:	82 0f       	add	r24, r18
    618c:	93 1f       	adc	r25, r19
    618e:	20 91 2b 06 	lds	r18, 0x062B	; 0x80062b <__brkval>
    6192:	30 91 2c 06 	lds	r19, 0x062C	; 0x80062c <__brkval+0x1>
    6196:	28 17       	cp	r18, r24
    6198:	39 07       	cpc	r19, r25
    619a:	09 f0       	breq	.+2      	; 0x619e <free+0x3a>
    619c:	61 c0       	rjmp	.+194    	; 0x6260 <free+0xfc>
    619e:	f0 93 2c 06 	sts	0x062C, r31	; 0x80062c <__brkval+0x1>
    61a2:	e0 93 2b 06 	sts	0x062B, r30	; 0x80062b <__brkval>
    61a6:	df 91       	pop	r29
    61a8:	cf 91       	pop	r28
    61aa:	08 95       	ret
    61ac:	ea 01       	movw	r28, r20
    61ae:	ce 17       	cp	r28, r30
    61b0:	df 07       	cpc	r29, r31
    61b2:	e8 f5       	brcc	.+122    	; 0x622e <free+0xca>
    61b4:	4a 81       	ldd	r20, Y+2	; 0x02
    61b6:	5b 81       	ldd	r21, Y+3	; 0x03
    61b8:	9e 01       	movw	r18, r28
    61ba:	41 15       	cp	r20, r1
    61bc:	51 05       	cpc	r21, r1
    61be:	b1 f7       	brne	.-20     	; 0x61ac <free+0x48>
    61c0:	e9 01       	movw	r28, r18
    61c2:	fb 83       	std	Y+3, r31	; 0x03
    61c4:	ea 83       	std	Y+2, r30	; 0x02
    61c6:	49 91       	ld	r20, Y+
    61c8:	59 91       	ld	r21, Y+
    61ca:	c4 0f       	add	r28, r20
    61cc:	d5 1f       	adc	r29, r21
    61ce:	ec 17       	cp	r30, r28
    61d0:	fd 07       	cpc	r31, r29
    61d2:	61 f4       	brne	.+24     	; 0x61ec <free+0x88>
    61d4:	80 81       	ld	r24, Z
    61d6:	91 81       	ldd	r25, Z+1	; 0x01
    61d8:	02 96       	adiw	r24, 0x02	; 2
    61da:	84 0f       	add	r24, r20
    61dc:	95 1f       	adc	r25, r21
    61de:	e9 01       	movw	r28, r18
    61e0:	99 83       	std	Y+1, r25	; 0x01
    61e2:	88 83       	st	Y, r24
    61e4:	82 81       	ldd	r24, Z+2	; 0x02
    61e6:	93 81       	ldd	r25, Z+3	; 0x03
    61e8:	9b 83       	std	Y+3, r25	; 0x03
    61ea:	8a 83       	std	Y+2, r24	; 0x02
    61ec:	f0 e0       	ldi	r31, 0x00	; 0
    61ee:	e0 e0       	ldi	r30, 0x00	; 0
    61f0:	12 96       	adiw	r26, 0x02	; 2
    61f2:	8d 91       	ld	r24, X+
    61f4:	9c 91       	ld	r25, X
    61f6:	13 97       	sbiw	r26, 0x03	; 3
    61f8:	00 97       	sbiw	r24, 0x00	; 0
    61fa:	b9 f5       	brne	.+110    	; 0x626a <free+0x106>
    61fc:	2d 91       	ld	r18, X+
    61fe:	3c 91       	ld	r19, X
    6200:	11 97       	sbiw	r26, 0x01	; 1
    6202:	cd 01       	movw	r24, r26
    6204:	02 96       	adiw	r24, 0x02	; 2
    6206:	82 0f       	add	r24, r18
    6208:	93 1f       	adc	r25, r19
    620a:	20 91 2b 06 	lds	r18, 0x062B	; 0x80062b <__brkval>
    620e:	30 91 2c 06 	lds	r19, 0x062C	; 0x80062c <__brkval+0x1>
    6212:	28 17       	cp	r18, r24
    6214:	39 07       	cpc	r19, r25
    6216:	39 f6       	brne	.-114    	; 0x61a6 <free+0x42>
    6218:	30 97       	sbiw	r30, 0x00	; 0
    621a:	51 f5       	brne	.+84     	; 0x6270 <free+0x10c>
    621c:	10 92 2e 06 	sts	0x062E, r1	; 0x80062e <__flp+0x1>
    6220:	10 92 2d 06 	sts	0x062D, r1	; 0x80062d <__flp>
    6224:	b0 93 2c 06 	sts	0x062C, r27	; 0x80062c <__brkval+0x1>
    6228:	a0 93 2b 06 	sts	0x062B, r26	; 0x80062b <__brkval>
    622c:	bc cf       	rjmp	.-136    	; 0x61a6 <free+0x42>
    622e:	d3 83       	std	Z+3, r29	; 0x03
    6230:	c2 83       	std	Z+2, r28	; 0x02
    6232:	40 81       	ld	r20, Z
    6234:	51 81       	ldd	r21, Z+1	; 0x01
    6236:	84 0f       	add	r24, r20
    6238:	95 1f       	adc	r25, r21
    623a:	c8 17       	cp	r28, r24
    623c:	d9 07       	cpc	r29, r25
    623e:	61 f4       	brne	.+24     	; 0x6258 <free+0xf4>
    6240:	4e 5f       	subi	r20, 0xFE	; 254
    6242:	5f 4f       	sbci	r21, 0xFF	; 255
    6244:	88 81       	ld	r24, Y
    6246:	99 81       	ldd	r25, Y+1	; 0x01
    6248:	48 0f       	add	r20, r24
    624a:	59 1f       	adc	r21, r25
    624c:	51 83       	std	Z+1, r21	; 0x01
    624e:	40 83       	st	Z, r20
    6250:	8a 81       	ldd	r24, Y+2	; 0x02
    6252:	9b 81       	ldd	r25, Y+3	; 0x03
    6254:	93 83       	std	Z+3, r25	; 0x03
    6256:	82 83       	std	Z+2, r24	; 0x02
    6258:	21 15       	cp	r18, r1
    625a:	31 05       	cpc	r19, r1
    625c:	09 f0       	breq	.+2      	; 0x6260 <free+0xfc>
    625e:	b0 cf       	rjmp	.-160    	; 0x61c0 <free+0x5c>
    6260:	f0 93 2e 06 	sts	0x062E, r31	; 0x80062e <__flp+0x1>
    6264:	e0 93 2d 06 	sts	0x062D, r30	; 0x80062d <__flp>
    6268:	9e cf       	rjmp	.-196    	; 0x61a6 <free+0x42>
    626a:	fd 01       	movw	r30, r26
    626c:	dc 01       	movw	r26, r24
    626e:	c0 cf       	rjmp	.-128    	; 0x61f0 <free+0x8c>
    6270:	13 82       	std	Z+3, r1	; 0x03
    6272:	12 82       	std	Z+2, r1	; 0x02
    6274:	d7 cf       	rjmp	.-82     	; 0x6224 <free+0xc0>

00006276 <do_rand>:
    6276:	8f 92       	push	r8
    6278:	9f 92       	push	r9
    627a:	af 92       	push	r10
    627c:	bf 92       	push	r11
    627e:	cf 92       	push	r12
    6280:	df 92       	push	r13
    6282:	ef 92       	push	r14
    6284:	ff 92       	push	r15
    6286:	cf 93       	push	r28
    6288:	df 93       	push	r29
    628a:	ec 01       	movw	r28, r24
    628c:	68 81       	ld	r22, Y
    628e:	79 81       	ldd	r23, Y+1	; 0x01
    6290:	8a 81       	ldd	r24, Y+2	; 0x02
    6292:	9b 81       	ldd	r25, Y+3	; 0x03
    6294:	61 15       	cp	r22, r1
    6296:	71 05       	cpc	r23, r1
    6298:	81 05       	cpc	r24, r1
    629a:	91 05       	cpc	r25, r1
    629c:	21 f4       	brne	.+8      	; 0x62a6 <do_rand+0x30>
    629e:	64 e2       	ldi	r22, 0x24	; 36
    62a0:	79 ed       	ldi	r23, 0xD9	; 217
    62a2:	8b e5       	ldi	r24, 0x5B	; 91
    62a4:	97 e0       	ldi	r25, 0x07	; 7
    62a6:	2d e1       	ldi	r18, 0x1D	; 29
    62a8:	33 ef       	ldi	r19, 0xF3	; 243
    62aa:	41 e0       	ldi	r20, 0x01	; 1
    62ac:	50 e0       	ldi	r21, 0x00	; 0
    62ae:	0e 94 66 34 	call	0x68cc	; 0x68cc <__divmodsi4>
    62b2:	49 01       	movw	r8, r18
    62b4:	5a 01       	movw	r10, r20
    62b6:	9b 01       	movw	r18, r22
    62b8:	ac 01       	movw	r20, r24
    62ba:	a7 ea       	ldi	r26, 0xA7	; 167
    62bc:	b1 e4       	ldi	r27, 0x41	; 65
    62be:	0e 94 85 34 	call	0x690a	; 0x690a <__muluhisi3>
    62c2:	6b 01       	movw	r12, r22
    62c4:	7c 01       	movw	r14, r24
    62c6:	ac ee       	ldi	r26, 0xEC	; 236
    62c8:	b4 ef       	ldi	r27, 0xF4	; 244
    62ca:	a5 01       	movw	r20, r10
    62cc:	94 01       	movw	r18, r8
    62ce:	0e 94 93 34 	call	0x6926	; 0x6926 <__mulohisi3>
    62d2:	dc 01       	movw	r26, r24
    62d4:	cb 01       	movw	r24, r22
    62d6:	8c 0d       	add	r24, r12
    62d8:	9d 1d       	adc	r25, r13
    62da:	ae 1d       	adc	r26, r14
    62dc:	bf 1d       	adc	r27, r15
    62de:	b7 ff       	sbrs	r27, 7
    62e0:	03 c0       	rjmp	.+6      	; 0x62e8 <do_rand+0x72>
    62e2:	01 97       	sbiw	r24, 0x01	; 1
    62e4:	a1 09       	sbc	r26, r1
    62e6:	b0 48       	sbci	r27, 0x80	; 128
    62e8:	88 83       	st	Y, r24
    62ea:	99 83       	std	Y+1, r25	; 0x01
    62ec:	aa 83       	std	Y+2, r26	; 0x02
    62ee:	bb 83       	std	Y+3, r27	; 0x03
    62f0:	9f 77       	andi	r25, 0x7F	; 127
    62f2:	df 91       	pop	r29
    62f4:	cf 91       	pop	r28
    62f6:	ff 90       	pop	r15
    62f8:	ef 90       	pop	r14
    62fa:	df 90       	pop	r13
    62fc:	cf 90       	pop	r12
    62fe:	bf 90       	pop	r11
    6300:	af 90       	pop	r10
    6302:	9f 90       	pop	r9
    6304:	8f 90       	pop	r8
    6306:	08 95       	ret

00006308 <rand_r>:
    6308:	0e 94 3b 31 	call	0x6276	; 0x6276 <do_rand>
    630c:	08 95       	ret

0000630e <rand>:
    630e:	8b e2       	ldi	r24, 0x2B	; 43
    6310:	91 e0       	ldi	r25, 0x01	; 1
    6312:	0e 94 3b 31 	call	0x6276	; 0x6276 <do_rand>
    6316:	08 95       	ret

00006318 <srand>:
    6318:	b0 e0       	ldi	r27, 0x00	; 0
    631a:	a0 e0       	ldi	r26, 0x00	; 0
    631c:	80 93 2b 01 	sts	0x012B, r24	; 0x80012b <next>
    6320:	90 93 2c 01 	sts	0x012C, r25	; 0x80012c <next+0x1>
    6324:	a0 93 2d 01 	sts	0x012D, r26	; 0x80012d <next+0x2>
    6328:	b0 93 2e 01 	sts	0x012E, r27	; 0x80012e <next+0x3>
    632c:	08 95       	ret

0000632e <strtod>:
    632e:	b0 e0       	ldi	r27, 0x00	; 0
    6330:	a0 e0       	ldi	r26, 0x00	; 0
    6332:	ed e9       	ldi	r30, 0x9D	; 157
    6334:	f1 e3       	ldi	r31, 0x31	; 49
    6336:	0c 94 9e 34 	jmp	0x693c	; 0x693c <__prologue_saves__+0xc>
    633a:	5c 01       	movw	r10, r24
    633c:	7b 01       	movw	r14, r22
    633e:	61 15       	cp	r22, r1
    6340:	71 05       	cpc	r23, r1
    6342:	19 f0       	breq	.+6      	; 0x634a <strtod+0x1c>
    6344:	db 01       	movw	r26, r22
    6346:	8d 93       	st	X+, r24
    6348:	9c 93       	st	X, r25
    634a:	85 01       	movw	r16, r10
    634c:	0f 5f       	subi	r16, 0xFF	; 255
    634e:	1f 4f       	sbci	r17, 0xFF	; 255
    6350:	f5 01       	movw	r30, r10
    6352:	d0 81       	ld	r29, Z
    6354:	8d 2f       	mov	r24, r29
    6356:	90 e0       	ldi	r25, 0x00	; 0
    6358:	0e 94 e7 32 	call	0x65ce	; 0x65ce <isspace>
    635c:	6c 01       	movw	r12, r24
    635e:	89 2b       	or	r24, r25
    6360:	b9 f5       	brne	.+110    	; 0x63d0 <strtod+0xa2>
    6362:	dd 32       	cpi	r29, 0x2D	; 45
    6364:	b9 f5       	brne	.+110    	; 0x63d4 <strtod+0xa6>
    6366:	0f 5f       	subi	r16, 0xFF	; 255
    6368:	1f 4f       	sbci	r17, 0xFF	; 255
    636a:	d5 01       	movw	r26, r10
    636c:	11 96       	adiw	r26, 0x01	; 1
    636e:	dc 91       	ld	r29, X
    6370:	c1 e0       	ldi	r28, 0x01	; 1
    6372:	58 01       	movw	r10, r16
    6374:	f1 e0       	ldi	r31, 0x01	; 1
    6376:	af 1a       	sub	r10, r31
    6378:	b1 08       	sbc	r11, r1
    637a:	43 e0       	ldi	r20, 0x03	; 3
    637c:	50 e0       	ldi	r21, 0x00	; 0
    637e:	64 eb       	ldi	r22, 0xB4	; 180
    6380:	70 e0       	ldi	r23, 0x00	; 0
    6382:	c5 01       	movw	r24, r10
    6384:	0e 94 06 33 	call	0x660c	; 0x660c <strncasecmp_P>
    6388:	89 2b       	or	r24, r25
    638a:	69 f5       	brne	.+90     	; 0x63e6 <strtod+0xb8>
    638c:	68 01       	movw	r12, r16
    638e:	82 e0       	ldi	r24, 0x02	; 2
    6390:	c8 0e       	add	r12, r24
    6392:	d1 1c       	adc	r13, r1
    6394:	45 e0       	ldi	r20, 0x05	; 5
    6396:	50 e0       	ldi	r21, 0x00	; 0
    6398:	6f ea       	ldi	r22, 0xAF	; 175
    639a:	70 e0       	ldi	r23, 0x00	; 0
    639c:	c6 01       	movw	r24, r12
    639e:	0e 94 06 33 	call	0x660c	; 0x660c <strncasecmp_P>
    63a2:	89 2b       	or	r24, r25
    63a4:	21 f4       	brne	.+8      	; 0x63ae <strtod+0x80>
    63a6:	68 01       	movw	r12, r16
    63a8:	97 e0       	ldi	r25, 0x07	; 7
    63aa:	c9 0e       	add	r12, r25
    63ac:	d1 1c       	adc	r13, r1
    63ae:	e1 14       	cp	r14, r1
    63b0:	f1 04       	cpc	r15, r1
    63b2:	19 f0       	breq	.+6      	; 0x63ba <strtod+0x8c>
    63b4:	d7 01       	movw	r26, r14
    63b6:	cd 92       	st	X+, r12
    63b8:	dc 92       	st	X, r13
    63ba:	60 e0       	ldi	r22, 0x00	; 0
    63bc:	70 e0       	ldi	r23, 0x00	; 0
    63be:	80 e8       	ldi	r24, 0x80	; 128
    63c0:	9f ef       	ldi	r25, 0xFF	; 255
    63c2:	c1 11       	cpse	r28, r1
    63c4:	ff c0       	rjmp	.+510    	; 0x65c4 <strtod+0x296>
    63c6:	60 e0       	ldi	r22, 0x00	; 0
    63c8:	70 e0       	ldi	r23, 0x00	; 0
    63ca:	80 e8       	ldi	r24, 0x80	; 128
    63cc:	9f e7       	ldi	r25, 0x7F	; 127
    63ce:	fa c0       	rjmp	.+500    	; 0x65c4 <strtod+0x296>
    63d0:	58 01       	movw	r10, r16
    63d2:	bb cf       	rjmp	.-138    	; 0x634a <strtod+0x1c>
    63d4:	db 32       	cpi	r29, 0x2B	; 43
    63d6:	29 f4       	brne	.+10     	; 0x63e2 <strtod+0xb4>
    63d8:	85 01       	movw	r16, r10
    63da:	0e 5f       	subi	r16, 0xFE	; 254
    63dc:	1f 4f       	sbci	r17, 0xFF	; 255
    63de:	f5 01       	movw	r30, r10
    63e0:	d1 81       	ldd	r29, Z+1	; 0x01
    63e2:	c0 e0       	ldi	r28, 0x00	; 0
    63e4:	c6 cf       	rjmp	.-116    	; 0x6372 <strtod+0x44>
    63e6:	43 e0       	ldi	r20, 0x03	; 3
    63e8:	50 e0       	ldi	r21, 0x00	; 0
    63ea:	6c ea       	ldi	r22, 0xAC	; 172
    63ec:	70 e0       	ldi	r23, 0x00	; 0
    63ee:	c5 01       	movw	r24, r10
    63f0:	0e 94 06 33 	call	0x660c	; 0x660c <strncasecmp_P>
    63f4:	89 2b       	or	r24, r25
    63f6:	e9 f0       	breq	.+58     	; 0x6432 <strtod+0x104>
    63f8:	f8 01       	movw	r30, r16
    63fa:	10 e0       	ldi	r17, 0x00	; 0
    63fc:	00 e0       	ldi	r16, 0x00	; 0
    63fe:	20 e0       	ldi	r18, 0x00	; 0
    6400:	30 e0       	ldi	r19, 0x00	; 0
    6402:	a9 01       	movw	r20, r18
    6404:	5f 01       	movw	r10, r30
    6406:	b0 ed       	ldi	r27, 0xD0	; 208
    6408:	8b 2e       	mov	r8, r27
    640a:	8d 0e       	add	r8, r29
    640c:	89 e0       	ldi	r24, 0x09	; 9
    640e:	88 15       	cp	r24, r8
    6410:	c8 f1       	brcs	.+114    	; 0x6484 <strtod+0x156>
    6412:	9c 2e       	mov	r9, r28
    6414:	68 94       	set
    6416:	91 f8       	bld	r9, 1
    6418:	8c 2f       	mov	r24, r28
    641a:	88 70       	andi	r24, 0x08	; 8
    641c:	c2 ff       	sbrs	r28, 2
    641e:	16 c0       	rjmp	.+44     	; 0x644c <strtod+0x11e>
    6420:	81 11       	cpse	r24, r1
    6422:	02 c0       	rjmp	.+4      	; 0x6428 <strtod+0xfa>
    6424:	0f 5f       	subi	r16, 0xFF	; 255
    6426:	1f 4f       	sbci	r17, 0xFF	; 255
    6428:	31 96       	adiw	r30, 0x01	; 1
    642a:	d5 01       	movw	r26, r10
    642c:	dc 91       	ld	r29, X
    642e:	c9 2d       	mov	r28, r9
    6430:	e9 cf       	rjmp	.-46     	; 0x6404 <strtod+0xd6>
    6432:	e1 14       	cp	r14, r1
    6434:	f1 04       	cpc	r15, r1
    6436:	29 f0       	breq	.+10     	; 0x6442 <strtod+0x114>
    6438:	0e 5f       	subi	r16, 0xFE	; 254
    643a:	1f 4f       	sbci	r17, 0xFF	; 255
    643c:	f7 01       	movw	r30, r14
    643e:	11 83       	std	Z+1, r17	; 0x01
    6440:	00 83       	st	Z, r16
    6442:	60 e0       	ldi	r22, 0x00	; 0
    6444:	70 e0       	ldi	r23, 0x00	; 0
    6446:	80 ec       	ldi	r24, 0xC0	; 192
    6448:	9f e7       	ldi	r25, 0x7F	; 127
    644a:	bc c0       	rjmp	.+376    	; 0x65c4 <strtod+0x296>
    644c:	88 23       	and	r24, r24
    644e:	11 f0       	breq	.+4      	; 0x6454 <strtod+0x126>
    6450:	01 50       	subi	r16, 0x01	; 1
    6452:	11 09       	sbc	r17, r1
    6454:	a5 e0       	ldi	r26, 0x05	; 5
    6456:	b0 e0       	ldi	r27, 0x00	; 0
    6458:	0e 94 85 34 	call	0x690a	; 0x690a <__muluhisi3>
    645c:	9b 01       	movw	r18, r22
    645e:	ac 01       	movw	r20, r24
    6460:	22 0f       	add	r18, r18
    6462:	33 1f       	adc	r19, r19
    6464:	44 1f       	adc	r20, r20
    6466:	55 1f       	adc	r21, r21
    6468:	28 0d       	add	r18, r8
    646a:	31 1d       	adc	r19, r1
    646c:	41 1d       	adc	r20, r1
    646e:	51 1d       	adc	r21, r1
    6470:	28 39       	cpi	r18, 0x98	; 152
    6472:	99 e9       	ldi	r25, 0x99	; 153
    6474:	39 07       	cpc	r19, r25
    6476:	49 07       	cpc	r20, r25
    6478:	99 e1       	ldi	r25, 0x19	; 25
    647a:	59 07       	cpc	r21, r25
    647c:	a8 f2       	brcs	.-86     	; 0x6428 <strtod+0xfa>
    647e:	c6 60       	ori	r28, 0x06	; 6
    6480:	9c 2e       	mov	r9, r28
    6482:	d2 cf       	rjmp	.-92     	; 0x6428 <strtod+0xfa>
    6484:	ae ef       	ldi	r26, 0xFE	; 254
    6486:	8a 12       	cpse	r8, r26
    6488:	06 c0       	rjmp	.+12     	; 0x6496 <strtod+0x168>
    648a:	c3 fd       	sbrc	r28, 3
    648c:	3c c0       	rjmp	.+120    	; 0x6506 <strtod+0x1d8>
    648e:	9c 2e       	mov	r9, r28
    6490:	68 94       	set
    6492:	93 f8       	bld	r9, 3
    6494:	c9 cf       	rjmp	.-110    	; 0x6428 <strtod+0xfa>
    6496:	df 7d       	andi	r29, 0xDF	; 223
    6498:	d5 34       	cpi	r29, 0x45	; 69
    649a:	a9 f5       	brne	.+106    	; 0x6506 <strtod+0x1d8>
    649c:	80 81       	ld	r24, Z
    649e:	8d 32       	cpi	r24, 0x2D	; 45
    64a0:	39 f4       	brne	.+14     	; 0x64b0 <strtod+0x182>
    64a2:	c0 61       	ori	r28, 0x10	; 16
    64a4:	df 01       	movw	r26, r30
    64a6:	12 96       	adiw	r26, 0x02	; 2
    64a8:	81 81       	ldd	r24, Z+1	; 0x01
    64aa:	62 e0       	ldi	r22, 0x02	; 2
    64ac:	70 e0       	ldi	r23, 0x00	; 0
    64ae:	06 c0       	rjmp	.+12     	; 0x64bc <strtod+0x18e>
    64b0:	df 01       	movw	r26, r30
    64b2:	8b 32       	cpi	r24, 0x2B	; 43
    64b4:	c1 f3       	breq	.-16     	; 0x64a6 <strtod+0x178>
    64b6:	11 96       	adiw	r26, 0x01	; 1
    64b8:	61 e0       	ldi	r22, 0x01	; 1
    64ba:	70 e0       	ldi	r23, 0x00	; 0
    64bc:	80 53       	subi	r24, 0x30	; 48
    64be:	5d 01       	movw	r10, r26
    64c0:	a6 1a       	sub	r10, r22
    64c2:	b7 0a       	sbc	r11, r23
    64c4:	8a 30       	cpi	r24, 0x0A	; 10
    64c6:	f8 f4       	brcc	.+62     	; 0x6506 <strtod+0x1d8>
    64c8:	e0 e8       	ldi	r30, 0x80	; 128
    64ca:	ce 16       	cp	r12, r30
    64cc:	ec e0       	ldi	r30, 0x0C	; 12
    64ce:	de 06       	cpc	r13, r30
    64d0:	5c f4       	brge	.+22     	; 0x64e8 <strtod+0x1ba>
    64d2:	b6 01       	movw	r22, r12
    64d4:	66 0f       	add	r22, r22
    64d6:	77 1f       	adc	r23, r23
    64d8:	66 0f       	add	r22, r22
    64da:	77 1f       	adc	r23, r23
    64dc:	c6 0e       	add	r12, r22
    64de:	d7 1e       	adc	r13, r23
    64e0:	cc 0c       	add	r12, r12
    64e2:	dd 1c       	adc	r13, r13
    64e4:	c8 0e       	add	r12, r24
    64e6:	d1 1c       	adc	r13, r1
    64e8:	5d 01       	movw	r10, r26
    64ea:	ff ef       	ldi	r31, 0xFF	; 255
    64ec:	af 1a       	sub	r10, r31
    64ee:	bf 0a       	sbc	r11, r31
    64f0:	8c 91       	ld	r24, X
    64f2:	80 53       	subi	r24, 0x30	; 48
    64f4:	8a 30       	cpi	r24, 0x0A	; 10
    64f6:	a8 f1       	brcs	.+106    	; 0x6562 <strtod+0x234>
    64f8:	c4 ff       	sbrs	r28, 4
    64fa:	03 c0       	rjmp	.+6      	; 0x6502 <strtod+0x1d4>
    64fc:	d1 94       	neg	r13
    64fe:	c1 94       	neg	r12
    6500:	d1 08       	sbc	r13, r1
    6502:	0c 0d       	add	r16, r12
    6504:	1d 1d       	adc	r17, r13
    6506:	c1 ff       	sbrs	r28, 1
    6508:	09 c0       	rjmp	.+18     	; 0x651c <strtod+0x1ee>
    650a:	e1 14       	cp	r14, r1
    650c:	f1 04       	cpc	r15, r1
    650e:	31 f0       	breq	.+12     	; 0x651c <strtod+0x1ee>
    6510:	81 e0       	ldi	r24, 0x01	; 1
    6512:	a8 1a       	sub	r10, r24
    6514:	b1 08       	sbc	r11, r1
    6516:	d7 01       	movw	r26, r14
    6518:	ad 92       	st	X+, r10
    651a:	bc 92       	st	X, r11
    651c:	ca 01       	movw	r24, r20
    651e:	b9 01       	movw	r22, r18
    6520:	0e 94 2e 33 	call	0x665c	; 0x665c <__floatunsisf>
    6524:	c3 70       	andi	r28, 0x03	; 3
    6526:	c3 30       	cpi	r28, 0x03	; 3
    6528:	09 f4       	brne	.+2      	; 0x652c <strtod+0x1fe>
    652a:	90 58       	subi	r25, 0x80	; 128
    652c:	4b 01       	movw	r8, r22
    652e:	5c 01       	movw	r10, r24
    6530:	20 e0       	ldi	r18, 0x00	; 0
    6532:	30 e0       	ldi	r19, 0x00	; 0
    6534:	a9 01       	movw	r20, r18
    6536:	0e 94 29 33 	call	0x6652	; 0x6652 <__cmpsf2>
    653a:	88 23       	and	r24, r24
    653c:	09 f4       	brne	.+2      	; 0x6540 <strtod+0x212>
    653e:	40 c0       	rjmp	.+128    	; 0x65c0 <strtod+0x292>
    6540:	c3 ee       	ldi	r28, 0xE3	; 227
    6542:	d0 e0       	ldi	r29, 0x00	; 0
    6544:	17 ff       	sbrs	r17, 7
    6546:	05 c0       	rjmp	.+10     	; 0x6552 <strtod+0x224>
    6548:	11 95       	neg	r17
    654a:	01 95       	neg	r16
    654c:	11 09       	sbc	r17, r1
    654e:	cb ec       	ldi	r28, 0xCB	; 203
    6550:	d0 e0       	ldi	r29, 0x00	; 0
    6552:	6e 01       	movw	r12, r28
    6554:	b8 e1       	ldi	r27, 0x18	; 24
    6556:	cb 1a       	sub	r12, r27
    6558:	d1 08       	sbc	r13, r1
    655a:	80 e2       	ldi	r24, 0x20	; 32
    655c:	e8 2e       	mov	r14, r24
    655e:	f1 2c       	mov	r15, r1
    6560:	0f c0       	rjmp	.+30     	; 0x6580 <strtod+0x252>
    6562:	d5 01       	movw	r26, r10
    6564:	b1 cf       	rjmp	.-158    	; 0x64c8 <strtod+0x19a>
    6566:	fe 01       	movw	r30, r28
    6568:	25 91       	lpm	r18, Z+
    656a:	35 91       	lpm	r19, Z+
    656c:	45 91       	lpm	r20, Z+
    656e:	54 91       	lpm	r21, Z
    6570:	0e 19       	sub	r16, r14
    6572:	1f 09       	sbc	r17, r15
    6574:	c5 01       	movw	r24, r10
    6576:	b4 01       	movw	r22, r8
    6578:	0e 94 8f 33 	call	0x671e	; 0x671e <__mulsf3>
    657c:	4b 01       	movw	r8, r22
    657e:	5c 01       	movw	r10, r24
    6580:	d5 01       	movw	r26, r10
    6582:	c4 01       	movw	r24, r8
    6584:	0e 15       	cp	r16, r14
    6586:	1f 05       	cpc	r17, r15
    6588:	74 f7       	brge	.-36     	; 0x6566 <strtod+0x238>
    658a:	24 97       	sbiw	r28, 0x04	; 4
    658c:	f5 94       	asr	r15
    658e:	e7 94       	ror	r14
    6590:	cc 16       	cp	r12, r28
    6592:	dd 06       	cpc	r13, r29
    6594:	a9 f7       	brne	.-22     	; 0x6580 <strtod+0x252>
    6596:	8a 2f       	mov	r24, r26
    6598:	88 0f       	add	r24, r24
    659a:	8b 2f       	mov	r24, r27
    659c:	88 1f       	adc	r24, r24
    659e:	8f 3f       	cpi	r24, 0xFF	; 255
    65a0:	49 f0       	breq	.+18     	; 0x65b4 <strtod+0x286>
    65a2:	20 e0       	ldi	r18, 0x00	; 0
    65a4:	30 e0       	ldi	r19, 0x00	; 0
    65a6:	a9 01       	movw	r20, r18
    65a8:	c5 01       	movw	r24, r10
    65aa:	b4 01       	movw	r22, r8
    65ac:	0e 94 29 33 	call	0x6652	; 0x6652 <__cmpsf2>
    65b0:	81 11       	cpse	r24, r1
    65b2:	06 c0       	rjmp	.+12     	; 0x65c0 <strtod+0x292>
    65b4:	82 e2       	ldi	r24, 0x22	; 34
    65b6:	90 e0       	ldi	r25, 0x00	; 0
    65b8:	90 93 30 06 	sts	0x0630, r25	; 0x800630 <errno+0x1>
    65bc:	80 93 2f 06 	sts	0x062F, r24	; 0x80062f <errno>
    65c0:	c5 01       	movw	r24, r10
    65c2:	b4 01       	movw	r22, r8
    65c4:	cd b7       	in	r28, 0x3d	; 61
    65c6:	de b7       	in	r29, 0x3e	; 62
    65c8:	ec e0       	ldi	r30, 0x0C	; 12
    65ca:	0c 94 ba 34 	jmp	0x6974	; 0x6974 <__epilogue_restores__+0xc>

000065ce <isspace>:
    65ce:	91 11       	cpse	r25, r1
    65d0:	0c 94 fc 33 	jmp	0x67f8	; 0x67f8 <__ctype_isfalse>
    65d4:	80 32       	cpi	r24, 0x20	; 32
    65d6:	19 f0       	breq	.+6      	; 0x65de <isspace+0x10>
    65d8:	89 50       	subi	r24, 0x09	; 9
    65da:	85 50       	subi	r24, 0x05	; 5
    65dc:	c8 f7       	brcc	.-14     	; 0x65d0 <isspace+0x2>
    65de:	08 95       	ret

000065e0 <memcmp_P>:
    65e0:	fb 01       	movw	r30, r22
    65e2:	dc 01       	movw	r26, r24
    65e4:	04 c0       	rjmp	.+8      	; 0x65ee <memcmp_P+0xe>
    65e6:	8d 91       	ld	r24, X+
    65e8:	05 90       	lpm	r0, Z+
    65ea:	80 19       	sub	r24, r0
    65ec:	21 f4       	brne	.+8      	; 0x65f6 <memcmp_P+0x16>
    65ee:	41 50       	subi	r20, 0x01	; 1
    65f0:	50 40       	sbci	r21, 0x00	; 0
    65f2:	c8 f7       	brcc	.-14     	; 0x65e6 <memcmp_P+0x6>
    65f4:	88 1b       	sub	r24, r24
    65f6:	99 0b       	sbc	r25, r25
    65f8:	08 95       	ret

000065fa <memcpy_P>:
    65fa:	fb 01       	movw	r30, r22
    65fc:	dc 01       	movw	r26, r24
    65fe:	02 c0       	rjmp	.+4      	; 0x6604 <memcpy_P+0xa>
    6600:	05 90       	lpm	r0, Z+
    6602:	0d 92       	st	X+, r0
    6604:	41 50       	subi	r20, 0x01	; 1
    6606:	50 40       	sbci	r21, 0x00	; 0
    6608:	d8 f7       	brcc	.-10     	; 0x6600 <memcpy_P+0x6>
    660a:	08 95       	ret

0000660c <strncasecmp_P>:
    660c:	fb 01       	movw	r30, r22
    660e:	dc 01       	movw	r26, r24
    6610:	41 50       	subi	r20, 0x01	; 1
    6612:	50 40       	sbci	r21, 0x00	; 0
    6614:	88 f0       	brcs	.+34     	; 0x6638 <strncasecmp_P+0x2c>
    6616:	8d 91       	ld	r24, X+
    6618:	81 34       	cpi	r24, 0x41	; 65
    661a:	1c f0       	brlt	.+6      	; 0x6622 <strncasecmp_P+0x16>
    661c:	8b 35       	cpi	r24, 0x5B	; 91
    661e:	0c f4       	brge	.+2      	; 0x6622 <strncasecmp_P+0x16>
    6620:	80 5e       	subi	r24, 0xE0	; 224
    6622:	65 91       	lpm	r22, Z+
    6624:	61 34       	cpi	r22, 0x41	; 65
    6626:	1c f0       	brlt	.+6      	; 0x662e <strncasecmp_P+0x22>
    6628:	6b 35       	cpi	r22, 0x5B	; 91
    662a:	0c f4       	brge	.+2      	; 0x662e <strncasecmp_P+0x22>
    662c:	60 5e       	subi	r22, 0xE0	; 224
    662e:	86 1b       	sub	r24, r22
    6630:	61 11       	cpse	r22, r1
    6632:	71 f3       	breq	.-36     	; 0x6610 <strncasecmp_P+0x4>
    6634:	99 0b       	sbc	r25, r25
    6636:	08 95       	ret
    6638:	88 1b       	sub	r24, r24
    663a:	fc cf       	rjmp	.-8      	; 0x6634 <strncasecmp_P+0x28>

0000663c <strnlen_P>:
    663c:	fc 01       	movw	r30, r24
    663e:	05 90       	lpm	r0, Z+
    6640:	61 50       	subi	r22, 0x01	; 1
    6642:	70 40       	sbci	r23, 0x00	; 0
    6644:	01 10       	cpse	r0, r1
    6646:	d8 f7       	brcc	.-10     	; 0x663e <strnlen_P+0x2>
    6648:	80 95       	com	r24
    664a:	90 95       	com	r25
    664c:	8e 0f       	add	r24, r30
    664e:	9f 1f       	adc	r25, r31
    6650:	08 95       	ret

00006652 <__cmpsf2>:
    6652:	0e 94 6b 33 	call	0x66d6	; 0x66d6 <__fp_cmp>
    6656:	08 f4       	brcc	.+2      	; 0x665a <__cmpsf2+0x8>
    6658:	81 e0       	ldi	r24, 0x01	; 1
    665a:	08 95       	ret

0000665c <__floatunsisf>:
    665c:	e8 94       	clt
    665e:	09 c0       	rjmp	.+18     	; 0x6672 <__floatsisf+0x12>

00006660 <__floatsisf>:
    6660:	97 fb       	bst	r25, 7
    6662:	3e f4       	brtc	.+14     	; 0x6672 <__floatsisf+0x12>
    6664:	90 95       	com	r25
    6666:	80 95       	com	r24
    6668:	70 95       	com	r23
    666a:	61 95       	neg	r22
    666c:	7f 4f       	sbci	r23, 0xFF	; 255
    666e:	8f 4f       	sbci	r24, 0xFF	; 255
    6670:	9f 4f       	sbci	r25, 0xFF	; 255
    6672:	99 23       	and	r25, r25
    6674:	a9 f0       	breq	.+42     	; 0x66a0 <__floatsisf+0x40>
    6676:	f9 2f       	mov	r31, r25
    6678:	96 e9       	ldi	r25, 0x96	; 150
    667a:	bb 27       	eor	r27, r27
    667c:	93 95       	inc	r25
    667e:	f6 95       	lsr	r31
    6680:	87 95       	ror	r24
    6682:	77 95       	ror	r23
    6684:	67 95       	ror	r22
    6686:	b7 95       	ror	r27
    6688:	f1 11       	cpse	r31, r1
    668a:	f8 cf       	rjmp	.-16     	; 0x667c <__floatsisf+0x1c>
    668c:	fa f4       	brpl	.+62     	; 0x66cc <__floatsisf+0x6c>
    668e:	bb 0f       	add	r27, r27
    6690:	11 f4       	brne	.+4      	; 0x6696 <__floatsisf+0x36>
    6692:	60 ff       	sbrs	r22, 0
    6694:	1b c0       	rjmp	.+54     	; 0x66cc <__floatsisf+0x6c>
    6696:	6f 5f       	subi	r22, 0xFF	; 255
    6698:	7f 4f       	sbci	r23, 0xFF	; 255
    669a:	8f 4f       	sbci	r24, 0xFF	; 255
    669c:	9f 4f       	sbci	r25, 0xFF	; 255
    669e:	16 c0       	rjmp	.+44     	; 0x66cc <__floatsisf+0x6c>
    66a0:	88 23       	and	r24, r24
    66a2:	11 f0       	breq	.+4      	; 0x66a8 <__floatsisf+0x48>
    66a4:	96 e9       	ldi	r25, 0x96	; 150
    66a6:	11 c0       	rjmp	.+34     	; 0x66ca <__floatsisf+0x6a>
    66a8:	77 23       	and	r23, r23
    66aa:	21 f0       	breq	.+8      	; 0x66b4 <__floatsisf+0x54>
    66ac:	9e e8       	ldi	r25, 0x8E	; 142
    66ae:	87 2f       	mov	r24, r23
    66b0:	76 2f       	mov	r23, r22
    66b2:	05 c0       	rjmp	.+10     	; 0x66be <__floatsisf+0x5e>
    66b4:	66 23       	and	r22, r22
    66b6:	71 f0       	breq	.+28     	; 0x66d4 <__floatsisf+0x74>
    66b8:	96 e8       	ldi	r25, 0x86	; 134
    66ba:	86 2f       	mov	r24, r22
    66bc:	70 e0       	ldi	r23, 0x00	; 0
    66be:	60 e0       	ldi	r22, 0x00	; 0
    66c0:	2a f0       	brmi	.+10     	; 0x66cc <__floatsisf+0x6c>
    66c2:	9a 95       	dec	r25
    66c4:	66 0f       	add	r22, r22
    66c6:	77 1f       	adc	r23, r23
    66c8:	88 1f       	adc	r24, r24
    66ca:	da f7       	brpl	.-10     	; 0x66c2 <__floatsisf+0x62>
    66cc:	88 0f       	add	r24, r24
    66ce:	96 95       	lsr	r25
    66d0:	87 95       	ror	r24
    66d2:	97 f9       	bld	r25, 7
    66d4:	08 95       	ret

000066d6 <__fp_cmp>:
    66d6:	99 0f       	add	r25, r25
    66d8:	00 08       	sbc	r0, r0
    66da:	55 0f       	add	r21, r21
    66dc:	aa 0b       	sbc	r26, r26
    66de:	e0 e8       	ldi	r30, 0x80	; 128
    66e0:	fe ef       	ldi	r31, 0xFE	; 254
    66e2:	16 16       	cp	r1, r22
    66e4:	17 06       	cpc	r1, r23
    66e6:	e8 07       	cpc	r30, r24
    66e8:	f9 07       	cpc	r31, r25
    66ea:	c0 f0       	brcs	.+48     	; 0x671c <__fp_cmp+0x46>
    66ec:	12 16       	cp	r1, r18
    66ee:	13 06       	cpc	r1, r19
    66f0:	e4 07       	cpc	r30, r20
    66f2:	f5 07       	cpc	r31, r21
    66f4:	98 f0       	brcs	.+38     	; 0x671c <__fp_cmp+0x46>
    66f6:	62 1b       	sub	r22, r18
    66f8:	73 0b       	sbc	r23, r19
    66fa:	84 0b       	sbc	r24, r20
    66fc:	95 0b       	sbc	r25, r21
    66fe:	39 f4       	brne	.+14     	; 0x670e <__fp_cmp+0x38>
    6700:	0a 26       	eor	r0, r26
    6702:	61 f0       	breq	.+24     	; 0x671c <__fp_cmp+0x46>
    6704:	23 2b       	or	r18, r19
    6706:	24 2b       	or	r18, r20
    6708:	25 2b       	or	r18, r21
    670a:	21 f4       	brne	.+8      	; 0x6714 <__fp_cmp+0x3e>
    670c:	08 95       	ret
    670e:	0a 26       	eor	r0, r26
    6710:	09 f4       	brne	.+2      	; 0x6714 <__fp_cmp+0x3e>
    6712:	a1 40       	sbci	r26, 0x01	; 1
    6714:	a6 95       	lsr	r26
    6716:	8f ef       	ldi	r24, 0xFF	; 255
    6718:	81 1d       	adc	r24, r1
    671a:	81 1d       	adc	r24, r1
    671c:	08 95       	ret

0000671e <__mulsf3>:
    671e:	0e 94 a2 33 	call	0x6744	; 0x6744 <__mulsf3x>
    6722:	0c 94 16 34 	jmp	0x682c	; 0x682c <__fp_round>
    6726:	0e 94 08 34 	call	0x6810	; 0x6810 <__fp_pscA>
    672a:	38 f0       	brcs	.+14     	; 0x673a <__mulsf3+0x1c>
    672c:	0e 94 0f 34 	call	0x681e	; 0x681e <__fp_pscB>
    6730:	20 f0       	brcs	.+8      	; 0x673a <__mulsf3+0x1c>
    6732:	95 23       	and	r25, r21
    6734:	11 f0       	breq	.+4      	; 0x673a <__mulsf3+0x1c>
    6736:	0c 94 ff 33 	jmp	0x67fe	; 0x67fe <__fp_inf>
    673a:	0c 94 05 34 	jmp	0x680a	; 0x680a <__fp_nan>
    673e:	11 24       	eor	r1, r1
    6740:	0c 94 4a 34 	jmp	0x6894	; 0x6894 <__fp_szero>

00006744 <__mulsf3x>:
    6744:	0e 94 27 34 	call	0x684e	; 0x684e <__fp_split3>
    6748:	70 f3       	brcs	.-36     	; 0x6726 <__mulsf3+0x8>

0000674a <__mulsf3_pse>:
    674a:	95 9f       	mul	r25, r21
    674c:	c1 f3       	breq	.-16     	; 0x673e <__mulsf3+0x20>
    674e:	95 0f       	add	r25, r21
    6750:	50 e0       	ldi	r21, 0x00	; 0
    6752:	55 1f       	adc	r21, r21
    6754:	62 9f       	mul	r22, r18
    6756:	f0 01       	movw	r30, r0
    6758:	72 9f       	mul	r23, r18
    675a:	bb 27       	eor	r27, r27
    675c:	f0 0d       	add	r31, r0
    675e:	b1 1d       	adc	r27, r1
    6760:	63 9f       	mul	r22, r19
    6762:	aa 27       	eor	r26, r26
    6764:	f0 0d       	add	r31, r0
    6766:	b1 1d       	adc	r27, r1
    6768:	aa 1f       	adc	r26, r26
    676a:	64 9f       	mul	r22, r20
    676c:	66 27       	eor	r22, r22
    676e:	b0 0d       	add	r27, r0
    6770:	a1 1d       	adc	r26, r1
    6772:	66 1f       	adc	r22, r22
    6774:	82 9f       	mul	r24, r18
    6776:	22 27       	eor	r18, r18
    6778:	b0 0d       	add	r27, r0
    677a:	a1 1d       	adc	r26, r1
    677c:	62 1f       	adc	r22, r18
    677e:	73 9f       	mul	r23, r19
    6780:	b0 0d       	add	r27, r0
    6782:	a1 1d       	adc	r26, r1
    6784:	62 1f       	adc	r22, r18
    6786:	83 9f       	mul	r24, r19
    6788:	a0 0d       	add	r26, r0
    678a:	61 1d       	adc	r22, r1
    678c:	22 1f       	adc	r18, r18
    678e:	74 9f       	mul	r23, r20
    6790:	33 27       	eor	r19, r19
    6792:	a0 0d       	add	r26, r0
    6794:	61 1d       	adc	r22, r1
    6796:	23 1f       	adc	r18, r19
    6798:	84 9f       	mul	r24, r20
    679a:	60 0d       	add	r22, r0
    679c:	21 1d       	adc	r18, r1
    679e:	82 2f       	mov	r24, r18
    67a0:	76 2f       	mov	r23, r22
    67a2:	6a 2f       	mov	r22, r26
    67a4:	11 24       	eor	r1, r1
    67a6:	9f 57       	subi	r25, 0x7F	; 127
    67a8:	50 40       	sbci	r21, 0x00	; 0
    67aa:	9a f0       	brmi	.+38     	; 0x67d2 <__mulsf3_pse+0x88>
    67ac:	f1 f0       	breq	.+60     	; 0x67ea <__mulsf3_pse+0xa0>
    67ae:	88 23       	and	r24, r24
    67b0:	4a f0       	brmi	.+18     	; 0x67c4 <__mulsf3_pse+0x7a>
    67b2:	ee 0f       	add	r30, r30
    67b4:	ff 1f       	adc	r31, r31
    67b6:	bb 1f       	adc	r27, r27
    67b8:	66 1f       	adc	r22, r22
    67ba:	77 1f       	adc	r23, r23
    67bc:	88 1f       	adc	r24, r24
    67be:	91 50       	subi	r25, 0x01	; 1
    67c0:	50 40       	sbci	r21, 0x00	; 0
    67c2:	a9 f7       	brne	.-22     	; 0x67ae <__mulsf3_pse+0x64>
    67c4:	9e 3f       	cpi	r25, 0xFE	; 254
    67c6:	51 05       	cpc	r21, r1
    67c8:	80 f0       	brcs	.+32     	; 0x67ea <__mulsf3_pse+0xa0>
    67ca:	0c 94 ff 33 	jmp	0x67fe	; 0x67fe <__fp_inf>
    67ce:	0c 94 4a 34 	jmp	0x6894	; 0x6894 <__fp_szero>
    67d2:	5f 3f       	cpi	r21, 0xFF	; 255
    67d4:	e4 f3       	brlt	.-8      	; 0x67ce <__mulsf3_pse+0x84>
    67d6:	98 3e       	cpi	r25, 0xE8	; 232
    67d8:	d4 f3       	brlt	.-12     	; 0x67ce <__mulsf3_pse+0x84>
    67da:	86 95       	lsr	r24
    67dc:	77 95       	ror	r23
    67de:	67 95       	ror	r22
    67e0:	b7 95       	ror	r27
    67e2:	f7 95       	ror	r31
    67e4:	e7 95       	ror	r30
    67e6:	9f 5f       	subi	r25, 0xFF	; 255
    67e8:	c1 f7       	brne	.-16     	; 0x67da <__mulsf3_pse+0x90>
    67ea:	fe 2b       	or	r31, r30
    67ec:	88 0f       	add	r24, r24
    67ee:	91 1d       	adc	r25, r1
    67f0:	96 95       	lsr	r25
    67f2:	87 95       	ror	r24
    67f4:	97 f9       	bld	r25, 7
    67f6:	08 95       	ret

000067f8 <__ctype_isfalse>:
    67f8:	99 27       	eor	r25, r25
    67fa:	88 27       	eor	r24, r24

000067fc <__ctype_istrue>:
    67fc:	08 95       	ret

000067fe <__fp_inf>:
    67fe:	97 f9       	bld	r25, 7
    6800:	9f 67       	ori	r25, 0x7F	; 127
    6802:	80 e8       	ldi	r24, 0x80	; 128
    6804:	70 e0       	ldi	r23, 0x00	; 0
    6806:	60 e0       	ldi	r22, 0x00	; 0
    6808:	08 95       	ret

0000680a <__fp_nan>:
    680a:	9f ef       	ldi	r25, 0xFF	; 255
    680c:	80 ec       	ldi	r24, 0xC0	; 192
    680e:	08 95       	ret

00006810 <__fp_pscA>:
    6810:	00 24       	eor	r0, r0
    6812:	0a 94       	dec	r0
    6814:	16 16       	cp	r1, r22
    6816:	17 06       	cpc	r1, r23
    6818:	18 06       	cpc	r1, r24
    681a:	09 06       	cpc	r0, r25
    681c:	08 95       	ret

0000681e <__fp_pscB>:
    681e:	00 24       	eor	r0, r0
    6820:	0a 94       	dec	r0
    6822:	12 16       	cp	r1, r18
    6824:	13 06       	cpc	r1, r19
    6826:	14 06       	cpc	r1, r20
    6828:	05 06       	cpc	r0, r21
    682a:	08 95       	ret

0000682c <__fp_round>:
    682c:	09 2e       	mov	r0, r25
    682e:	03 94       	inc	r0
    6830:	00 0c       	add	r0, r0
    6832:	11 f4       	brne	.+4      	; 0x6838 <__fp_round+0xc>
    6834:	88 23       	and	r24, r24
    6836:	52 f0       	brmi	.+20     	; 0x684c <__fp_round+0x20>
    6838:	bb 0f       	add	r27, r27
    683a:	40 f4       	brcc	.+16     	; 0x684c <__fp_round+0x20>
    683c:	bf 2b       	or	r27, r31
    683e:	11 f4       	brne	.+4      	; 0x6844 <__fp_round+0x18>
    6840:	60 ff       	sbrs	r22, 0
    6842:	04 c0       	rjmp	.+8      	; 0x684c <__fp_round+0x20>
    6844:	6f 5f       	subi	r22, 0xFF	; 255
    6846:	7f 4f       	sbci	r23, 0xFF	; 255
    6848:	8f 4f       	sbci	r24, 0xFF	; 255
    684a:	9f 4f       	sbci	r25, 0xFF	; 255
    684c:	08 95       	ret

0000684e <__fp_split3>:
    684e:	57 fd       	sbrc	r21, 7
    6850:	90 58       	subi	r25, 0x80	; 128
    6852:	44 0f       	add	r20, r20
    6854:	55 1f       	adc	r21, r21
    6856:	59 f0       	breq	.+22     	; 0x686e <__fp_splitA+0x10>
    6858:	5f 3f       	cpi	r21, 0xFF	; 255
    685a:	71 f0       	breq	.+28     	; 0x6878 <__fp_splitA+0x1a>
    685c:	47 95       	ror	r20

0000685e <__fp_splitA>:
    685e:	88 0f       	add	r24, r24
    6860:	97 fb       	bst	r25, 7
    6862:	99 1f       	adc	r25, r25
    6864:	61 f0       	breq	.+24     	; 0x687e <__fp_splitA+0x20>
    6866:	9f 3f       	cpi	r25, 0xFF	; 255
    6868:	79 f0       	breq	.+30     	; 0x6888 <__fp_splitA+0x2a>
    686a:	87 95       	ror	r24
    686c:	08 95       	ret
    686e:	12 16       	cp	r1, r18
    6870:	13 06       	cpc	r1, r19
    6872:	14 06       	cpc	r1, r20
    6874:	55 1f       	adc	r21, r21
    6876:	f2 cf       	rjmp	.-28     	; 0x685c <__fp_split3+0xe>
    6878:	46 95       	lsr	r20
    687a:	f1 df       	rcall	.-30     	; 0x685e <__fp_splitA>
    687c:	08 c0       	rjmp	.+16     	; 0x688e <__fp_splitA+0x30>
    687e:	16 16       	cp	r1, r22
    6880:	17 06       	cpc	r1, r23
    6882:	18 06       	cpc	r1, r24
    6884:	99 1f       	adc	r25, r25
    6886:	f1 cf       	rjmp	.-30     	; 0x686a <__fp_splitA+0xc>
    6888:	86 95       	lsr	r24
    688a:	71 05       	cpc	r23, r1
    688c:	61 05       	cpc	r22, r1
    688e:	08 94       	sec
    6890:	08 95       	ret

00006892 <__fp_zero>:
    6892:	e8 94       	clt

00006894 <__fp_szero>:
    6894:	bb 27       	eor	r27, r27
    6896:	66 27       	eor	r22, r22
    6898:	77 27       	eor	r23, r23
    689a:	cb 01       	movw	r24, r22
    689c:	97 f9       	bld	r25, 7
    689e:	08 95       	ret

000068a0 <eeprom_read_byte>:
    68a0:	f9 99       	sbic	0x1f, 1	; 31
    68a2:	fe cf       	rjmp	.-4      	; 0x68a0 <eeprom_read_byte>
    68a4:	92 bd       	out	0x22, r25	; 34
    68a6:	81 bd       	out	0x21, r24	; 33
    68a8:	f8 9a       	sbi	0x1f, 0	; 31
    68aa:	99 27       	eor	r25, r25
    68ac:	80 b5       	in	r24, 0x20	; 32
    68ae:	08 95       	ret

000068b0 <eeprom_write_byte>:
    68b0:	26 2f       	mov	r18, r22

000068b2 <eeprom_write_r18>:
    68b2:	f9 99       	sbic	0x1f, 1	; 31
    68b4:	fe cf       	rjmp	.-4      	; 0x68b2 <eeprom_write_r18>
    68b6:	1f ba       	out	0x1f, r1	; 31
    68b8:	92 bd       	out	0x22, r25	; 34
    68ba:	81 bd       	out	0x21, r24	; 33
    68bc:	20 bd       	out	0x20, r18	; 32
    68be:	0f b6       	in	r0, 0x3f	; 63
    68c0:	f8 94       	cli
    68c2:	fa 9a       	sbi	0x1f, 2	; 31
    68c4:	f9 9a       	sbi	0x1f, 1	; 31
    68c6:	0f be       	out	0x3f, r0	; 63
    68c8:	01 96       	adiw	r24, 0x01	; 1
    68ca:	08 95       	ret

000068cc <__divmodsi4>:
    68cc:	05 2e       	mov	r0, r21
    68ce:	97 fb       	bst	r25, 7
    68d0:	1e f4       	brtc	.+6      	; 0x68d8 <__divmodsi4+0xc>
    68d2:	00 94       	com	r0
    68d4:	0e 94 7d 34 	call	0x68fa	; 0x68fa <__negsi2>
    68d8:	57 fd       	sbrc	r21, 7
    68da:	07 d0       	rcall	.+14     	; 0x68ea <__divmodsi4_neg2>
    68dc:	0e 94 cf 34 	call	0x699e	; 0x699e <__udivmodsi4>
    68e0:	07 fc       	sbrc	r0, 7
    68e2:	03 d0       	rcall	.+6      	; 0x68ea <__divmodsi4_neg2>
    68e4:	4e f4       	brtc	.+18     	; 0x68f8 <__divmodsi4_exit>
    68e6:	0c 94 7d 34 	jmp	0x68fa	; 0x68fa <__negsi2>

000068ea <__divmodsi4_neg2>:
    68ea:	50 95       	com	r21
    68ec:	40 95       	com	r20
    68ee:	30 95       	com	r19
    68f0:	21 95       	neg	r18
    68f2:	3f 4f       	sbci	r19, 0xFF	; 255
    68f4:	4f 4f       	sbci	r20, 0xFF	; 255
    68f6:	5f 4f       	sbci	r21, 0xFF	; 255

000068f8 <__divmodsi4_exit>:
    68f8:	08 95       	ret

000068fa <__negsi2>:
    68fa:	90 95       	com	r25
    68fc:	80 95       	com	r24
    68fe:	70 95       	com	r23
    6900:	61 95       	neg	r22
    6902:	7f 4f       	sbci	r23, 0xFF	; 255
    6904:	8f 4f       	sbci	r24, 0xFF	; 255
    6906:	9f 4f       	sbci	r25, 0xFF	; 255
    6908:	08 95       	ret

0000690a <__muluhisi3>:
    690a:	0e 94 f1 34 	call	0x69e2	; 0x69e2 <__umulhisi3>
    690e:	a5 9f       	mul	r26, r21
    6910:	90 0d       	add	r25, r0
    6912:	b4 9f       	mul	r27, r20
    6914:	90 0d       	add	r25, r0
    6916:	a4 9f       	mul	r26, r20
    6918:	80 0d       	add	r24, r0
    691a:	91 1d       	adc	r25, r1
    691c:	11 24       	eor	r1, r1
    691e:	08 95       	ret

00006920 <__mulshisi3>:
    6920:	b7 ff       	sbrs	r27, 7
    6922:	0c 94 85 34 	jmp	0x690a	; 0x690a <__muluhisi3>

00006926 <__mulohisi3>:
    6926:	0e 94 85 34 	call	0x690a	; 0x690a <__muluhisi3>
    692a:	82 1b       	sub	r24, r18
    692c:	93 0b       	sbc	r25, r19
    692e:	08 95       	ret

00006930 <__prologue_saves__>:
    6930:	2f 92       	push	r2
    6932:	3f 92       	push	r3
    6934:	4f 92       	push	r4
    6936:	5f 92       	push	r5
    6938:	6f 92       	push	r6
    693a:	7f 92       	push	r7
    693c:	8f 92       	push	r8
    693e:	9f 92       	push	r9
    6940:	af 92       	push	r10
    6942:	bf 92       	push	r11
    6944:	cf 92       	push	r12
    6946:	df 92       	push	r13
    6948:	ef 92       	push	r14
    694a:	ff 92       	push	r15
    694c:	0f 93       	push	r16
    694e:	1f 93       	push	r17
    6950:	cf 93       	push	r28
    6952:	df 93       	push	r29
    6954:	cd b7       	in	r28, 0x3d	; 61
    6956:	de b7       	in	r29, 0x3e	; 62
    6958:	ca 1b       	sub	r28, r26
    695a:	db 0b       	sbc	r29, r27
    695c:	0f b6       	in	r0, 0x3f	; 63
    695e:	f8 94       	cli
    6960:	de bf       	out	0x3e, r29	; 62
    6962:	0f be       	out	0x3f, r0	; 63
    6964:	cd bf       	out	0x3d, r28	; 61
    6966:	09 94       	ijmp

00006968 <__epilogue_restores__>:
    6968:	2a 88       	ldd	r2, Y+18	; 0x12
    696a:	39 88       	ldd	r3, Y+17	; 0x11
    696c:	48 88       	ldd	r4, Y+16	; 0x10
    696e:	5f 84       	ldd	r5, Y+15	; 0x0f
    6970:	6e 84       	ldd	r6, Y+14	; 0x0e
    6972:	7d 84       	ldd	r7, Y+13	; 0x0d
    6974:	8c 84       	ldd	r8, Y+12	; 0x0c
    6976:	9b 84       	ldd	r9, Y+11	; 0x0b
    6978:	aa 84       	ldd	r10, Y+10	; 0x0a
    697a:	b9 84       	ldd	r11, Y+9	; 0x09
    697c:	c8 84       	ldd	r12, Y+8	; 0x08
    697e:	df 80       	ldd	r13, Y+7	; 0x07
    6980:	ee 80       	ldd	r14, Y+6	; 0x06
    6982:	fd 80       	ldd	r15, Y+5	; 0x05
    6984:	0c 81       	ldd	r16, Y+4	; 0x04
    6986:	1b 81       	ldd	r17, Y+3	; 0x03
    6988:	aa 81       	ldd	r26, Y+2	; 0x02
    698a:	b9 81       	ldd	r27, Y+1	; 0x01
    698c:	ce 0f       	add	r28, r30
    698e:	d1 1d       	adc	r29, r1
    6990:	0f b6       	in	r0, 0x3f	; 63
    6992:	f8 94       	cli
    6994:	de bf       	out	0x3e, r29	; 62
    6996:	0f be       	out	0x3f, r0	; 63
    6998:	cd bf       	out	0x3d, r28	; 61
    699a:	ed 01       	movw	r28, r26
    699c:	08 95       	ret

0000699e <__udivmodsi4>:
    699e:	a1 e2       	ldi	r26, 0x21	; 33
    69a0:	1a 2e       	mov	r1, r26
    69a2:	aa 1b       	sub	r26, r26
    69a4:	bb 1b       	sub	r27, r27
    69a6:	fd 01       	movw	r30, r26
    69a8:	0d c0       	rjmp	.+26     	; 0x69c4 <__udivmodsi4_ep>

000069aa <__udivmodsi4_loop>:
    69aa:	aa 1f       	adc	r26, r26
    69ac:	bb 1f       	adc	r27, r27
    69ae:	ee 1f       	adc	r30, r30
    69b0:	ff 1f       	adc	r31, r31
    69b2:	a2 17       	cp	r26, r18
    69b4:	b3 07       	cpc	r27, r19
    69b6:	e4 07       	cpc	r30, r20
    69b8:	f5 07       	cpc	r31, r21
    69ba:	20 f0       	brcs	.+8      	; 0x69c4 <__udivmodsi4_ep>
    69bc:	a2 1b       	sub	r26, r18
    69be:	b3 0b       	sbc	r27, r19
    69c0:	e4 0b       	sbc	r30, r20
    69c2:	f5 0b       	sbc	r31, r21

000069c4 <__udivmodsi4_ep>:
    69c4:	66 1f       	adc	r22, r22
    69c6:	77 1f       	adc	r23, r23
    69c8:	88 1f       	adc	r24, r24
    69ca:	99 1f       	adc	r25, r25
    69cc:	1a 94       	dec	r1
    69ce:	69 f7       	brne	.-38     	; 0x69aa <__udivmodsi4_loop>
    69d0:	60 95       	com	r22
    69d2:	70 95       	com	r23
    69d4:	80 95       	com	r24
    69d6:	90 95       	com	r25
    69d8:	9b 01       	movw	r18, r22
    69da:	ac 01       	movw	r20, r24
    69dc:	bd 01       	movw	r22, r26
    69de:	cf 01       	movw	r24, r30
    69e0:	08 95       	ret

000069e2 <__umulhisi3>:
    69e2:	a2 9f       	mul	r26, r18
    69e4:	b0 01       	movw	r22, r0
    69e6:	b3 9f       	mul	r27, r19
    69e8:	c0 01       	movw	r24, r0
    69ea:	a3 9f       	mul	r26, r19
    69ec:	70 0d       	add	r23, r0
    69ee:	81 1d       	adc	r24, r1
    69f0:	11 24       	eor	r1, r1
    69f2:	91 1d       	adc	r25, r1
    69f4:	b2 9f       	mul	r27, r18
    69f6:	70 0d       	add	r23, r0
    69f8:	81 1d       	adc	r24, r1
    69fa:	11 24       	eor	r1, r1
    69fc:	91 1d       	adc	r25, r1
    69fe:	08 95       	ret

00006a00 <__mulsi3>:
    6a00:	db 01       	movw	r26, r22
    6a02:	8f 93       	push	r24
    6a04:	9f 93       	push	r25
    6a06:	0e 94 85 34 	call	0x690a	; 0x690a <__muluhisi3>
    6a0a:	bf 91       	pop	r27
    6a0c:	af 91       	pop	r26
    6a0e:	a2 9f       	mul	r26, r18
    6a10:	80 0d       	add	r24, r0
    6a12:	91 1d       	adc	r25, r1
    6a14:	a3 9f       	mul	r26, r19
    6a16:	90 0d       	add	r25, r0
    6a18:	b2 9f       	mul	r27, r18
    6a1a:	90 0d       	add	r25, r0
    6a1c:	11 24       	eor	r1, r1
    6a1e:	08 95       	ret

00006a20 <__udivmodhi4>:
    6a20:	aa 1b       	sub	r26, r26
    6a22:	bb 1b       	sub	r27, r27
    6a24:	51 e1       	ldi	r21, 0x11	; 17
    6a26:	07 c0       	rjmp	.+14     	; 0x6a36 <__udivmodhi4_ep>

00006a28 <__udivmodhi4_loop>:
    6a28:	aa 1f       	adc	r26, r26
    6a2a:	bb 1f       	adc	r27, r27
    6a2c:	a6 17       	cp	r26, r22
    6a2e:	b7 07       	cpc	r27, r23
    6a30:	10 f0       	brcs	.+4      	; 0x6a36 <__udivmodhi4_ep>
    6a32:	a6 1b       	sub	r26, r22
    6a34:	b7 0b       	sbc	r27, r23

00006a36 <__udivmodhi4_ep>:
    6a36:	88 1f       	adc	r24, r24
    6a38:	99 1f       	adc	r25, r25
    6a3a:	5a 95       	dec	r21
    6a3c:	a9 f7       	brne	.-22     	; 0x6a28 <__udivmodhi4_loop>
    6a3e:	80 95       	com	r24
    6a40:	90 95       	com	r25
    6a42:	bc 01       	movw	r22, r24
    6a44:	cd 01       	movw	r24, r26
    6a46:	08 95       	ret

00006a48 <__divmodhi4>:
    6a48:	97 fb       	bst	r25, 7
    6a4a:	07 2e       	mov	r0, r23
    6a4c:	16 f4       	brtc	.+4      	; 0x6a52 <__divmodhi4+0xa>
    6a4e:	00 94       	com	r0
    6a50:	07 d0       	rcall	.+14     	; 0x6a60 <__divmodhi4_neg1>
    6a52:	77 fd       	sbrc	r23, 7
    6a54:	09 d0       	rcall	.+18     	; 0x6a68 <__divmodhi4_neg2>
    6a56:	0e 94 10 35 	call	0x6a20	; 0x6a20 <__udivmodhi4>
    6a5a:	07 fc       	sbrc	r0, 7
    6a5c:	05 d0       	rcall	.+10     	; 0x6a68 <__divmodhi4_neg2>
    6a5e:	3e f4       	brtc	.+14     	; 0x6a6e <__divmodhi4_exit>

00006a60 <__divmodhi4_neg1>:
    6a60:	90 95       	com	r25
    6a62:	81 95       	neg	r24
    6a64:	9f 4f       	sbci	r25, 0xFF	; 255
    6a66:	08 95       	ret

00006a68 <__divmodhi4_neg2>:
    6a68:	70 95       	com	r23
    6a6a:	61 95       	neg	r22
    6a6c:	7f 4f       	sbci	r23, 0xFF	; 255

00006a6e <__divmodhi4_exit>:
    6a6e:	08 95       	ret

00006a70 <__tablejump2__>:
    6a70:	ee 0f       	add	r30, r30
    6a72:	ff 1f       	adc	r31, r31
    6a74:	05 90       	lpm	r0, Z+
    6a76:	f4 91       	lpm	r31, Z
    6a78:	e0 2d       	mov	r30, r0
    6a7a:	09 94       	ijmp

00006a7c <__parityhi2>:
    6a7c:	89 27       	eor	r24, r25

00006a7e <__parityqi2>:
    6a7e:	08 2e       	mov	r0, r24
    6a80:	02 94       	swap	r0
    6a82:	80 25       	eor	r24, r0
    6a84:	8c 5f       	subi	r24, 0xFC	; 252
    6a86:	8b 7f       	andi	r24, 0xFB	; 251
    6a88:	8a 5f       	subi	r24, 0xFA	; 250
    6a8a:	83 fd       	sbrc	r24, 3
    6a8c:	83 95       	inc	r24
    6a8e:	81 70       	andi	r24, 0x01	; 1
    6a90:	99 27       	eor	r25, r25
    6a92:	08 95       	ret

00006a94 <__adddi3>:
    6a94:	2a 0d       	add	r18, r10
    6a96:	3b 1d       	adc	r19, r11
    6a98:	4c 1d       	adc	r20, r12
    6a9a:	5d 1d       	adc	r21, r13
    6a9c:	6e 1d       	adc	r22, r14
    6a9e:	7f 1d       	adc	r23, r15
    6aa0:	80 1f       	adc	r24, r16
    6aa2:	91 1f       	adc	r25, r17
    6aa4:	08 95       	ret

00006aa6 <__cmpdi2>:
    6aa6:	2a 15       	cp	r18, r10
    6aa8:	3b 05       	cpc	r19, r11
    6aaa:	4c 05       	cpc	r20, r12
    6aac:	5d 05       	cpc	r21, r13
    6aae:	6e 05       	cpc	r22, r14
    6ab0:	7f 05       	cpc	r23, r15
    6ab2:	80 07       	cpc	r24, r16
    6ab4:	91 07       	cpc	r25, r17
    6ab6:	08 95       	ret

00006ab8 <__gesf2>:
    6ab8:	0e 94 6b 33 	call	0x66d6	; 0x66d6 <__fp_cmp>
    6abc:	08 f4       	brcc	.+2      	; 0x6ac0 <__gesf2+0x8>
    6abe:	8f ef       	ldi	r24, 0xFF	; 255
    6ac0:	08 95       	ret

00006ac2 <realloc>:
    6ac2:	b0 e0       	ldi	r27, 0x00	; 0
    6ac4:	a0 e0       	ldi	r26, 0x00	; 0
    6ac6:	e7 e6       	ldi	r30, 0x67	; 103
    6ac8:	f5 e3       	ldi	r31, 0x35	; 53
    6aca:	0c 94 9a 34 	jmp	0x6934	; 0x6934 <__prologue_saves__+0x4>
    6ace:	8c 01       	movw	r16, r24
    6ad0:	00 97       	sbiw	r24, 0x00	; 0
    6ad2:	51 f4       	brne	.+20     	; 0x6ae8 <realloc+0x26>
    6ad4:	cb 01       	movw	r24, r22
    6ad6:	0e 94 16 30 	call	0x602c	; 0x602c <malloc>
    6ada:	8c 01       	movw	r16, r24
    6adc:	c8 01       	movw	r24, r16
    6ade:	cd b7       	in	r28, 0x3d	; 61
    6ae0:	de b7       	in	r29, 0x3e	; 62
    6ae2:	e0 e1       	ldi	r30, 0x10	; 16
    6ae4:	0c 94 b6 34 	jmp	0x696c	; 0x696c <__epilogue_restores__+0x4>
    6ae8:	fc 01       	movw	r30, r24
    6aea:	e6 0f       	add	r30, r22
    6aec:	f7 1f       	adc	r31, r23
    6aee:	9c 01       	movw	r18, r24
    6af0:	22 50       	subi	r18, 0x02	; 2
    6af2:	31 09       	sbc	r19, r1
    6af4:	e2 17       	cp	r30, r18
    6af6:	f3 07       	cpc	r31, r19
    6af8:	08 f4       	brcc	.+2      	; 0x6afc <realloc+0x3a>
    6afa:	9d c0       	rjmp	.+314    	; 0x6c36 <realloc+0x174>
    6afc:	d9 01       	movw	r26, r18
    6afe:	cd 91       	ld	r28, X+
    6b00:	dc 91       	ld	r29, X
    6b02:	11 97       	sbiw	r26, 0x01	; 1
    6b04:	c6 17       	cp	r28, r22
    6b06:	d7 07       	cpc	r29, r23
    6b08:	98 f0       	brcs	.+38     	; 0x6b30 <realloc+0x6e>
    6b0a:	c5 30       	cpi	r28, 0x05	; 5
    6b0c:	d1 05       	cpc	r29, r1
    6b0e:	30 f3       	brcs	.-52     	; 0x6adc <realloc+0x1a>
    6b10:	ce 01       	movw	r24, r28
    6b12:	04 97       	sbiw	r24, 0x04	; 4
    6b14:	86 17       	cp	r24, r22
    6b16:	97 07       	cpc	r25, r23
    6b18:	08 f3       	brcs	.-62     	; 0x6adc <realloc+0x1a>
    6b1a:	c6 1b       	sub	r28, r22
    6b1c:	d7 0b       	sbc	r29, r23
    6b1e:	22 97       	sbiw	r28, 0x02	; 2
    6b20:	c1 93       	st	Z+, r28
    6b22:	d1 93       	st	Z+, r29
    6b24:	6d 93       	st	X+, r22
    6b26:	7c 93       	st	X, r23
    6b28:	cf 01       	movw	r24, r30
    6b2a:	0e 94 b2 30 	call	0x6164	; 0x6164 <free>
    6b2e:	d6 cf       	rjmp	.-84     	; 0x6adc <realloc+0x1a>
    6b30:	5b 01       	movw	r10, r22
    6b32:	ac 1a       	sub	r10, r28
    6b34:	bd 0a       	sbc	r11, r29
    6b36:	4c 01       	movw	r8, r24
    6b38:	8c 0e       	add	r8, r28
    6b3a:	9d 1e       	adc	r9, r29
    6b3c:	a0 91 2d 06 	lds	r26, 0x062D	; 0x80062d <__flp>
    6b40:	b0 91 2e 06 	lds	r27, 0x062E	; 0x80062e <__flp+0x1>
    6b44:	51 2c       	mov	r5, r1
    6b46:	41 2c       	mov	r4, r1
    6b48:	f1 2c       	mov	r15, r1
    6b4a:	e1 2c       	mov	r14, r1
    6b4c:	10 97       	sbiw	r26, 0x00	; 0
    6b4e:	31 f5       	brne	.+76     	; 0x6b9c <realloc+0xda>
    6b50:	80 91 2b 06 	lds	r24, 0x062B	; 0x80062b <__brkval>
    6b54:	90 91 2c 06 	lds	r25, 0x062C	; 0x80062c <__brkval+0x1>
    6b58:	88 15       	cp	r24, r8
    6b5a:	99 05       	cpc	r25, r9
    6b5c:	09 f0       	breq	.+2      	; 0x6b60 <realloc+0x9e>
    6b5e:	5c c0       	rjmp	.+184    	; 0x6c18 <realloc+0x156>
    6b60:	46 16       	cp	r4, r22
    6b62:	57 06       	cpc	r5, r23
    6b64:	08 f0       	brcs	.+2      	; 0x6b68 <realloc+0xa6>
    6b66:	58 c0       	rjmp	.+176    	; 0x6c18 <realloc+0x156>
    6b68:	80 91 25 01 	lds	r24, 0x0125	; 0x800125 <__malloc_heap_end>
    6b6c:	90 91 26 01 	lds	r25, 0x0126	; 0x800126 <__malloc_heap_end+0x1>
    6b70:	00 97       	sbiw	r24, 0x00	; 0
    6b72:	41 f4       	brne	.+16     	; 0x6b84 <realloc+0xc2>
    6b74:	8d b7       	in	r24, 0x3d	; 61
    6b76:	9e b7       	in	r25, 0x3e	; 62
    6b78:	40 91 29 01 	lds	r20, 0x0129	; 0x800129 <__malloc_margin>
    6b7c:	50 91 2a 01 	lds	r21, 0x012A	; 0x80012a <__malloc_margin+0x1>
    6b80:	84 1b       	sub	r24, r20
    6b82:	95 0b       	sbc	r25, r21
    6b84:	e8 17       	cp	r30, r24
    6b86:	f9 07       	cpc	r31, r25
    6b88:	08 f0       	brcs	.+2      	; 0x6b8c <realloc+0xca>
    6b8a:	55 c0       	rjmp	.+170    	; 0x6c36 <realloc+0x174>
    6b8c:	f0 93 2c 06 	sts	0x062C, r31	; 0x80062c <__brkval+0x1>
    6b90:	e0 93 2b 06 	sts	0x062B, r30	; 0x80062b <__brkval>
    6b94:	f9 01       	movw	r30, r18
    6b96:	71 83       	std	Z+1, r23	; 0x01
    6b98:	60 83       	st	Z, r22
    6b9a:	a0 cf       	rjmp	.-192    	; 0x6adc <realloc+0x1a>
    6b9c:	8d 91       	ld	r24, X+
    6b9e:	9c 91       	ld	r25, X
    6ba0:	11 97       	sbiw	r26, 0x01	; 1
    6ba2:	12 96       	adiw	r26, 0x02	; 2
    6ba4:	6c 90       	ld	r6, X
    6ba6:	12 97       	sbiw	r26, 0x02	; 2
    6ba8:	13 96       	adiw	r26, 0x03	; 3
    6baa:	7c 90       	ld	r7, X
    6bac:	13 97       	sbiw	r26, 0x03	; 3
    6bae:	a8 15       	cp	r26, r8
    6bb0:	b9 05       	cpc	r27, r9
    6bb2:	59 f5       	brne	.+86     	; 0x6c0a <realloc+0x148>
    6bb4:	6c 01       	movw	r12, r24
    6bb6:	42 e0       	ldi	r20, 0x02	; 2
    6bb8:	c4 0e       	add	r12, r20
    6bba:	d1 1c       	adc	r13, r1
    6bbc:	ca 14       	cp	r12, r10
    6bbe:	db 04       	cpc	r13, r11
    6bc0:	20 f1       	brcs	.+72     	; 0x6c0a <realloc+0x148>
    6bc2:	ac 01       	movw	r20, r24
    6bc4:	4a 19       	sub	r20, r10
    6bc6:	5b 09       	sbc	r21, r11
    6bc8:	da 01       	movw	r26, r20
    6bca:	12 96       	adiw	r26, 0x02	; 2
    6bcc:	15 97       	sbiw	r26, 0x05	; 5
    6bce:	80 f0       	brcs	.+32     	; 0x6bf0 <realloc+0x12e>
    6bd0:	62 82       	std	Z+2, r6	; 0x02
    6bd2:	73 82       	std	Z+3, r7	; 0x03
    6bd4:	51 83       	std	Z+1, r21	; 0x01
    6bd6:	40 83       	st	Z, r20
    6bd8:	d9 01       	movw	r26, r18
    6bda:	6d 93       	st	X+, r22
    6bdc:	7c 93       	st	X, r23
    6bde:	e1 14       	cp	r14, r1
    6be0:	f1 04       	cpc	r15, r1
    6be2:	71 f0       	breq	.+28     	; 0x6c00 <realloc+0x13e>
    6be4:	d7 01       	movw	r26, r14
    6be6:	13 96       	adiw	r26, 0x03	; 3
    6be8:	fc 93       	st	X, r31
    6bea:	ee 93       	st	-X, r30
    6bec:	12 97       	sbiw	r26, 0x02	; 2
    6bee:	76 cf       	rjmp	.-276    	; 0x6adc <realloc+0x1a>
    6bf0:	22 96       	adiw	r28, 0x02	; 2
    6bf2:	8c 0f       	add	r24, r28
    6bf4:	9d 1f       	adc	r25, r29
    6bf6:	f9 01       	movw	r30, r18
    6bf8:	91 83       	std	Z+1, r25	; 0x01
    6bfa:	80 83       	st	Z, r24
    6bfc:	f3 01       	movw	r30, r6
    6bfe:	ef cf       	rjmp	.-34     	; 0x6bde <realloc+0x11c>
    6c00:	f0 93 2e 06 	sts	0x062E, r31	; 0x80062e <__flp+0x1>
    6c04:	e0 93 2d 06 	sts	0x062D, r30	; 0x80062d <__flp>
    6c08:	69 cf       	rjmp	.-302    	; 0x6adc <realloc+0x1a>
    6c0a:	48 16       	cp	r4, r24
    6c0c:	59 06       	cpc	r5, r25
    6c0e:	08 f4       	brcc	.+2      	; 0x6c12 <realloc+0x150>
    6c10:	2c 01       	movw	r4, r24
    6c12:	7d 01       	movw	r14, r26
    6c14:	d3 01       	movw	r26, r6
    6c16:	9a cf       	rjmp	.-204    	; 0x6b4c <realloc+0x8a>
    6c18:	cb 01       	movw	r24, r22
    6c1a:	0e 94 16 30 	call	0x602c	; 0x602c <malloc>
    6c1e:	7c 01       	movw	r14, r24
    6c20:	00 97       	sbiw	r24, 0x00	; 0
    6c22:	49 f0       	breq	.+18     	; 0x6c36 <realloc+0x174>
    6c24:	ae 01       	movw	r20, r28
    6c26:	b8 01       	movw	r22, r16
    6c28:	0e 94 1e 36 	call	0x6c3c	; 0x6c3c <memcpy>
    6c2c:	c8 01       	movw	r24, r16
    6c2e:	0e 94 b2 30 	call	0x6164	; 0x6164 <free>
    6c32:	87 01       	movw	r16, r14
    6c34:	53 cf       	rjmp	.-346    	; 0x6adc <realloc+0x1a>
    6c36:	10 e0       	ldi	r17, 0x00	; 0
    6c38:	00 e0       	ldi	r16, 0x00	; 0
    6c3a:	50 cf       	rjmp	.-352    	; 0x6adc <realloc+0x1a>

00006c3c <memcpy>:
    6c3c:	fb 01       	movw	r30, r22
    6c3e:	dc 01       	movw	r26, r24
    6c40:	02 c0       	rjmp	.+4      	; 0x6c46 <memcpy+0xa>
    6c42:	01 90       	ld	r0, Z+
    6c44:	0d 92       	st	X+, r0
    6c46:	41 50       	subi	r20, 0x01	; 1
    6c48:	50 40       	sbci	r21, 0x00	; 0
    6c4a:	d8 f7       	brcc	.-10     	; 0x6c42 <memcpy+0x6>
    6c4c:	08 95       	ret

00006c4e <strcpy>:
    6c4e:	fb 01       	movw	r30, r22
    6c50:	dc 01       	movw	r26, r24
    6c52:	01 90       	ld	r0, Z+
    6c54:	0d 92       	st	X+, r0
    6c56:	00 20       	and	r0, r0
    6c58:	e1 f7       	brne	.-8      	; 0x6c52 <strcpy+0x4>
    6c5a:	08 95       	ret

00006c5c <__do_global_dtors>:
    6c5c:	16 e0       	ldi	r17, 0x06	; 6
    6c5e:	c8 e4       	ldi	r28, 0x48	; 72
    6c60:	d6 e0       	ldi	r29, 0x06	; 6
    6c62:	04 c0       	rjmp	.+8      	; 0x6c6c <__do_global_dtors+0x10>
    6c64:	fe 01       	movw	r30, r28
    6c66:	0e 94 38 35 	call	0x6a70	; 0x6a70 <__tablejump2__>
    6c6a:	21 96       	adiw	r28, 0x01	; 1
    6c6c:	c9 34       	cpi	r28, 0x49	; 73
    6c6e:	d1 07       	cpc	r29, r17
    6c70:	c9 f7       	brne	.-14     	; 0x6c64 <__do_global_dtors+0x8>
    6c72:	f8 94       	cli

00006c74 <__stop_program>:
    6c74:	ff cf       	rjmp	.-2      	; 0x6c74 <__stop_program>
