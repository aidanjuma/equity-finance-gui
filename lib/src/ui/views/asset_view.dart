import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:equity/src/utils/global.dart';
import 'package:equity/src/models/google_asset.dart';
import 'package:equity/src/providers/equity_api_provider.dart';
import 'package:equity/src/ui/components/navigation/custom_app_bar.dart';

const TextStyle _infoTextStyle = TextStyle(
  fontFamily: 'Lexend',
  fontSize: 14,
);

class AssetView extends StatefulWidget {
  const AssetView({super.key});

  @override
  State<AssetView> createState() => _AssetViewState();
}

class _AssetViewState extends State<AssetView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: customAppBar(context, 1),
      body: Consumer<EquityApiProvider>(
        builder: (context, provider, child) {
          GoogleAsset? asset = provider.selectedAssetData;

          bool equityIsReady = provider.isInitialized &&
              provider.isLoading == false &&
              asset != null;

          return equityIsReady
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        provider.selectedAssetData!.ticker.split(':')[0],
                        style: const TextStyle(
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w500,
                          fontSize: 48,
                        ),
                      ),
                      Text(
                        '${convertEnumValueToString(asset.market)} • ${asset.label}',
                        style: const TextStyle(
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        margin: EdgeInsets.symmetric(vertical: height * 0.025),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '${asset.currentPrice} ${convertEnumValueToString(asset.marketCurrency)}',
                              style: const TextStyle(
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w500,
                                fontSize: 32,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: height * 0.04,
                                bottom: height * 0.02,
                              ),
                              child: Column(
                                children: <Widget>[
                                  const Text(
                                    'Additional Data',
                                    style: TextStyle(
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: height * 0.01,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      const Text(
                                        'Asset Type',
                                        style: _infoTextStyle,
                                      ),
                                      Text(
                                        convertEnumValueToString(asset.type),
                                        style: _infoTextStyle,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
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
