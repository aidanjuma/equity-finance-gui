import 'package:hive/hive.dart';
import 'package:equity/src/models/settings.dart';

Future resetSettings() async {
  Box<Settings> settingsBox = Hive.box('Settings');
  Settings? storedSettings = settingsBox.get('storedSettings');
  // If storedSettings isn't found, ensure clear and generate defaults.
  if (storedSettings == null) {
    await settingsBox.clear();
    await settingsBox.put('storedSettings', Settings());
  }
}

Future deleteAllStoredData() async {
  Box<Settings> settingsBox = Hive.box('Settings');

  await resetSettings();
}

String convertEnumValueToString(enumValue) {
  return enumValue.toString().split('.').last;
}
