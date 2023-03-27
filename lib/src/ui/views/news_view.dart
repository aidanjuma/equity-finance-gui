import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/global.dart';
import '../../providers/equity_api_provider.dart';
import '../../ui/components/sliders/default_slider.dart';
import '../../ui/components/navigation/custom_app_bar.dart';
import '../../ui/components/panels/news_article_panel.dart';

const TextStyle _titleStyle = TextStyle(
  fontFamily: 'DM Sans',
  fontSize: 18,
  fontWeight: FontWeight.w700,
);

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: customAppBar(context, 0),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Consumer<EquityApiProvider>(
          builder: (context, provider, child) {
            bool storiesAvailable =
                provider.marketStories != null && !provider.isLoading;

            return Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Top Stories",
                    style: _titleStyle,
                  ),
                  Center(
                    child: Builder(
                      builder: (context) {
                        if (storiesAvailable) {
                          final List<NewsArticlePanel> panels =
                              parseNewsArticles(
                            provider.marketStories!.topStories,
                          );

                          return Container(
                            padding: EdgeInsets.symmetric(
                              vertical: height * 0.015,
                            ),
                            child: DefaultSlider(
                              direction: Axis.vertical,
                              panels: panels,
                            ),
                          );
                        }

                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: height * 0.1),
                          child: const CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                  const Text(
                    "Local Market",
                    style: _titleStyle,
                  ),
                  Center(
                    child: Builder(
                      builder: (context) {
                        if (storiesAvailable) {
                          final List<NewsArticlePanel> panels =
                              parseNewsArticles(
                            provider.marketStories!.localMarket,
                          );

                          return Container(
                            padding: EdgeInsets.symmetric(
                              vertical: height * 0.015,
                            ),
                            child: DefaultSlider(
                              direction: Axis.vertical,
                              panels: panels,
                            ),
                          );
                        }

                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: height * 0.1),
                          child: const CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                  const Text(
                    "World Markets",
                    style: _titleStyle,
                  ),
                  Center(
                    child: Builder(
                      builder: (context) {
                        if (storiesAvailable) {
                          final List<NewsArticlePanel> panels =
                              parseNewsArticles(
                            provider.marketStories!.worldMarkets,
                          );

                          return Container(
                            padding: EdgeInsets.symmetric(
                              vertical: height * 0.015,
                            ),
                            child: DefaultSlider(
                              direction: Axis.vertical,
                              panels: panels,
                            ),
                          );
                        }

                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: height * 0.1),
                          child: const CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      EquityApiProvider provider =
          Provider.of<EquityApiProvider>(context, listen: false);

      await provider.getGoogleFinanceMarketNews();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
