import 'package:hive/hive.dart';
import '../types/appearance.dart';

part 'settings.g.dart';

@HiveType(typeId: 0)
class Settings extends HiveObject {
  // Appearance: Light, Dark or System
  @HiveField(0)
  Appearance theme;

  Settings({this.theme = Appearance.dark});
}
