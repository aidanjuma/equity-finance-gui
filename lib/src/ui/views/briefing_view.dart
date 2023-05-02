import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';
import '../../utils/global.dart';
import '../../router/routes.dart';
import '../../ui/theme/global.dart';
import '../../models/settings.dart';
import '../../router/navigator_wrapper.dart';
import '../../providers/equity_api_provider.dart';
import '../components/sliders/default_slider.dart';

const TextStyle _generalStyle = TextStyle(
  fontFamily: 'DM Sans',
  fontSize: 28,
  fontWeight: FontWeight.w700,
);

class BriefingView extends StatefulWidget {
  const BriefingView({super.key});

  @override
  State<BriefingView> createState() => _BriefingViewState();
}

class _BriefingViewState extends State<BriefingView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: Consumer<EquityApiProvider>(
        builder: (context, provider, child) {
          // If still loading, display shimmering "equity" text:
          if (provider.selectedAssetData?.dailyPriceDelta == null) {
            return Container(
              alignment: Alignment.center,
              child: Shimmer.fromColors(
                baseColor: const Color(0xff4484e4),
                highlightColor: Colors.white,
                enabled: true,
                child: const Text(
                  'equity',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 64,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            );
          }

          final num dailyPriceDelta =
              provider.selectedAssetData!.dailyPriceDelta!;

          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              vertical: height * 0.1,
              horizontal: width * 0.065,
            ),
            child: Column(
              children: <Widget>[
                timeOfDayMessage(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.015,
                  ),
                ),
                Text(
                  '${provider.selectedAssetData!.label} (last 24hrs)',
                  style: _generalStyle,
                ),
                Text(
                  '$dailyPriceDelta%',
                  style: dailyPriceDelta.isNegative
                      ? const TextStyle(
                          color: Themes.errorColor,
                          fontFamily: 'DM Sans',
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        )
                      : const TextStyle(
                          color: Themes.positiveColor,
                          fontFamily: 'DM Sans',
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.035,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      const Text(
                        'Featured News',
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      provider.selectedAssetData?.news != null
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                vertical: height * 0.015,
                              ),
                              child: DefaultSlider(
                                direction: Axis.vertical,
                                panels: parseNewsArticles(
                                    provider.selectedAssetData!.news!),
                              ),
                            )
                          : const Text('No news available.'),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  height: height * 0.085,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: GestureDetector(
                    onTap: () =>
                        NavigatorWrapper.pushAndRemoveAll(context, Routes.root),
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
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

      // Get stored settings...
      final Box<Settings> settingsBox = Hive.box('Settings');
      final Settings settings = settingsBox.get('storedSettings')!;

      // Get said asset data from API using stored briefing asset ID:
      await provider.updateSelectedAssetTicker(settings.briefingPageAssetId);
      await provider.getGoogleAssetData();

      // Update last viewed date-time string in settings:
      settings.whenBriefingLastDisplayed = DateTime.now().toIso8601String();
      await settingsBox.put(settings.key, settings);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
