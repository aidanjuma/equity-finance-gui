import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:equity/src/providers/equity_api_provider.dart';

class AssetView extends StatefulWidget {
  const AssetView({super.key});

  @override
  State<AssetView> createState() => _AssetViewState();
}

class _AssetViewState extends State<AssetView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      EquityApiProvider provider =
          Provider.of<EquityApiProvider>(context, listen: false);

      await provider.getGoogleAssetData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
