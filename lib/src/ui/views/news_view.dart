import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:equity/src/router/routes.dart';
import 'package:equity/src/router/navigator_wrapper.dart';
import 'package:equity/src/providers/equity_api_provider.dart';
import 'package:equity/src/ui/components/navigation/custom_app_bar.dart';
import 'package:equity/src/ui/components/panels/news_article_panel.dart';

const TextStyle _titleStyle = TextStyle(
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
      appBar: customAppBar(context),
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
                  Text(
                    "Top Stories",
                    style: _titleStyle,
                  ),
                  // <Scrollable Data>
                  Text(
                    "Local Market",
                    style: _titleStyle,
                  ),
                  // <Scrollable Data>
                  Text(
                    "World Markets",
                    style: _titleStyle,
                  ),
                  // <Scrollable Data>
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
