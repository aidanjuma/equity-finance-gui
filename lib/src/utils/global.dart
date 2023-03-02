import 'package:hive/hive.dart';
import 'package:equity/src/models/settings.dart';

Future resetSettings(bool dataDeletionRequested) async {
  Box<Settings> settingsBox = Hive.box('Settings');
  Settings? storedSettings = settingsBox.get('storedSettings');
  // If storedSettings isn't found OR is found and called from deletion screen,
  // ensure clear and generate defaults.
  if (storedSettings == null ||
      (dataDeletionRequested && storedSettings.isInBox)) {
    await settingsBox.clear();
    await settingsBox.put('storedSettings', Settings());
  }
}

Future deleteAllStoredData() async {
  await resetSettings(true);
  // TODO: Delete all other data; at this point, it is not populated yet.
}

String convertEnumValueToString(enumValue) {
  return enumValue.toString().split('.').last;
}
