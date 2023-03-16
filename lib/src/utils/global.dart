import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:equity/src/models/settings.dart';
import 'package:equity/src/models/google_news_article.dart';
import 'package:equity/src/providers/equity_api_provider.dart';
import 'package:equity/src/ui/components/panels/news_article_panel.dart';

import 'debouncer.dart';

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
        await equityProvider.searchGoogleAssets(query);
      }
    },
  );
}
