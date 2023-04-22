// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MarketAdapter extends TypeAdapter<Market> {
  @override
  final int typeId = 7;

  @override
  Market read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return Market.NYSE;
      case 2:
        return Market.NASDAQ;
      case 3:
        return Market.TPE;
      case 4:
        return Market.KPX;
      case 5:
        return Market.BVMF;
      case 6:
        return Market.SHA;
      case 7:
        return Market.IDX;
      case 8:
        return Market.WSE;
      case 9:
        return Market.ETR;
      case 10:
        return Market.IST;
      case 11:
        return Market.NZE;
      case 12:
        return Market.LON;
      case 13:
        return Market.TYO;
      case 14:
        return Market.HKG;
      case 15:
        return Market.NSE;
      case 16:
        return Market.KLSE;
      case 17:
        return Market.SHE;
      case 18:
        return Market.ASX;
      case 19:
        return Market.BIT;
      case 20:
        return Market.BKK;
      case 21:
        return Market.TSE;
      case 22:
        return Market.TADAWUL;
      case 23:
        return Market.TLV;
      case 24:
        return Market.STO;
      case 25:
        return Market.CVE;
      case 26:
        return Market.CPH;
      case 27:
        return Market.SGX;
      case 28:
        return Market.CNSX;
      case 29:
        return Market.AMS;
      case 30:
        return Market.FRA;
      case 31:
        return Market.EPA;
      case 32:
        return Market.SWX;
      case 33:
        return Market.HEL;
      case 34:
        return Market.KOSDAQ;
      case 35:
        return Market.BOM;
      case 36:
        return Market.BME;
      case 37:
        return Market.JSE;
      case 38:
        return Market.BMV;
      case 39:
        return Market.BCBA;
      case 40:
        return Market.VIE;
      case 41:
        return Market.EBR;
      case 42:
        return Market.ELI;
      case 43:
        return Market.ICE;
      case 44:
        return Market.TAL;
      case 45:
        return Market.VSE;
      case 46:
        return Market.OTCMKTS;
      case 47:
        return Market.NYSEARCA;
      case 48:
        return Market.NYSEAMERICAN;
      case 49:
        return Market.MUTF;
      case 50:
        return Market.MUTF_IN;
      case 51:
        return Market.BATS;
      case 52:
        return Market.CBOT;
      case 53:
        return Market.CME_EMINIS;
      case 54:
        return Market.NYMEX;
      default:
        return Market.NYSE;
    }
  }

  @override
  void write(BinaryWriter writer, Market obj) {
    switch (obj) {
      case Market.NYSE:
        writer.writeByte(1);
        break;
      case Market.NASDAQ:
        writer.writeByte(2);
        break;
      case Market.TPE:
        writer.writeByte(3);
        break;
      case Market.KPX:
        writer.writeByte(4);
        break;
      case Market.BVMF:
        writer.writeByte(5);
        break;
      case Market.SHA:
        writer.writeByte(6);
        break;
      case Market.IDX:
        writer.writeByte(7);
        break;
      case Market.WSE:
        writer.writeByte(8);
        break;
      case Market.ETR:
        writer.writeByte(9);
        break;
      case Market.IST:
        writer.writeByte(10);
        break;
      case Market.NZE:
        writer.writeByte(11);
        break;
      case Market.LON:
        writer.writeByte(12);
        break;
      case Market.TYO:
        writer.writeByte(13);
        break;
      case Market.HKG:
        writer.writeByte(14);
        break;
      case Market.NSE:
        writer.writeByte(15);
        break;
      case Market.KLSE:
        writer.writeByte(16);
        break;
      case Market.SHE:
        writer.writeByte(17);
        break;
      case Market.ASX:
        writer.writeByte(18);
        break;
      case Market.BIT:
        writer.writeByte(19);
        break;
      case Market.BKK:
        writer.writeByte(20);
        break;
      case Market.TSE:
        writer.writeByte(21);
        break;
      case Market.TADAWUL:
        writer.writeByte(22);
        break;
      case Market.TLV:
        writer.writeByte(23);
        break;
      case Market.STO:
        writer.writeByte(24);
        break;
      case Market.CVE:
        writer.writeByte(25);
        break;
      case Market.CPH:
        writer.writeByte(26);
        break;
      case Market.SGX:
        writer.writeByte(27);
        break;
      case Market.CNSX:
        writer.writeByte(28);
        break;
      case Market.AMS:
        writer.writeByte(29);
        break;
      case Market.FRA:
        writer.writeByte(30);
        break;
      case Market.EPA:
        writer.writeByte(31);
        break;
      case Market.SWX:
        writer.writeByte(32);
        break;
      case Market.HEL:
        writer.writeByte(33);
        break;
      case Market.KOSDAQ:
        writer.writeByte(34);
        break;
      case Market.BOM:
        writer.writeByte(35);
        break;
      case Market.BME:
        writer.writeByte(36);
        break;
      case Market.JSE:
        writer.writeByte(37);
        break;
      case Market.BMV:
        writer.writeByte(38);
        break;
      case Market.BCBA:
        writer.writeByte(39);
        break;
      case Market.VIE:
        writer.writeByte(40);
        break;
      case Market.EBR:
        writer.writeByte(41);
        break;
      case Market.ELI:
        writer.writeByte(42);
        break;
      case Market.ICE:
        writer.writeByte(43);
        break;
      case Market.TAL:
        writer.writeByte(44);
        break;
      case Market.VSE:
        writer.writeByte(45);
        break;
      case Market.OTCMKTS:
        writer.writeByte(46);
        break;
      case Market.NYSEARCA:
        writer.writeByte(47);
        break;
      case Market.NYSEAMERICAN:
        writer.writeByte(48);
        break;
      case Market.MUTF:
        writer.writeByte(49);
        break;
      case Market.MUTF_IN:
        writer.writeByte(50);
        break;
      case Market.BATS:
        writer.writeByte(51);
        break;
      case Market.CBOT:
        writer.writeByte(52);
        break;
      case Market.CME_EMINIS:
        writer.writeByte(53);
        break;
      case Market.NYMEX:
        writer.writeByte(54);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarketAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
