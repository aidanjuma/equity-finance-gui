import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:equity/src/router/routes.dart';
import 'package:equity/src/router/navigator_wrapper.dart';
import 'package:equity/src/providers/equity_api_provider.dart';
import 'package:equity/src/ui/components/panels/news_article_panel.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.2),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.075,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'equity',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'DM Sans',
                ),
              ),
              GestureDetector(
                onTap: () => NavigatorWrapper.push(context, Routes.settings),
                child: const Icon(
                  EvaIcons.settingsOutline,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Consumer<EquityApiProvider>(
        builder: (context, provider, child) {
          bool storiesAvailable =
              provider.marketStories != null && !provider.isLoading;

          return Container();
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

      await provider.getGoogleFinanceMarketNews();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
