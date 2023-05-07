import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../../models/asset.dart';
import '../../utils/global.dart';
import '../../models/google_asset.dart';
import '../../models/google_news_article.dart';
import '../../providers/equity_api_provider.dart';
import '../components/sliders/default_slider.dart';
import '../../ui/components/panels/asset_panel.dart';
import '../components/navigation/custom_app_bar.dart';

const TextStyle _titleStyle = TextStyle(
  fontFamily: 'DM Sans',
  fontWeight: FontWeight.w700,
);

const TextStyle _labelStyle = TextStyle(
  fontFamily: 'Lexend',
  fontSize: 12,
  fontWeight: FontWeight.w500,
);

class PortfolioView extends StatefulWidget {
  const PortfolioView({super.key});

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {
  final Box<Asset> assetsBox = Hive.box('Asset');

  // Flags:
  bool isShowingValues = true;
  bool isCalculatingPL = true;
  bool isFetchingNews = true;

  // Values:
  double profitLoss = 0;
  double latestValue = 0;
  String totalValueString = '';
  Map<String, double> pieChartDataMap = {};
  List<GoogleNewsArticle> newsArticles = [];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: customAppBar(context, 3),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Consumer<EquityApiProvider>(
          builder: (context, provider, child) {
            return Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: height * 0.51,
                  color: colors.surface,
                  padding: EdgeInsets.only(
                    top: height * 0.15,
                    left: width * 0.05,
                    right: width * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Portfolio Value',
                        style: _titleStyle,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            isShowingValues
                                ? totalValueString
                                : _generatePrivacyString(totalValueString),
                            style: const TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Negate: if true, make false; and vice versa.
                                  isShowingValues = !isShowingValues;
                                });
                              },
                              child: isShowingValues
                                  ? const Icon(EvaIcons.eyeOutline)
                                  : const Icon(EvaIcons.eyeOff2),
                            ),
                          ),
                        ],
                      ),
                      // Only show pie chart if there are data values...
                      pieChartDataMap.isNotEmpty
                          ? PieChart(dataMap: pieChartDataMap)
                          // Otherwise, display shimmering representation of it!
                          : Center(
                              child: Shimmer.fromColors(
                                baseColor: colors.background.withOpacity(0.8),
                                highlightColor:
                                    colors.background.withOpacity(0.2),
                                child: Container(
                                  width: 250,
                                  height: 250,
                                  margin: EdgeInsets.symmetric(
                                    vertical: height * 0.01,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(9999),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: height * 0.02,
                  ),
                  // Show a notice if there are no assets to display as of yet.
                  child: assetsBox.isEmpty
                      ? Column(
                          children: <Widget>[
                            Icon(
                              EvaIcons.questionMarkCircleOutline,
                              color: colors.onSurface,
                              size: 48,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                'Nothing here just yet! Tap on the "+" button in the app bar to add an asset.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: colors.onSurface,
                                ),
                              ),
                            )
                          ],
                        )
                      // Otherwise, display the first row of data widgets!
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Statistics',
                              style: _titleStyle,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: height * 0.01,
                                bottom: height * 0.02,
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: height * 0.035,
                              ),
                              height: height * 0.15,
                              decoration: BoxDecoration(
                                color: colors.surface,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      const Text(
                                        'Unique Assets',
                                        style: _labelStyle,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: height * 0.015),
                                        child: Text(
                                          assetsBox.values.length.toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily: 'Lexend',
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      const Text(
                                        'Profit/Loss',
                                        style: _labelStyle,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: height * 0.015),
                                        child: isCalculatingPL
                                            ? Shimmer.fromColors(
                                                baseColor: colors.background
                                                    .withOpacity(0.8),
                                                highlightColor: colors
                                                    .background
                                                    .withOpacity(0.2),
                                                child: Container(
                                                  width: 80,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              )
                                            : Text(
                                                '${_formatNumber(profitLoss)}USD',
                                                style: const TextStyle(
                                                  fontFamily: 'Lexend',
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            assetsBox.isEmpty
                                ? const SizedBox.shrink()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text(
                                        'Assets',
                                        style: _titleStyle,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          bottom: height * 0.02,
                                        ),
                                        child: DefaultSlider(
                                          direction: Axis.vertical,
                                          panels: _buildAssetList(),
                                        ),
                                      ),
                                    ],
                                  ),
                            assetsBox.isEmpty
                                ? const SizedBox.shrink()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text(
                                        'Related News',
                                        style: _titleStyle,
                                      ),
                                      isFetchingNews
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: height * 0.005,
                                              ),
                                              child: DefaultSlider(
                                                direction: Axis.vertical,
                                                panels: parseNewsArticles(
                                                  newsArticles,
                                                ),
                                              ),
                                            )
                                    ],
                                  )
                          ],
                        ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  // Format number to be separated by commas using intl.dart:
  String _formatNumber(double number) =>
      NumberFormat('#,##0.00').format(number);

  // Generate the string denoting total portfolio value:
  String _generateTotalValueString(double? inputValue) {
    double value = 0;

    if (inputValue == null) {
      for (final element in assetsBox.values) {
        value += element.lastKnownTotalValue!;
      }
    } else {
      value += inputValue;
    }

    return '\$${_formatNumber(value)}';
  }

  // Overwrite each character in price string with * for privacy...
  String _generatePrivacyString(String originalString) {
    StringBuffer stringBuffer = StringBuffer();
    for (int i = 0; i < originalString.length; i++) {
      stringBuffer.write('*');
    }

    return stringBuffer.toString();
  }

  // Calculate the total value of all assets using a list of updated prices.
  double _calculateLatestTotal(List<num> latestValues) {
    double latestValue = 0;
    int i = 0;
    for (final asset in assetsBox.values) {
      latestValue += latestValues[i] * asset.quantity!;
      i += 1;
    }

    return latestValue;
  }

  // Add all newest values together and subtract to get the difference, i.e. P/L.
  double _calculateProfitLoss(List<num> latestValues) {
    double valueAtPurchase = 0;
    double newValuesTotal = 0;

    int i = 0;
    for (final asset in assetsBox.values) {
      valueAtPurchase += asset.purchasePricePerUnit! * asset.quantity!;
      newValuesTotal += latestValues[i] * asset.quantity!;
      i += 1;
    }

    return newValuesTotal - valueAtPurchase;
  }

  Future _updatePageData() async {
    // Temporary arrays to store fetched data.
    List<num> latestValues = [];
    List<GoogleNewsArticle> articles = [];

    // Access root instance of provider.
    final EquityApiProvider provider =
        Provider.of<EquityApiProvider>(context, listen: false);

    // If there are values to get, i.e. the user has items in their portfolio:
    if (assetsBox.isNotEmpty) {
      // Iterate over each stored asset...
      int i = 0;
      for (final asset in assetsBox.values) {
        // Fetch and temporarily store its updated data...
        await provider.updateSelectedAssetTicker(asset.ticker);
        await provider.getGoogleAssetData();

        GoogleAsset assetData = provider.selectedAssetData!;
        Asset storedAssetData = assetsBox.values.toList()[i];

        // Update last known total to reflect with new prices...
        storedAssetData.lastKnownTotalValue = double.parse(
            '${assetData.currentPrice! * storedAssetData.quantity!}');

        // ...and store this value locally.
        assetsBox.putAt(i, storedAssetData);

        // Update data for this asset on the pie chart...
        pieChartDataMap[asset.ticker] = storedAssetData.lastKnownTotalValue!;

        // Add new values to temp. arrays!
        latestValues.add(assetData.currentPrice!);
        articles.addAll(assetData.news!);
        i += 1;
      }

      final double latestTotal = _calculateLatestTotal(latestValues);

      // Update all values on the page, i.e. refresh the page state accordingly.
      setState(() {
        // Generate strings for P/L and total value to display on UI:
        profitLoss = _calculateProfitLoss(latestValues);
        totalValueString = _generateTotalValueString(latestTotal);

        // Stop shimmer effect on P/L UI element...
        isCalculatingPL = !isCalculatingPL;

        newsArticles = articles;
        // Stop loading animation for news only if there is news present.
        articles.isNotEmpty ? isFetchingNews = false : isFetchingNews = true;
      });
    }
  }

  // Sequential list of assets stored in the database represented visually.
  List<AssetPanel> _buildAssetList() {
    List<AssetPanel> assetPanels = [];
    final List<Asset> assetsList = assetsBox.values.toList();

    for (int i = 0; i < assetsList.length; i++) {
      assetPanels.add(
        AssetPanel(
          assetsBox: assetsBox,
          index: i,
        ),
      );
    }

    return assetPanels;
  }

  @override
  void initState() {
    super.initState();
    // Setup page with saved values first (offline viewing),
    totalValueString = _generateTotalValueString(null);
    // ...and try to obtain updated data.
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) async => await _updatePageData());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
