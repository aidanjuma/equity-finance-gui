import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:equity/src/ui/views/root_view.dart';
import 'package:equity/src/models/settings.dart';
import 'package:equity/src/ui/theme/global.dart';

void main() async {
  _startHive();
  _startApp();
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      // TODO: System / Update Preferred.
      themeMode: ThemeMode.dark,
      home: const RootView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void _startHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsAdapter());
  await Hive.openBox<Settings>('Settings');
}

void _startApp() {
  const app = Application();
  runApp(app);
}
