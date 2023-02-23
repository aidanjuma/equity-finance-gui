import 'package:flutter/material.dart';
import 'package:equity/src/ui/components/navigation/custom_app_bar.dart';

class AssetView extends StatefulWidget {
  const AssetView({super.key});

  @override
  State<AssetView> createState() => _AssetViewState();
}

class _AssetViewState extends State<AssetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 1),
    );
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
