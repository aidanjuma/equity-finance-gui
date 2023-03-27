import 'package:flutter/material.dart';
import '../router/routes.dart';
import '../ui/views/root_view.dart';
import '../ui/views/news_view.dart';
import '../ui/views/search_view.dart';
import '../ui/views/asset_view.dart';
import '../ui/views/portfolio_view.dart';
import '../ui/views/settings_view.dart';

class NavigatorWrapper {
  static String initialRoute = Routes.root;
  static Map<String, WidgetBuilder> get routes {
    return {
      Routes.root: (context) => const RootView(),
      Routes.news: (context) => const NewsView(),
      Routes.search: (context) => const SearchView(),
      Routes.asset: (context) => const AssetView(),
      Routes.portfolio: (context) => const PortfolioView(),
      Routes.settings: (context) => const SettingsView(),
    };
  }

  static Future push(BuildContext context, String route,
      {Object? arguments, Function? callback}) {
    return Navigator.of(context).pushNamed(route, arguments: arguments).then(
          (value) => callback != null ? callback() : null,
        );
  }

  static replace(BuildContext context, String route,
      {Object? arguments, Function? callback}) {
    Navigator.of(context)
        .pushReplacementNamed(route, arguments: arguments)
        .then(
          (value) => callback != null ? callback() : null,
        );
  }

  static pushAndRemoveAll(BuildContext context, String route,
      {Object? arguments, Function? callback}) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(
          route,
          (_) => false,
          arguments: arguments,
        )
        .then(
          (value) => callback != null ? callback() : null,
        );
  }
}
