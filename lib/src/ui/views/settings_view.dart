import 'package:flutter/material.dart';
// Local
import '../../utils/global.dart';
import '../../enums/appearance.dart';
import '../../ui/components/navigation/custom_app_bar.dart';
import '../../ui/components/settings/theme_color_indicator.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

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
              onTap: () => _resetDataDialogBuilder(context),
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

  Future<void> _resetDataDialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Stored Data Deletion'),
          content: const Text('Proceeding with this request will\n'
              'delete ALL data stored within equity\n'
              '(including portfolio & settings data).\n\n'
              'Thus, settings will be returned to their default values.\n\n'
              'Continue?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                'Yes',
                style: TextStyle(
                  color: const Color(0xfff76161).withOpacity(0.85),
                ),
              ),
              onPressed: () async {
                _awaitDeletion();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _awaitDeletion() async => await deleteAllStoredData();
}
