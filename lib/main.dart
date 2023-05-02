import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
// Local
import 'package:equity/src/utils/global.dart';
import 'package:equity/src/enums/market.dart';
import 'package:equity/src/models/asset.dart';
import 'package:equity/src/enums/currency.dart';
import 'package:equity/src/models/settings.dart';
import 'package:equity/src/ui/theme/global.dart';
import 'package:equity/src/enums/asset_type.dart';
import 'package:equity/src/enums/appearance.dart';
import 'package:equity/src/models/price_range.dart';
import 'package:equity/src/ui/views/root_view.dart';
import 'package:equity/src/models/google_asset.dart';
import 'package:equity/src/models/market_summary.dart';
import 'package:equity/src/router/navigator_wrapper.dart';
import 'package:equity/src/providers/equity_api_provider.dart';

void main() async {
  // Spin-up Hive...
  await _startHive();
  // Runs the app.
  _startApp();
}

class Application extends StatelessWidget {
  final bool showBriefingPage;
  const Application({required this.showBriefingPage, super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Settings>('Settings').listenable(),
      builder: (BuildContext context, Box<Settings> settings, Widget? child) {
        return ChangeNotifierProvider(
          create: (context) => EquityApiProvider(),
          child: MaterialApp(
            theme: Themes.light,
            darkTheme: Themes.dark,
            themeMode: _setThemeMode(settings.get('storedSettings')?.theme) ??
                ThemeMode.system,
            home: const RootView(),
            debugShowCheckedModeBanner: false,
            initialRoute: showBriefingPage == true
                ? NavigatorWrapper.briefingRoute
                : NavigatorWrapper.rootRoute,
            routes: NavigatorWrapper.routes,
          ),
        );
      },
    );
  }
}

void _startApp() {
  final Box<Settings> settingsBox = Hive.box('Settings');
  final Settings settings = settingsBox.get('storedSettings')!;

  final String formattedString =
      restrictFractionalSeconds(settings.whenBriefingLastDisplayed);
  final DateTime dateTimeObj = DateTime.parse(formattedString);

  // If same day as last shown, don't show; else, do show.
  final bool showBriefingPage =
      dateTimeObj.day == DateTime.now().day ? false : true;

  final Application app = Application(showBriefingPage: showBriefingPage);
  runApp(app);
}

Future<void> _startHive() async {
  await Hive.initFlutter();
  // Registers custom type adapters.
  Hive.registerAdapter(AppearanceAdapter());
  Hive.registerAdapter(CurrencyAdapter());
  Hive.registerAdapter(MarketAdapter());
  Hive.registerAdapter(AssetTypeAdapter());
  Hive.registerAdapter(SettingsAdapter());
  Hive.registerAdapter(AssetAdapter());
  Hive.registerAdapter(PriceRangeAdapter());
  Hive.registerAdapter(MarketSummaryAdapter());
  Hive.registerAdapter(GoogleAssetAdapter());
  // Opens box(es).
  await Hive.openBox<Settings>('Settings');
  await Hive.openBox<Asset>('Asset');
  // Configures settings; make sure defaults exist.
  await resetSettings(false);
}

ThemeMode? _setThemeMode(Appearance? storedTheme) => themes[storedTheme];
