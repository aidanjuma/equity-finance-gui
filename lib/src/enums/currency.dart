// Type: Currency (enum: ISO4217 codes)
// ignore_for_file: constant_identifier_names

import 'package:hive/hive.dart';

part 'currency.g.dart';

@HiveType(typeId: 2)
enum Currency {
  @HiveField(0)
  AED,

  @HiveField(1)
  AFN,

  @HiveField(2)
  ALL,

  @HiveField(3)
  AMD,

  @HiveField(4)
  ANG,

  @HiveField(5)
  AOA,

  @HiveField(6)
  ARS,

  @HiveField(7)
  AUD,

  @HiveField(8)
  AWG,

  @HiveField(9)
  AZN,

  @HiveField(10)
  BAM,

  @HiveField(11)
  BBD,

  @HiveField(12)
  BDT,

  @HiveField(13)
  BGN,

  @HiveField(14)
  BHD,

  @HiveField(15)
  BIF,

  @HiveField(16)
  BMD,

  @HiveField(17)
  BND,

  @HiveField(18)
  BOB,

  @HiveField(19)
  BRL,

  @HiveField(20)
  BSD,

  @HiveField(21)
  BTN,

  @HiveField(22)
  BWP,

  @HiveField(23)
  BYN,

  @HiveField(24)
  BZD,

  @HiveField(25)
  CAD,

  @HiveField(26)
  CDF,

  @HiveField(27)
  CHF,

  @HiveField(28)
  CLP,

  @HiveField(29)
  CNY,

  @HiveField(30)
  COP,

  @HiveField(31)
  CRC,

  @HiveField(32)
  CUC,

  @HiveField(33)
  CUP,

  @HiveField(34)
  CVE,

  @HiveField(35)
  CZK,

  @HiveField(36)
  DJF,

  @HiveField(37)
  DKK,

  @HiveField(38)
  DOP,

  @HiveField(39)
  DZD,

  @HiveField(40)
  EGP,

  @HiveField(41)
  ERN,

  @HiveField(42)
  ETB,

  @HiveField(43)
  EUR,

  @HiveField(44)
  FJD,

  @HiveField(45)
  FKP,

  @HiveField(46)
  GBP,

  @HiveField(47)
  GEL,

  @HiveField(48)
  GGP,

  @HiveField(49)
  GHS,

  @HiveField(50)
  GIP,

  @HiveField(51)
  GMD,

  @HiveField(52)
  GNF,

  @HiveField(53)
  GTQ,

  @HiveField(54)
  GYD,

  @HiveField(55)
  HKD,

  @HiveField(56)
  HNL,

  @HiveField(57)
  HRK,

  @HiveField(58)
  HTG,

  @HiveField(59)
  HUF,

  @HiveField(60)
  IDR,

  @HiveField(61)
  ILS,

  @HiveField(62)
  IMP,

  @HiveField(63)
  INR,

  @HiveField(64)
  IQD,

  @HiveField(65)
  IRR,

  @HiveField(66)
  ISK,

  @HiveField(67)
  JEP,

  @HiveField(68)
  JMD,

  @HiveField(69)
  JOD,

  @HiveField(70)
  JPY,

  @HiveField(71)
  KES,

  @HiveField(72)
  KGS,

  @HiveField(73)
  KHR,

  @HiveField(74)
  KMF,

  @HiveField(75)
  KPW,

  @HiveField(76)
  KRW,

  @HiveField(77)
  KWD,

  @HiveField(78)
  KYD,

  @HiveField(79)
  KZT,

  @HiveField(80)
  LAK,

  @HiveField(81)
  LBP,

  @HiveField(82)
  LKR,

  @HiveField(83)
  LRD,

  @HiveField(84)
  LSL,

  @HiveField(85)
  LYD,

  @HiveField(86)
  MAD,

  @HiveField(87)
  MDL,

  @HiveField(88)
  MGA,

  @HiveField(89)
  MKD,

  @HiveField(90)
  MMK,

  @HiveField(91)
  MNT,

  @HiveField(92)
  MOP,

  @HiveField(93)
  MRU,

  @HiveField(94)
  MUR,

  @HiveField(95)
  MVR,

  @HiveField(96)
  MWK,

  @HiveField(97)
  MXN,

  @HiveField(98)
  MYR,

  @HiveField(99)
  MZN,

  @HiveField(100)
  NAD,

  @HiveField(101)
  NGN,

  @HiveField(102)
  NIO,

  @HiveField(103)
  NOK,

  @HiveField(104)
  NPR,

  @HiveField(105)
  NZD,

  @HiveField(106)
  OMR,

  @HiveField(107)
  PAB,

  @HiveField(108)
  PEN,

  @HiveField(109)
  PGK,

  @HiveField(110)
  PHP,

  @HiveField(111)
  PKR,

  @HiveField(112)
  PLN,

  @HiveField(113)
  PYG,

  @HiveField(114)
  QAR,

  @HiveField(115)
  RON,

  @HiveField(116)
  RSD,

  @HiveField(117)
  RUB,

  @HiveField(118)
  RWF,

  @HiveField(119)
  SAR,

  @HiveField(120)
  SBD,

  @HiveField(121)
  SCR,

  @HiveField(122)
  SDG,

  @HiveField(123)
  SEK,

  @HiveField(124)
  SGD,

  @HiveField(125)
  SHP,

  @HiveField(126)
  SLL,

  @HiveField(127)
  SOS,

  @HiveField(128)
  SPL,

  @HiveField(129)
  SRD,

  @HiveField(130)
  STN,

  @HiveField(131)
  SVC,

  @HiveField(132)
  SYP,

  @HiveField(133)
  SZL,

  @HiveField(134)
  THB,

  @HiveField(135)
  TJS,

  @HiveField(136)
  TMT,

  @HiveField(137)
  TND,

  @HiveField(138)
  TOP,

  @HiveField(139)
  TRY,

  @HiveField(140)
  TTD,

  @HiveField(141)
  TVD,

  @HiveField(142)
  TWD,

  @HiveField(143)
  TZS,

  @HiveField(144)
  UAH,

  @HiveField(145)
  UGX,

  @HiveField(146)
  USD,

  @HiveField(147)
  UYU,

  @HiveField(148)
  UZS,

  @HiveField(149)
  VEF,

  @HiveField(150)
  VND,

  @HiveField(151)
  VUV,

  @HiveField(152)
  WST,

  @HiveField(153)
  XAF,

  @HiveField(154)
  XCD,

  @HiveField(155)
  XDR,

  @HiveField(156)
  XOF,

  @HiveField(157)
  XPF,

  @HiveField(158)
  YER,

  @HiveField(159)
  ZAR,

  @HiveField(160)
  ZMW,

  @HiveField(161)
  ZWD;
}
