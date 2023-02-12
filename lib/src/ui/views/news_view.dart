import 'package:equity/src/ui/components/panels/news_article_panel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:equity/src/providers/equity_api_provider.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
