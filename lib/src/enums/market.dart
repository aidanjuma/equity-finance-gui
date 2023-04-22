// ignore_for_file: constant_identifier_names
import 'package:hive/hive.dart';

part 'market.g.dart';

@HiveType(typeId: 7)
enum Market {
  @HiveField(1)
  NYSE,

  @HiveField(2)
  NASDAQ,

  @HiveField(3)
  TPE,

  @HiveField(4)
  KPX,

  @HiveField(5)
  BVMF,

  @HiveField(6)
  SHA,

  @HiveField(7)
  IDX,

  @HiveField(8)
  WSE,

  @HiveField(9)
  ETR,

  @HiveField(10)
  IST,

  @HiveField(11)
  NZE,

  @HiveField(12)
  LON,

  @HiveField(13)
  TYO,

  @HiveField(14)
  HKG,

  @HiveField(15)
  NSE,

  @HiveField(16)
  KLSE,

  @HiveField(17)
  SHE,

  @HiveField(18)
  ASX,

  @HiveField(19)
  BIT,

  @HiveField(20)
  BKK,

  @HiveField(21)
  TSE,

  @HiveField(22)
  TADAWUL,

  @HiveField(23)
  TLV,

  @HiveField(24)
  STO,

  @HiveField(25)
  CVE,

  @HiveField(26)
  CPH,

  @HiveField(27)
  SGX,

  @HiveField(28)
  CNSX,

  @HiveField(29)
  AMS,

  @HiveField(30)
  FRA,

  @HiveField(31)
  EPA,

  @HiveField(32)
  SWX,

  @HiveField(33)
  HEL,

  @HiveField(34)
  KOSDAQ,

  @HiveField(35)
  BOM,

  @HiveField(36)
  BME,

  @HiveField(37)
  JSE,

  @HiveField(38)
  BMV,

  @HiveField(39)
  BCBA,

  @HiveField(40)
  VIE,

  @HiveField(41)
  EBR,

  @HiveField(42)
  ELI,

  @HiveField(43)
  ICE,

  @HiveField(44)
  TAL,

  @HiveField(45)
  VSE,

  @HiveField(46)
  OTCMKTS,

  @HiveField(47)
  NYSEARCA,

  @HiveField(48)
  NYSEAMERICAN,

  @HiveField(49)
  MUTF,

  @HiveField(50)
  MUTF_IN,

  @HiveField(51)
  BATS,

  @HiveField(52)
  CBOT,

  @HiveField(53)
  CME_EMINIS,

  @HiveField(54)
  NYMEX,
}
