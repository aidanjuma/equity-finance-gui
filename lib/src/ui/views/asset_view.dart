import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../utils/global.dart';
import '../../models/google_asset.dart';
import '../../providers/equity_api_provider.dart';
import '../../ui/components/sliders/default_slider.dart';
import '../../ui/components/navigation/custom_app_bar.dart';

const TextStyle _infoTextStyle = TextStyle(
  fontFamily: 'Lexend',
  fontSize: 18,
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
      body: SingleChildScrollView(
        child: Consumer<EquityApiProvider>(
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
                          asset.ticker.split(':')[0],
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
                          margin:
                              EdgeInsets.symmetric(vertical: height * 0.025),
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
                              asset.dailyPriceDelta != null &&
                                      asset.currentPrice != null
                                  ? _renderPriceDeltaText(asset.currentPrice!,
                                      asset.dailyPriceDelta!)
                                  : const SizedBox.shrink(),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: height * 0.02,
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
                                        ),
                                      ],
                                    ),
                                    asset.preMarketPrice != null
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text(
                                                'Pre Market Price',
                                                style: _infoTextStyle,
                                              ),
                                              Text(
                                                '${asset.preMarketPrice} ${convertEnumValueToString(asset.marketCurrency)}',
                                                style: _infoTextStyle,
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                    asset.marketSummary?.dayRange != null
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text(
                                                'Day Range',
                                                style: _infoTextStyle,
                                              ),
                                              Text(
                                                '${asset.marketSummary?.dayRange.toString()} ${convertEnumValueToString(asset.marketCurrency)}',
                                                style: _infoTextStyle,
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                    asset.marketSummary?.yearRange != null
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text(
                                                'Year Range',
                                                style: _infoTextStyle,
                                              ),
                                              Text(
                                                '${asset.marketSummary?.yearRange.toString()} ${convertEnumValueToString(asset.marketCurrency)}',
                                                style: _infoTextStyle,
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                    asset.marketSummary?.marketCap != null
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text(
                                                'Market Cap',
                                                style: _infoTextStyle,
                                              ),
                                              Text(
                                                '${NumberFormat.compact().format(asset.marketSummary?.marketCap)} ${convertEnumValueToString(asset.marketCurrency)}',
                                                style: _infoTextStyle,
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                    asset.marketSummary?.avgVolume != null
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text(
                                                'Average Volume',
                                                style: _infoTextStyle,
                                              ),
                                              Text(
                                                '${NumberFormat.compact().format(asset.marketSummary?.avgVolume)} ${convertEnumValueToString(asset.marketCurrency)}',
                                                style: _infoTextStyle,
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                    asset.marketSummary?.pteRatio != null
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text(
                                                'P/E Ratio',
                                                style: _infoTextStyle,
                                              ),
                                              Text(
                                                '${asset.marketSummary?.pteRatio}',
                                                style: _infoTextStyle,
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                    asset.marketSummary?.dividendYield != null
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text(
                                                'Dividend Yield',
                                                style: _infoTextStyle,
                                              ),
                                              Text(
                                                '${asset.marketSummary?.dividendYield}%',
                                                style: _infoTextStyle,
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        asset.description != null
                            ? Container(
                                width: double.infinity,
                                height: height * 0.3,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: height * 0.01,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      'About',
                                      style: TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: height * 0.005,
                                      ),
                                    ),
                                    Expanded(
                                      child: Scrollbar(
                                        interactive: true,
                                        child: SingleChildScrollView(
                                          child: Text(
                                            asset.description!,
                                            style: const TextStyle(
                                              fontFamily: 'Lexend',
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                        asset.news != null
                            ? Container(
                                width: double.infinity,
                                height: height * 0.45,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: height * 0.01,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      'News',
                                      style: TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: height * 0.005,
                                      ),
                                    ),
                                    DefaultSlider(
                                      direction: Axis.vertical,
                                      panels: parseNewsArticles(asset.news!),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }

  Widget _renderPriceDeltaText(num currentPrice, num priceDelta) {
    final bool isNegative = priceDelta.sign == -1.0 ? true : false;

    final num previousPrice =
        isNegative ? priceDelta + currentPrice : currentPrice - priceDelta;

    final String priceDeltaPercentage =
        (((currentPrice / previousPrice) - 1) * 100).toStringAsFixed(2);

    return Text(
      '1D | ${isNegative ? "-$priceDeltaPercentage" : priceDeltaPercentage}%',
      style: TextStyle(
        fontFamily: 'Lexend',
        color: isNegative
            ? const Color(0xfff76161).withOpacity(0.85)
            : const Color(0xff6ed265),
        fontWeight: FontWeight.w500,
        fontSize: 18,
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
