import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// Local
import 'package:equity/src/models/settings.dart';
import 'package:equity/src/types/appearance.dart';
import 'package:equity/src/ui/theme/global.dart';
import 'package:equity/src/ui/views/root_view.dart';

void main() async {
  await Hive.initFlutter();
  // Registers custom type adapters.
  Hive.registerAdapter(SettingsAdapter());
  Hive.registerAdapter(AppearanceAdapter());
  // Opens box(es).
  await Hive.openBox<Settings>('Settings');
  // Configures settings; make sure defaults exist.
  _configSettings();
  // Runs the app.
  const app = Application();
  runApp(app);
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    Appearance storedTheme =
        Hive.box<Settings>('Settings').get('storedSettings')!.theme;
    return MaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: _setThemeMode(storedTheme) ?? ThemeMode.dark,
      home: const RootView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void _configSettings() async {
  Box<Settings> settingsBox = Hive.box('Settings');
  Settings? storedSettings = settingsBox.get('storedSettings');
  // If storedSettings isn't found, ensure clear and generate defaults.
  if (storedSettings == null) {
    settingsBox.clear();
    settingsBox.put('storedSettings', Settings());
  }
}

ThemeMode? _setThemeMode(Appearance storedTheme) {
  Map<Appearance, ThemeMode> cases = {
    Appearance.light: ThemeMode.light,
    Appearance.dark: ThemeMode.dark,
    Appearance.system: ThemeMode.system,
  };

  return cases[storedTheme];
}
