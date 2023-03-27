import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// Local
import 'news_view.dart';
import 'search_view.dart';
import 'portfolio_view.dart';
import '../../ui/components/navigation/navigation_bar.dart' as nav;

class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const NewsView(),
    const SearchView(),
    const PortfolioView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: nav.NavigationBar(
        height: 100,
        iconSize: 28,
        items: <nav.NavigationBarItem>[
          nav.NavigationBarItem(icon: EvaIcons.bulbOutline),
          nav.NavigationBarItem(icon: EvaIcons.searchOutline),
          nav.NavigationBarItem(icon: EvaIcons.pieChartOutline),
        ],
        onChanged: (int index) {
          _currentIndex = index;
          setState(() => {});
        },
      ),
      body: _pages[_currentIndex],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
