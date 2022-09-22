import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'main_view.dart';
import 'settings_view.dart';
import '../components/navigation/navigation_bar.dart' as nav;

class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MainView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: nav.NavigationBar(
        iconSize: 28,
        items: <nav.NavigationBarItem>[
          nav.NavigationBarItem(icon: EvaIcons.homeOutline),
          nav.NavigationBarItem(icon: EvaIcons.settingsOutline),
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