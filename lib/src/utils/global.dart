import 'package:equity/src/enums/asset_type.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'debouncer.dart';
import '../models/asset.dart';
import '../models/settings.dart';
import '../enums/appearance.dart';
import '../models/google_news_article.dart';
import '../providers/equity_api_provider.dart';
import '../ui/components/panels/news_article_panel.dart';

const TextStyle _timeOfDayStyle = TextStyle(
  fontFamily: 'Lexend',
  fontSize: 40,
  fontWeight: FontWeight.w700,
);

Text timeOfDayMessage() {
  final int hour = DateTime.now().hour;

  if (hour >= 4 && hour <= 11) {
    return const Text('Good Morning!', style: _timeOfDayStyle);
  } else if (hour >= 12 && hour <= 15) {
    return const Text('Good Afternoon.', style: _timeOfDayStyle);
  } else if (hour >= 16 && hour <= 19) {
    return const Text('Good Evening.', style: _timeOfDayStyle);
  }

  return const Text('Good Night!', style: _timeOfDayStyle);
}

// Used to handle ISO8601 time strings; allows parsing to DateTime object.
String restrictFractionalSeconds(String dateTime) =>
    dateTime.replaceFirstMapped(
      RegExp("(\\.\\d{6})\\d+"),
      (m) => m[1].toString(),
    );

Map<Appearance, ThemeMode> themes = {
  Appearance.light: ThemeMode.light,
  Appearance.dark: ThemeMode.dark,
  Appearance.system: ThemeMode.system,
};

Future<void> updateBriefingPageAsset(String assetId) async {
  Box<Settings> settingsBox = Hive.box<Settings>('Settings');
  Settings storedSettings =
      Hive.box<Settings>('Settings').get('storedSettings')!;
  storedSettings.briefingPageAssetId = assetId;
  settingsBox.put(storedSettings.key, storedSettings);
}

Future<void> saveAsset(
    String assetId, int quantityPurchased, double pricePerUnit) async {
  Box<Asset> assetsBox = Hive.box('Asset');

  final double value = quantityPurchased * pricePerUnit;
  await assetsBox.put(
    assetId,
    Asset(
      type: AssetType.Unknown,
      ticker: assetId,
      quantity: quantityPurchased,
      purchasePricePerUnit: pricePerUnit,
      valueAtPurchaseTime: value,
      lastKnownTotalValue: value,
      // Only Google Finance assets contain ':', so use this for validation for now.
      providerName: assetId.contains(':') ? 'Google Finance' : 'Binance',
    ),
  );
}

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
  Box<Asset> assetsBox = Hive.box('Asset');

  await resetSettings(true);
  await assetsBox.clear();
}

List<NewsArticlePanel> parseNewsArticles(List<GoogleNewsArticle> articles) {
  List<NewsArticlePanel> panels = [];
  for (int i = 0; i < articles.length; i++) {
    final article = articles[i];
    panels.add(
      NewsArticlePanel(
        link: article.link,
        imageUrl: article.thumbnailUrl,
        publisher: article.publisher,
        whenPublished: article.whenPublished,
        title: article.title,
      ),
    );
  }
  return panels;
}

String convertEnumValueToString(enumValue) {
  return enumValue.toString().split('.').last;
}

void updateSearchResults(
    BuildContext context, Debouncer debouncer, String query) {
  debouncer.run(
    () async {
      final equityProvider =
          Provider.of<EquityApiProvider>(context, listen: false);
      // Only fire request if query is different than last time.
      if (equityProvider.latestQuery != query) {
        await equityProvider.searchAssets(query);
      }
    },
  );
}

Future<void> updateAssetList(BuildContext context) async {
  final equityProvider = Provider.of<EquityApiProvider>(context, listen: false);
  // Only fire request if list is null.
  if (equityProvider.availableGoogleAssets == null) {
    await equityProvider.getAvailableGoogleAssets();
  }
}
