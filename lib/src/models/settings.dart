import 'package:hive/hive.dart';
import '../enums/appearance.dart';

part 'settings.g.dart';

@HiveType(typeId: 0)
class Settings extends HiveObject {
  // Appearance: Light, Dark or System.
  @HiveField(0)
  Appearance theme;

  // Asset ID for briefing page data fetching; AAPL by default.
  @HiveField(1)
  String briefingPageAssetId;

  // Holds information RE: when the briefing page was last displayed.
  @HiveField(2)
  String whenBriefingLastDisplayed;

  Settings({
    this.theme = Appearance.dark,
    this.briefingPageAssetId = 'AAPL:NASDAQ',
    this.whenBriefingLastDisplayed = '1970-01-01T01:00:00.000',
  });
}
