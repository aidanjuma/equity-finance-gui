import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// Local
import '../../../models/settings.dart';
import '../../../enums/appearance.dart';

class ThemeColorIndicator extends StatelessWidget {
  final double width;
  final double height;
  final Appearance colorMode;

  const ThemeColorIndicator({
    super.key,
    this.width = 48,
    this.height = 48,
    this.colorMode = Appearance.dark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleThemeUpdate(colorMode),
      child: SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colorMode == Appearance.dark
                ? const Color(0xff10141a)
                : const Color(0xffffffff),
            borderRadius: BorderRadius.circular(9999),
          ),
        ),
      ),
    );
  }

  /* Get settings from box, change theme, replace settings object. */
  void _handleThemeUpdate(Appearance theme) {
    Box<Settings> settingsBox = Hive.box<Settings>('Settings');
    Settings storedSettings =
        Hive.box<Settings>('Settings').get('storedSettings')!;
    storedSettings.theme = theme;
    settingsBox.put(storedSettings.key, storedSettings);
  }
}
