import 'package:hive/hive.dart';
import '../enums/appearance.dart';
import '../enums/currency.dart';

part 'settings.g.dart';

@HiveType(typeId: 0)
class Settings extends HiveObject {
  // Appearance: Light, Dark or System.
  @HiveField(0)
  Appearance theme;

  // Default Currency: Compare asset values to this currency.
  @HiveField(1)
  Currency defaultCurrency;

  Settings({
    this.theme = Appearance.dark,
    this.defaultCurrency = Currency.GBP,
  });
}
