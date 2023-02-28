import 'package:flutter/material.dart';
// Local
import 'package:equity/src/utils/global.dart';
import 'package:equity/src/enums/appearance.dart';
import 'package:equity/src/ui/components/navigation/custom_app_bar.dart';
import 'package:equity/src/ui/components/settings/theme_color_indicator.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: customAppBar(context, 2),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        child: Column(
          children: <Widget>[
            /* Theme Selection Column */
            Column(
              children: <Widget>[
                /* Left-Aligned Subtitle for Theme */
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Theme',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: colors.onSurface,
                      ),
                    ),
                  ),
                ),
                /* Theme Options Container */
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  /* Theme Options Row */
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      ThemeColorIndicator(colorMode: Appearance.dark),
                      ThemeColorIndicator(colorMode: Appearance.light)
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => deleteAllStoredData(),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 32),
                child: Text(
                  'Delete All Stored Data (Settings & Portfolio)',
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 14,
                    color: const Color(0xfff76161).withOpacity(0.85),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
